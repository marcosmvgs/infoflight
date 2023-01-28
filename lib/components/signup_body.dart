import 'package:flutter/material.dart';
import 'package:infoflight/components/button_mockup.dart';
import 'package:infoflight/components/form_error.dart';
import 'package:infoflight/components/rounded_input_email_field.dart';
import 'package:infoflight/components/rounded_password_field.dart';
import 'package:infoflight/components/social_card.dart';
import 'package:infoflight/core/models/auth_form_data.dart';
import 'package:infoflight/utils/constants.dart';
import 'package:infoflight/utils/size_config.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Positioned(
            child: SizedBox(
              width: size.width,
              height: size.height,
              child: Image.asset(
                'assets/images/signup_screen_image.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.black, Color.fromARGB(0, 0, 0, 0), Colors.black],
              begin: Alignment(0, -0.6),
              end: Alignment(0, 0.7),
            )),
          ),
          SizedBox(
            width: size.width,
            height: size.height,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                getProportionateScreenWidth(20),
                getProportionateScreenWidth(70),
                getProportionateScreenWidth(20),
                getProportionateScreenWidth(40),
              ),
              child: Column(
                children: const [
                  Text(
                    'Registrar conta',
                    style: TextStyle(
                        fontSize: 50,
                        fontFamily: 'Oswald',
                        color: Constants.KHighLightColor),
                  ),
                  Expanded(
                    child: Text(
                      'Preencha os campos ou prossiga com uma Media Social',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SignupForm(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  final _formData = AuthFormData();
  final List<String> errors = [];
  final List<bool> requirementsColors = [false, false, false];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(size),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildPasswordFormField(size, requirementsColors),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildConfirmPasswordFormField(size),
          SizedBox(height: getProportionateScreenHeight(25)),
          FormPasswordcheck(requirementColor: requirementsColors),
          SizedBox(height: getProportionateScreenHeight(25)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(25)),
          ButtonMockUp(
            labelText: 'Continue',
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                // Go to complete profile page
                _formKey.currentState?.save();
              }
            },
            backColor: Constants.KHighLightColor,
          ),
          SizedBox(height: getProportionateScreenHeight(25)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SocialCard(icon: 'assets/icons/facebook-2.svg'),
              SocialCard(icon: 'assets/icons/google-icon.svg'),
              SocialCard(icon: 'assets/icons/twitter.svg')
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(25)),
          const Text(
            'Ao continuar, você concorda com nossa Política de Privacidade',
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  RoundedInputPasswordField buildConfirmPasswordFormField(Size size) {
    return RoundedInputPasswordField(
      onSaved: (typedPassword) {},
      labelText: 'Confirme sua senha',
      size: size,
      onChaged: (password) {
        _formData.password = password;
      },
    );
  }

  RoundedInputPasswordField buildPasswordFormField(
      Size size, List<bool> requirementsColors) {
    return RoundedInputPasswordField(
        onSaved: (typedPassword) => _formData.password = typedPassword!,
        labelText: 'Digite sua senha',
        size: size,
        onChaged: (password) {
          if (requirementsColors[0] == false) {
            if (password.trim().length < 6) {
              return;
            } else {
              setState(() {
                requirementsColors[0] = true;
              });
            }
          } else {
            if (password.trim().length < 6) {
              setState(() {
                requirementsColors[0] = false;
              });
            } else {
              return;
            }
          }
        });
  }

  RoundedInputEmailField buildEmailFormField(Size size) {
    return RoundedInputEmailField(
      onSaved: (validEmail) => _formData.email = validEmail!,
      size: size,
      hintText: 'Seu email',
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(Constants.kEmailNullError)) {
          setState(() {
            errors.remove(Constants.kEmailNullError);
          });
        } else if (Constants.regExp.hasMatch(value) &&
            errors.contains(Constants.kInvalidEmailError)) {
          setState(() {
            errors.remove(Constants.kInvalidEmailError);
          });
        }
      },
      validator: (value) {
        final value_ = value ?? '';
        if (value_.isEmpty && !errors.contains(Constants.kEmailNullError)) {
          setState(() {
            errors.add(Constants.kEmailNullError);
          });
        } else if (!Constants.regExp.hasMatch(value_) &&
            !errors.contains(Constants.kInvalidEmailError)) {
          setState(() {
            errors.add(Constants.kInvalidEmailError);
          });
        }
        return null;
      },
    );
  }
}

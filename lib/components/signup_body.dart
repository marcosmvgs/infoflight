import 'package:flutter/material.dart';
import 'package:infoflight/components/button_mockup.dart';
import 'package:infoflight/components/form_error.dart';
import 'package:infoflight/components/rounded_input_email_field.dart';
import 'package:infoflight/components/rounded_password_field.dart';
import 'package:infoflight/core/models/auth_form_data.dart';
import 'package:infoflight/utils/constants.dart';
import 'package:infoflight/utils/size_config.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          getProportionateScreenWidth(20),
          getProportionateScreenWidth(100),
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(size),
          SizedBox(height: getProportionateScreenHeight(18)),
          buildPasswordFormField(size),
          SizedBox(height: getProportionateScreenHeight(18)),
          buildConfirmPasswordFormField(size),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
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
        ],
      ),
    );
  }

  RoundedInputPasswordField buildConfirmPasswordFormField(Size size) {
    return RoundedInputPasswordField(
      onSaved: (typedPassword) => _formData.confirmedPassword = typedPassword!,
      labelText: 'Confirme sua senha',
      size: size,
      onChaged: (password) {
        _formData.password = password;
      },
    );
  }

  RoundedInputPasswordField buildPasswordFormField(Size size) {
    return RoundedInputPasswordField(
      onSaved: (typedPassword) => _formData.password = typedPassword!,
      labelText: 'Digite sua senha',
      size: size,
      onChaged: (password) {
        _formData.password = password;
      },
    );
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

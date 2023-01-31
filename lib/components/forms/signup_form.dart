import 'package:flutter/material.dart';
import '../../core/models/auth_form_data.dart';
import '../../utils/constants.dart';
import '../../utils/size_config.dart';
import '../button_mockup.dart';
import '../form_error.dart';
import '../social_card.dart';

class SignupForm extends StatefulWidget {
  final void Function(AuthFormData) onSubmit;
  const SignupForm({
    super.key,
    required this.onSubmit,
  });

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = AuthFormData();
  final List<String> errors = [];
  List<bool> requirementsColors = [false, false, false];
  late FocusNode _checkPasswordFocus;
  late FocusNode _newPasswordFocus;
  bool visibilityOne = true;
  bool visibilityTwo = true;

  @override
  void initState() {
    super.initState();
    _newPasswordFocus = FocusNode();
    _checkPasswordFocus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _newPasswordFocus.dispose();
    _checkPasswordFocus.dispose();
  }

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) return;
    _formKey.currentState?.save();
    Navigator.of(context).pop();
    widget.onSubmit(_formData);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildEmailSignupForm(),
          SizedBox(height: getProportionateScreenHeight(25)),
          _buildNewPasswordSignup(),
          SizedBox(height: getProportionateScreenHeight(25)),
          _buildConfirmNewPasswordSignup(),
          SizedBox(height: getProportionateScreenHeight(25)),
          FormPasswordcheck(requirementColor: requirementsColors),
          SizedBox(height: getProportionateScreenHeight(25)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(25)),
          ButtonMockUp(
            labelText: 'Continue',
            onPressed: _submitForm,
            backColor: Constants.KHighLightColor,
          ),
          SizedBox(height: getProportionateScreenHeight(25)),
          _buildSocialCardRow(),
          SizedBox(height: getProportionateScreenHeight(25)),
          const Text(
            'Ao continuar, você concorda com nossa Política de Privacidade',
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  TextFormField _buildEmailSignupForm() {
    return TextFormField(
      autofocus: true,
      onEditingComplete: () {
        _newPasswordFocus.requestFocus();
      },
      onSaved: (newValue) => _formData.email = newValue!,
      decoration: const InputDecoration(
          hintText: 'Seu email',
          prefixIcon: Icon(Icons.person, color: Constants.kBackgroundColor)),
      onChanged: (value) {
        onChangeEmail(value, errors, setState);
      },
      validator: (value) {
        onValidateEmail(value, errors, setState);
        if (errors.isEmpty) return null;
        return 'Há algo de errado com seu email';
      },
    );
  }

  TextFormField _buildNewPasswordSignup() {
    return TextFormField(
        onSaved: (newValue) => _formData.password = newValue!,
        focusNode: _newPasswordFocus,
        onEditingComplete: () {
          _checkPasswordFocus.requestFocus();
        },
        obscureText: visibilityOne,
        decoration: InputDecoration(
          hintText: 'Digite uma senha',
          prefixIcon: const Icon(Icons.lock, color: Constants.kBackgroundColor),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                visibilityOne = !visibilityOne;
              });
            },
            child: const Icon(
              Icons.visibility,
              color: Constants.kBackgroundColor,
            ),
          ),
        ),
        validator: (oldValue) {
          if (requirementsColors.every((element) => true)) {
            return null;
          } else {
            return 'Verifique requisitos de senha.';
          }
        },
        onChanged: (password) {
          final list = validPasswordCreated(password);
          setState(() {
            requirementsColors[0] = list[0];
            requirementsColors[1] = list[1];
            requirementsColors[2] = list[2];
          });
          _formData.password = password;
        });
  }

  TextFormField _buildConfirmNewPasswordSignup() {
    return TextFormField(
      focusNode: _checkPasswordFocus,
      onEditingComplete: _submitForm,
      onSaved: (typedPassword) => _formData.confirmedPassword,
      obscureText: visibilityTwo,
      decoration: InputDecoration(
        hintText: 'Repita senha',
        prefixIcon: const Icon(Icons.lock, color: Constants.kBackgroundColor),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              visibilityTwo = !visibilityTwo;
            });
          },
          child:
              const Icon(Icons.visibility, color: Constants.kBackgroundColor),
        ),
      ),
      onChanged: (password) {},
      validator: (password) {
        final confPassword = password ?? '';
        if (confPassword == _formData.password) {
          return null;
        } else {
          return 'Senhas não conferem';
        }
      },
    );
  }

  Row _buildSocialCardRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SocialCard(icon: 'assets/icons/facebook-2.svg'),
        SocialCard(icon: 'assets/icons/google-icon.svg'),
        SocialCard(icon: 'assets/icons/twitter.svg')
      ],
    );
  }
}

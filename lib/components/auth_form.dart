import 'package:flutter/material.dart';
import 'package:infoflight/components/already_have_an_account.dart';
import 'package:infoflight/components/button_mockup.dart';
import 'package:infoflight/components/form_error.dart';
import 'package:infoflight/components/rounded_input_field.dart';
import 'package:infoflight/components/rounded_password_field.dart';
import 'package:infoflight/core/models/auth_form_data.dart';
import 'package:infoflight/utils/constants.dart';
import 'package:infoflight/utils/size_config.dart';

class AuthForm extends StatefulWidget {
  final void Function(AuthFormData formData) onSubmit;
  const AuthForm({
    Key? key,
    required this.size,
    required this.onSubmit,
  }) : super(key: key);

  final Size size;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = AuthFormData();
  final List<String> errors = [];

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) return;
    widget.onSubmit(_formData);
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          RoundedInputEmailField(
            size: widget.size,
            hintText: 'Seu email',
            onChanged: (value) {
              if (value.isNotEmpty &&
                  errors.contains(Constants.kEmailNullError)) {
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
              final _value = value ?? '';
              if (_value.isEmpty &&
                  !errors.contains(Constants.kEmailNullError)) {
                setState(() {
                  errors.add(Constants.kEmailNullError);
                });
              } else if (!Constants.regExp.hasMatch(_value) &&
                  !errors.contains(Constants.kInvalidEmailError)) {
                setState(() {
                  errors.add(Constants.kInvalidEmailError);
                });
              }
              return null;
            },
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          RoundedInputPasswordField(
            labelText: _formData.isLogin ? 'Senha' : 'Digite uma Senha',
            size: widget.size,
            onChaged: (password) {
              _formData.password = password;
            },
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          SizedBox(
            width: widget.size.width * 0.9,
            height: 50,
            child: ButtonMockUp(
              labelText: _formData.isLogin ? 'Entrar' : 'Cadastrar',
              onPressed: _submit,
              backColor: Constants.KHighLightColor,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          GestureDetector(
            onTap: () {},
            child: const Text(
              'Esqueci a senha',
              style: TextStyle(color: Constants.kNeutralColor, fontSize: 14),
            ),
          ),
          const SizedBox(height: 8),
          AlreadyHaveAnAccountCheck(
            press: () {
              setState(() {
                _formData.toggleAuthMode();
              });
            },
          ),
        ],
      ),
    );
  }
}

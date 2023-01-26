import 'package:flutter/material.dart';
import 'package:infoflight/components/already_have_an_account.dart';
import 'package:infoflight/components/button_mockup.dart';
import 'package:infoflight/components/rounded_input_field.dart';
import 'package:infoflight/components/rounded_password_field.dart';
import 'package:infoflight/core/models/auth_form_data.dart';

class AuthForm extends StatefulWidget {
  void Function(AuthFormData formData) onSubmit;
  AuthForm({
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

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) return;
    widget.onSubmit(_formData);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RoundedInputField(
            size: widget.size,
            hintText: 'Seu email',
            onChanged: (email) {
              _formData.email = email;
            },
          ),
          RoundedPasswordField(
            labelText: _formData.isLogin ? 'Senha' : 'Digite uma Senha',
            size: widget.size,
            onChaged: (password) {
              _formData.password = password;
            },
          ),
          if (_formData.isSignup)
            RoundedPasswordField(
              labelText: 'Confirme a senha',
              size: widget.size,
              onChaged: (password) {
                _formData.password = password;
              },
            ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: widget.size.width * 0.9,
            height: 50,
            child: ButtonMockUp(
              labelText: _formData.isLogin ? 'Entrar' : 'Cadastrar',
              onPressed: _submit,
              backColor: Theme.of(context)
                  .colorScheme
                  .secondaryContainer
                  .withAlpha(195),
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {},
            child: const Text(
              'Esqueci a senha',
              style: TextStyle(color: Colors.white, fontSize: 14),
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

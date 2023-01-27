import 'package:flutter/material.dart';
import 'package:infoflight/components/button_mockup.dart';
import 'package:infoflight/components/form_error.dart';
import 'package:infoflight/components/rounded_input_email_field.dart';
import 'package:infoflight/components/rounded_password_field.dart';
import 'package:infoflight/components/social_card.dart';
import 'package:infoflight/core/models/auth_form_data.dart';
import 'package:infoflight/utils/app_routes.dart';
import 'package:infoflight/utils/constants.dart';
import 'package:infoflight/utils/size_config.dart';

import 'no_account_text.dart';

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
  bool remember = false;

  void _submit() {
    //Variável para ver se o formulário está válido.
    final isValid = _formKey.currentState?.validate() ?? false;

    // Formulário está válido?
    if (!isValid) return;
    // Se sim, pode salvar, executar onsaved de todos textformfields
    _formKey.currentState!.save();

    // Agora que já atribui os valores no _formData pode chamar a função onSubmit para
    // passar o _formData para o widget AuthScreen.

    widget.onSubmit(_formData);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          Row(
            children: [
              Checkbox(
                  activeColor: Constants.KHighLightColor,
                  side: const BorderSide(color: Constants.kNeutralColor),
                  value: remember,
                  onChanged: (value) {
                    setState(() {
                      remember = value!;
                    });
                  }),
              const Text(
                'Lembrar credenciais',
                style: TextStyle(color: Constants.kNeutralColor),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(AppRoutes.FORGOT_PASSWORD),
                child: const Text(
                  'Esqueceu a senha?',
                  style: TextStyle(
                      color: Constants.kNeutralColor,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(10)),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SocialCard(icon: 'assets/icons/facebook-2.svg'),
              SocialCard(icon: 'assets/icons/google-icon.svg'),
              SocialCard(icon: 'assets/icons/twitter.svg')
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          const NoAccountText(),
          SizedBox(height: getProportionateScreenHeight(40)),
        ],
      ),
    );
  }

  RoundedInputPasswordField buildPasswordFormField() {
    return RoundedInputPasswordField(
      onSaved: (typedPassword) => _formData.password = typedPassword!,
      labelText: _formData.isLogin ? 'Senha' : 'Digite uma Senha',
      size: widget.size,
      onChaged: (password) {
        _formData.password = password;
      },
    );
  }

  RoundedInputEmailField buildEmailFormField() {
    return RoundedInputEmailField(
      onSaved: (validEmail) => _formData.email = validEmail!,
      size: widget.size,
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



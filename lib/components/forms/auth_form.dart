import 'package:flutter/material.dart';
import 'package:infoflight/components/button_mockup.dart';
import 'package:infoflight/components/form_error.dart';
import 'package:infoflight/components/social_card.dart';
import 'package:infoflight/core/models/auth_form_data.dart';
import 'package:infoflight/utils/app_routes.dart';
import 'package:infoflight/utils/constants.dart';
import 'package:infoflight/utils/size_config.dart';
import '../no_account_text.dart';

class AuthForm extends StatefulWidget {
  final void Function(AuthFormData formData) onSubmit;
  const AuthForm({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = AuthFormData();
  final List<String> errors = [];
  bool remember = false;
  bool isObscured = true;
  late FocusNode emailFocusNode;

  @override
  void initState() {
    super.initState();
    emailFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    emailFocusNode.dispose();
  }

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
          _buildEmailAuthForm(),
          SizedBox(height: getProportionateScreenHeight(20)),
          _buildPasswordAuthForm(),
          SizedBox(height: getProportionateScreenHeight(20)),
          Row(
            children: [
              _buildRememberCredentials(),
              const Text(
                'Lembrar credenciais',
                style: TextStyle(color: Constants.kNeutralColor),
              ),
              const Spacer(),
              _buildForgetPassword(context)
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(10)),
          ButtonMockUp(
            labelText: _formData.isLogin ? 'Entrar' : 'Cadastrar',
            onPressed: _submit,
            backColor: Constants.KHighLightColor,
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          _buildSocialCardRow(),
          SizedBox(height: getProportionateScreenHeight(20)),
          const NoAccountText(),
          SizedBox(height: getProportionateScreenHeight(40)),
        ],
      ),
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

  Checkbox _buildRememberCredentials() {
    return Checkbox(
        activeColor: Constants.KHighLightColor,
        side: const BorderSide(color: Constants.kNeutralColor),
        value: remember,
        onChanged: (value) {
          setState(() {
            remember = value!;
          });
        });
  }

  GestureDetector _buildForgetPassword(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(AppRoutes.FORGOT_PASSWORD),
      child: const Text(
        'Esqueceu a senha?',
        style: TextStyle(
            color: Constants.kNeutralColor,
            decoration: TextDecoration.underline),
      ),
    );
  }

  TextFormField _buildPasswordAuthForm() {
    return TextFormField(
      focusNode: emailFocusNode,
      obscureText: isObscured,
      onSaved: (newValue) => _formData.email = newValue!,
      decoration: InputDecoration(
        hintText: 'Senha',
        prefixIcon: const Icon(
          Icons.lock,
          color: Constants.kBackgroundColor,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              isObscured = !isObscured;
            });
          },
          child: const Icon(
            Icons.visibility,
            color: Constants.kBackgroundColor,
          ),
        ),
      ),
      onChanged: (value) {
        onChangeEmail(value, errors, setState);
      },
      validator: (value) {
        onValidateEmail(value, errors, setState);
        if (errors.isEmpty) return null;
        return 'A senha não passou em algum critério.';
      },
    );
  }

  TextFormField _buildEmailAuthForm() {
    return TextFormField(
      autofocus: true,
      onEditingComplete: () {
        emailFocusNode.requestFocus();
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
        if (errors.isNotEmpty) return null;
        return 'Há algo de errado com seu email';
      },
    );
  }
}

import 'package:flutter/material.dart';
import '../../core/models/auth_form_data.dart';
import '../../utils/constants.dart';
import '../../utils/size_config.dart';
import '../button_mockup.dart';
import '../form_errors.dart';
import '../no_account_text.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  List<String> errors = [];
  final _formData = AuthFormData();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildEmailForgetPasswordForm(),
          SizedBox(height: getProportionateScreenHeight(10)),
          FormErrors(errors: errors),
          SizedBox(height: getProportionateScreenHeight(10)),
          ButtonMockUp(
            labelText: 'Continue',
            onPressed: () {
              _formKey.currentState?.validate();
            },
            backColor: Constants.KHighLightColor,
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.02),
          const NoAccountText(),
          SizedBox(height: getProportionateScreenHeight(40))
        ],
      ),
    );
  }

  TextFormField _buildEmailForgetPasswordForm() {
    return TextFormField(
      autofocus: true,
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

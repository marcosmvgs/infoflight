import 'package:flutter/material.dart';
import 'package:infoflight/components/button_mockup.dart';
import 'package:infoflight/components/form_error.dart';
import 'package:infoflight/components/no_account_text.dart';
import 'package:infoflight/components/rounded_input_email_field.dart';
import 'package:infoflight/core/models/auth_form_data.dart';
import 'package:infoflight/utils/constants.dart';
import 'package:infoflight/utils/size_config.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(100)),
          Text(
            'Esqueceu a senha?',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(45),
              fontFamily: 'Oswald',
              color: Constants.KHighLightColor,
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 16, 10, 0),
              child: Text(
                "Por favor, insira seu email e nós vamos te enviar as instruções para recuperar sua senha",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const ForgotPasswordForm()
        ],
      ),
    );
  }
}

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
    final size = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          RoundedInputEmailField(
            onSaved: (validEmail) => _formData.email = validEmail!,
            size: size,
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
              final value_ = value ?? '';
              if (value_.isEmpty &&
                  !errors.contains(Constants.kEmailNullError)) {
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
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          FormError(errors: errors),
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
}

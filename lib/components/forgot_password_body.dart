import 'package:flutter/material.dart';
import 'package:infoflight/utils/constants.dart';
import 'package:infoflight/utils/size_config.dart';
import 'forms/forgot_password_form.dart';

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


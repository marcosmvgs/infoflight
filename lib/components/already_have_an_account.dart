import 'package:flutter/material.dart';
import 'package:infoflight/utils/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final void Function()? press;

  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login
          ? 'Não tem uma conta?'
          : 'Já possui uma conta?',
          style: TextStyle(color: Constants.kNeutralColor, fontSize: 14),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login
            ? ' Registre-se!'
            : ' Entre!',
              style: const TextStyle(
                  color: Constants.kNeutralColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
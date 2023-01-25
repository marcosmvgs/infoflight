import 'package:flutter/material.dart';

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
      children: [
        Text(
          login
          ? 'Não tem uma conta?'
          : 'Já possui uma conta?',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login
            ? ' Registre-se!'
            : ' Entre!',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
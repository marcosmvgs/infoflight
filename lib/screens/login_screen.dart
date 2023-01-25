import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:infoflight/components/already_have_an_account.dart';
import 'package:infoflight/components/button_mockup.dart';
import 'package:infoflight/components/rounded_input_field.dart';
import 'package:infoflight/components/rounded_password_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 95,
            left: 5,
            width: size.width + 5,
            height: size.height,
            child: Image.asset(
              'assets/images/login_image.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              width: size.width,
              height: size.height * 0.5,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(0, 0, 0, 0),
                    Color.fromARGB(255, 17, 17, 17),
                  ],
                  begin: Alignment(0, -1),
                  end: Alignment(0, 1),
                )),
              )),
          Positioned(
            top: 100,
            child: Text(
              "Vamos começar!",
              style: TextStyle(
                fontFamily: 'Oswald',
                color: Theme.of(context)
                    .colorScheme
                    .secondaryContainer
                    .withAlpha(185),
                fontSize: 50,
              ),
            ),
          ),
          Positioned(
              top: 400,
              child: Column(
                children: [
                  RoundedInputField(
                    size: size,
                    hintText: 'Seu email',
                    onChanged: (email) {},
                  ),
                  RoundedPasswordField(
                    size: size,
                    onChaged: (password) {},
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    //padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: size.width * 0.9,
                    height: 50,
                    child: ButtonMockUp(
                      labelText: 'Entrar',
                      onPressed: () {},
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
                      });
                    },
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

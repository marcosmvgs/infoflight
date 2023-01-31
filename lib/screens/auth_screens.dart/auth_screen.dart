import 'package:flutter/material.dart';
import 'package:infoflight/components/forms/auth_form.dart';
import 'package:infoflight/core/models/auth_form_data.dart';
import 'package:infoflight/core/services/auth_service.dart';
import 'package:infoflight/utils/app_routes.dart';
import 'package:infoflight/utils/constants.dart';
import '../../utils/size_config.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Future<void> _handleSubmit(AuthFormData formData) async {
    try {
      if (!mounted) return;
      setState(() {});
      final usersMap = AuthService().users;
      if (usersMap[formData.email] == null) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: const Text('Email não está cadastrado'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pushNamed(AppRoutes.SIGNUP);
                        },
                        child: const Text('Cadastre-se')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Fechar'))
                  ],
                ));
      }

      await AuthService().login(
        formData.email,
        formData.password,
      );
    } catch (error) {
      error.toString();
      // Tratar erro
    } finally {}
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              bottom: 80,
              child: SizedBox(
                width: size.width,
                height: size.height,
                child: Image.asset(
                  'assets/images/login_image.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: size.width,
                height: size.height * 0.5,
                decoration: const BoxDecoration(
                    gradient: Constants.kBackgroundGradient),
              ),
            ),
            Positioned(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(10, 50, 10, 20),
                width: size.width,
                height: size.height,
                child: Column(
                  children: [
                    SizedBox(height: getProportionateScreenHeight(40)),
                    const Text(
                      'Vamos começar!',
                      style: TextStyle(
                          fontSize: 50,
                          color: Constants.KHighLightColor,
                          fontFamily: 'Oswald'),
                    ),
                    const Expanded(
                      child: Text(
                        'Preencha seu email e senha\n ou faça o login com uma rede social.',
                        textAlign: TextAlign.center,
                        style: Constants.kTextStyleNeutral,
                      ),
                    ),
                    AuthForm(onSubmit: _handleSubmit)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

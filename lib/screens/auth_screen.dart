import 'package:flutter/material.dart';
import 'package:infoflight/components/auth_form.dart';
import 'package:infoflight/core/models/auth_form_data.dart';
import 'package:infoflight/core/services/auth_service.dart';
import 'package:infoflight/utils/constants.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLoading = false;

  Future<void> _handleSubmit(AuthFormData formData) async {
    try {
      if (!mounted) return;
      setState(() {
        _isLoading = true;
      });
      if (formData.isLogin) {
        await AuthService().login(
          formData.email,
          formData.password,
        );
      } else {
        await AuthService().signup(
          formData.name,
          formData.email,
          formData.password,
        );
      }
    } catch (error) {
      // Tratar erro
    } finally {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 32),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: size.width,
            height: size.height,
          ),
          Positioned(
            bottom: 80,
            child: Container(
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
              decoration:
                  const BoxDecoration(gradient: Constants.kBackgroundGradient),
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
                      style: TextStyle(
                          color: Constants.kNeutralColor, fontSize: 14),
                    ),
                  ),
                  AuthForm(size: size, onSubmit: _handleSubmit)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

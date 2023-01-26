import 'package:flutter/material.dart';
import 'package:infoflight/components/auth_form.dart';
import 'package:infoflight/core/models/auth_form_data.dart';
import 'package:infoflight/core/services/auth_service.dart';

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
              top: 200,
              height: size.height * 0.7,
              child: AuthForm(
                onSubmit: _handleSubmit,
                size: size,
              )),
          if (_isLoading)
            Container(
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
              child: Center(
                child: RefreshProgressIndicator(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
              ),
            )
        ],
      ),
    );
  }
}

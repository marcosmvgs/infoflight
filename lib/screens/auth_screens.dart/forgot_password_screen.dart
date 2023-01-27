import 'package:flutter/material.dart';
import 'package:infoflight/components/forgot_password_body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: size.width,
              height: size.height,
            ),
            Positioned(
              bottom: 40,
              child: SizedBox(
                width: size.width,
                height: size.height,
                child: Image.asset(
                  'assets/images/forgot_password_screen_image.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: size.width,
              height: size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Color.fromARGB(0, 0, 0, 0), Colors.black],
                  begin: Alignment(0, -0.6),
                  end: Alignment(0, 0.7),
                )
              ),
            ),
            SizedBox(
              width: size.width,
              height: size.height,
              child: const ForgotPasswordBody()),
          ],
        ),
      ),
    );
  }
}

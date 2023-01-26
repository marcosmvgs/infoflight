import 'package:flutter/cupertino.dart';
import 'package:infoflight/core/models/app_user.dart';
import 'package:infoflight/core/services/auth_service.dart';
import 'package:infoflight/screens/auth_screen.dart';
import 'package:infoflight/screens/homepage_sceen.dart';
import 'package:infoflight/screens/loading_screen.dart';

class AuthOrApp extends StatelessWidget {
  const AuthOrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppUser?>(
      stream: AuthService().userChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else {
          return snapshot.hasData ? const HomepageScreen() : const AuthScreen();
        }
      },
    );
  }
}

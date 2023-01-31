import 'package:flutter/material.dart';
import 'package:infoflight/core/models/airfields_list.dart';
import 'package:infoflight/core/models/selected_airfields_list.dart';
import 'package:infoflight/core/models/selected_products_list.dart';
import 'package:infoflight/core/services/auth_or_app.dart';
import 'package:infoflight/screens/airfield_info_screen.dart';
import 'package:infoflight/screens/auth_screens.dart/signup_screen.dart';
import 'package:infoflight/screens/create_flight_screen.dart';
import 'package:infoflight/screens/auth_screens.dart/forgot_password_screen.dart';
import 'package:infoflight/screens/homepage_sceen.dart';
import 'package:infoflight/screens/auth_screens.dart/auth_screen.dart';
import 'package:infoflight/screens/onboard_screen.dart';
import 'package:infoflight/screens/profile_seetings_screen.dart';
import 'package:infoflight/themes.dart' as theme_folder;
import 'package:infoflight/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeData theme = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SelectedAirfieldsList(),
        ),
        ChangeNotifierProvider(
          create: (_) => SelectedProductsList(),
        ),
        ChangeNotifierProvider(create: (_) => AirfieldsList()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'InfoFlight',
        theme: theme_folder.theme(),
        routes: {      
          AppRoutes.HOMEPAGE: (context) => const HomepageScreen(),
          AppRoutes.CREATE_FLIGHT: (context) => const CreateFlightScreen(),
          AppRoutes.PROFILE_SETTINGS: (context) =>
              const ProfileSettingsScreen(),
          AppRoutes.AIRFIELD_INFO: (context) => const AirfieldInforScreen(),
          AppRoutes.ONBOARD: (context) => const OnboardScreen(),
          AppRoutes.LOGIN: (context) => const AuthScreen(),
          AppRoutes.AUTH_OR_APP: (context) => const AuthOrApp(),
          AppRoutes.FORGOT_PASSWORD: (context) => const ForgotPasswordScreen(),
          AppRoutes.SIGNUP: (context) => const SignupScreen(),
        },
      ),
    );
  }
}

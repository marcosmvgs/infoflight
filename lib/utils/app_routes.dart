// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';

import '../core/services/auth_or_app.dart';
import '../screens/airfield_info_screen.dart';
import '../screens/auth_screens.dart/auth_screen.dart';
import '../screens/auth_screens.dart/forgot_password_screen.dart';
import '../screens/auth_screens.dart/signup_screen.dart';
import '../screens/create_flight_screen.dart';
import '../screens/homepage_sceen.dart';
import '../screens/onboard_screen.dart';
import '../screens/profile_seetings_screen.dart';

class AppRoutes {
  static const String ONBOARD = '/';
  static const String HOMEPAGE = '/homepage';
  static const String CREATE_FLIGHT = '/create-form';
  static const String PROFILE_SETTINGS = '/profile-settings';
  static const String AIRFIELD_INFO = '/airfield-info';
  static const String LOGIN = '/login';
  static const String AUTH_OR_APP = '/auth-or-app';
  static const String FORGOT_PASSWORD = '/forgot_password';
  static const String SIGNUP = '/signup';
}


final Map<String, Widget Function(BuildContext)> routesMap =  {      
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
        };

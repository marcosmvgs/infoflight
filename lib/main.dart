import 'package:flutter/material.dart';
import 'package:infoflight/core/models/airfields_list.dart';
import 'package:infoflight/core/models/selected_airfields_list.dart';
import 'package:infoflight/core/models/selected_products_list.dart';
import 'package:infoflight/core/services/auth_or_app.dart';
import 'package:infoflight/screens/airfield_info_screen.dart';
import 'package:infoflight/screens/create_flight_screen.dart';
import 'package:infoflight/screens/forgot_password_screen.dart';
import 'package:infoflight/screens/homepage_sceen.dart';
import 'package:infoflight/screens/auth_screen.dart';
import 'package:infoflight/screens/onboard_screen.dart';
import 'package:infoflight/screens/profile_seetings_screen.dart';
import 'package:infoflight/utils/app_routes.dart';
import 'package:provider/provider.dart';
import 'utils/constants.dart';

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
        theme: theme.copyWith(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: const Color.fromRGBO(26, 26, 26, 1.0),
          colorScheme: theme.colorScheme.copyWith(),
          appBarTheme: theme.appBarTheme.copyWith(
              elevation: 0.0,
              backgroundColor: const Color.fromRGBO(26, 26, 26, 1.0),
              titleTextStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Constants.kNeutralColor,
              )),
          listTileTheme: theme.listTileTheme.copyWith(
            iconColor: Constants.KHighLightColor,
            textColor: Constants.kBackgroundColor,
          ),
          drawerTheme: theme.drawerTheme.copyWith(
            backgroundColor: Constants.kNeutralColor,
          ),
          textTheme: theme.textTheme.copyWith(
            bodyMedium: Constants.kTextStyleNeutral
          )
        ),
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
        },
      ),
    );
  }
}

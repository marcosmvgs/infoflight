import 'package:flutter/material.dart';
import 'package:infoflight/models/airfields_list.dart';
import 'package:infoflight/models/selected_airfields_list.dart';
import 'package:infoflight/models/selected_products_list.dart';
import 'package:infoflight/screens/airfield_info_screen.dart';
import 'package:infoflight/screens/create_flight_screen.dart';
import 'package:infoflight/screens/onboard_screen.dart';
import 'package:infoflight/screens/profile_seetings_screen.dart';
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
        title: 'InfoFlight',
        theme: theme.copyWith(
            scaffoldBackgroundColor: const Color.fromRGBO(26, 26, 26, 1.0),
            colorScheme: theme.colorScheme.copyWith(
              primaryContainer: const Color.fromRGBO(250, 250, 250, 1),
              secondaryContainer: const Color.fromARGB(255, 252, 184, 74),
            ),
            appBarTheme: theme.appBarTheme.copyWith(
                elevation: 0.0,
                backgroundColor: const Color.fromRGBO(26, 26, 26, 1.0),
                titleTextStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(250, 250, 250, 1),
                )),
            textTheme: theme.textTheme.copyWith(
              headline4: const TextStyle(
                color: Color.fromRGBO(250, 250, 250, 1),
                fontSize: 20,
              ),
              headline5: const TextStyle(
                color: Color.fromRGBO(250, 250, 250, 1),
                fontSize: 20,
              ),
            ),
            listTileTheme: theme.listTileTheme.copyWith(
              iconColor: const Color.fromARGB(255, 252, 184, 74),
              textColor: const Color.fromRGBO(26, 26, 26, 1.0),
            ),
            drawerTheme: theme.drawerTheme.copyWith(
              backgroundColor: const Color.fromARGB(255, 236, 236, 236),
            )),
        routes: {
          AppRoutes.HOMEPAGE: (context) => const OnboardScreen(),
          AppRoutes.CREATE_FLIGHT: (context) => const CreateFlightScreen(),
          AppRoutes.PROFILE_SETTINGS: (context) =>
              const ProfileSettingsScreen(),
          AppRoutes.AIRFIELD_INFO: (context) => const AirfieldInforScreen(),
        },
      ),
    );
  }
}

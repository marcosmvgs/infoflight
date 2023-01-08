import 'package:flutter/material.dart';
import 'package:infoflight/components/app_drawer.dart';
import 'package:infoflight/screens/homepage_sceen.dart';
import 'package:infoflight/utils/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeData theme = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InfoFlight',
      theme: theme.copyWith(
        scaffoldBackgroundColor: const Color.fromRGBO(26, 26, 26, 1.0),
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
          iconColor: const Color.fromRGBO(255, 190, 85, 1.0),
          textColor: const Color.fromRGBO(26, 26, 26, 1.0),
        ),
        drawerTheme: theme.drawerTheme.copyWith(
          backgroundColor: Color.fromARGB(255, 236, 236, 236),
        )
      ),
      routes: {
        AppRoutes.HOMEPAGE:(context) => const HomepageScreen(),
      },
    );
  }
}


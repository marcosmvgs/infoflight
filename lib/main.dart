import 'package:flutter/material.dart';
import 'package:infoflight/screens/homepage_sceen.dart';

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
            )
          )),
      home: const HomepageScreen(),
    );
  }
}

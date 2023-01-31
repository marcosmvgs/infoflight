import 'package:flutter/material.dart';
import 'package:infoflight/utils/constants.dart';

ThemeData theme() {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Constants.kBackgroundColor,
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    listTileTheme: listTileTheme()
  );
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    fillColor: const Color.fromARGB(220, 255, 255, 255),
    filled: true,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 20,
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: Colors.white),
        gapPadding: 10),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: const BorderSide(color: Colors.white),
      gapPadding: 10,
    ),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: Colors.white),
        gapPadding: 10),
    
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
      elevation: 0.0,
      backgroundColor: Constants.kBackgroundColor,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Constants.kNeutralColor,
      ));
}

TextTheme textTheme() {
  return const TextTheme(bodyMedium: Constants.kTextStyleNeutral);
}

DrawerThemeData drawerTheme() {
  return const DrawerThemeData(backgroundColor: Constants.kNeutralColor);
}

ListTileThemeData listTileTheme() {
  return const ListTileThemeData(
    iconColor: Constants.KHighLightColor,
    textColor: Constants.kBackgroundColor,
  );
}

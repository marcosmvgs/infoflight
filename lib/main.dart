import 'package:flutter/material.dart';
import 'package:infoflight/core/models/airfields_list.dart';
import 'package:infoflight/core/models/selected_airfields_list.dart';
import 'package:infoflight/core/models/selected_products_list.dart';
import 'package:infoflight/themes.dart' as theme_folder;
import 'package:infoflight/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        routes: routesMap,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:infoflight/components/app_drawer.dart';
import 'package:infoflight/utils/app_routes.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InfoFlight'),
        actions: [
          GestureDetector(
            onTap: (() {
              Navigator.of(context).pushNamed(AppRoutes.PROFILE_SETTINGS);
            }),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
              child: CircleAvatar(
                backgroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
                foregroundColor: Theme.of(context).appBarTheme.backgroundColor,
                child: const Icon(Icons.person),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Text(
          'Home Page do Aplicativo',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}

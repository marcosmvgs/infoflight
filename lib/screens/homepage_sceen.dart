import 'package:flutter/material.dart';
import 'package:infoflight/components/app_drawer.dart';
import 'package:infoflight/core/models/airfields_list.dart';
import 'package:infoflight/core/services/auth_service.dart';
import 'package:infoflight/utils/constants.dart';
import 'package:provider/provider.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  late Future<void> _loadAirfieldsList;

  @override
  void initState() {
    super.initState();

    _loadAirfieldsList =
        Provider.of<AirfieldsList>(context, listen: false).loadAirfields();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('InfoFlight'),
          actions: [
            GestureDetector(
              onTap: (() {
                AuthService().logout();
              }),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                child: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                  foregroundColor:
                      Theme.of(context).appBarTheme.backgroundColor,
                  child: const Icon(Icons.person),
                ),
              ),
            )
          ],
        ),
        drawer: const AppDrawer(),
        body: FutureBuilder(
          future: _loadAirfieldsList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return const Center(
                child: Text('Seja bem vindo!',
                    textAlign: TextAlign.center,
                    style: Constants.kTextStyleNeutral),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}

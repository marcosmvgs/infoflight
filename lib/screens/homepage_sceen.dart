import 'package:flutter/material.dart';
import 'package:infoflight/components/app_drawer.dart';
import 'package:infoflight/models/airfields_list.dart';
import 'package:infoflight/utils/app_routes.dart';
import 'package:provider/provider.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  late Future<void> _future;

  @override
  void initState() {
    super.initState();
    Provider.of<AirfieldsList>(context, listen: false).loadAirfieldsColors();
    _future =
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
      body: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Center(
                child: Text(
                  'Lista de Aeródromos carregada',
                  style: Theme.of(context).textTheme.headline4,
                ),
              );
            } else {
              return const Center(
                child: Text('Ops... deu algum erro.'),
              );
            }
          }),
      drawer: const AppDrawer(),
    );
  }
}

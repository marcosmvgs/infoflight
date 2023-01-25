import 'package:flutter/material.dart';
import 'package:infoflight/components/app_drawer.dart';
import 'package:infoflight/components/flight_form.dart';
import 'package:infoflight/core/models/airfields_list.dart';
import 'package:provider/provider.dart';

class CreateFlightScreen extends StatefulWidget {
  const CreateFlightScreen({super.key});

  @override
  State<CreateFlightScreen> createState() => _CreateFlightScreenState();
}

class _CreateFlightScreenState extends State<CreateFlightScreen> {

  @override
  Widget build(BuildContext context) {
    final airportList =
        Provider.of<AirfieldsList>(context, listen: false).airfields;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 218, 218, 218),
        appBar: AppBar(
          title: const Text('Criar Voo'),
        ),
        drawer: const AppDrawer(),
        floatingActionButton: SizedBox(
          width: 200,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
                foregroundColor: Theme.of(context).scaffoldBackgroundColor,
                elevation: 8),
            child: const Text(
              'Criar Voo',
              style: TextStyle(fontSize: 16),
            ),
            onPressed: () {
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: FlightForm(airportList: airportList));
  }
}


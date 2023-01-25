import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:infoflight/core/models/airfield.dart';
import 'package:intl/intl.dart';

class FlightForm extends StatefulWidget {
  const FlightForm({
    Key? key,
    required List<Airfield> airportList,
  })  : _airportList = airportList,
        super(key: key);

  final List<Airfield> _airportList;

  @override
  State<FlightForm> createState() => _FlightFormState();
}

class _FlightFormState extends State<FlightForm> {
  Duration tempoVoo = const Duration(hours: 0);
  DateTime? _pickedDepDateTime;
  DateTime? _pickedLandDateTime;
  final _formKey = GlobalKey<FormState>();

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Decolagem - Data e Hora',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: FormBuilderDropdown(
                    name: 'dep_airport',
                    items: widget._airportList.map((e) {
                      return DropdownMenuItem(
                        value: e.icao,
                        child: Text(e.icao),
                      );
                    }).toList(),
                    validator: (value) {
                      final depAirfield = value ?? '';
                      if (depAirfield.isNotEmpty) {
                        return null;
                      } else {
                        return 'Informe um Aeródromo';
                      }
                    },
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                    flex: 3,
                    child: FormBuilderDateTimePicker(
                      format: DateFormat('d/M/y H:m:s'),
                      onChanged: (value) {
                        _pickedDepDateTime = value;
                      },
                      textAlign: TextAlign.center,
                      name: 'dep_datetime',
                      decoration: const InputDecoration(
                        hintText: 'Data/Hora (Z)',
                      ),
                      validator: (value) {
                        final depDateTime = value;
                        if (depDateTime != null) {
                          return null;
                        } else {
                          return 'Informe Data e Hora';
                        }
                      },
                    )),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Pouso - Data e Hora',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: FormBuilderDropdown(
                    
                    name: 'land_airport',
                    items: widget._airportList.map((e) {
                      return DropdownMenuItem(
                        value: e.icao,
                        child: Text(e.icao),
                      );
                    }).toList(),
                    validator: (value) {
                      final landAirfield = value ?? '';
                      if (landAirfield.isNotEmpty) {
                        return null;
                      } else {
                        return 'Informe um Aeródromo';
                      }
                    },
                  ),
                  
                ),
                const SizedBox(width: 30),
                Expanded(
                    flex: 2,
                    child: FormBuilderDateTimePicker(
                      format: DateFormat('d/M/y H:m:s'),
                      onChanged: (value) {
                        _pickedLandDateTime = value;

                        setState(() {
                          tempoVoo = _pickedLandDateTime!
                              .difference(_pickedDepDateTime!);
                        });
                      },
                      textAlign: TextAlign.center,
                      name: 'land_datetime',
                      decoration: const InputDecoration(
                        hintText: 'Data/Hora (Z)',
                      ),
                    )),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                        'Tempo de Voo: ${tempoVoo.inHours}:${tempoVoo.inMinutes.remainder(60)}'),
                  ),
                ),
                Expanded(
                  child: FormBuilderTextField(
                    name: 'num-pousos',
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Nº Pousos'),

                  ))
              ],
            ),
            ElevatedButton(
                onPressed: _submitForm, child: const Text('Enviar formulário'))
          ],
        ),
      ),
    );
  }
}

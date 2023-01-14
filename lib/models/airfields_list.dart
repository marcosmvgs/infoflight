import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:infoflight/models/airfield.dart';
import 'package:http/http.dart' as http;

class AirfieldsList with ChangeNotifier {
  final List<Airfield> _airfields = [];
  final List<Map<String, String>> _airfieldsColors = [];

  static const String _baseUrl =
      "https://api-redemet.decea.mil.br/aerodromos/?api_key=Ab7mwKofsb2zfTUStwB3ltFSlkO20Ab4bxIczWlu";

  static const String _baseUrlStatus =
      "https://api-redemet.decea.mil.br/aerodromos/status?api_key=Ab7mwKofsb2zfTUStwB3ltFSlkO20Ab4bxIczWlu";

  List<Airfield> get airfields {
    return [..._airfields];
  }

  Future<void> loadAirfields() async {
    _airfields.clear();
    final response = await http.get(Uri.parse(_baseUrl));
    //print(jsonDecode(response.body)['data']);
    List<dynamic> data = jsonDecode(response.body)['data'];
    for (var airfield in data) {
      final color = _airfieldsColors
          .where((e) => e.keys.first.toString() == airfield['cod'].toString())
          .toList();
      if (color.isNotEmpty) {
        _airfields.add(Airfield(
          icao: airfield['cod'],
          city: airfield['cidade'],
          color: color[0][airfield['cod']]
        ));
      } else {
         _airfields.add(Airfield(
          icao: airfield['cod'],
          city: airfield['cidade'],
        ));
      }
    }
    notifyListeners();
  }

  Future<void> loadAirfieldsColors() async {
    _airfieldsColors.clear();
    final response = await http.get(Uri.parse(_baseUrlStatus));
    List<dynamic> data = jsonDecode(response.body)['data'];
    for (var airfield in data) {
      _airfieldsColors.add({airfield[0].toString(): airfield[4].toString()});
    }
    notifyListeners();
  }
}

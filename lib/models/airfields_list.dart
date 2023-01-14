import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:infoflight/models/airfield.dart';
import 'package:http/http.dart' as http;

class AirfieldsList with ChangeNotifier {
  final List<Airfield> _airfields = [];

  static const String _baseUrl =
      "https://api-redemet.decea.mil.br/aerodromos/?api_key=Ab7mwKofsb2zfTUStwB3ltFSlkO20Ab4bxIczWlu&pais=Brasil";

  static const String _baseUrlStatus =
      "https://api-redemet.decea.mil.br/aerodromos/status/pais/BRASIL?api_key=Ab7mwKofsb2zfTUStwB3ltFSlkO20Ab4bxIczWlu";

  List<Airfield> get airfields {
    return [..._airfields];
  }

  Future<void> loadAirfields() async {
    final airfieldStatus = await loadAirfieldsColors();

    _airfields.clear();
    final response = await http.get(Uri.parse(_baseUrl));

    Map<String, dynamic> rawData = jsonDecode(response.body);
    if (rawData['status'] == true) {
      List<dynamic> data = rawData['data'];
      for (Map<String, dynamic> airfieldItem in data) {
        final airfieldItemColor = airfieldStatus
            .firstWhere((element) => element
            .containsKey(airfieldItem['cod'])).values.first;
        _airfields.add(Airfield(
          icao: airfieldItem['cod'],
          city: airfieldItem['cidade'],
          color: airfieldItemColor,
        ));
      }
    } else {
      log('status falso');
    }
    notifyListeners();
  }

  Future<List<Map<String, String>>> loadAirfieldsColors() async {
    final List<Map<String, String>> airfieldsColors = [];
    final response = await http.get(Uri.parse(_baseUrlStatus));
    Map<String, dynamic> rawData = jsonDecode(response.body);
    if (rawData['status'] == true) {
      List<dynamic> data = rawData['data'];
      for (var airfieldStatusItem in data) {
        airfieldsColors.add({
          airfieldStatusItem[0].toString(): airfieldStatusItem[4].toString()
        });
      }
    } else {
      log('não entrei no rawdata');
    }
    return airfieldsColors;
  }
}

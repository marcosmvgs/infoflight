import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:infoflight/models/airfield.dart';
import 'package:http/http.dart' as http;
import 'package:infoflight/utils/constants.dart';

class AirfieldsList with ChangeNotifier {
  final List<Airfield> _airfields = [];

  final _airfieldInfoUrl = Constants.AIRFIELD_INFO_URL;
  final _baseUrlStatus = Constants.AIRFIELD_STATUS_URL;

  List<Airfield> get airfields {
    return [..._airfields];
  }

  Future<void> loadAirfields() async {
    final airfieldStatus = await loadAirfieldsColors();

    _airfields.clear();
    final response = await http.get(Uri.parse(_airfieldInfoUrl));

    Map<String, dynamic> rawData = jsonDecode(response.body);
    if (rawData['status'] == true) {
      List<dynamic> data = rawData['data'];
      for (Map<String, dynamic> airfieldItem in data) {
        final airfieldItemColor = airfieldStatus
            .firstWhere((element) => element.containsKey(airfieldItem['cod']))
            .values
            .first;

        final metarTaf = airfieldItemColor['METAR/TAF'].toString();
        final metarExp = RegExp(
          "^(METAR|SPECI)(.|\n)*?(=|${airfieldItem['cod']})\$",
          multiLine: true,
        );
        final tafExp = RegExp(
          "^(TAF)(.|\n)*?(=|${airfieldItem['cod']})\$",
          multiLine: true,
        );
        final metar = metarExp.firstMatch(metarTaf)?.group(0);
        final taf = tafExp.firstMatch(metarTaf)?.group(0);

        _airfields.add(Airfield(
            icao: airfieldItem['cod'],
            city: airfieldItem['cidade'],
            color: airfieldItemColor['cor'],
            country: airfieldItem['pais'],
            name: airfieldItem['nome'],
            metar: metar,
            taf: taf));
      }
    } else {
      log('status falso');
    }
    notifyListeners();
  }

  Future<List<Map<String, dynamic>>> loadAirfieldsColors() async {
    final List<Map<String, dynamic>> airfieldsColors = [];
    final response = await http.get(Uri.parse(_baseUrlStatus));
    Map<String, dynamic> rawData = jsonDecode(response.body);
    if (rawData['status'] == true) {
      List<dynamic> data = rawData['data'];
      for (var airfieldStatusItem in data) {
        airfieldsColors.add({
          airfieldStatusItem[0].toString(): {
            'cor': airfieldStatusItem[4].toString(),
            'METAR/TAF': airfieldStatusItem[5],
          }
        });
      }
    } else {
      log('não entrei no rawdata');
    }
    return airfieldsColors;
  }
}

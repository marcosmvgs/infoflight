import 'package:flutter/cupertino.dart';
import 'package:infoflight/models/airfield.dart';

class SelectedAirfieldsList with ChangeNotifier {
  List<Airfield> _selectedAirfieldsList = [];

  List<Airfield> get selectedAirfieldsList {
    return [..._selectedAirfieldsList];
  }

  void updateSelectedAirfieldList(List<Airfield> data) {
    _selectedAirfieldsList = data;
    notifyListeners();
  }

  void clearSelectedAirfieldsList() {
    _selectedAirfieldsList = [];
    notifyListeners();
  }

  int getLenght() {
    return _selectedAirfieldsList.length;
  }
}

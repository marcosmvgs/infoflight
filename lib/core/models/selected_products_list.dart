import 'package:flutter/cupertino.dart';
import 'package:infoflight/core/data/products_data.dart';

class SelectedProductsList with ChangeNotifier {
  List<Products> _selectedProductsList = [];

  List<Products> get selectedProductsList {
    return [..._selectedProductsList];
  }

  void addProduct(Products product) {
    _selectedProductsList.add(product);
    notifyListeners();
  }

  void removeProduct(Products product) {
    _selectedProductsList.remove(product);
    notifyListeners();
  }

  void clearProducts() {
    _selectedProductsList = [];
    notifyListeners();
  }
}

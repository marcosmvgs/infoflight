import 'package:flutter/material.dart';
import 'package:infoflight/components/chips_input.dart';
import 'package:infoflight/components/info_item.dart';
import 'package:infoflight/components/product_item.dart';
import 'package:infoflight/data/products_data.dart';
import 'package:infoflight/models/airfields_list.dart';
import 'package:infoflight/models/selected_airfields_list.dart';
import 'package:infoflight/models/selected_products_list.dart';
import 'package:provider/provider.dart';

class AirfieldInforScreen extends StatefulWidget {
  const AirfieldInforScreen({super.key});

  @override
  State<AirfieldInforScreen> createState() => _AirfieldInforScreenState();
}

class _AirfieldInforScreenState extends State<AirfieldInforScreen> {
  bool _showResults = false;
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SelectedProductsList>(context, listen: false).clearProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final airfieldsList =
        Provider.of<AirfieldsList>(context, listen: false).airfields;
    var selectedAirfields =
        Provider.of<SelectedAirfieldsList>(context, listen: false)
            .selectedAirfieldsList;
    var selectedProductsProvider =
        Provider.of<SelectedProductsList>(context, listen: false);
    var selectedProductsList = selectedProductsProvider.selectedProductsList;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: !_isSearching
            ? const Text(
                'Selecione os produtos e clique para pesquisar...',
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              )
            : ChipsInputWidget(mockResults: airfieldsList),
        automaticallyImplyLeading: _isSearching ? false : true,
        actions: _isSearching
            ? [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isSearching = !_isSearching;
                    });
                    Provider.of<SelectedAirfieldsList>(context, listen: false)
                        .clearSelectedAirfieldsList();
                  },
                  icon: const Icon(Icons.cancel),
                ),
              ]
            : [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      _isSearching = !_isSearching;
                    });
                  },
                ),
              ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            height: 90,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Products.values.length,
                itemBuilder: (context, index) => ProductItem(
                      product: Products.values[index],
                      onSelected: (bool value) {
                        if (value) {
                          selectedProductsProvider
                              .addProduct(Products.values[index]);
                        } else {
                          selectedProductsProvider
                              .removeProduct(Products.values[index]);
                        }
                      },
                    )),
          ),
          ElevatedButton(
            onPressed: () {
              selectedAirfields =
                  Provider.of<SelectedAirfieldsList>(context, listen: false)
                      .selectedAirfieldsList;
              if (selectedAirfields.isEmpty) {
                return;
              } else {
                setState(() {
                  _showResults = true;
                });
              }
            },
            child: const Text('Pesquisar'),
          ),
          _showResults &&
                  selectedAirfields.isNotEmpty &&
                  selectedProductsList.isNotEmpty
              ? SizedBox(
                  height: 500,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: selectedAirfields.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                            child:
                                InfoItem(airfield: selectedAirfields[index]));
                      }),
                )
              : Expanded(
                  child: Center(
                    child: Text(
                      'Selecione os produtos e aeródromos e clique em Pesquisar...',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

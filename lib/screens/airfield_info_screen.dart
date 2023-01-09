import 'package:flutter/material.dart';
import 'package:infoflight/components/chips_input.dart';
import 'package:infoflight/components/product_item.dart';
import 'package:infoflight/data/products_data.dart';
import 'package:infoflight/models/airfield.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  bool _isSearching = false;
  final Icon _customIcom = const Icon(Icons.search);

  @override
  Widget build(BuildContext context) {
    const mockResults = <Airfield>[
      Airfield(
        icao: 'SBGR',
        city: 'Guarulhos-SP',
      ),
      Airfield(
        icao: 'SBVC',
        city: 'Campinas-SP',
      ),
      Airfield(
        icao: 'SBBV',
        city: 'Boa Vista-RR',
      ),
      Airfield(
        icao: 'SBCC',
        city: 'Alta FLoresta-PA',
      ),
    ];

    return Scaffold(
        appBar: AppBar(
          title: !_isSearching
              ? const Text(
                  'Selecione os produtos e clique para pesquisar...',
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                )
              : const ChipsInputWidget(mockResults: mockResults),
          automaticallyImplyLeading: _isSearching ? false : true,
          actions: _isSearching
              ? [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isSearching = !_isSearching;
                      });
                    },
                    icon: const Icon(Icons.cancel),
                  ),
                ]
              : [
                  IconButton(
                    icon: _customIcom,
                    onPressed: () {
                      setState(() {
                        _isSearching = !_isSearching;
                      });
                    },
                  ),
                ],
        ),
        body:  Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            height: 120,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Products.values.length,
                itemBuilder: (context, index) => ProductItem(
                      product: Products.values[index],
                      onSelected: (bool value) {
                        if (value) {}
                      },
                    )),
          ),
        ],
      ),);
  }
}


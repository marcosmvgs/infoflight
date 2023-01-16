import 'package:flutter/material.dart';
import 'package:infoflight/models/airfield.dart';
import 'package:infoflight/models/selected_products_list.dart';
import 'package:provider/provider.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({super.key, required this.airfield});

  final Airfield airfield;

  @override
  Widget build(BuildContext context) {
    final productsList =
        Provider.of<SelectedProductsList>(context, listen: false)
            .selectedProductsList;
    final metarText = airfield.metar ?? 'METAR NÃO DISPONÍVEL';
    final tafText = airfield.taf ?? 'TAF NÃO DISPONÍVEL';

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      color: Colors.blue[100],
      height: 400,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5),
            color: Colors.green[100],
            width: double.infinity,
            height: 40,
            child: Text(
              airfield.icao,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: productsList.length,
              itemBuilder: (context, index) {
                if (productsList[index].label == 'METAR') {
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 10,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(metarText),
                    ),
                  );
                } else if (productsList[index].label == 'TAF') {
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 10,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(tafText),
                    ),
                  );
                } else {
                  return const Text('peguei outra coisa');
                }
              })
        ],
      ),
    );
  }
}

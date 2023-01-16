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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 226, 226, 226),
            Color.fromARGB(255, 236, 236, 236)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter)
      ),
      height: 400,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: const BorderRadius.vertical(bottom: Radius.zero, top: Radius.circular(10)),
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5),
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
                  return InfoCard(text: metarText);
                } else if (productsList[index].label == 'TAF') {
                  return InfoCard(text: tafText);
                } else {
                  return const Text('peguei outra coisa');
                }
              })
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(1, 233, 233, 233),
      borderOnForeground: false,
      elevation: 0,
      margin: const EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 10,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text),
      ),
    );
  }
}

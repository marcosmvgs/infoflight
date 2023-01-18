import 'package:flutter/material.dart';
import 'package:infoflight/components/chips_input.dart';
import 'package:infoflight/data/products_data.dart';
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
          gradient: const LinearGradient(colors: [
            Color.fromARGB(255, 226, 226, 226),
            Color.fromARGB(255, 236, 236, 236)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      height: 400,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: const BorderRadius.vertical(
                  bottom: Radius.zero, top: Radius.circular(10)),
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            width: double.infinity,
            height: 40,
            child: Row(children: [
              inputCircleColor(airfield.color),
              const SizedBox(width: 10),
              Text(
                "${airfield.icao} - ${airfield.city}",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ]),
          ),
          productsList.contains(Products.metar)
              ? EachInfo(text: metarText)
              : const SizedBox(),
          productsList.contains(Products.taf)
              ? EachInfo(text: tafText)
              : const SizedBox(),
        ],
      ),
    );
  }
}

class EachInfo extends StatelessWidget {
  const EachInfo({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Text(text));
  }
}

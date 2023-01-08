import 'package:flutter/material.dart';
import 'package:infoflight/components/product_item.dart';
import 'package:infoflight/data/products_data.dart';


class AirfieldInfoScreen extends StatefulWidget {
  const AirfieldInfoScreen({super.key});

  @override
  State<AirfieldInfoScreen> createState() => _AirfieldInfoScreenState();
}

class _AirfieldInfoScreenState extends State<AirfieldInfoScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações de aeródromo'),
      ),
      body: Column(
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
          )
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:infoflight/models/airfield.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({super.key, required this.airfield});

  final Airfield airfield;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      color: Colors.blue[100],
      height: airfield.metar.length * 1.5,
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
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              airfield.metar,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

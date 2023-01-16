import 'package:flutter/material.dart';

enum Products {
  metar(icon: Icons.cloud, label: 'METAR'),
  taf(icon: Icons.sunny, label: 'TAF', ),
  aip(icon: Icons.book, label: 'AIP-MAP', ),
  rotaer(icon: Icons.route, label: 'ROTAER', ),
  imgSattelite(icon: Icons.satellite, label: 'IMAGENS', ),
  cartas(icon: Icons.airplanemode_active, label: 'CARTAS', );

  const Products({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;
}
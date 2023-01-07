import 'package:flutter/material.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InfoFlight'),
      ),
      body: const Center(child: Text('Home Page do Aplicativo'),),
    );
  }
}
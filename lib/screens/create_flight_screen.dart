import 'package:flutter/material.dart';
import 'package:infoflight/components/app_drawer.dart';

class CreateFlightScreen extends StatelessWidget {
  const CreateFlightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Voo'),
      ),
      body: Center(child: Text('Página de formulário',
      style: Theme.of(context).textTheme.headline4,)),
      drawer: const AppDrawer(),
    );
  }
}
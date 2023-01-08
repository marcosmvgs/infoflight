import 'package:flutter/material.dart';
import 'package:infoflight/components/app_drawer.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InfoFlight'),
      ),
      body: Center(child: Text('Home Page do Aplicativo',
      style: Theme.of(context).textTheme.headline4,),),
      drawer: AppDrawer(),
    );
  }
}
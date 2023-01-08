import 'package:flutter/material.dart';
import 'package:infoflight/components/app_drawer.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
        actions: [
          Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
              width: 120,
              //color: Colors.blue[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.close),
                  Icon(Icons.check),
                ],
              )),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Container(
            alignment: Alignment.center,
            child: const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 60),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Página de edição de Perfil',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
      drawer: const AppDrawer(),
    );
  }
}

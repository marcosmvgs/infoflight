import 'package:flutter/material.dart';
import 'package:infoflight/data/drawer_data.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'Opções',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          ListView.builder(
              padding: const EdgeInsets.all(0),
              shrinkWrap: true,
              itemCount: DrawerItems.values.length,
              itemBuilder: (context, index) {
                
                final item = DrawerItems.values.firstWhere((element) {
                  return element.index == index;
                });

                return Column(
                  children: [
                    ListTile(
                      leading: Icon(item.icon),
                      title: Text(item.title),
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            item.routeToNavigate);
                      },
                    ),
                    const Divider(
                      thickness: 1.2,
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:infoflight/data/drawer_data.dart';
import 'package:infoflight/utils/app_routes.dart';


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
                return Column(
                  children: [
                    ListTile(
                      leading: Icon(DrawerItems.values[index].icon),
                      title: Text(DrawerItems.values[index].title),
                      onTap: () {
                        if (DrawerItems.values[index].routeToNavigate == '/') {
                          return Navigator.of(context).pop();
                        } else {
                          Navigator.of(context)
                              .pushNamed(DrawerItems.values[index].routeToNavigate);
                        }
                      },
                    ),
                    const Divider(thickness: 1.2,),
                  ],
                );
              }),
        ],
      ),
    );
  }
}

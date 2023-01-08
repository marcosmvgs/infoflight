import 'package:flutter/material.dart';
import 'package:infoflight/utils/app_routes.dart';

enum DrawerItems {
  item1(
    title: 'Criar voo',
    icon: Icons.airplanemode_on,
    routeToNavigate: AppRoutes.HOMEPAGE,
  ),

  item2(
    title: 'Informações de Aeródromo',
    icon: Icons.cloud,
    routeToNavigate: AppRoutes.HOMEPAGE,
  ),

  item3(
    title: 'Notícias da Aviação',
    icon: Icons.newspaper,
    routeToNavigate: AppRoutes.HOMEPAGE,
  ),

  item4(
    title: 'Configurações',
    icon: Icons.settings,
    routeToNavigate: AppRoutes.HOMEPAGE,
  ),

  item5(
    title: 'Sair',
    icon: Icons.logout,
    routeToNavigate: AppRoutes.HOMEPAGE,
  ),
  ;

  const DrawerItems({
    required this.title,
    required this.icon,
    required this.routeToNavigate,
  });

  final String title;
  final IconData icon;
  final String routeToNavigate;
}

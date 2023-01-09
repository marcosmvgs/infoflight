import 'package:flutter/material.dart';
import 'package:infoflight/utils/app_routes.dart';

enum DrawerItems {
  home(
    position: 1,
    title: 'Home',
    icon: Icons.home,
    routeToNavigate: AppRoutes.HOMEPAGE,
  ),

  criarVoo(
    position: 2,
    title: 'Criar voo',
    icon: Icons.airplanemode_on,
    routeToNavigate: AppRoutes.HOMEPAGE,
  ),

  informacaoAerodromo(
    position: 3,
    title: 'Informações de Aeródromo',
    icon: Icons.cloud,
    routeToNavigate: AppRoutes.AIRFIELD_INFO,
  ),

  noticiasAviacao(
    position: 4,
    title: 'Notícias da Aviação',
    icon: Icons.newspaper,
    routeToNavigate: AppRoutes.HOMEPAGE,
  ),

  config(
    position: 5,
    title: 'Configurações',
    icon: Icons.settings,
    routeToNavigate: AppRoutes.HOMEPAGE,
  ),

  sair(
    position: 6,
    title: 'Sair',
    icon: Icons.logout,
    routeToNavigate: AppRoutes.HOMEPAGE,
  ),
  ;

  const DrawerItems({
    required this.position,
    required this.title,
    required this.icon,
    required this.routeToNavigate,
  });

  final int position;
  final String title;
  final IconData icon;
  final String routeToNavigate;
}

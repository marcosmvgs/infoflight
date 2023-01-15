import 'package:flutter/material.dart';
import 'package:infoflight/utils/app_routes.dart';

enum DrawerItems {
  home(
    title: 'Home',
    icon: Icons.home,
    routeToNavigate: AppRoutes.HOMEPAGE,
  ),

  criarVoo(
    title: 'Criar voo',
    icon: Icons.airplanemode_on,
    routeToNavigate: AppRoutes.HOMEPAGE,
  ),

  informacaoAerodromo(
    title: 'Informações de Aeródromo',
    icon: Icons.cloud,
    routeToNavigate: AppRoutes.AIRFIELD_INFO,
  ),

  noticiasAviacao(
    title: 'Notícias da Aviação',
    icon: Icons.newspaper,
    routeToNavigate: AppRoutes.HOMEPAGE,
  ),

  config(
    title: 'Configurações',
    icon: Icons.settings,
    routeToNavigate: AppRoutes.HOMEPAGE,
  ),
  sair(
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

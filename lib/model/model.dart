import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuItem {
  final String menuName;
  final IconData menuIcon;
  final String path;

  const MenuItem({
    @required this.menuName,
    @required this.menuIcon,
    @required this.path,
  });
}

List<MenuItem> menuItems = [
  const MenuItem(
    menuName: 'Home',
    menuIcon: Icons.home,
    path: 'MyHomePage',
  ),
  const MenuItem(
    menuName: 'Favoritos',
    menuIcon: Icons.favorite,
  ),
  const MenuItem(
    menuName: 'Maps',
    menuIcon: Icons.map,
  ),
  const MenuItem(
    menuName: 'Discos',
    menuIcon: Icons.disc_full,
  ),
];

Map<int, Color> color = {
  50: const Color.fromRGBO(255, 92, 87, .1),
  100: const Color.fromRGBO(255, 92, 87, .2),
  200: const Color.fromRGBO(255, 92, 87, .3),
  300: const Color.fromRGBO(255, 92, 87, .4),
  400: const Color.fromRGBO(255, 92, 87, .5),
  500: const Color.fromRGBO(255, 92, 87, .6),
  600: const Color.fromRGBO(255, 92, 87, .7),
  700: const Color.fromRGBO(255, 92, 87, .8),
  800: const Color.fromRGBO(255, 92, 87, .9),
  900: const Color.fromRGBO(255, 92, 87, 1),
};

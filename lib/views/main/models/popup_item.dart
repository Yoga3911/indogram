import 'package:flutter/material.dart';

class MenuItem {
  const MenuItem({required this.name, required this.icon});
  final String name;
  final IconData icon;
}

class MenuItems {
  static const settings = MenuItem(name: "Settings", icon: Icons.settings);
  static const signOut = MenuItem(name: "Sign Out", icon: Icons.logout_rounded);
}

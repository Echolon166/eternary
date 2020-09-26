import 'package:flutter/widgets.dart';

class NavBarItemModel {
  const NavBarItemModel({
    this.title,
    this.icon,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;
}

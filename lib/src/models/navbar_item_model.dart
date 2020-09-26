import 'package:flutter/foundation.dart';

class NavBarItemModel {
  const NavBarItemModel({
    this.title,
    this.onTap,
  });

  final String title;
  final VoidCallback onTap;
}

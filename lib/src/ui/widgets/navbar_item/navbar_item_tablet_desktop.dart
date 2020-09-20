import 'package:eternary/src/models/navbar_item_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class NavbarItemTabletDesktop extends ViewModelWidget<NavBarItemModel> {
  const NavbarItemTabletDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, NavBarItemModel model) {
    return Text(
      model.title,
      style: TextStyle(
        fontFamily: 'Overpass',
        fontSize: 18,
      ),
    );
  }
}

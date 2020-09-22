import 'package:eternary/src/models/navbar_item_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

/// Mobile adaptation of the home view.
class NavbarItemMobile extends ViewModelWidget<NavBarItemModel> {
  const NavbarItemMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, NavBarItemModel model) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: Text(
        model.title,
        style: TextStyle(
          fontFamily: 'Overpass',
          fontSize: 18,
        ),
      ),
    );
  }
}

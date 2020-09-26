import 'package:eternary/src/models/navbar_item_model.dart';
import 'package:eternary/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

/// Tablet/Desktop adaptation of the navbar item.
class NavbarItemTabletDesktop extends ViewModelWidget<NavBarItemModel> {
  const NavbarItemTabletDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, NavBarItemModel model) {
    closeDrawer(context);

    return Text(
      model.title,
      style: descriptionTextStyle(
        deviceScreenType: DeviceScreenType.tablet,
      ),
    );
  }

  ///  Close the drawer if it is open
  void closeDrawer(BuildContext context) async {
    if (Scaffold.of(context).isDrawerOpen) {
      await Future(
        () => Scaffold.of(context).openEndDrawer(),
      );
    }
  }
}

import 'package:eternary/src/models/navbar_item_model.dart';
import 'package:eternary/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

/// Mobile adaptation of the home view.
class NavbarItemMobile extends ViewModelWidget<NavBarItemModel> {
  const NavbarItemMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, NavBarItemModel model) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        top: 60,
      ),
      child: Row(
        children: [
          Icon(
            model.icon,
            size: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 8.0,
              bottom: 6.0,
              top: 10.0,
            ),
            child: Text(
              model.title,
              style: descriptionTextStyle(
                deviceScreenType: DeviceScreenType.mobile,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

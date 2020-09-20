import 'package:eternary/src/ui/widgets/navigation_bar/navbar_item.dart';
import 'package:eternary/src/ui/widgets/navigation_bar/navbar_logo.dart';
import 'package:flutter/material.dart';
import 'package:eternary/utils/constants.dart' as Constants;

class NavigationBarTabletDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavBarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              //  TODO:
              NavBarItem(Constants.about, Constants.TimelineRoute),
              SizedBox(
                width: 60,
              ),
              NavBarItem(Constants.logout, Constants.HomeRoute),
            ],
          ),
        ],
      ),
    );
  }
}

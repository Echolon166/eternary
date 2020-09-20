import 'package:eternary/src/ui/widgets/navbar_item/navbar_item.dart';
import 'package:eternary/src/ui/widgets/navigation_bar/navbar_logo.dart';
import 'package:flutter/material.dart';
import 'package:eternary/utils/constants.dart' as Constants;

class NavigationBarTabletDesktop extends StatelessWidget {
  const NavigationBarTabletDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavBarLogo(),
          //  TODO: Hide in home, show in rest
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              //  TODO:
              NavBarItem(
                title: Constants.about,
                navigationRoute: Constants.TimelineRoute,
              ),
              SizedBox(
                width: 60,
              ),
              NavBarItem(
                title: Constants.logout,
                navigationRoute: Constants.HomeRoute,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

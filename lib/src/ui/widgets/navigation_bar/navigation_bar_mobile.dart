import 'package:eternary/src/ui/widgets/navigation_bar/navbar_logo.dart';
import 'package:flutter/material.dart';

/// Mobile adaptation of the home view.
class NavigationBarMobile extends StatelessWidget {
  const NavigationBarMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: null,
            //  TODO: Implement drawer
          ),
          NavBarLogo(),
        ],
      ),
    );
  }
}

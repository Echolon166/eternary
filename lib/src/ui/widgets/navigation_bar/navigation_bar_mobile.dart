import 'package:eternary/src/ui/widgets/navigation_bar/navbar_logo.dart';
import 'package:flutter/material.dart';

/// Mobile adaptation of the home view.
class NavigationBarMobile extends StatelessWidget {
  const NavigationBarMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 5,
        ),
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
      ),
    );
  }
}

import 'package:eternary/utils/locator.dart';
import 'package:flutter/material.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem(this.title, this.navigationRoute);

  final String title;
  final String navigationRoute;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        locatorNavigateTo(navigationRoute);
      },
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'PalanquinDark',
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }
}

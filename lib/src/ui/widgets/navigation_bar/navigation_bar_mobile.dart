import 'package:eternary/src/ui/widgets/navigation_bar/navbar_logo.dart';
import 'package:flutter/material.dart';

class NavigationBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(icon: Icon(Icons.menu), onPressed: null),
          NavBarLogo(),
        ],
      ),
    );
  }
}

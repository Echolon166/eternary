import 'package:eternary/src/models/navbar_item_model.dart';
import 'package:eternary/src/ui/widgets/clickable_widget/clickable_widget.dart';
import 'package:eternary/src/ui/widgets/navbar_item/navbar_item_mobile.dart';
import 'package:eternary/src/ui/widgets/navbar_item/navbar_item_tablet_desktop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// NavBarItem will navigate to [navigationRoute] whenever it gets clicked.
class NavBarItem extends StatelessWidget {
  const NavBarItem({
    Key key,
    this.title,
    this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var model = NavBarItemModel(title: title, onTap: onTap);

    return ClickableInkwell(
      onTap: onTap,
      child: Provider.value(
        value: model,
        child: ScreenTypeLayout(
          mobile: NavbarItemMobile(),
          tablet: NavbarItemTabletDesktop(),
        ),
      ),
    );
  }
}

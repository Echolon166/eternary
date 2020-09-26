import 'package:eternary/src/ui/widgets/navigation_bar/navbar_logo.dart';
import 'package:eternary/src/viewmodels/layout_template_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

/// Mobile adaptation of the home view.
class NavigationBarMobile extends ViewModelWidget<LayoutTemplateViewModel> {
  const NavigationBarMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, LayoutTemplateViewModel viewModel) {
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
            viewModel.loggedIn
                ? IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  )
                : SizedBox(),
            NavBarLogo(),
          ],
        ),
      ),
    );
  }
}

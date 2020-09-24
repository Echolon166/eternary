import 'package:eternary/src/ui/widgets/centered_view/centered_view.dart';
import 'package:eternary/src/ui/widgets/navbar_item/navbar_item.dart';
import 'package:eternary/src/ui/widgets/navigation_bar/navbar_logo.dart';
import 'package:eternary/src/viewmodels/layout_template_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:eternary/utils/constants.dart' as Constants;
import 'package:stacked/stacked.dart';

/// Tablet/Desktop adaptation of the navigation bar.
class NavigationBarTabletDesktop
    extends ViewModelWidget<LayoutTemplateViewModel> {
  const NavigationBarTabletDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, LayoutTemplateViewModel viewModel) {
    return Material(
      elevation: 1,
      child: Container(
        height: 70,
        child: CenteredView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavBarLogo(),
              viewModel.loggedIn
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        NavBarItem(
                          title: Constants.logout,
                          onTap: viewModel.logOut,
                        ),
                      ],
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

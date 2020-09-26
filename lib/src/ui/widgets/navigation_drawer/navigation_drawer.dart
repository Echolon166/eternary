import 'package:eternary/src/ui/widgets/navbar_item/navbar_item.dart';
import 'package:eternary/src/viewmodels/layout_template_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:eternary/utils/constants.dart' as Constants;
import 'package:stacked/stacked.dart';

class NavigationDrawer extends ViewModelWidget<LayoutTemplateViewModel> {
  @override
  Widget build(BuildContext context, LayoutTemplateViewModel viewModel) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 16,
          ),
        ],
      ),
      child: Column(
        children: [
          NavBarItem(
            title: Constants.logout,
            icon: Icons.logout,
            onTap: () {
              Scaffold.of(context).openEndDrawer();
              viewModel.logOut();
            },
          ),
        ],
      ),
    );
  }
}

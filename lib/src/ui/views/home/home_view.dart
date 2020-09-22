import 'package:eternary/src/ui/views/home/home_content_desktop.dart';
import 'package:eternary/src/ui/views/home/home_content_tablet_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// Landing view of the app, user must login to continue.
class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: HomeContentTabletMobile(),
      desktop: HomeContentDesktop(),
    );
  }
}

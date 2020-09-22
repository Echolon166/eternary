import 'package:eternary/src/ui/views/landing/landing_content_desktop.dart';
import 'package:eternary/src/ui/views/landing/landing_content_tablet_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// Landing view of the app, user must login to continue.
class LandingView extends StatelessWidget {
  const LandingView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: LandingContentTabletMobile(),
      desktop: LandingContentDesktop(),
    );
  }
}

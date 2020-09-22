import 'package:eternary/src/ui/views/landing/landing_content_desktop.dart';
import 'package:eternary/src/ui/views/landing/landing_content_tablet_mobile.dart';
import 'package:eternary/src/viewmodels/landing_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

/// Landing view of the app, user must login to continue.
class LandingView extends StatelessWidget {
  const LandingView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => LandingViewModel(),
      builder: (context, model, child) => ScreenTypeLayout(
        mobile: LandingContentTabletMobile(),
        desktop: LandingContentDesktop(),
      ),
    );
  }
}

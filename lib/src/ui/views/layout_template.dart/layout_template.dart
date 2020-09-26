import 'package:eternary/src/ui/views/home/home_view.dart';
import 'package:eternary/src/ui/views/landing/landing_view.dart';
import 'package:eternary/src/ui/widgets/centered_view/centered_view.dart';
import 'package:eternary/src/ui/widgets/constrained_flex_view/constrained_flex_view.dart';
import 'package:eternary/src/ui/widgets/footer/footer.dart';
import 'package:eternary/src/ui/widgets/navigation_bar/navigation_bar.dart';
import 'package:eternary/src/ui/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:eternary/src/viewmodels/layout_template_viewmodel.dart';
import 'package:eternary/utils/constants.dart' as Constants;
import 'package:eternary/utils/my_router.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

/// Base layout template view,
///   which should be called above every other view(Ideally in entry point).
class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => LayoutTemplateViewModel(),
      builder: (context, model, child) => ResponsiveBuilder(
        builder: (context, sizingInformation) => Scaffold(
          drawer: NavigationDrawer(),
          drawerEdgeDragWidth: 0,

          backgroundColor: Colors.white,

          /// Wraps the content with ScrollView
          ///   if the screen is too small to fit the content.
          body: ConstrainedFlexView(
            minSize: 640,
            child: Column(
              children: [
                /// NavigationBar will stay on top of the view even if we navigate to a different route.
                NavigationBar(),
                Expanded(
                  /// Limits the width of the content to prevent it from sticking to corners.
                  child: CenteredView(
                    child: Column(
                      children: [
                        /// View inside the navigator will change whenever we navigate to a different route.
                        Expanded(
                          child: model.loggedIn
                              ? Navigator(
                                  key: model.navigatorKey,
                                  onGenerateRoute: generateRoute,
                                  initialRoute: Constants.HomeRoute,
                                )
                              : LandingView(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Footer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

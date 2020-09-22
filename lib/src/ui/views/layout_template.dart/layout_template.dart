import 'package:eternary/src/ui/widgets/centered_view/centered_view.dart';
import 'package:eternary/src/ui/widgets/constrained_flex_view/constrained_flex_view.dart';
import 'package:eternary/src/ui/widgets/navigation_bar/navigation_bar.dart';
import 'package:eternary/utils/constants.dart' as Constants;
import 'package:eternary/src/services/locator_service.dart';
import 'package:eternary/utils/my_router.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// Base layout template view,
///   which should be called above every other view(Ideally in entry point).
class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        //drawer: sizingInformation.isMobile ? NavigationDrawer() : null,
        backgroundColor: Colors.white,

        /// Limits the width of the content to prevent it from sticking to corners.
        body: CenteredView(
          /// Wraps the content with ScrollView
          ///   if the screen is too small to fit the content.
          child: ConstrainedFlexView(
            700,
            child: Column(
              children: [
                /// NavigationBar will stay on top of the view even if we navigate to a different route.
                NavigationBar(),
                SizedBox(
                  height: 20,
                ),

                /// View inside the navigator will change whenever we navigate to a different route.
                Expanded(
                  child: Navigator(
                    key: locatorGetNavigatorKey(),
                    onGenerateRoute: generateRoute,
                    initialRoute: Constants.LandingRoute,
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

import 'package:eternary/src/ui/widgets/centered_view/centered_view.dart';
import 'package:eternary/src/ui/widgets/constrained_flex_view/constrained_flex_view.dart';
import 'package:eternary/src/ui/widgets/navigation_bar/navigation_bar.dart';
import 'package:eternary/utils/constants.dart' as Constants;
import 'package:eternary/src/services/locator_service.dart';
import 'package:eternary/utils/my_router.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        //drawer: sizingInformation.isMobile ? NavigationDrawer() : null,
        backgroundColor: Colors.white,
        body: CenteredView(
          child: ConstrainedFlexView(
            640,
            child: Column(
              children: [
                NavigationBar(),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Navigator(
                    key: locatorGetNavigatorKey(),
                    onGenerateRoute: generateRoute,
                    initialRoute: Constants.HomeRoute,
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

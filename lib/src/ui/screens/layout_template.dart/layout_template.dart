import 'package:eternary/src/services/navigation_service.dart';
import 'package:eternary/src/ui/widgets/navigation_bar/navigation_bar.dart';
import 'package:eternary/utils/constants.dart' as Constants;
import 'package:eternary/utils/locator.dart';
import 'package:eternary/utils/my_router.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LayoutTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        //drawer: sizingInformation.isMobile ? NavigationDrawer() : null,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            NavigationBar(),
            Expanded(
              child: Navigator(
                key: locator<NavigationService>().navigatorKey,
                onGenerateRoute: generateRoute,
                initialRoute: Constants.HomeRoute,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

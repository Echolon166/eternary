import 'package:flutter/material.dart';
import 'package:eternary/theme/text_styles.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:eternary/utils/constants.dart' as Constants;

class LandingDetails extends StatelessWidget {
  const LandingDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        var textAlignment =
            sizingInformation.isDesktop ? TextAlign.left : TextAlign.center;

        return Container(
          width: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Constants.landingTitle,
                textAlign: textAlignment,
                style: titleTextStyle(
                  deviceScreenType: sizingInformation.deviceScreenType,
                  height: 0.9,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                Constants.landingDescription,
                textAlign: textAlignment,
                style: descriptionTextStyle(
                  deviceScreenType: sizingInformation.deviceScreenType,
                  height: 1.7,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

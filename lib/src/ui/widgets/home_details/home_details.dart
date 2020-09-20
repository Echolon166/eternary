import 'package:flutter/material.dart';
import 'package:eternary/theme/text_styles.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:eternary/utils/constants.dart' as Constants;

class HomeDetails extends StatelessWidget {
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
                Constants.homeTitle,
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
                Constants.homeDescription,
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

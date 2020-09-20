import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterOuterLogo extends StatelessWidget {
  const FooterOuterLogo({this.imagePath, this.url});

  final String imagePath;
  final String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchURL();
      },
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          double imageSize = sizingInformation.isMobile ? 29 : 35;

          return SizedBox(
            height: imageSize,
            width: imageSize,
            child: Image.asset(imagePath),
          );
        },
      ),
    );
  }

  void _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

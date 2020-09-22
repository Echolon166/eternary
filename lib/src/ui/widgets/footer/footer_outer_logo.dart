import 'package:eternary/src/ui/widgets/clickable_widget/clickable_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

/// FooterOuterLogo will be drawn as [imagePath] and will open the [url] whenever it gets clicked.
class FooterOuterLogo extends StatelessWidget {
  const FooterOuterLogo({
    Key key,
    this.imagePath,
    this.url,
  }) : super(key: key);

  final String imagePath;
  final String url;

  @override
  Widget build(BuildContext context) {
    return ClickableInkwell(
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

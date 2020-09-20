import 'package:eternary/src/ui/widgets/footer/footer_outer_logo.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FooterOuterLogo(
            imagePath: 'assets/images/arweave-logo.png',
            url: 'https://www.arweave.org/',
          ),
          SizedBox(
            width: 15,
          ),
          FooterOuterLogo(
            imagePath: 'assets/images/github-logo.png',
            url: 'https://github.com/Echolon166/eternary',
          ),
        ],
      ),
    );
  }
}

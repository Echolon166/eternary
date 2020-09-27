import 'package:eternary/src/ui/widgets/wallet_dropzone/wallet_dropzone.dart';
import 'package:flutter/material.dart';
import 'package:eternary/src/ui/widgets/landing_details/landing_details.dart';

/// Tablet/Mobile adaptation of the landing view.
class LandingContentTabletMobile extends StatelessWidget {
  const LandingContentTabletMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              LandingDetails(),
              SizedBox(
                height: 50,
              ),
              WalletDropzone(),
            ],
          ),
        ),
      ],
    );
  }
}

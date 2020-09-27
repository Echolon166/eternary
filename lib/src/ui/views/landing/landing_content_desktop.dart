import 'package:flutter/material.dart';
import 'package:eternary/src/ui/widgets/landing_details/landing_details.dart';
import 'package:eternary/src/ui/widgets/wallet_dropzone/wallet_dropzone.dart';

/// Desktop adaptation of the landing view.
class LandingContentDesktop extends StatelessWidget {
  const LandingContentDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              LandingDetails(),
              Expanded(
                child: Center(
                  child: WalletDropzone(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

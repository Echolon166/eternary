import 'package:eternary/src/ui/widgets/footer/footer.dart';
import 'package:eternary/src/ui/widgets/wallet_dropzone/wallet_dropzone.dart';
import 'package:flutter/material.dart';
import 'package:eternary/src/ui/widgets/home_details/home_details.dart';

/// Tablet/Mobile adaptation of the home view.
class HomeContentTabletMobile extends StatelessWidget {
  const HomeContentTabletMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              HomeDetails(),
              SizedBox(
                height: 100,
              ),
              WalletDropzone(),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Footer(),
      ],
    );
  }
}

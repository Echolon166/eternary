import 'package:eternary/src/ui/widgets/wallet_dropzone/wallet_dropzone.dart';
import 'package:flutter/material.dart';
import 'package:eternary/src/ui/widgets/home_details/home_details.dart';

class HomeContentMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HomeDetails(),
        SizedBox(
          height: 100,
        ),
        WalletDropzone(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:eternary/src/ui/widgets/home_details/home_details.dart';
import 'package:eternary/src/ui/widgets/wallet_dropzone/wallet_dropzone.dart';

class HomeContentDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HomeDetails(),
        Expanded(
          child: Center(
            child: WalletDropzone(),
          ),
        ),
      ],
    );
  }
}

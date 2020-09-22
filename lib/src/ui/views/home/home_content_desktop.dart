import 'package:eternary/src/ui/widgets/footer/footer.dart';
import 'package:flutter/material.dart';
import 'package:eternary/src/ui/widgets/home_details/home_details.dart';
import 'package:eternary/src/ui/widgets/wallet_dropzone/wallet_dropzone.dart';

/// Desktop adaptation of the home view.
class HomeContentDesktop extends StatelessWidget {
  const HomeContentDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              HomeDetails(),
              Expanded(
                child: Center(
                  child: WalletDropzone(),
                ),
              ),
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

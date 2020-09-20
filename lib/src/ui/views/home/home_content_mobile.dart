import 'package:eternary/src/ui/widgets/constrained_flex_view/constrained_flex_view.dart';
import 'package:eternary/src/ui/widgets/footer/footer.dart';
import 'package:eternary/src/ui/widgets/wallet_dropzone/wallet_dropzone.dart';
import 'package:flutter/material.dart';
import 'package:eternary/src/ui/widgets/home_details/home_details.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({Key key}) : super(key: key);

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

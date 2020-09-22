import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:eternary/src/services/arweave_service.dart';
import 'package:eternary/src/services/locator_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:eternary/theme/text_styles.dart';
import 'package:eternary/utils/constants.dart' as Constants;
import 'package:responsive_builder/responsive_builder.dart';

/// WalletDropzone is to get the Arweave wallet keyfile from the user.
class WalletDropzone extends StatelessWidget {
  const WalletDropzone({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DropzoneViewController controller;

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        double iconSize = sizingInformation.isMobile ? 29 : 35;

        return Container(
          height: 180,
          width: 550,
          child: Stack(
            children: [
              DropzoneView(
                operation: DragOperation.copy,
                cursor: CursorType.grab,
                onCreated: (ctrl) => controller = ctrl,

                /// Called when user drops a file to WalletDropzone.
                onDrop: (ev) async {
                  loginUsingWalletKeyfile(controller, ev);
                },
              ),
              InkWell(
                child: Container(
                  child: DottedBorder(
                    padding: EdgeInsets.all(20),
                    dashPattern: [4, 3, 4, 3],
                    strokeWidth: 1,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.move_to_inbox_outlined,
                            size: iconSize,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            Constants.dropzoneText,
                            style: descriptionTextStyle(
                              deviceScreenType:
                                  sizingInformation.deviceScreenType,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                /// Called when user clicks to WalletDropzone to select a file.
                onTap: () async {
                  dynamic ev = await controller.pickFiles(multiple: false);
                  loginUsingWalletKeyfile(controller, ev[0]);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /// Login using the [key] which is obtained from the [ev], the wallet keyfile.
  void loginUsingWalletKeyfile(
    DropzoneViewController controller,
    dynamic ev,
  ) async {
    Uint8List key = await controller.getFileData(ev[0]);
    if (locator<ArweaveService>().login(key)) {
      locatorNavigateTo(Constants.TimelineRoute);
    }
  }
}

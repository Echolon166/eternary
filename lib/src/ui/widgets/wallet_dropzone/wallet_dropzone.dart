import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:eternary/theme/text_styles.dart';
import 'package:eternary/utils/constants.dart' as Constants;
import 'package:responsive_builder/responsive_builder.dart';

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
                onDrop: (ev) async {
                  //Uint8List data = await controller.getFileData(ev);
                  //  TODO: login/change screen, send this part to dropzone from outside
                },
              ),
              InkWell(
                onTap: () async {
                  dynamic ev = await controller.pickFiles(multiple: false);
                  //Uint8List data = await controller.getFileData(ev[0]);
                  //  TODO: login/change screen, send this part to dropzone from outside
                },
                child: Container(
                  child: DottedBorder(
                    padding: EdgeInsets.all(20),
                    dashPattern: [4, 3, 4, 3],
                    strokeWidth: 1,
                    //color:
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
              ),
            ],
          ),
        );
      },
    );
  }
}

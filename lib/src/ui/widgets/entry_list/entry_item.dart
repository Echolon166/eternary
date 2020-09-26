import 'package:eternary/src/models/entry_item_model.dart';
import 'package:eternary/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class EntryItem extends StatelessWidget {
  const EntryItem({
    Key key,
    this.entry,
  }) : super(key: key);

  final EntryItemModel entry;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        double itemWidth = sizingInformation.isMobile
            ? 420
            : sizingInformation.isTablet
                ? 500
                : 720;
        double iconSize = sizingInformation.isMobile ? 16 : 18;

        bool isEntryTextEmpty = (entry.text == '' || entry.text == null);

        return Card(
          margin: EdgeInsets.only(
            bottom: 10.0,
            top: 10.0,
          ),
          color: Colors.white,
          elevation: 2,
          child: SizedBox(
            width: itemWidth,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isEntryTextEmpty
                      ? SizedBox()
                      : Text(
                          entry.text,
                          style: smallDescriptionTextStyle(
                            deviceScreenType:
                                sizingInformation.deviceScreenType,
                          ),
                        ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.event_note,
                        size: iconSize,
                        color: Color(0xFF3C4858),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 8.0,
                          bottom: 6.0,
                          top: 10.0,
                        ),
                        child: Text(
                          entry.date,
                          style: smallDescriptionTextStyle(
                            deviceScreenType:
                                sizingInformation.deviceScreenType,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

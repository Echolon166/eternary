import 'package:eternary/src/models/entry_item_model.dart';
import 'package:eternary/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';

class EntryItem extends StatelessWidget {
  const EntryItem({
    Key key,
    this.entry,
  }) : super(key: key);

  final EntryItemModel entry;

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('MMMM d, y,').add_jm();

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        double itemWidth = sizingInformation.isMobile
            ? 420
            : sizingInformation.isTablet
                ? 500
                : 720;
        double iconSize = sizingInformation.isMobile ? 16 : 18;
        double textSize = sizingInformation.isMobile ? 14 : 16;

        bool isEntryTextEmpty = (entry.text == '' || entry.text == null);

        return Card(
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
                      : MarkdownBody(
                          data: entry.text,
                          styleSheet:
                              MarkdownStyleSheet.fromTheme(Theme.of(context))
                                  .copyWith(
                            h1: Theme.of(context).textTheme.bodyText2.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'PalanquinDark',
                                  fontSize: textSize + 6.0,
                                ),
                            h2: Theme.of(context).textTheme.bodyText2.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'PalanquinDark',
                                  fontSize: textSize + 4.0,
                                ),
                            h3: Theme.of(context).textTheme.bodyText2.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'PalanquinDark',
                                  fontSize: textSize + 2.0,
                                ),
                            p: Theme.of(context).textTheme.bodyText2.copyWith(
                                  fontSize: textSize,
                                  fontFamily: 'Overpass',
                                ),
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
                          entry.date != null
                              ? dateFormat.format(entry.date)
                              : '-',
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

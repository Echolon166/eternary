import 'package:eternary/src/models/entry_item_model.dart';
import 'package:flutter/material.dart';

class EntryItem extends StatelessWidget {
  const EntryItem({
    Key key,
    this.model,
  }) : super(key: key);

  final EntryItemModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: SizedBox(
        width: 360,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: TextStyle(
                  fontFamily: 'PalanquinDark',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
                softWrap: true,
              ),
              Text(
                model.entryText,
                style: TextStyle(
                  fontFamily: 'Overpass',
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

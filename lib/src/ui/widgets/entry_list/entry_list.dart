import 'package:eternary/src/models/entry_item_model.dart';
import 'package:eternary/src/ui/widgets/entry_list/entry_item.dart';
import 'package:flutter/material.dart';

class EntryList extends StatelessWidget {
  const EntryList({Key key, this.entries}) : super(key: key);

  final List<EntryItemModel> entries;

  @override
  Widget build(BuildContext context) {
    //  TODO: Use list? instead of wrap
    return Wrap(
      spacing: 30,
      runSpacing: 30,
      children: [
        ...entries.map(
          (entry) => EntryItem(model: entry),
        ),
      ],
    );
  }
}

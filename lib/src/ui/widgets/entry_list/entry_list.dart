import 'package:eternary/src/ui/widgets/entry_list/entry_item.dart';
import 'package:eternary/src/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class EntryList extends ViewModelWidget<HomeViewModel> {
  const EntryList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Column(
      children: [
        ...viewModel.entries.map(
          (entry) => Container(
            margin: EdgeInsets.only(
              bottom: 10.0,
              top: 10.0,
            ),
            child: EntryItem(entry: entry),
          ),
        ),
      ],
    );
  }
}

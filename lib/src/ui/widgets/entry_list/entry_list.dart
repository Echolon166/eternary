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
          (entry) => EntryItem(entry: entry),
        ),
      ],
    );
  }
}

/*
import 'package:eternary/src/ui/widgets/entry_list/entry_item.dart';
import 'package:eternary/src/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class EntryList extends ViewModelWidget<HomeViewModel> {
  const EntryList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return ListView.builder(
        itemCount: viewModel.entries.length,
        itemBuilder: (context, position) {
          return Column(
            children: [
              EntryItem(
                entry: viewModel.entries[position],
              ),
            ],
          );
        });
  }
}
*/

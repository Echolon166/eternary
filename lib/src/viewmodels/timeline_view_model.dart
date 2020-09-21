import 'package:eternary/src/models/entry_item_model.dart';
import 'package:eternary/src/services/arweave_service.dart';
import 'package:eternary/src/services/locator_service.dart';
import 'package:flutter/material.dart';

class TimelineViewModel extends ChangeNotifier {
  final _arweaveService = locator<ArweaveService>();

  List<EntryItemModel> _entries;

  List<EntryItemModel> get entries => _entries;

  Future getEntries() async {
    var entryResults = await _arweaveService.getEntries();

    _entries = entryResults;

    notifyListeners();
  }
}

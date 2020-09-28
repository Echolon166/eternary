import 'dart:io';

import 'package:eternary/src/models/entry_item_model.dart';
import 'package:eternary/src/services/arweave_service.dart';
import 'package:eternary/utils/locator.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final ArweaveService _arweaveService = locator<ArweaveService>();

  bool _isPending = false;
  bool get isPending => _isPending;

  String get address => _arweaveService.address;

  bool _isSubmitting = false;
  bool get isSubmitting => _isSubmitting;

  String _newEntryText;
  String get newEntry => _newEntryText;

  List<EntryItemModel> _entries;
  List<EntryItemModel> get entries => _entries;

  void updateIsPending(bool value) {
    _isPending = value;

    notifyListeners();
  }

  void updateIsSubmitting(bool value) {
    _isSubmitting = value;

    if (value == null) {
      updateNewEntryText('');
    }

    notifyListeners();
  }

  void updateNewEntryText(String value) {
    _newEntryText = value;

    notifyListeners();
  }

  void submitNewEntry() async {
    EntryItemModel newEntry = EntryItemModel(
      text: _newEntryText,
      date: DateTime.now(),
    );

    updateIsSubmitting(false);

    _arweaveService.submitEntry(newEntry);

    /// Sometimes it takes time to Arweave network to identify new transactions,
    ///   because of that we check previous entry number with new entry number,
    ///   and if it hasn't increased yet, we call getEntries again.
    int oldEntryCount = _entries.length;
    while (_entries.length <= oldEntryCount) {
      await getEntries();
    }
  }

  Future getEntries() async {
    updateIsPending(true);

    var entryResults = await _arweaveService.getEntries();
    _entries = entryResults;
    notifyListeners();

    await getPendingEntries();

    updateIsPending(false);
  }

  Future getPendingEntries() async {
    var entryResults = await _arweaveService.getPendingEntries();

    /// Sometimes old entries gets pending status
    /// To prevent placement errors, we check the dates of the entries,
    ///   and insert the pending entry to it's place
    if (entryResults.isNotEmpty) {
      for (int i = 0; i < entryResults.length; i++) {
        for (int j = 0; j < _entries.length; j++) {
          if (entryResults[i].date.isAfter(_entries[j].date)) {
            _entries.insert(j, entryResults[i]);
            break;
          } else if (j == _entries.length - 1) {
            _entries.add(entryResults[i]);
          }
        }
      }

      notifyListeners();
    }
  }
}

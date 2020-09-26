import 'package:eternary/src/models/entry_item_model.dart';
import 'package:eternary/src/services/arweave_service.dart';
import 'package:eternary/utils/locator.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final ArweaveService _arweaveService = locator<ArweaveService>();

  bool _isSubmitting = false;
  bool get isSubmitting => _isSubmitting;

  String _newEntry;
  String get newEntry => _newEntry;

  List<EntryItemModel> _entries;
  List<EntryItemModel> get entries => _entries;

  void updateIsSubmitting(bool value) {
    _isSubmitting = value;

    if (value == false) {
      updateNewEntry('');
    }

    notifyListeners();
  }

  void updateNewEntry(String value) {
    _newEntry = value;

    notifyListeners();
  }

  void submitNewEntry() {
    _arweaveService.submitEntry(_newEntry);

    getEntries();

    updateIsSubmitting(false);
  }

  Future getEntries() async {
    var entryResults = await _arweaveService.getEntries();

    _entries = entryResults;

    notifyListeners();
  }
}

import 'package:eternary/src/models/entry_item_model.dart';
import 'package:eternary/src/services/arweave_service.dart';
import 'package:eternary/utils/locator.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final ArweaveService _arweaveService = locator<ArweaveService>();

  String _newEntry;
  String get newEntry => _newEntry;

  List<EntryItemModel> _entries;
  List<EntryItemModel> get entries => _entries;

  void updateNewEntry(String value) {
    _newEntry = value;

    notifyListeners();
  }

  void submitNewEntry() {
    _arweaveService.submitEntry(_newEntry);

    getEntries();
  }

  Future getEntries() async {
    var entryResults = await _arweaveService.getEntries();

    _entries = entryResults;

    notifyListeners();
  }
}

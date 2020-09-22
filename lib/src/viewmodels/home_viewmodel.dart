import 'package:eternary/src/models/entry_item_model.dart';
import 'package:eternary/src/services/arweave_service.dart';
import 'package:eternary/utils/locator.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final ArweaveService _arweaveService = locator<ArweaveService>();

  List<EntryItemModel> _entries;

  List<EntryItemModel> get entries => _entries;

  Future getEntries() async {
    var entryResults = await _arweaveService.getEntries();

    _entries = entryResults;

    notifyListeners();
  }
}

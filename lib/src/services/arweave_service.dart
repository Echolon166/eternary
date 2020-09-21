import 'dart:convert';
import 'dart:typed_data';

import 'package:arweave/arweave.dart';
import 'package:eternary/src/models/entry_item_model.dart';

class ArweaveService {
  Arweave _arweave = Arweave();
  Wallet _wallet;
  String _address;

  String get address => _address;
  Future<String> get balance => _arweave.wallets.getBalance(_address);

  bool login(Uint8List key) {
    try {
      Map<String, dynamic> mapJWK = jsonDecode(String.fromCharCodes(key));

      _wallet = Wallet.fromJwk(mapJWK);
      _address = _wallet.address;

      return true;
    } catch (e) {
      print(e);
    }

    return false;
  }

  Future<void> submitEntry() async {}

  Future<List<EntryItemModel>> getEntries() async {
    //  TEMP
    return entries;
  }

  final List<EntryItemModel> entries = [
    //  TEMP ENTRIES, TODO: FETCH ENTRIES FROM ARWEAVE
    EntryItemModel(
      title: 'Entry 1',
      entryText: 'Today was good!',
    ),
    EntryItemModel(
      title: 'Entry 2',
      entryText: 'Hail Hydra',
    ),
    EntryItemModel(
      title: 'My Entry',
      entryText: 'This one is different from the rest',
    ),
    EntryItemModel(
      title: 'Boring Entry',
      entryText: 'Boring Text',
    ),
    EntryItemModel(
      title: 'title',
      entryText: 'text',
    ),
    EntryItemModel(
      title: 'title23',
      entryText: 'text23',
    ),
    EntryItemModel(
      title: 'lasttitle',
      entryText: 'lasttext',
    ),
    EntryItemModel(
      title: 'Entry 1',
      entryText: 'Today was good!',
    ),
    EntryItemModel(
      title: 'Entry 2',
      entryText: 'Hail Hydra',
    ),
    EntryItemModel(
      title: 'My Entry',
      entryText: 'This one is different from the rest',
    ),
    EntryItemModel(
      title: 'Boring Entry',
      entryText: 'Boring Text',
    ),
    EntryItemModel(
      title: 'title',
      entryText: 'text',
    ),
    EntryItemModel(
      title: 'title23',
      entryText: 'text23',
    ),
    EntryItemModel(
      title: 'lasttitle',
      entryText: 'lasttext',
    ),
    EntryItemModel(
      title: 'Entry 1',
      entryText: 'Today was good!',
    ),
    EntryItemModel(
      title: 'Entry 2',
      entryText: 'Hail Hydra',
    ),
    EntryItemModel(
      title: 'My Entry',
      entryText: 'This one is different from the rest',
    ),
    EntryItemModel(
      title: 'Boring Entry',
      entryText: 'Boring Text',
    ),
    EntryItemModel(
      title: 'title',
      entryText: 'text',
    ),
    EntryItemModel(
      title: 'title23',
      entryText: 'text23',
    ),
    EntryItemModel(
      title: 'lasttitle',
      entryText: 'lasttext',
    ),
    EntryItemModel(
      title: 'Entry 1',
      entryText: 'Today was good!',
    ),
    EntryItemModel(
      title: 'Entry 2',
      entryText: 'Hail Hydra',
    ),
    EntryItemModel(
      title: 'My Entry',
      entryText: 'This one is different from the rest',
    ),
    EntryItemModel(
      title: 'Boring Entry',
      entryText: 'Boring Text',
    ),
    EntryItemModel(
      title: 'title',
      entryText: 'text',
    ),
    EntryItemModel(
      title: 'title23',
      entryText: 'text23',
    ),
    EntryItemModel(
      title: 'lasttitle',
      entryText: 'lasttext',
    ),
  ];
}

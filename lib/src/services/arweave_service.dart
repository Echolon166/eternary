import 'dart:convert';
import 'dart:typed_data';

import 'package:arweave/arweave.dart';
import 'package:eternary/src/models/entry_item_model.dart';
import 'package:flutter/foundation.dart';

/// ArweaveService is to handle the tasks which are related to Arweave.
class ArweaveService {
  Arweave _arweave = Arweave();

  Wallet _wallet;
  Future<String> get balance => _arweave.wallets.getBalance(_address);

  String _address;
  String get address => _address;

  /// Initialize [_wallet] and [_address]
  void initializeWallet(Map<String, dynamic> mapJWK) {
    _wallet = Wallet.fromJwk(mapJWK);
    _address = _wallet.address;
  }

  /// Decode [key] to JWK
  Map<String, dynamic> decodeWalletKey({@required Uint8List key}) {
    Map<String, dynamic> mapJWK = jsonDecode(String.fromCharCodes(key));
    return mapJWK;
  }

  /// Submit new entries into the Arweave network.
  Future<void> submitEntry() async {}

  /// Get user's entries from the Arweave network.
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

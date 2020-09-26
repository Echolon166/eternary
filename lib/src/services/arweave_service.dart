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
  Future<void> submitEntry(String newEntry) async {
    //  TEMP
    entries.insert(
      0,
      EntryItemModel(
        text: newEntry,
        date: 'New date',
      ),
    );
  }

  /// Get user's entries from the Arweave network.
  Future<List<EntryItemModel>> getEntries() async {
    //  TEMP
    return entries;
  }

  final List<EntryItemModel> entries = [
    //  TEMP ENTRIES, TODO: FETCH ENTRIES FROM ARWEAVE
    EntryItemModel(
      text: 'Today was good!',
      date: 'September 25, 2020, 10:46 AM',
    ),
    EntryItemModel(
      text: 'Hail Hydra',
      date: 'September 25, 2020, 10:46 AM',
    ),
    EntryItemModel(
      text: 'This one is different from the rest',
      date: 'September 25, 2020, 10:46 AM',
    ),
    EntryItemModel(
      text: '',
      date: 'September 25, 2020, 10:46 AM',
    ),
    EntryItemModel(
      text: 'Long Text',
      date: 'September 25, 2020, 10:46 AM',
    ),
    EntryItemModel(
      text:
          'Long TextLong TextLong TextLong TextLong TextLong TextLong TextLong TextLong TextLong TextLong TextLong TextLong TextLong TextLong TextLong TextLong TextLong TextLong TextLong TextLong TextLong TextLong TextLong TextLong TextLong TextLong TextLong TextLong Text',
      date: 'September 25, 2020, 10:46 AM',
    ),
    EntryItemModel(
      text: 'lasttext',
      date: 'September 25, 2020, 10:46 AM',
    ),
  ];
}

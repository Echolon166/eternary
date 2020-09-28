import 'dart:convert';
import 'dart:typed_data';

import 'package:arweave/arweave.dart';
import 'package:arweave/utils.dart';
import 'package:eternary/src/models/entry_item_model.dart';
import 'package:flutter/foundation.dart';

/// ArweaveService is to handle the tasks which are related to Arweave.
class ArweaveService {
  String _appTag = 'eternary';
  List<String> _pendingEntries;

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
  Future<void> submitEntry(EntryItemModel newEntry) async {
    final transaction = await _arweave.transactions.prepare(
      Transaction.withJsonData(
        data: newEntry.toJson(),
      ),
      _wallet,
    );

    transaction.addTag('app-name', _appTag);

    await transaction.sign(_wallet);

    await _arweave.transactions.post(transaction);
  }

  /// Get user's entries from the Arweave network.
  Future<List<EntryItemModel>> getEntries() async {
    List<EntryItemModel> entryList = List<EntryItemModel>();
    _pendingEntries = List<String>();

    Map<String, dynamic> query = {
      "op": "and",
      "expr1": {
        "op": "equals",
        "expr1": "app-name",
        "expr2": _appTag,
      },
      "expr2": {
        "op": "equals",
        "expr1": "from",
        "expr2": address,
      },
    };

    List<String> result = await _arweave.transactions.arql(query);

    var it = result.iterator;

    while (it.moveNext()) {
      try {
        String data = await _arweave.transactions.getData(it.current);

        entryList.add(
          EntryItemModel().fromJson(
            jsonDecode(decodeBase64ToString(data)),
          ),
        );
      } catch (e) {
        _pendingEntries.add(it.current);
        continue;
      }
    }

    return entryList;
  }

  /// Get user's pending entries from the Arweave network.
  /// Call it after the getEntries().
  Future<List<EntryItemModel>> getPendingEntries() async {
    if (_pendingEntries.isEmpty) {
      return [];
    }

    List<EntryItemModel> entryList = List<EntryItemModel>();

    var it = _pendingEntries.iterator;

    /// Loop until pending entries gets identified by the system.
    while (it.moveNext()) {
      bool pending = true;
      while (pending) {
        try {
          String data = await _arweave.transactions.getData(it.current);

          entryList.add(
            EntryItemModel().fromJson(
              jsonDecode(decodeBase64ToString(data)),
            ),
          );

          pending = false;
        } catch (e) {
          continue;
        }
      }
    }

    return entryList;
  }
}

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 账目明细Repository
class AccountMoneyRepository {
  static const debug = false;

  AccountMoneyRepository._();

  static Future<void> moneyLogRemove(int? id, int? dateline) async {
    if (id == null || dateline == null) return;
    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}account/moneyLogRemove/",
          {
            'id': id.toString(),
            'dateline': dateline.toString(),
          },
          throwOnError: true);
      if (debug) Log.d('AccountMoneyRepository: ${response.response}');
    } catch (e) {
      Log.d(e);
    }
  }

  static Future<void> doMoneyAction(
      State pageState, String op, String id) async {
    String url = '${System.domain}money/$op/';
    try {
      await Xhr.postJson(url, {'id': id}, throwOnError: true);
    } catch (e) {
      if (pageState.mounted) {
        Toast.showCenter(pageState.context, e.toString());
      }
    }
  }
}

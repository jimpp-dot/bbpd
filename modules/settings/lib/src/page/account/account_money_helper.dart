import 'package:shared/shared.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import '../../../k.dart';
import 'on_remove.dart';

/// 与账目明细页相关的工具类
class AccountMoneyHelper {
  AccountMoneyHelper._();

  static String getDateline(int dateline) {
    return formatDate(DateTime.fromMillisecondsSinceEpoch(dateline * 1000),
        [yyyy, '.', mm, '.', dd, ' ', HH, ':', nn]);
  }

  static Future<void> removeItem(
      OnRemove? onRemove, int id, int dateline) async {
    if (onRemove == null) return;
    SheetCallback? result = await displayModalBottomSheet(
        context: onRemove.context,
        builder: (BuildContext context) {
          return RadioBottomSheet(
              title: K.setting_select_option,
              data: [SheetItem(K.setting_delete, 'option_delete')]);
        });
    String? key = result?.value?.key;
    if (key?.isNotEmpty == true && key == 'option_delete')
      await onRemove.onRemove(id, dateline);
  }

  /// 获取金币交易前缀
  static String getGoldPre(String op) {
    switch (op) {
      case 'sign-add':
      case 'mission-add':
      case 'contribute':
      case 'income':
        {
          return '+';
        }
      case 'consume':
      case 'sign-repair':
        {
          return '-';
        }
      default:
        return '';
    }
  }

  static Pair<String, String> getPreAndType(Map value) {
    final String op = value['op'];
    switch (op) {
      case 'pay':
        return _p('+', K.setting_charge);
      case 'consume':
        return _p('-', _consumeType(value));
      case 'income':
        return _p('+', K.setting_income);
      case 'change':
        return _p('->', K.setting_ti_to_balance);
      case 'refund':
        return _p('->', K.setting_refund);
      case 'subsidy':
        return _p('+', K.setting_first_order_subsidy);
      case 'income-lock':
        return _p('+', K.setting_income_lock);
      case 'income-unlock':
        return _p('->', K.setting_income_unlock);
      case 'income-back':
        return _p('-', K.setting_return);
      case 'back':
        return _p('+', K.setting_deal_refund);
      case 'return':
        return _p('+', K.setting_charge);
      case 'collect':
        {
          if (_isCollectIn(value))
            return _p('+', K.setting_cap_collection_income);
          return _p('-', K.setting_cap_collection_expend);
        }
      case 'confiscate':
        return _p('-', K.setting_official_reception);
      case 'punish':
        return _p('-', K.setting_official_fine);
      case 'punish-back':
        return _p('+', K.setting_return_fine);
      case 'give':
        return _p('+', K.setting_official_gift);
      default:
        {
          if (op == Util.concat(['ca', 'sh'])) return _p('-', K.setting_ti);
          if (op == Util.concat(['ca', 'sh-back']))
            return _p('+', K.setting_ti_fail_back);
          return _p('', '');
        }
    }
  }

  static Pair<String, String> _p(String pre, String type) {
    return Pair.create<String, String>(pre, type);
  }

  static Map? getReason(Map value) {
    var r = value['_reason'];
    return (r is Map) ? r : null;
  }

  static String _consumeType(Map value) {
    Map? reason = getReason(value);
    if (reason != null &&
        reason['type'] == 'package' &&
        Util.parseInt(reason['_bag'], 0) > 0) {
      return K.setting_gift_consume;
    }
    return K.setting_consume;
  }

  static bool _isCollectIn(Map value) {
    Map? reason = getReason(value);
    return reason != null && reason['type'] == 'collect_in';
  }
}

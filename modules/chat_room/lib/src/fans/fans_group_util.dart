import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared/shared.dart';

class FansGroupUtil {
  static String scoreToString(String score) {
    double money0 = Util.parseDouble(score);
    if (money0 < 10000) {
      return score;
    }

    double money = Util.parseInt(score) ~/ 100 * 100 / 10000; // 取小数点时不进行四舍五入
    NumberFormat format = NumberFormat();
    format.maximumFractionDigits = 2;
    format.minimumFractionDigits = 0;

    return '${format.format(money)}W';
  }

  // rank 0 开始
  static Widget fansRankWidget(int rank) {
    if (rank < 3) {
      return R.img('fans/fan_rank_${rank + 1}.webp',
          width: 66 / 2,
          height: 63 / 2,
          package: ComponentManager.MANAGER_BASE_ROOM);
    }

    String numStr = '';

    if (rank < 9) {
      numStr = '0${rank + 1}';
    } else if (rank < 99) {
      numStr = '${rank + 1}';
    } else {
      numStr = '99+';
    }
    return NumText(
      numStr,
      style: const TextStyle(
          fontSize: 17,
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic),
    );
  }
}

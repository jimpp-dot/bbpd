import 'dart:ui';

import 'package:chat_room/chat_room.dart';
import 'gpk_constants.dart';

/// 分组pk业务帮助类
class GPKHelper {
  /// 是否为房主或者接待
  static bool isCreatorOrReception(ChatRoomData room) {
    return room.showGpk == true; // 后端这个字段同逻辑
  }

  /// 获取对应阵营的颜色
  static List<Color> getCampColorList(GPKCamp? camp) {
    switch (camp) {
      case GPKCamp.camp1:
        return GPK_CAMP1_COLORS;
      case GPKCamp.camp2:
        return GPK_CAMP2_COLORS;
      default:
        return GPK_CAMP1_COLORS;
    }
  }

  /// 根据规则显示得分
  static String getScoreText(int? rule, int score) {
    if (rule == RULE_GIF_VALUE) {
      return getGifText(score);
    } else {
      return getVoteText(score);
    }
  }

  /// 礼物显示方式
  static String getGifText(int score) {
    double realScore = score / 100;
    if (realScore <= 0) {
      return '0';
    } else if (realScore < 1000) {
      return realScore.toStringAsFixed(1);
    } else if (realScore < 1000000) {
      return '${(realScore / 1000).toStringAsFixed(1)}k';
    } else {
      return '${(realScore / 1000000).toStringAsFixed(1)}m';
    }
  }

  /// 投票显示方式
  static String getVoteText(int score) {
    if (score < 1000) {
      return '$score';
    } else {
      return '${score ~/ 1000}k';
    }
  }

  static double getScoreValue(int rule, int score) {
    if (rule == RULE_GIF_VALUE) {
      return getGifValue(score);
    } else {
      return score.toDouble();
    }
  }

  /// 礼物显示方式
  static double getGifValue(int score) {
    return double.parse((score / 100).toStringAsFixed(1));
  }
}

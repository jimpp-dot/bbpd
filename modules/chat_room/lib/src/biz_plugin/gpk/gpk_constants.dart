import 'dart:ui';

const bool GPK_DEBUG = true;

/// 分组PK每边最多多少人
const int MAX_SELECT_NUM = 4;

/// 礼物价值
const int RULE_GIF_VALUE = 1;

/// 投票人数
const int RULE_VOTE_NUM = 2;

/// 分组PK 红色阵营进行面板中头像右上角得分颜色
const Color GPK_SCORE_CAMP1_COLOR = Color(0xFFFF5F7D);

/// 分组PK 蓝色阵营进行面板中头像右上角得分颜色
const Color GPK_SCORE_CAMP2_COLOR = Color(0xFF60C8FF);

/// 阵营1的颜色值
const Color GPK_CAMP1_COLOR_GRADIENT_START = Color(0xFFFF2D88);
const Color GPK_CAMP1_COLOR_GRADIENT_END = Color(0xFFC086FF);
const List<Color> GPK_CAMP1_COLORS = <Color>[
  GPK_CAMP1_COLOR_GRADIENT_START,
  GPK_CAMP1_COLOR_GRADIENT_END
];

/// 阵营2的颜色值
const Color GPK_CAMP2_COLOR_GRADIENT_START = Color(0xFF46B3FF);
const Color GPK_CAMP2_COLOR_GRADIENT_END = Color(0xFFC086FF);
const List<Color> GPK_CAMP2_COLORS = <Color>[
  GPK_CAMP2_COLOR_GRADIENT_END,
  GPK_CAMP2_COLOR_GRADIENT_START
];

const String KEY_SHOW_STATUS_CLICK = 'room.gpk.status.clickable';
const String KEY_SHOW_MENU_REDDOT = 'room.gpk.show.menu.reddot';

/// 分组pk阵营
enum GPKCamp {
  camp1,
  camp2,
}

enum GPKState {
  /// pk状态进行中
  pk_ing,

  /// pk状态惩罚中
  punish_ing,

  /// pk正常结束
  pk_over,

  /// pk模式结束（提前结束）
  all_over,

  /// 未知状态，服务器返回错误？
  unknown,
}

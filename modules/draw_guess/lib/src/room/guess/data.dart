import 'package:shared/shared.dart';

import 'draw_something.dart';

// 你画我猜房间配置数据
class GuessConfigData {
  final int version;
  final GameGuessState state;
  final int count;
  final int current; // 当前绘制者的麦序
  final String image;
  final String prompt; // 提示词
  final int changeWordPrice;

  GuessConfigData.fromJson(Map data)
      : version = Util.parseInt(data['gu_version'], 1),
        state = _getGameGuessState(Util.parseStr(data['gu_state'])),
        count = Util.parseInt(data['gu_count'], 1),
        current = Util.parseInt(data['gu_current'], 0),
        image = Util.parseStr(data['gu_image']) ?? '',
        prompt = Util.parseStr(data['gu_prompt']) ?? '',
        changeWordPrice = Util.parseInt(data['gu_change_word_price']);

  static GameGuessState _getGameGuessState(String? state) {
    if (Util.isStringEmpty(state)) return GameGuessState.wait;
    switch (state) {
      case 'wait':
        return GameGuessState.wait;
      case 'ready':
        return GameGuessState.ready;
      case 'choose':
        return GameGuessState.choose;
      case 'drawing':
        return GameGuessState.drawing;
      case 'result':
        return GameGuessState.result;
      case 'end':
        return GameGuessState.end;
    }
    return GameGuessState.wait;
  }
}

// 你画我猜麦上数据
class GuessPositionData {
  final int aid; // 游戏id
  final int originId; // 麦位用户id, 掉线保持不变
  final Role role; // 角色
  final int score; // 总分数
  final bool guessRight; // 是否猜测正确
  final String guessText; // 猜测的文本，对了显示加分，错了显示错误答案

  GuessPositionData.fromJson(Map data)
      : aid = Util.parseInt(data['gu_aid']),
        originId = Util.parseInt(data['gu_origin']),
        role = _convertRole(Util.parseStr(data['gu_role'])),
        score = Util.parseInt(data['gu_score']),
        guessRight = Util.parseInt(data['gu_guess_right']) > 0,
        guessText = Util.parseStr(data['gu_guess_text']) ?? '';

  static Role _convertRole(String? role) {
    switch (role) {
      case 'drawer':
        return Role.drawer;
      case 'guesser':
        return Role.guesser;
      default:
        return Role.audience;
    }
  }
}

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/vote/vote_repos.dart';
import 'package:chat_room/src/protobuf/generated/plugin_vote.pb.dart';
import 'package:flutter/material.dart';

/// 投票规则类型枚举
enum VoteOptionType {
  user, // 用户
  text // 文本
}

/// 转换投票规则
VoteOptionType convertRuleType(String type) {
  if (type == 'text') {
    return VoteOptionType.text;
  }
  return VoteOptionType.user;
}

class VoteCreateInfo {
  String title = ''; // 主题
  int time = 0; // 时间，单位秒
  bool isMulti = false; // 是否多选 false: 单选 true: 多选
  bool showResult = false; // 是否显示结果 false: 不显示 true:显示
  List<OptionUser> users = []; // 选择的用户
  List<String> texts = []; // 选择的文本

  void init(VoteSettingRule voteRule) {
    title = '';
    time = voteRule.time.default_4;
    isMulti = voteRule.defaultSelect;
    showResult = voteRule.defaultResultShow;
    users = [];
    texts = ['', ''];
  }
}

/// 创建投票viewModel
class VoteCreateViewModel extends ChangeNotifier {
  final ChatRoomData room;

  ResVoteConfig? voteConfig;
  VoteSettingRule? voteRule;

  VoteOptionType? optionType;
  VoteCreateInfo info = VoteCreateInfo();

  VoteCreateViewModel(this.room);

  bool mounted = true;

  @override
  void dispose() {
    mounted = false;
    super.dispose();
  }

  /// 加载配置数据
  Future<void> loadData() async {
    try {
      voteConfig = await VoteRepos.getConfig(room.rid);
      if (voteConfig != null) {
        VoteOptionType optionType =
            convertRuleType(voteConfig!.defaultRuleType);
        switchVoteRule(optionType);
      }
    } catch (e) {
      Log.d(e);
    }
  }

  /// 切换投票柜子
  void switchVoteRule(VoteOptionType optionType) {
    if (this.optionType != optionType) {
      this.optionType = optionType;
      voteRule = voteConfig?.list.firstWhereOrNull(
          (element) => convertRuleType(element.type) == optionType);
      if (voteRule != null) {
        info.init(voteRule!);
      }
    }
  }

  /// 获取分钟区间
  List<int> getTimerMinuteSection() {
    int min = (voteRule?.time.min ?? 0) ~/ 60;
    int max = (voteRule?.time.max ?? 0) ~/ 60;
    var retVal = <int>[];
    for (var i = min, step = 1; i < max; i = i + step) {
      retVal.add(i);
    }
    return retVal;
  }

  /// 获取秒钟区间
  List<int> getTimerSecondSection() {
    int stepValue = voteRule?.time.step ?? 10;
    var retVal = <int>[];
    for (var i = 0, step = stepValue; i <= 60; i = i + step) {
      retVal.add(i);
    }
    return retVal;
  }

  /// 时间转换成字符串
  String timeStr() {
    int time = info.time;
    int minute = time ~/ 60;
    int second = time % 60;
    String timeStr = '';
    if (minute > 0) {
      timeStr = '$minute${K.room_unit_minute}';
    }
    if (second > 0) {
      timeStr += '$second${K.room_second}';
    }
    return timeStr;
  }
}

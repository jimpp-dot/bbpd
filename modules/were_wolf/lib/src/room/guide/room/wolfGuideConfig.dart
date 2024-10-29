//游戏状态-新手引导
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';

enum WolfGuideConfigState {
  Wait, //未开始
  GameStart, //游戏开始
  GetRole, //抢身份
  PublishRole, //公布身份
  Night, //天黑
  NightAction, //天黑行动（查验，杀人，守卫）需配合角色来区分
  NightAntidote, //女巫解药
  NightPoison, //女巫毒药
  Daytime, //天亮
  DaytimePublishDead, //公布死亡结果
  DaytimeLastWords, //白天遗言
  DaytimeDesc, //白天发言
  DaytimeStartVote, //白天开始投票
  DaytimeVote, //白天投票
  DaytimeVoteResult, //投票结果
  DaytimeVotePublishDead, //投票死亡结果公布
  GameEnd, //游戏结束-出结束提示浮层
  End, //结束-出结果弹框
}

//狼人杀状态分类
enum WolfGuideDayType {
  other, //其他状态
  night, //白天
  day, //夜晚
}

class WolfGuidePosition {
  String levelIcon; //成就
  WolfRole role; //角色
  bool isDead; //角色是否死亡
  WolfDeadType? deadType; //死亡类型
  bool isDesc; //是否轮到发言
  bool canAction; //是否能行动
  bool publishRole; //是否公布角色
  bool canBeSelected; //是否可以被选中

  WolfGuidePosition(
      {this.levelIcon = '',
      required this.role,
      this.isDead = false,
      this.deadType,
      this.isDesc = false,
      this.canAction = false,
      this.publishRole = false,
      this.canBeSelected = true});
}

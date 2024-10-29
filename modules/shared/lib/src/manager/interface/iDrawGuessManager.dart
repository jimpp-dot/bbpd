import 'package:flutter/widgets.dart';
import '../iResourceLoader.dart';

abstract class IDrawGuessManager extends IResourceLoader {
  //画猜消息定制widget
  Widget getGuessMsgWidget(dynamic message);

  //是否在画猜游戏中
  bool isGaming();

  //是否在选词作画期间
  bool isDrawerChooseOrDrawing(dynamic positionExpendData);

  //是否在画画阶段
  bool isDrawing();

  //获取画猜游戏的originUid
  int getOriginUid(dynamic positionExpendData);

  int getAid(dynamic positionExpendData);

  //画猜游戏面板widget
  Widget getGuess(dynamic room);

  //画猜用户列表widget
  Widget getGuessPlayerList(dynamic room, bool displayEmote);

  //数据转换,config中扩展的画猜对象
  dynamic getGuessConfigData(Map data);

  //数据转换,position中扩展的画猜对象
  dynamic getGuessPositionData(Map data);

  /// 画猜接龙主界面
  Widget getGuessQueueWidget(dynamic room, VoidCallback onSettingClick);

  /// 你画我猜/画猜接龙，模式选择弹框，并返回对应的匹配type
  Future<String?> showChooseGuessModePanel(BuildContext context);

  //画猜接龙是否游戏中
  bool isGuessQueueGaming(BuildContext context);
}

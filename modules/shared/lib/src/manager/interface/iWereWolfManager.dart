import 'package:flutter/widgets.dart';

import '../iResourceLoader.dart';

abstract class IWereWolfManager extends IResourceLoader {
  static const String WOLF6 = 'wolf6';
  static const String WOLF9 = 'wolf';
  static const String NEWWOLF6 = 'newwolf6';
  static const String NEWWOLF9 = 'newwolf9';
  static const String WOLF12 = 'wolf12';

  //获取狼人房间（6/9/12）
  Widget getWolfRoomPage(dynamic room,
      {bool displayEmoteAtMic = true, bool displayMessageList = true});

  bool isWolf6(String typeLabel);

  bool isWolf9(String typeLabel);

  //狼人消息定制widget
  Widget getWolfMsgWidget(dynamic message);

  //数据转换,config中扩展的画猜对象
  dynamic getWolfConfigData(Map data);

  //数据转换,position中扩展的画猜对象
  dynamic getWolfPositionData(Map data);

  //获取狼人游戏的originUid
  int getOriginUid(dynamic positionExpendData);

  //是否在狼人游戏中
  bool isGaming();

  //是否狼人12人局
  bool isNewWolfRoom();

  //是否狼人白天
  bool isWolfStateTypeDay();

  //打开狼人等级解锁测试
  Future openWolfTestScreen(BuildContext context, {int mode = 1});

  //获取狼人typeLabel
  String getTypeLabel();

  ///获取明暗牌场
  String? getPublishDeal();

  //是否可直接关闭狼人房间
  bool checkToDispose(dynamic positionExpendData);

  bool isGameStarted();

  Widget getWolfBg(BuildContext context);

  Future<bool?> openWolfGuideScreen(BuildContext context);

  bool isInRoom();

  //were_wolf模块一些初始化
  Future<void> init();

  int getGameType();
}

import 'event.dart';

class RiskWheelEvent extends TrackEvent {
  /// 1：代表入口曝光
  static const int viewEntry = 1;

  /// 2：代表入口点击
  static const int clickEntry = 2;

  /// 3：默认转盘点击
  static const int clickDefaultWheel = 3;

  /// 4：自定义转盘设置的按钮点击
  static const int clickCustomCreate = 4;

  /// 5：自定义转盘开启点击
  static const int clickCustomStart = 5;

  /// 6：自定义转盘编辑点击
  static const int clickCustomEdit = 6;

  /// 7：有效点击“保存并生效”按钮
  static const int clickSave = 7;

  /// 8：用户点击draw触发公屏消息
  static const int clickUserStart = 8;

  /// 9：主播点击draw触发转盘
  static const int clickCreatorStart = 9;

  /// 10：大冒险开启状态下，点击编辑
  static const int clickWheelEdit = 10;

  /// 11：大冒险开启状态下，点击关闭
  static const int clickWheelClose = 11;

  /// 12：大冒险开启状态下，点击缩小
  static const int clickWheelMinimize = 12;

  /// 13：推荐选项点击
  static const int clickRecommend = 13;

  const RiskWheelEvent(String name) : super(name);

  /// 大冒险玩法按钮操作的时候上报
  static const adventure = RiskWheelEvent('adventure');

  static Map<String, dynamic> getAdventureProperties(int type) {
    Map<String, dynamic> properties = <String, dynamic>{
      'adventure_type': type,
    };
    return properties;
  }
}

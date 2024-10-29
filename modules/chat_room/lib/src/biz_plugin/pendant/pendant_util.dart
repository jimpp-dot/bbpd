import 'package:shared/shared.dart';

const String TAG = 'PendantLog';

/// 房间顶层动效消息key
const String roomTopmostEffectKey = 'room.topmost.effect';

/// 支持的挂件类型
enum PendantType {
  common, // 通用类型
  gift_red_envelope, // 礼物红包
  associated_room, // 关联房间
  title_birthday, // 生日小精灵
}

/// 挂件的显示类型
enum PendantShowType {
  top, // 竖排
  delete, // 删除消息
}

/// 挂件点击类型
enum PendantClickType {
  jump, // scheme跳转
  introduction, // 说明
  lottery, // 抽奖
  act_activity, // 活动抽奖
  drawer, // 抽屉类型,可展开
}

/// 挂件时间显示类型
enum PendantTimeShowType {
  show, // 结束时间
  show_countdown, // 倒计时-显示
  hide_countdown, // 倒计时-隐藏
  show_countdown_hour, // 倒计时-显示-三段 时分秒
}

/// 已领取过奖励的插件id列表
List<String> _receivedPluginIds = [];

/// 已手动关闭的动效
List<String> _handleClosePluginEffect = [];

/// 手动关闭插件动效触发
void handClosePluginEffect(int pluginId, String pluginType) {
  _handleClosePluginEffect.add('${pluginType}_$pluginId');
}

/// 是否手动关闭过插件动效
bool alreadyHandClosePluginEffect(int pluginId, String pluginType) {
  return _handleClosePluginEffect.contains('${pluginType}_$pluginId');
}

/// 是否已领取奖励
Future<bool> hasReceived(int pluginId) async {
  String? ids = await HiveUtil.get<String>('${TAG}_ids');
  _receivedPluginIds = ids?.split(',') ?? [];
  return _receivedPluginIds.contains(pluginId.toString());
}

/// 保存已领取奖励的插件id
void saveReceivedPlugin(int pluginId) {
  _receivedPluginIds.add(pluginId.toString());
  HiveUtil.put<String>('${TAG}_ids', _receivedPluginIds.join(','));
}

/// 是否未知挂件类型
bool isUnknownType(String type) {
  return PendantType.values.indexWhere((e) => e.name == type) < 0;
}

/// 是否无效的显示类型
bool isInvalidShowType(String showType) {
  return PendantShowType.values.indexWhere((e) => e.name == showType) < 0;
}

/// 格式化时间戳
String formatTime(int timeMillis, String timeShowType) {
  return timeShowType == PendantTimeShowType.show.name
      ? _formatDateTime(timeMillis)
      : timeShowType == PendantTimeShowType.show_countdown_hour.name
          ? TimeUtil.formateTimeHms(timeMillis)
          : TimeUtil.timerText(timeMillis);
}

String _formatDateTime(int timeMillis) {
  if (timeMillis <= 0) return '00:00';
  DateTime date = DateTime.fromMillisecondsSinceEpoch(timeMillis);
  return '${date.hour}:${date.minute}';
}

/// 计算剩余时间(指定时间与当前时间的间隔)
int remainderTime(int timeMillis) {
  return timeMillis - DateTime.now().secondsSinceEpoch;
}

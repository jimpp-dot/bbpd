import 'dart:async';

import 'package:thinking_analytics/thinking_analytics.dart';
import 'event.dart';

/// 数据埋点SDK
/// 目前仅支持单实例上报
class Tracker {
  Tracker._();

  static final Tracker _instance = Tracker._();

  /// ThinkingAnalyticsSDK 支持多实例，我们只用到单实例
  /// 为了后期扩展，这是通过单例调用sdk，而不是通过静态方法调用
  static Tracker get instance => _instance;

  /// 获取SDK版本号
  /// Android提供了自动获取的方法，iOS需要手动更新
  static Future<String> get version async {
    final String version = await ThinkingAnalytics.version;
    return version;
  }

  /// 初始化。
  /// [appId] App Id
  /// [serverUrl] 数据上传的url
  static Future<bool> init(
      {required String appId, required String serverUrl}) async {
    bool result =
        await ThinkingAnalytics.init(appId: appId, serverUrl: serverUrl);
    return result;
  }

  // 事件相关

  /// 上报一条事件数据
  /// [event] 事件的名称，需要以字母开头，可以包括数字、字母及“_”，最大为50个字符
  /// [properties] 事件的属性，是一个Map对象，每个元素代表一个属性，
  ///              key值为属性名，类型为String，value值为属性值，类型为String、Number、Boolean
  Future<bool> track(TrackEvent event,
      {Map<String, dynamic>? properties}) async {
    if (properties is Map<String, Object>) {
      properties = Map<String, dynamic>.from(properties);
    }
    properties?.removeWhere((k, v) => v == null);
    properties?.updateAll((key, value) {
      if (value is! String &&
          value is! num &&
          value is! bool &&
          value is! List) {
        value = value.toString();
      }
      return value;
    });
    // Log.d("track event.name=${event.name} properties=${properties == null ? 'null':properties.toString()}");

    //拦截模拟厅的上报
    if (properties != null &&
        properties['room_property'] != null &&
        properties['room_property'] == 'virtual') {
      return false;
    }

    return await ThinkingAnalytics.track(event.name, properties: properties);
  }

  /// 开始记录某个事件的时长，直到用户上传该事件为止，
  /// 该事件中将会带有#duration这一预置属性，用以表示记录的时长，
  /// 多次开始记录同一事件的时长将会以最后一次调用作为计时起点
  /// [event] 需要计时的事件，当使用[track]上传该事件名的事件时，计时停止，并上传计时数据。
  Future<bool> timeEvent(TrackEvent event) async {
    return await ThinkingAnalytics.timeEvent(event.name);
  }

  /// 设置公共事件属性
  /// 添加事件公共属性，设置后上传的事件都会带有这些事件公共属性。
  /// 每次设置会将新的属性添加进公共属性中，之前设置的也将保留，
  /// 如果多次设置同一属性，则取最后一次的设置值，事件公共属性的配置将会被保存，无需多次调用
  Future setSuperProperties(Map<String, dynamic> properties) async {
    await ThinkingAnalytics.setSuperProperties(properties);
  }

  /// 返回所有已设置的事件公共属性
  Future<Map<String, dynamic>?> getSuperProperties() async {
    return ThinkingAnalytics.getSuperProperties();
  }

  /// 删除已设置的事件公共属性
  Future<bool> unsetSuperProperty(String propertyName) async {
    return await ThinkingAnalytics.unsetSuperProperty(propertyName);
  }

  /// 清空所有已设置的事件公共属性
  Future clearSuperProperties() async {
    return await ThinkingAnalytics.clearSuperProperties();
  }

  /// 设置动态公共属性，即公共属性可以上报时获取当时的值
  Future<bool> setDynamicSuperProperties(
      Map<String, dynamic> properties) async {
    return await ThinkingAnalytics.setDynamicSuperProperties(properties);
  }

  // 用户相关

  /// 设置访客ID（可选）
  /// 在使用SDK之后，SDK会使用UUID作为每个用户的默认访客ID，该ID将会作为用户在未登录状态下身份识别ID，
  /// 如果App对每个用户有自己的访客ID管理体系，则可以调用identify来设置访客ID，
  /// 如果您需要替换访客ID，则应当在初始化SDK结束之后立即进行调用，请勿多次调用，以免产生无用的账号，
  /// 需要注意的是，UUID在用户重新安装APP以及更换设备时将会变更。
  Future<bool> identify(String id) async {
    return await ThinkingAnalytics.identify(id);
  }

  /// 获取访客ID
  Future<String> getDistinctId() async {
    String distinctId = await ThinkingAnalytics.getDistinctId();
    return distinctId;
  }

  /// 设置账号ID，一般为uid
  /// 在用户进行登录时，可调用[login]来设置用户的账号ID，
  /// 在设置完账号ID后，将会以账号ID作为身份识别ID，并且设置的账号ID将会在调用[logout]之前一直保留，
  /// [login]可以多次调用，每次调用会判断传入的账号ID与先前保存的ID是否一致，一致则忽略调用，不一致则会覆盖先前的ID。
  Future<bool> login(String accountId) async {
    return await ThinkingAnalytics.login(accountId);
  }

  /// 在用户产生登出行为之后，可调用logout来清除账号ID，在下次调用login之前，将会以访客ID作为身份识别ID
  Future logout() async {
    return await ThinkingAnalytics.logout();
  }

  /// 用户属性：使用该接口上传的属性将会覆盖原有的属性值，如果之前不存在该用户属性，则会新建该用户属性
  Future<bool> user_set(Map<String, dynamic> properties) async {
    return await ThinkingAnalytics.user_set(properties);
  }

  /// 用户属性：当该属性之前已经有值的时候，将会忽略这条信息
  Future<bool> user_setOnce(Map<String, dynamic> properties) async {
    return await ThinkingAnalytics.user_setOnce(properties);
  }

  /// 用户属性：上传数值型的属性，如果该属性还未被设置，则会赋值0后再进行计算，可传入负值，等同于相减操作
  Future<bool> user_add(Map<String, num> properties) async {
    return await ThinkingAnalytics.user_add(properties);
  }

  /// 用户属性：对指定属性进行清空操作，如果该属性还未在集群中被创建，则user_unset不会创建该属性
  Future<bool> user_unset(String key) async {
    return await ThinkingAnalytics.user_unset(key);
  }

  /// 是否打印Log，默认关闭
  static Future<bool> enableTrackLog(bool enable) async {
    return await ThinkingAnalytics.enableTrackLog(enable);
  }

  /// 是否暂停上报
  Future<bool> enableTracking(bool enable) async {
    return await ThinkingAnalytics.enableTracking(enable);
  }

  /// 开启自动采集
  /// 目前包括 APP_INSTALL、APP_START、APP_END 三个事件
  /// 如需设置公共事件属性或设置自定义访客ID，请务必确保在开启自动采集之前调用[setSuperProperties]或[identify]
  Future enableAutoTrack() async {
    return await ThinkingAnalytics.enableAutoTrack();
  }
}

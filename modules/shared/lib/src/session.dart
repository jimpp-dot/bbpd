import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shared/k.dart';
import 'package:shared/shared.dart';

enum UserRole { REG /* 注册ing,需完善资料 */, NORMAL, DISABLED, GOD }

class Session {
  static setValue(String key, String val) async {
    // Log.d('setValue:$key, value:$val');
    String old = Config.get(key);
    await Config.set(key, val);
    if (old != val) {
      eventCenter.emit(EventConstant.SessionChange, key);
    }
  }

  static Future setValues(Map<dynamic, dynamic>? res) async {
    if (res == null) return;

    /// Log.d('join_broker: ${res['join_broker']}');
    List<dynamic> keys = res.keys.toList();
    int length = keys.length;
    for (int i = 0; i < length; i++) {
      String key = keys[i].toString();
      String val;
      if (res[keys[i]] is Map || res[keys[i]] is List) {
        val = json.encode(res[keys[i]]);
      } else {
        val = res[keys[i]].toString();
      }

      //key为dtoken，且dtoken对应的值不为空，则覆盖dtoken对应的值的值
      //其它key走原来逻辑，直接覆盖
      if (key == 'dtoken') {
        if (val.isNotEmpty) {
          await setValue(key, val);
        }
      } else {
        await setValue(key, val);
      }
    }
  }

  static logout() {
    int uid = Session.uid;
    Config.delete('${uid}_private_chat_count');
    Config.delete('uid');
    Config.delete('token');
    Config.delete('icon');
    Config.delete('name');
    Config.delete('_is_auth');
    Config.delete('login_platform');
    Config.delete('little_alarm_god');
    Config.delete('pretty_uid');
    Config.delete('low_device_special_effect');
    Config.delete(BBConfigKey.loginAgreeUserLicense);
    if (uid > 0) {
      eventCenter.emit(EventConstant.EventLogout, uid);
    }
  }

  static dynamic getValue(String key) {
    return Config.get(key);
  }

  static int getInt(String key, [int defaultValue = 0]) => Config.getInt(key, defaultValue);

  static String getString(String key, [String defaultValue = '']) => Config.get(key, defaultValue);

  static Map getMap(String key, [Map? defaultValue]) {
    try {
      final value = Config.get(key);
      if (value.isEmpty) return defaultValue ?? {};

      dynamic v = json.decode(value);
      if (v is Map) return v;
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
    return defaultValue ?? {};
  }

  static int get uid {
    return getInt('uid', 0);
  }

  static int get agoraUid {
    return getInt('agora_uid', 0);
  }

  static int get sex {
    return getInt('sex', 0);
  }

  static int get version {
    return getInt('version', 0);
  }

  static int get title {
    return getInt('title', 0);
  }

  static int get titleNew {
    return getInt('title_new', 0);
  }

  static int get vip {
    return getInt('vip', 0);
  }

  static int get vipNew {
    return getInt('vip_new', 0);
  }

  static String get token {
    return getString('token');
  }

  static String get name {
    return getString('name');
  }

  static String get icon {
    return getString('icon');
  }

  static String get birthday {
    return getString('birthday');
  }

  /// 是否新用户，用于判断是否需要提示消息免打扰弹框
  static bool get isNewer {
    return Util.parseBool(getValue('is_chat_newer'));
  }

  /// 是否官方账号
  static bool get isOfficialAccount {
    return Util.parseBool(getValue('is_official'));
  }

  /// 官方账号类型 0： none，1：召回vip管家账号，2：GS管家账号，3：UGC官方账号，4：svip管家账号，5：潜在高价值管家账号，6：演员，7：官方运营
  static int get officialType {
    return getInt('official_type', 0);
  }

  /// 当前用户是否为小闹钟渠道白名单主播
  static bool get isAlarmWhiteGod => getInt('little_alarm_god', 0) == 1;

  ///待审核的头像，用于本地显示
  static String get tempIcon {
    String icon = getString('tmp_icon');

    return icon.isNotEmpty ? icon : Session.icon;
  }

  static String get sign {
    return getString('sign');
  }

  static String get loginPlatform {
    return getString('login_platform', '');
  }

  /// 账号曾经一键登录过
  static bool get mobileCertified {
    return getInt('_mobile_certify', 0) > 0;
  }

  /// 身份认证通过
  static bool get idAuthenticated {
    return getInt('_is_auth', 0) == 1;
  }

  /// 账号绑定过手机号或者安全手机号
  static bool get hasMobile {
    return (getInt('has_mobile', 0) >= 1) || hasUserMobile || hasSafeMobile;
  }

  /// 账号绑定过手机号
  static bool get hasUserMobile {
    return getInt('has_user_mobile', 0) >= 1;
  }

  /// 账号绑定过安全手机号
  static bool get hasSafeMobile {
    return getInt('has_safe_mobile', 0) >= 1;
  }

  static int get money {
    Map value = getMap('_money');
    int totalMoneyWithoutCoin = Util.parseInt(value['money']) +
        Util.parseInt(value['money_order']) +
        Util.parseInt(value['money_ca' 'sh']) +
        Util.parseInt(value['money_ca' 'sh_b']);
    return totalMoneyWithoutCoin;
  }

  static bool get hasName {
    String name = getString('name');
    return name.isNotEmpty;
  }

  static UserRole get role {
    int value = getInt('role', 0);
    switch (value) {
      case 1:
        return UserRole.NORMAL;
      case 2:
        return UserRole.DISABLED;
      case 3:
        return UserRole.GOD;
    }
    return UserRole.REG;
  }

  /// 房间内是否显示宠物🐱 -- 客户端控制
  static bool getRoomPetShow() {
    return Config.getBool('client_room_pet_$uid}', true);
  }

  static void setRoomPetShow(bool value) {
    Config.setBool('client_room_pet_$uid}', value);
  }

  static bool get servicePause {
    Map value = getMap('_orderservice', {});

    return Util.parseInt(value['service_pause']) > 0;
  }

  static int get serviceForbidden {
    Map value = getMap('_orderservice', {});

    return Util.parseInt(value['service_forbidden']);
  }

  static int get serviceRecover {
    Map value = getMap('_orderservice', {});

    return Util.parseInt(value['service_recover']);
  }

  static bool get showPopularityRedPoint {
    return getInt('benefit_popular_read', 0) == 1;
  }

  static bool get showVipRedPoint {
    return getInt('benefit_vip_read', 0) == 1;
  }

  static bool get showActivityLevelRedPoint {
    Map map = getMap("account_center");
    if (map.isNotEmpty) {
      return Util.parseBool(map['viability_award']);
    }
    return false;
  }

  static int get startBrowseTime {
    int browseTimeStamp = getInt('startBrowseTime', 0);
    return browseTimeStamp;
  }

  static bool get joinBroker {
    return Util.parseBool(getInt('join_broker', 0));
  }

  static int get popularityLevel {
    Map map = getMap("account_center");
    if (map.isNotEmpty) {
      return Util.parseInt(map['popularity_new_level']);
    }
    return 0;
  }

  // 获取当前用户的是否观光团白名单
  static bool get enabledCreateTourGroup {
    return Util.parseBool(getInt('tour_enable', 0));
  }

  static int get unionCreateTitle {
    return getInt('union_create_title', 0);
  }

  static int get unionCreateTitleNew {
    return getInt('union_create_title_new', 0);
  }

  // 获取当前用户是否dm
  static bool get isDm {
    return Util.parseBool(getInt('is_dm', 0));
  }

  // 是否成年人 -1未实名 0青少年 1成人
  static int get isAdult {
    return getInt('_isAdult', 1);
  }

  static int get age {
    return getInt('_age', 0);
  }

  static bool get canLogin {
    return getInt('_canLogin', 1) == 1;
  }

  // 用户类型 普通:0, 导游:1, 新手:2
  static int get killerUserType {
    return getInt('guide_user_type', 0);
  }

  // 用户注册时间
  static int get dateline {
    return getInt('dateline', 0);
  }

  /// 动态头像权限： 1 - 没有； 2 - 有
  static bool get dynamicHeader {
    return getInt('dynamic_header', 0) == 2;
  }

  /// 是否开启个性化推荐
  static bool get recommendEnable {
    if (getInt('close_recommend', 0) == 1) {
      return false;
    }
    return true;
  }

  static bool get lockGoods {
    if (getInt('lock_goods', 0) == 1) {
      return true;
    }
    return false;
  }

  static bool get lockNoble {
    if (getInt('lock_noble', 0) == 1) {
      return true;
    }
    return false;
  }

  /// 是否展示GS个性标签录入弹窗
  static bool get showGsTagsDialog {
    return false;
  }

  /// 是否在我的tab展示GS个性标签入口
  static bool get showGsTagsEntrance {
    return false;
  }

  static void clearShowGsTags() async {
    await setValues({'show_gs_tag_popup': '0', 'show_gs_tag_float_window': '0'});
  }

  static bool supportCoinUse = false;

  static Future<List> get browseUids async {
    int now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    int browseTimeStamp = Session.startBrowseTime;

    List browseUids = [];
    //浏览记录只保存1小时
    if (now - browseTimeStamp < 3600) {
      try {
        dynamic value = json.decode(getString('browseUids'));
        if (value is List) {
          browseUids = value;
        }
      } catch (e, s) {
        Log.e(e, stackTrace: s);
      }
    } else {
      //清空记录
      await setValue('startBrowseTime', now.toString());
      await setValue('browseUids', '[]');
    }
    return browseUids;
  }

  static clearBrowseUids() async {
    await setValue('browseUids', '');
  }

  static setBrowseUids(List uids) async {
    List browseUids = await Session.browseUids;
    if (browseUids.isNotEmpty) {
      browseUids = browseUids + uids;
    } else {
      browseUids = uids;
    }

    if (browseUids.length > 100) {
      browseUids.removeRange(0, browseUids.length - 100);
    }

    await setValue('browseUids', jsonEncode(browseUids));
  }

  static int get startBrowseRoomTime {
    int browseRoomTimeStamp = getInt('startBrowseRoomTime', 0);
    return browseRoomTimeStamp;
  }

  static Future<List> get browseRids async {
    int now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    int browseRoomTimeStamp = Session.startBrowseRoomTime;

    List browseRids = [];
    //浏览记录只保存1小时
    if (now - browseRoomTimeStamp < 3600) {
      try {
        dynamic value = json.decode(getString('browseRids'));
        if (value is List) {
          browseRids = value;
        }
      } catch (e, s) {
        Log.e(e, stackTrace: s);
      }
    } else {
      //清空记录
      await setValue('startBrowseRoomTime', now.toString());
      await setValue('browseRids', '[]');
    }
    return browseRids;
  }

  static clearBrowseRids() async {
    await setValue('browseRids', '');
  }

  static setBrowseRids(List rids) async {
    List browseRids = await Session.browseRids;
    if (browseRids.isNotEmpty) {
      browseRids = browseRids + rids;
    } else {
      browseRids = rids;
    }

    if (browseRids.length > 50) {
      browseRids.removeRange(0, browseRids.length - 50);
    }

    await setValue('browseRids', jsonEncode(browseRids));
  }

  static int get isPeiPei {
    return Session.isLogined ? getInt('is_peipei', 0) : 0;
  }

  static String get userType {
    //未充值 且 （非陪陪 或 非主播）（主播角色，未通过任何资质或关闭全部资质）&& 注册时间7天内
    if (!Session.isLogined || (Session.getInt('pay_money', 0) == 0 && Session.role != UserRole.GOD && Session.isPeiPei == 0)) {
      return 'new';
    } else if (Session.isLogined && (Session.role == UserRole.GOD || Session.isPeiPei > 0)) {
      return 'gold';
    } else if (Session.isLogined && Session.role != UserRole.GOD && Session.isPeiPei == 0 && Session.getInt('pay_money') > 0) {
      return 'old';
    } else {
      return 'expire';
    }
  }

  static bool get isLogined => Session.token.isNotEmpty && Session.uid > 0;

  /// 是否显示手气榜入口（开箱子面板、礼物面板）
  /// Session.sync({'lucky': true});
  static bool get showLucky {
    return Session.getInt('show_lucky', 0) > 0;
  }

  /// 是否展示签到红点，非小号且未签到才展示
  static bool showSignInRedPoint = false;

  /// 同步账号信息
  static Future<XhrResponse> sync([Map<String, bool>? options, bool forbiddenSave = false]) async {
    List<String> query = [];
    if (options != null) {
      // 如果是低端机，则需要获取低端机配置信息
      options['need_general_settings'] = true;

      options.forEach((String name, bool value) {
        if (value) {
          query.add("$name=1");
        }
      });
    }
    String url = '${System.domain}go/yy/account/sync?version=11&act_version=2&${query.isNotEmpty ? query.join('&') : ''}';
    XhrResponse response = await Xhr.getJson(url, formatJson: true);
    if (response.error == null && forbiddenSave == false) {
      Map res = response.value();
      if (res['success'] == true) {
        Config.delete('danger_user');
        Log.d('==>>sync:${res['data']}');
        await Session.setValues(res['data']);
        await syncTracerData();
        _configLowDeviceSpecialEffect();
      }
    }
    return response;
  }

  /// 向服务器上报登录用户冷启动 和 用户登录
  static Future<NormalNull> reportUserConnect() async {
    try {
      XhrResponse response = await Xhr.post('go/yy/account/connect', {}, pb: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } on Exception catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  static Future<Map> get chatMatchIds async {
    return getMap('${Session.uid}_chat_match_ids', {});
  }

  static setChatMatchIds(Map ids) async {
    try {
      String val = json.encode(ids);
      await setValue('${Session.uid}_chat_match_ids', val);
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
  }

  static syncTracerData() async {
    String group = Session.getString("group", "");
    Map<String, dynamic> dataMap = {};
    if (!Util.isStringEmpty(group)) {
      try {
        dataMap["group"] = json.decode(group);
      } catch (e, s) {
        Log.e(e, stackTrace: s);
      }
    }
    dataMap["vip"] = Session.vipNew;
    await Tracker.instance.setSuperProperties(dataMap);
  }

  static BoxGameType? _useStar;

  static BoxGameType get useStar {
    return _useStar ??= BoxGameType.None;
  }

  static String get signUrl {
    return Util.getWebUrl(getString('_sign_url', 'checkin/index.html'), params: {'clientScreenMode': '1'});
  }

  static String getSignUrl(String initTab) {
    return Util.getWebUrl(getString('_sign_url', 'checkin/index.html'), params: {'clientScreenMode': '1', 'initTab': initTab});
  }

  static int get firstPay {
    int recharge = getInt('first_pay', 0);
    return recharge;
  }

  static int get pckVersion {
    int pv = getInt('pck_version', 0);
    return pv;
  }

  static int get startMatchTime {
    int matchTime = getInt('startMatchTime', 0);
    return matchTime;
  }

  //已打过招呼的uids 1小时内不再匹配
  static Future<List> get sayhiMatchBrowseUids async {
    List browseUids = [];
    try {
      dynamic value = json.decode(getString('sayhiMatchBrowseUids'));
      if (value is List) {
        browseUids = value;
      }
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
    return browseUids;
  }

  static setSayhiMatchBrowseUids(List uids) async {
    List browseUids = await Session.sayhiMatchBrowseUids;
    if (browseUids.isNotEmpty) {
      browseUids = browseUids + uids;
    } else {
      browseUids = uids;
    }

    if (browseUids.length > 500) {
      browseUids.removeRange(0, browseUids.length - 500);
    }

    await setValue('sayhiMatchBrowseUids', jsonEncode(browseUids));
  }

  // 已转化
  static bool get showUserTransfer {
    return Util.parseBool(getInt('show_user_transfer', 0), false);
  }

  // 新贵NL转化 好友推荐
  static bool get showNLFriendRecommend {
    return Util.parseBool(getInt('show_nl_friend_recommend', 0), false);
  }

  /// 服务端控制是否展示跟点单/技能相关的UI
  static bool get showSkill {
    return Session.getInt('show_skills', 0) > 0;
  }

  /// 服务端控制是否展示rich
  static bool get canSeeRich {
    return Session.getInt('can_see_rich', 0) > 0;
  }

  /// 是否展示新人榜
  static bool get showUserRankNew {
    return Util.parseBool(getInt('rank_new', 0), false);
  }

  /// 消息页是否展示私聊保护提醒, 只有服务端默认设置为打开（-1）才展示，用户手动设置（0，1）不展示
  static bool get showPrivateChatProtect {
    return Util.parseInt(getInt('stranger_msg'), 1) == -1;
  }

  /// 是否是风险用户，风险用户弹语音验证码
  static bool get dangerUser {
    return Session.getInt('danger_user', 0) == 1;
  }

  /// 读取低端机是否关闭房间内特效，默认-2。
  /// -1：未设置过，如果是低端机且==-1，则会主动调用接口关闭特效；0：关闭关闭特效【开启特效】；1：开启关闭特效【关闭特效】。
  static int get lowDeviceSpecialEffect {
    int specialEffectValue = getInt('low_device_special_effect', -2);
    return specialEffectValue;
  }

  /// 是否显示礼包码，1显示，其它不显示
  static bool get showGiftCode {
    return Util.parseInt(getInt('show_gift_code'), 0) == 1;
  }

  /// 用户是否 建联
  /// 0-已建联；1-未建联
  static int get getKaStatus {
    return getInt('ka_status', 0);
  }

  /// 私聊次数是否达到上线（默认上限是2次）
  static bool privateChatCountReachUpperLimit({int dangerUser = 0, int limit = 2}) {
    String key = '${Session.uid}_private_chat_count';
    if (dangerUser == 1) {
      int count = Session.getInt(key, 0);
      if (count >= limit) {
        return true;
      } else {
        count += 1;
        Session.setValue(key, count.toString());
        return false;
      }
    } else {
      Config.delete(key);
      return false;
    }
  }

  static String get browseFateUidsString {
    String uids;
    try {
      uids = getString('browseFateUids', '[]');
    } catch (e) {
      uids = '[]';
    }

    return uids;
  }

  /// 今日缘分：已浏览uid，最多存100个
  static List get browseFateUids {
    List browseUids = [];
    try {
      dynamic value = json.decode(getString('browseFateUids'));
      if (value is List) {
        browseUids = value;
      }
    } catch (e) {}
    return browseUids;
  }

  static setBrowseFateUids(List uids) async {
    List browseUids = Session.browseFateUids;
    if (browseUids.isNotEmpty) {
      browseUids.addAll(uids);
    } else {
      browseUids = uids;
    }

    if (browseUids.length > 100) {
      browseUids.removeRange(0, browseUids.length - 100);
    }

    await setValue('browseFateUids', jsonEncode(browseUids));
  }

  /// 如果是低端机 && 为设置过，则主动调用接口进行关闭低端机房间内特效，并吐司提示下
  static bool _isLoadingLowDeviceSpecialEffectApi = false;

  static void _configLowDeviceSpecialEffect() async {
    int value = Session.lowDeviceSpecialEffect;
    Log.d('_configLowDeviceSpecialEffect---------------prev value:$value');
    if (isLogined && (await _isLowDevice()) && value == -1 && !_isLoadingLowDeviceSpecialEffectApi) {
      Log.d('_configLowDeviceSpecialEffect---------------next value:$value');
      _isLoadingLowDeviceSpecialEffectApi = true;
      ISettingManager settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
      NormalNull resp = await settingManager.setGeneralSetting(0, 1);
      if (resp.success) {
        Session.sync({});
        Fluttertoast.showCenter(msg: K.close_low_device_special_effect_tip);
      }
      _isLoadingLowDeviceSpecialEffectApi = false;
    }
  }

  /// 判断是否是低端机，iOS从低端机列表读取；Android判断运行内存<4G则为低端机
  static Future<bool> _isLowDevice() async {
    double totalMemorySize = await SharedAppPlugin.totalMemorySize;
    if ((Platform.isIOS && AppConfig.isLowSideDevice) || (totalMemorySize > 0 && totalMemorySize < 4.0)) {
      return true;
    }
    return false;
  }

  static bool isUserAdmin(int uid) {
    if (uid <= 100010000 || uid == 100010050) {
      return true;
    }
    return false;
  }
}

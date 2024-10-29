import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class AppConfig {
  static const String kickout = 'kickout'; // 游戏房踢人理由
  static const String image_domain = 'image_domain'; //IM图片有效域名
  static const String data_domain = 'data_domain'; //数数上报有效域名
  static const String song_domain = 'song_domain'; //KTV歌曲域名
  static const String cdn_image_domain = 'cdn_image_domain'; //图片有效域名
  /// 直播间打赏功能是否开放给普通用户
  static const String live_reward_all_user = 'live_reward_all_user';

  /// 真实迷案模块是否显示
  static const String user_show_case = 'user_show_case';

  /// 夺宝入口
  static const String treasure_act_link = 'treasure_act_link';

  /// 好声音入口
  static const String show_good_voice = 'show_good_voice';

  /// 是否上传直播间音频数据流
  static const String open_upload_aac = 'open_upload_aac';
  static const String upload_aac_rids = 'upload_aac_rids';

  /// 背景音乐搜索过滤词
  static const String music_trie = 'music_trie';

  /// 房间游戏配置信息
  static const String room_game = "room_game";

  /// 创意音效配置
  static const String sound_effect = "operate_effect";

  /// 人脸识别的弹窗文案
  static const String face_recognition = 'face_recognition';
  static const String face_recognition_first_tips = 'first_tips';
  static const String face_recognition_second_tips = 'second_tips';

  /// 录唱字体包配置
  static const String music_font = "music_font";

  /// 是否展示充值礼包
  static const String gift_pack = 'gift_pack';

  /// 开黑厅是否展示派单按钮
  static const String open_send_order = 'open_send_order';

  /// 是否展示旅行机票
  static const String travel_gift = 'travel_gift';

  /// avatar资源包配置
  static const int avatar_ver = 1;
  static const String avatar_config = "avatar_cfg@ver=$avatar_ver";

  /// 日志上报地址
  static const String device_report_domain = 'device_report_domain';

  /// 是否开启日志上报1：开启， 0：不开启
  static const String use_bblog = 'use_bblog';

  /// 首页是否置灰
  static const String _isGray = 'is_gray';

  /// 是否关闭新的vap plugin（目前有两个vap plugin，vap_view为新增纹理方式），为避免上线后出现crash等问题，支持服务端关闭
  static const String close_new_vap = 'close_new_vap';

  /// 是否禁用iOS的实时活动
  static const String close_live_activity = 'close_live_activity';

  /// 高潜管家ID
  static const String high_potential_steward = 'high_potential_steward';

  /// 是否展示工会入驻
  static const String show_trade_union = 'show_trade_union';

  /// KA用户APP评价
  static const ka_evaluate = 'ka_evaluate';

  /// 低端设备
  static bool isLowSideDevice = false;

  ///中端设备
  static bool isMidSideDevice = false;

  /// 视频编辑低端设备
  static bool isVideoEditLowSideDevice = false;

  /// 是否使用快速进房
  static const String use_fast_enter_room = 'use_fast_enter_room';

  static const List<String> _lowSideDevices = [
    'iPhone3,',

    /// 4系列
    'iPhone4,',

    /// 4s系列
    'iPhone5,',

    /// 5系列
    'iPhone6,',

    /// 5s系列
    'iPhone7,',

    /// 6系列
    'iPad2,',

    /// iPad 2, iPad Mini
    'iPad3,',

    /// iPad 3, iPad 4
    "iPad4,",

    /// iPad Air, iPad Mini 2, iPad Mini 3
  ];

  static const List<String> _midSideDevices = [
    'iPhone8,', //6s系列
    'iPhone9,', //7系列
    'iPhone10,', //8，x系列
    'iPhone11,8', //只有xr
    'iPhone12,8', //只有se2
    'iPad5,', //iPad
    'iPad6,', //
    'iPad7,', //
  ];

  static const List<String> _videoEditLowSideDevices = [
    'iPhone3,',

    /// 4系列
    'iPhone4,',

    /// 4s系列
    'iPhone5,',

    /// 5系列
    'iPhone6,',

    /// 5s系列
    'iPhone7,',

    /// 6系列
    'iPhone8,',

    ///6s系列
    'iPhone9,', //7系列
    'iPhone10,', //8，x系列
    'iPad5,', //iPad
    'iPad6,', //
    'iPad7,', //
  ];

  /// 已觉醒礼物列表
  static String get awakenedGiftKey => '${Session.uid}.AwakenedGift';

  static bool get _isMidSideDevice {
    for (String element in _midSideDevices) {
      if (DeviceInfo.machine.contains(element)) {
        return true;
      }
    }
    return false;
  }

  static bool get _isLowSideDevice {
    for (String element in _lowSideDevices) {
      if (DeviceInfo.machine.contains(element)) {
        return true;
      }
    }
    return false;
  }

  static bool get _isVideoEditLowSideDevice {
    for (String element in _videoEditLowSideDevices) {
      if (DeviceInfo.machine.contains(element)) {
        return true;
      }
    }
    return false;
  }

  /// - imagecache针对低端机调小
  /// - 关闭音频通知服务
  static void deviceLeveInit() {
    imageCache.maximumSize = 1000;
    imageCache.maximumSizeBytes = 1024 * 1024 * 50;
    if (_isLowSideDevice || _isMidSideDevice) {
      imageCache.maximumSizeBytes = 1024 * 1024 * 20;
      isLowSideDevice = _isLowSideDevice;
      isMidSideDevice = _isMidSideDevice;
      isVideoEditLowSideDevice = _isVideoEditLowSideDevice;
    }
  }

  static Future<Map> sync({required List<String> type}) async {
    Map result = {};
    try {
      Map<String, String> params = {if (type.isNotEmpty) 'type': type.join(',')};
      XhrResponse response = await Xhr.postJson('${System.domain}go/yy/config/common?version=4', params, formatJson: true);
      Map res = response.value();
      if (res['success'] == true) {
        result = res['data'];
        result.forEach((key, value) async {
          Log.d('config/common key:$key, value:$value');
          if (value is String) {
            Config.set('Config.$key', value);
          } else {
            if (key == AppConfig._isGray) {
              /// 首页置灰，变化需要通知出去
              String oldValue = AppConfig.getConfig(AppConfig._isGray, defValue: '0');
              Config.set('Config.$key', jsonEncode(value));
              if (oldValue != jsonEncode(value)) {
                eventCenter.emit(EventConstant.EventHomeGreyChange);
              }
            } else {
              if (key == ka_evaluate) {
                HiveUtil.put<String>('${Session.uid}_$key', jsonEncode(value));
              } else {
                Config.set('Config.$key', jsonEncode(value));
              }
            }
          }

          if ('cdn_image_domain' == key && value != null && value is Map) {
            //如果是cnd的图片域名key
            Map cdnImageDomain = value;
            saveCdnImageConfig(cdnImageDomain);
          }

          if ('data_domain' == key && Util.validStr(value)) {
            System.updateConfig('dataDomain', value);
            // 更新数数上报的域名
            bool result = await Tracker.init(appId: BaseConfig.instance.trackerAppId, serverUrl: System.dataDomain);
            Log.d('app_config => update dataDomain: ${System.dataDomain}, result: $result');
          }
        });

        eventCenter.emit(EventConstant.EventAppSyncConfigSucc);
      }
    } catch (e) {
      Log.d('Catch exception when check room, exception: $e');
    }
    return result;
  }

  static void saveCdnImageConfig(Map cdnImageDomain) {
    try {
      String? imageDomain = Util.parseStr(cdnImageDomain['imageDomain']);
      if (imageDomain != null && imageDomain.isNotEmpty && (imageDomain.startsWith('http://') || imageDomain.startsWith('https://'))) {
        Log.d('app_config => update imageDomain: $imageDomain');
        System.updateConfig('imageDomain', imageDomain);
      }
      String? imageOriginDomain = Util.parseStr(cdnImageDomain['imageOriginDomain']);
      if (imageOriginDomain != null &&
          imageOriginDomain.isNotEmpty &&
          (imageOriginDomain.startsWith('http://') || imageOriginDomain.startsWith('https://'))) {
        Log.d('app_config => update imageOriginDomain: $imageOriginDomain');
        System.updateConfig('imageOriginDomain', imageOriginDomain);
      }
    } catch (e) {
      Log.d('Catch exception when saveCdnImageConfig: $e');
    }
  }

  static String getConfig(String type, {String defValue = ''}) {
    if (type == image_domain) {
      defValue = defaultImageDomain;
    }
    return Config.get('Config.$type', defValue);
  }

  static String getMiniId() {
    return Config.get('Config.mini_id', '');
  }

  static String? _defaultImageDomainJson;

  static String get defaultImageDomain {
    return _defaultImageDomainJson ??= jsonEncode([
      'bbpd-dev.oss-cn-hangzhou.aliyuncs.com',
      'bbpd-image.oss-cn-hangzhou.aliyuncs.com',
      'bbpdim.oss-cn-hangzhou.aliyuncs.com',
      'proxyimg.happyxq.cc.cn',
    ]);
  }

  static bool get userShowCase {
    return AppConfig.getConfig(AppConfig.user_show_case) == '1';
  }

  static bool get showGoodVoice {
    return AppConfig.getConfig(AppConfig.show_good_voice) == '1';
  }

  static bool get openUploadAac => AppConfig.getConfig(AppConfig.open_upload_aac) == '1';

  static List<int> get uploadAacRids {
    String ridStr = AppConfig.getConfig(AppConfig.upload_aac_rids);
    List<int> rid = [];
    try {
      rid = Util.validStr(ridStr) ? List<int>.from(jsonDecode(ridStr)) : [];
    } catch (e) {
      Log.d('uploadAacRids error: $e');
    }
    return rid;
  }

  static List<String> get musicTrie {
    String musicStr = AppConfig.getConfig(AppConfig.music_trie);
    List<String> musicT = [];
    try {
      musicT = Util.validStr(musicStr) ? musicStr.split(',') : [];
    } catch (e) {
      Log.d('musicTrie error: $e');
    }
    return musicT;
  }

  static bool get showGiftPack {
    String giftPack = AppConfig.getConfig(AppConfig.gift_pack);
    if ('1' == giftPack) {
      return true;
    }
    return false;
  }

  static bool get showTravelGift {
    String travelGift = AppConfig.getConfig(AppConfig.travel_gift);
    if ('1' == travelGift) {
      return true;
    }
    return false;
  }

  static String get treasureUrl {
    String config = AppConfig.getConfig(AppConfig.treasure_act_link, defValue: '');
    if (Util.isStringEmpty(config)) {
      return '';
    }
    var treasure = jsonDecode(config);
    if (config.isNotEmpty && treasure is Map) {
      if (Util.parseBool(treasure['is_open'], false)) {
        return Util.parseStr(treasure['link']) ?? '';
      }
    }

    return '';
  }

  static String get bbLogDomain {
    return AppConfig.getConfig(AppConfig.device_report_domain);
  }

  static bool get useBBlog {
    String type = AppConfig.getConfig(AppConfig.use_bblog, defValue: '0');
    return type == '1';
  }

  static bool get openSendOrder {
    String type = AppConfig.getConfig(AppConfig.open_send_order, defValue: '0');
    return type == '1';
  }

  static bool get closeNewVap {
    /// 默认开启
    String type = AppConfig.getConfig(AppConfig.close_new_vap, defValue: '0');
    return type == '1';
  }

  static bool get disableLiveActivity {
    /// 默认开启
    String type = AppConfig.getConfig(AppConfig.close_live_activity, defValue: '0');
    return type == '1';
  }

  /// first_tips / second_tips
  static String getFaceRecognitionByKey(String key) {
    String str = AppConfig.getConfig(AppConfig.face_recognition);
    Map<String, dynamic> map = {};
    try {
      map = Util.validStr(str) ? jsonDecode(str) : {};
    } catch (e) {
      Log.d('getFaceRecognitionByKey error: $e');
    }
    if (map.isNotEmpty) {
      final value = map[key] ?? '';
      return value.toString();
    }
    return '';
  }

  /// 皮队友首页置灰
  static bool get homeGrey {
    String type = AppConfig.getConfig(AppConfig._isGray, defValue: '0');
    return type == '1';
  }

  static List<int>? _highPotentialStewardIds; // 高潜管家ID

  /// 判断是否为高潜管家ID
  static bool isHighPotentialSteward(String targetId) {
    if (_highPotentialStewardIds == null) {
      String value = AppConfig.getConfig(AppConfig.high_potential_steward, defValue: '');
      _highPotentialStewardIds = Util.validStr(value) ? List<int>.from(jsonDecode(value)) : [];
    }
    return _highPotentialStewardIds!.contains(Util.parseInt(targetId));
  }

  /// 是否展示工会入驻
  static bool get showTradeUnion => AppConfig.getConfig(AppConfig.show_trade_union, defValue: '0') == '1';

  static List<String> get awakenedGifts {
    String data = Config.get(AppConfig.awakenedGiftKey, '');
    return Util.validStr(data) ? data.split(',') : [];
  }

  static void saveAwakenedGifts(List<String> giftList) {
    String data = giftList.isNotEmpty == true ? giftList.join(',') : '';
    Config.set(AppConfig.awakenedGiftKey, data);
  }

  static bool get useFastEnterRoom {
    return AppConfig.getConfig(AppConfig.use_fast_enter_room, defValue: '1') == '1';
  }
}

String get faceRecognitionFirstTips => AppConfig.getFaceRecognitionByKey(AppConfig.face_recognition_first_tips);

String get faceRecognitionSecondTips => AppConfig.getFaceRecognitionByKey(AppConfig.face_recognition_second_tips);

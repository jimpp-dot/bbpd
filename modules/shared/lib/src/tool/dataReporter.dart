import 'dart:convert';
import 'dart:io';

import 'package:shared/shared.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

class DataReporter {
  static String _md5(String data) {
    var content = const Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes).toLowerCase();
  }

  static Future reportEvent(UserEvent? event) async {
    int ct = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    String? sid = Config.get('boot.sid');
    int son = Config.getInt('boot.son', 1);
    String mac = DeviceInfo.mac;
    String mt = Platform.isIOS
        ? "${DeviceInfo.model}_${DeviceInfo.deviceId}"
        : DeviceInfo.model;

    son = son + 1;
    Config.set('boot.son', son.toString());

    Map newData = {
      'ct': ct,
      'sid': sid,
      'son': son,
      'mt': mt,
      'sys': Platform.isIOS ? 'ios' : 'android',
      'syv': DeviceInfo.systemVersion,
      'mac': mac,
      'ch': DeviceInfo.channel,
      'ver': Constant.appVersion,
      'jv': '2.0.0.0',
      'uid': Session.uid.toString(),
      'tm': 0,
      'tp': event?.type ?? '',
      'net': '',
      'idfa': DeviceInfo.idfa,
      'pname': Constant.packageName,
      'prdtype': 'xs', //应用标识（cy：冲鸭， xs：主app）
    };

    event?.getData().forEach((k, v) {
      newData[k] = v;
    });

    String getParams = "";
    newData.forEach((k, v) {
      getParams += ("$k=$v&");
    });

    Log.d("getParams $getParams");
    XhrResponse response = await Xhr.get('${System.logDomain}xs?$getParams');
    if (response.error != null) {
      return false;
    }
    return true;
  }
}

abstract class UserEvent {
  final String? type;

  UserEvent(this.type) : assert(type != null);

  Map<String, String> getData();
}

class ClickEvent extends UserEvent {
  final List<int>? uidList;

  ClickEvent(this.uidList) : super('click');

  @override
  Map<String, String> getData() {
    return {'uids': uidList?.map((uid) => uid.toString()).join(',') ?? ''};
  }
}

//匹配上报字段
class MatchEvent extends UserEvent {
  final String? matchKey;
  final String rid;
  final int duration;
  final String ltp;
  final String iid;

  MatchEvent(this.rid, this.matchKey, this.duration, this.ltp, {this.iid = '0'})
      : super('match');

  @override
  Map<String, String> getData() {
    return {
      'vid': rid,
      'lid': matchKey ?? '',
      'bitm': '$duration',
      'ltp': ltp,
      'iid': iid,
    };
  }
}

class CallEvent extends UserEvent {
  final String? roomType;
  final String rid;

  CallEvent(this.rid, this.roomType) : super('gmzz');

  @override
  Map<String, String> getData() {
    return {'vid': rid, 'ltab': roomType ?? ''};
  }
}

class LoginEvent extends UserEvent {
  static const String way_qq = 'qq';
  static const String way_wx = 'wx';
  static const String way_apple = 'apple';
  static const String way_xiaomi = 'xiaomi';
  static const String way_douyin = 'douyin';
  static const String way_phone = 'phone';
  static const String way_onekey = 'onekey';

  static const String status_show = 'show'; // 展示授权页
  static const String status_token = 'token'; // 获取到token
  static const String status_switch = 'switch'; // 切换登录方式
  static const String status_cancel = 'cancel'; // 取消登录
  static const String status_success = 'succ'; // 登录成功
  static const String status_error = 'err'; // 登录失败

  final String way; // 登录方式
  final String? status; // 过程状态
  final String? msg; // 描述信息

  LoginEvent(this.way, {this.status, this.msg}) : super('login');

  @override
  Map<String, String> getData() {
    Map<String, String> map = {'lpt': way};
    if (status != null) {
      map['lsa'] = status ?? '';
    }
    if (msg != null) {
      map['osa'] = msg ?? '';
    }
    return map;
  }
}

//创建房间上报字段
class CreateRoomEvent extends UserEvent {
  final String key; //分类id  如：wolf/juben等
  final String rid;
  final String iid; //特殊id，如剧本id

  CreateRoomEvent(this.rid, this.key, {this.iid = '0'}) : super('drama_room');

  @override
  Map<String, String> getData() {
    return {
      'vid': rid,
      'lid': key,
      'iid': iid,
    };
  }
}

//游戏开局上报字段
class StartGameEvent extends UserEvent {
  final String key; //分类id  如：wolf/juben等
  final String rid;
  final int duration; //游戏未开始前进房到游戏开局花费的时间
  final String iid; //特殊id，如剧本id

  StartGameEvent(this.rid, this.key, this.duration, {this.iid = '0'})
      : super('drama_game');

  @override
  Map<String, String> getData() {
    return {
      'vid': rid,
      'lid': key,
      'bitm': '$duration',
      'iid': iid,
    };
  }
}

//房间内邀请好友上报字段
class InviteFriendEvent extends UserEvent {
  final String key; //分类id  如：wolf/juben等
  final String rid;
  final String vpg; //邀请渠道
  final String iid; //特殊id，如剧本id

  InviteFriendEvent(this.rid, this.key, this.vpg, {this.iid = '0'})
      : super('drama_invite');

  @override
  Map<String, String> getData() {
    return {
      'vid': rid,
      'lid': key,
      'vpg': vpg,
      'iid': iid,
    };
  }
}

//游戏准备或者取消准备上报字段
class ReadyGameEvent extends UserEvent {
  final String key; //分类id  如：wolf/juben等
  final String rid;
  final String iid; //特殊id，如剧本id
  final int isCancel; //1取消准备 0准备

  ReadyGameEvent(this.rid, this.key, this.isCancel, {this.iid = '0'})
      : super('drama_rd');

  @override
  Map<String, String> getData() {
    return {
      'vid': rid,
      'lid': key,
      'iid': iid,
      'ltp': isCancel == 1 ? 'cancel' : 'ready'
    };
  }
}

//新手引导显示上报字段
class GuideShowEvent extends UserEvent {
  final String oto; //是否有跳过1有0无

  GuideShowEvent(this.oto) : super('drama_guide_show');

  @override
  Map<String, String> getData() {
    return {
      'oto': oto,
    };
  }
}

//新手引导完成上报字段(完成或跳过)
class GuideDoneEvent extends UserEvent {
  final String oto; //是否有跳过1有0无
  final String bitm; //使用时长，s
  final String oskl; //当前阶段数
  final String opri; //总阶段数

  GuideDoneEvent(
    this.oto,
    this.bitm,
    this.oskl,
    this.opri,
  ) : super('drama_guide_done');

  @override
  Map<String, String> getData() {
    return {
      'oto': oto,
      'bitm': bitm,
      'oskl': oskl,
      'opri': opri,
    };
  }
}

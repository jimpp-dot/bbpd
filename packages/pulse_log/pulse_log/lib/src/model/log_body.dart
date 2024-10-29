import 'dart:convert';

import 'package:flutter/material.dart';

import 'log_print.dart';

enum LogType {
  plain, //默认，仅供解析使用
  net, // 网络请求
  socket, // websock 请求
  event, // 事件
  router, // 路由
  exception, // 异常
  console, // 控制台
  netConnectInfo, // 网络连接信息,
  user, //用户uid, 登录登出时
  nobility, // 开通贵族,
  pay, // 支付行为
  gift, //礼物行为
  imageFail, //图片下载/上传失败
  rtc, // rtc 相关异常
}

enum SocketAction {
  connectSucc,
  connectError,
  onDone,
  send,
  receive,
  imTryConnect,
  imRealConnect,
  imKickOut,
  imLoginError,
}

enum SocketScene {
  room,
  im,
}

enum NobilityAction {
  showIap,
}

enum PayAction {
  showPMethod, // 显示ipa弹窗
  goIap,
  goIapNext, // Iap 内部行为
  goNormal, // 走非 iap 方式
  loadH5Token,
  loadPayCreate,
  loadPayCreateNext,
  loadPayReturn,
  willOpenH5,
  openH5, // 打开H5遇到错误时才会有这个行为上报
  h5Jump, // h5二次跳转
  payed, //支付流程成功的结束
}

enum GiftAction {
  play,
}

enum ImageAction {
  upload,
  download,
}

enum RtcAction {
  exception,
}

LogType logTypeFromDesc(String desc) {
  if (desc == LogType.net.name) {
    return LogType.net;
  } else if (desc == LogType.event.name) {
    return LogType.event;
  } else if (desc == LogType.router.name) {
    return LogType.router;
  } else if (desc == LogType.exception.name) {
    return LogType.exception;
  } else if (desc == LogType.console.name) {
    return LogType.console;
  }

  return LogType.values.firstWhere(
    (e) => e.name == desc,
    orElse: () => LogType.plain,
  );
}

String get _nowTime => DateTime.now().toLocal().toString();

String getTimeString(dynamic value) {
  if (value == null) {
    return '';
  } else if (value is String) {
    return value;
  } else if (value is int) {
    return DateTime.fromMillisecondsSinceEpoch(value).toLocal().toString();
  } else {
    return value.toString();
  }
}

abstract class LogBody {
  late LogType type;
  late String time;

  String get brief;

  String get description;

  bool get canLog => true;

  bool get alert => false;

  Map<String, dynamic> toMap();

  static LogBody fromMap(Map<String, dynamic> map) {
    LogType type = logTypeFromDesc(map['type'] ?? '');
    switch (type) {
      case LogType.net:
        return NetBody.fromMap(map);
      case LogType.event:
        return EventBody.fromMap(map);
      case LogType.console:
        return ConsoleBody.fromMap(map);
      case LogType.exception:
        return ExceptionBody.fromMap(map);
      case LogType.router:
        return RouterBody.fromMap(map);
      case LogType.plain:
        return PlainBody.fromMap(map);
      case LogType.socket:
        return SocketBody.fromMap(map);
      case LogType.netConnectInfo:
        return NetworkInfoBody.fromMap(map);
      case LogType.user:
        return UserBody.fromMap(map);
      case LogType.nobility:
        return NobilityBody.fromMap(map);
      case LogType.pay:
        return PayBody.fromMap(map);
      case LogType.gift:
        return GiftBody.fromMap(map);
      case LogType.imageFail:
        return ImageFailBody.fromMap(map);
      case LogType.rtc:
        return RtcExceptionBody.fromMap(map);
    }
  }

  Color get color {
    switch (type) {
      case LogType.net:
        return Colors.blue;
      case LogType.event:
        return Colors.yellow;
      case LogType.console:
        return Colors.cyan;
      case LogType.exception:
        return Colors.red;
      case LogType.router:
        return Colors.greenAccent;
      case LogType.plain:
        return Colors.grey;
      case LogType.socket:
        return Colors.lightBlueAccent;
      case LogType.netConnectInfo:
        return Colors.blueGrey;
      case LogType.user:
        return Colors.orangeAccent;
      case LogType.nobility:
        return Colors.orange;
      case LogType.pay:
        return Colors.deepOrangeAccent;
      case LogType.gift:
        return Colors.purpleAccent;
      case LogType.imageFail:
        return Colors.redAccent;
      case LogType.rtc:
        return Colors.lightGreenAccent;
    }
  }

  String get typeText {
    switch (type) {
      case LogType.net:
        return '网络请求';
      case LogType.event:
        return '自定义事件';
      case LogType.console:
        return '控制台';
      case LogType.exception:
        return '异常';
      case LogType.router:
        return '页面路由';
      case LogType.plain:
        return '日志';
      case LogType.socket:
        return 'Socket';
      case LogType.netConnectInfo:
        return '网络连接信息';
      case LogType.user:
        return '用户登录/登出';
      case LogType.nobility:
        return '爵位开通';
      case LogType.pay:
        return '支付/消费行为';
      case LogType.gift:
        return '送礼/打赏';
      case LogType.imageFail:
        return '图片上传/下载失败';
      case LogType.rtc:
        return 'RTC 异常';
    }
  }

  @override
  String toString() {
    return description;
  }
}

/// 默认日志体
class PlainBody extends LogBody {
  late dynamic content;

  PlainBody(this.content) {
    type = LogType.plain;
    time = _nowTime;
  }

  @override
  String get brief => content.toString();

  @override
  String get description => content is Map
      ? BodyUtil.formatMap(content)
      : content is String
          ? content
          : '';

  @override
  Map<String, dynamic> toMap() => {'content': content.toString(), 'time': time};

  factory PlainBody.fromMap(Map<String, dynamic> map) {
    PlainBody body = PlainBody(map);
    body.time = getTimeString(map['time']);
    return body;
  }
}

/// 网络日志体
class NetBody extends LogBody {
  static List<String> ignoreList = ['account/sync', 'cloud/token'];

  late String url;
  late int statusCode;
  late bool success;
  String? errorMsg;
  late int duration;
  late String? body;
  bool isPb = false;

  NetBody(this.url) {
    type = LogType.net;
    time = _nowTime;
  }

  @override
  bool get alert => !success;

  @override
  String get brief => '${Uri.parse(url).path} --> $success ${errorMsg ?? ''}';

  @override
  String get description => BodyUtil.formatMap(toMap(), ignoreKey: isPb ? 'body' : null);

  @override
  Map<String, dynamic> toMap() => {
        'type': type.name,
        'url': url,
        'statusCode': statusCode,
        'success': success,
        'errorMsg': errorMsg ?? '',
        'duration': duration,
        'body': respBody,
        'isPb': isPb,
        'time': time,
      };

  factory NetBody.fromMap(Map<String, dynamic> map) {
    NetBody body = NetBody(map['url']);
    body.type = logTypeFromDesc(map['type']);
    body.statusCode = BodyUtil.parseInt(map['statusCode']);
    body.success = BodyUtil.parseBool(map['success']);
    body.errorMsg = map['errorMsg'];
    body.duration = BodyUtil.parseInt(map['duration']);
    body.time = getTimeString(map['time']);
    body.body = map['body'];
    body.isPb = map['isPb'] ?? false;
    return body;
  }

  String get respBody {
    for (var keyword in ignoreList) {
      if (url.contains(keyword)) {
        return '';
      }
    }

    if (body != null && body!.toLowerCase().contains('token')) {
      return '';
    }

    return body ?? '';
  }
}

/// websocket日志
class SocketBody extends LogBody {
  static List<String> ignoreList = ['joinChannel', 'ping'];

  SocketAction action;
  SocketScene scene;
  Map info;
  bool isPb = false;

  SocketBody(this.scene, this.action, this.info, {this.isPb = false}) {
    type = LogType.socket;
    time = _nowTime;
  }

  @override
  String get brief => '${scene.name}: ${action.name} ${getTheInfo()}';

  @override
  String get description => BodyUtil.formatMap(toMap());

  @override
  Map<String, dynamic> toMap() =>
      {'scene': scene.name, 'type': type.name, 'action': action.name, 'info': getTheInfo(), 'isPb': isPb, 'time': time};

  factory SocketBody.fromMap(Map<String, dynamic> map) {
    Map info = {};
    try {
      info = jsonDecode(map['info']);
    } catch (e) {
      logPrint(e.toString());
    }

    SocketBody body = SocketBody(
        SocketScene.values.firstWhere(
          (e) => e.name == map['scene'],
          orElse: () => SocketScene.im,
        ),
        SocketAction.values.firstWhere(
          (e) => e.name == map['action'],
          orElse: () => SocketAction.send,
        ),
        info);
    body.isPb = map['isPb'] ?? false;
    body.time = getTimeString(map['time']);
    return body;
  }

  String getTheInfo() {
    for (var keyword in ignoreList) {
      if (info.toString().contains(keyword)) {
        return '';
      }
    }

    if (info.toString().toLowerCase().contains('token')) {
      return '';
    }

    try {
      return jsonEncode(info, toEncodable: (obj) => obj.toString());
    } catch (e) {
      return info.toString();
    }
  }

  @override
  bool get canLog => getTheInfo().isNotEmpty;
}

/// 事件日志
class EventBody extends LogBody {
  late String name;

  Map<String, dynamic>? properties;

  EventBody(this.name) {
    type = LogType.event;
    time = _nowTime;
  }

  @override
  String get brief => '$name:: ${properties.toString()}';

  @override
  String get description => BodyUtil.formatMap(toMap());

  @override
  Map<String, dynamic> toMap() => {'type': type.name, 'name': name, 'properties': properties ?? {}, 'time': time};

  factory EventBody.fromMap(Map<String, dynamic> map) {
    EventBody body = EventBody(map['name']);
    body.type = logTypeFromDesc(map['type']);
    body.properties = map['properties'] ?? {};
    body.time = getTimeString(map['time']);
    return body;
  }
}

/// 路由日志
class RouterBody extends LogBody {
  late String preRoute;
  late String currentRoute;
  dynamic routeArgs;

  RouterBody(this.preRoute, this.currentRoute) {
    type = LogType.router;
    time = _nowTime;
  }

  @override
  String get brief => '$preRoute ----> $currentRoute';

  @override
  String get description => BodyUtil.formatMap(toMap());

  @override
  Map<String, dynamic> toMap() =>
      {'type': type.name, 'preRoute': preRoute, 'currentRoute': currentRoute, 'routeArgs': routeArgs, 'time': time};

  factory RouterBody.fromMap(Map<String, dynamic> map) {
    RouterBody body = RouterBody(map['preRoute'], map['currentRoute']);
    body.type = logTypeFromDesc(map['type']);
    body.routeArgs = map['routeArgs'];
    body.time = getTimeString(map['time']);
    return body;
  }
}

/// 异常日志
class ExceptionBody extends LogBody {
  late String exception;
  String? stack;
  int platform; // 0-flutter,1-native

  ExceptionBody(this.exception, {this.platform = 0, this.stack}) {
    type = LogType.exception;
    time = _nowTime;
  }

  @override
  bool get alert => true;

  @override
  String get brief => platform == 0 ? 'flutter:: $exception' : 'native';

  @override
  String get description => BodyUtil.formatMap(toMap());

  @override
  Map<String, dynamic> toMap() => {
        'type': type.name,
        'exception': exception,
        'stack': stack ?? '',
        'platform': platform == 0 ? 'flutter' : 'native',
        'time': time
      };

  factory ExceptionBody.fromMap(Map<String, dynamic> map) {
    ExceptionBody body = ExceptionBody(map['exception']);
    body.stack = map['stack'] ?? '';
    body.platform = BodyUtil.parseInt(map['platform'] == 'flutter' ? 0 : 1);
    body.time = getTimeString(map['time']);
    return body;
  }
}

/// 控制台日志
class ConsoleBody extends LogBody {
  late String content;
  String? tag;

  ConsoleBody(this.content) {
    type = LogType.console;
    time = _nowTime;
  }

  @override
  String get brief => '${tag ?? ''} :: $content';

  @override
  String get description => BodyUtil.formatMap(toMap());

  @override
  Map<String, dynamic> toMap() => {'type': type.name, 'content': content, 'tag': tag ?? '', 'time': time};

  factory ConsoleBody.fromMap(Map<String, dynamic> map) {
    ConsoleBody body = ConsoleBody(map['content']);
    body.tag = map['tag'];
    body.time = getTimeString(map['time']);
    return body;
  }
}

/// 网络信息日志
class NetworkInfoBody extends LogBody {
  late Map<String, dynamic> info;

  NetworkInfoBody(this.info) {
    type = LogType.netConnectInfo;
    time = _nowTime;
  }

  @override
  String get brief => '$info';

  @override
  String get description => BodyUtil.formatMap(toMap());

  @override
  Map<String, dynamic> toMap() => {'type': type.name, 'netInfo': info, 'time': time};

  factory NetworkInfoBody.fromMap(Map<String, dynamic> map) {
    NetworkInfoBody body = NetworkInfoBody(map['netInfo']);
    body.time = getTimeString(map['time']);
    return body;
  }
}

/// 用户切换
class UserBody extends LogBody {
  String uid;
  bool isLogin = false;

  UserBody(this.uid) {
    type = LogType.user;
    isLogin = uid.isNotEmpty;
    time = _nowTime;
  }

  @override
  bool get alert => true;

  @override
  String get brief => isLogin ? '登录：$uid' : '登出';

  @override
  String get description => BodyUtil.formatMap(toMap());

  @override
  Map<String, dynamic> toMap() => {'type': type.name, 'event': isLogin ? 'login' : 'logout', 'uid': uid, 'time': time};

  factory UserBody.fromMap(Map<String, dynamic> map) {
    UserBody body = UserBody(map['uid']);
    body.time = getTimeString(map['time']);
    return body;
  }
}

class NobilityBody extends LogBody {
  NobilityAction action;
  Map params;
  bool result;

  NobilityBody(this.action, this.params, this.result) {
    type = LogType.nobility;
    time = _nowTime;
  }

  @override
  String get brief => '${action.name} >> $result';

  @override
  String get description => BodyUtil.formatMap(toMap());

  @override
  Map<String, dynamic> toMap() =>
      {'type': type.name, 'action': action.name, 'params': jsonEncode(params), 'result': result, 'time': time};

  factory NobilityBody.fromMap(Map<String, dynamic> map) {
    Map params;
    try {
      params = jsonDecode(map['params']);
    } catch (e) {
      params = {'value': map['params'].toString()};
    }
    NobilityBody body = NobilityBody(
        NobilityAction.values.firstWhere(
          (e) => e.name == map['action'],
          orElse: () => NobilityAction.showIap,
        ),
        params,
        map['result']);
    body.time = getTimeString(map['time']);
    return body;
  }
}

class PayBody extends LogBody {
  PayAction action;
  Map params;
  bool result;
  String reason; // 成功/失败原因

  PayBody(this.action, this.params, this.result, {this.reason = 'none'}) {
    type = LogType.pay;
    time = _nowTime;
  }

  @override
  bool get alert => !result;

  @override
  String get brief => '${action.name} >> $result ${reason.isNotEmpty ? '>> $reason' : ''}';

  @override
  String get description => BodyUtil.formatMap(toMap());

  @override
  Map<String, dynamic> toMap() => {
        'type': type.name,
        'action': action.name,
        'params': params.toString(),
        'result': result,
        'reason': reason,
        'time': time,
      };

  factory PayBody.fromMap(Map<String, dynamic> map) {
    Map params;
    try {
      params = jsonDecode(map['params']);
    } catch (e) {
      params = {'value': map['params'].toString()};
    }
    PayBody body = PayBody(
        PayAction.values.firstWhere(
          (e) => e.name == map['action'],
          orElse: () => PayAction.payed,
        ),
        params,
        map['result'],
        reason: map['reason']);
    body.time = getTimeString(map['time']);
    return body;
  }
}

class GiftBody extends LogBody {
  GiftAction action;
  String giftConfig;
  bool result;
  String reason; // 失败原因

  GiftBody(this.action, this.giftConfig, this.result, this.reason) {
    type = LogType.gift;
    time = _nowTime;
  }

  @override
  bool get alert => !result;

  @override
  String get brief => '${action.name} >> $result ${reason.isNotEmpty ? '>> $reason' : ''}';

  @override
  String get description => BodyUtil.formatMap(toMap());

  @override
  Map<String, dynamic> toMap() => {
        'type': type.name,
        'action': action.name,
        'giftConfig': giftConfig,
        'result': result,
        'reason': reason,
        'time': time
      };

  factory GiftBody.fromMap(Map<String, dynamic> map) {
    GiftBody body = GiftBody(
        GiftAction.values.firstWhere(
          (e) => e.name == map['action'],
          orElse: () => GiftAction.play,
        ),
        map['giftConfig'],
        map['result'],
        map['reason']);
    body.time = getTimeString(map['time']);
    return body;
  }
}

// 图片上传、下载失败记录
class ImageFailBody extends LogBody {
  ImageAction action;
  String imgPath;
  String info;

  ImageFailBody(this.action, this.imgPath, this.info) {
    type = LogType.imageFail;
    time = _nowTime;
  }

  @override
  bool get alert => true;

  @override
  String get brief => '${action.name}, $imgPath, $info';

  @override
  String get description => BodyUtil.formatMap(toMap());

  @override
  Map<String, dynamic> toMap() =>
      {'type': type.name, 'action': action.name, 'imgPath': imgPath, 'info': info, 'time': time};

  factory ImageFailBody.fromMap(Map<String, dynamic> map) {
    ImageFailBody body = ImageFailBody(
      ImageAction.values.firstWhere(
        (e) => e.name == map['action'],
        orElse: () => ImageAction.download,
      ),
      map['imgPath'],
      map['info'],
    );
    body.time = getTimeString(map['time']);
    return body;
  }
}

class RtcExceptionBody extends LogBody {
  String reason;
  String from;

  RtcExceptionBody(this.reason, this.from) {
    type = LogType.rtc;
    time = _nowTime;
  }

  @override
  bool get alert => true;

  @override
  String get brief => '$reason, $from';

  @override
  String get description => BodyUtil.formatMap(toMap());

  @override
  Map<String, dynamic> toMap() => {'type': type.name, 'reason': reason, 'from': from, 'time': time};

  factory RtcExceptionBody.fromMap(Map<String, dynamic> map) {
    RtcExceptionBody body = RtcExceptionBody(
      map['reason'],
      map['from'],
    );
    body.time = getTimeString(map['time']);
    return body;
  }
}

class BodyUtil {
  static int parseInt(dynamic value, [int defaultValue = 0]) {
    if (value == null) return defaultValue;
    if (value is String) {
      try {
        return int.parse(value);
      } catch (e) {
        return defaultValue;
      }
    }
    if (value is int) return value;
    if (value is double) return value.toInt();
    return defaultValue;
  }

  static bool parseBool(dynamic value, [bool defValue = false]) {
    if (value == null) return defValue;

    if (value is bool) return value;
    if (value is int) return value > 0;
    if (value is String) {
      try {
        return value.toLowerCase() == 'true' || BodyUtil.parseInt(value) > 0;
      } catch (e) {
        return defValue;
      }
    }

    return defValue;
  }

  static String formatMap(Map? source, {int deep = 0, String? ignoreKey}) {
    if (source == null) return '';

    // ignore: unnecessary_type_check
    if (source is! Map) return source.toString();

    List<String> result = [];

    try {
      for (var key in source.keys) {
        if (ignoreKey != null && key == ignoreKey) continue;

        dynamic value = source[key];
        bool valueIsMap = true;
        if (value is Map) {
          value = formatMap(value, deep: deep + 1);
        } else {
          try {
            Map mapValue = jsonDecode(value);
            value = formatMap(mapValue, deep: deep + 1);
          } catch (e) {
            valueIsMap = false;
          }
        }
        String indent = List.generate(deep, (index) => '  ').join();
        result.add('$indent$key: ${valueIsMap ? '\n$indent' : ''}$value${valueIsMap ? '' : '\n'}');
      }
    } on Exception catch (e) {
      logPrint(e.toString());
    }
    return result.join('');
  }
}

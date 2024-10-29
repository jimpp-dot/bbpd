import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:loading_more_list/loading_more_list.dart';

part 'new_user_ranking_bean.g.dart';

/// 新用户排行榜
class NewUserRanking {
  final int uid;
  final String name;
  final int sex;
  final String icon;
  final int rid;
  final int age;
  final int vip;
  final int isOnline;
  final RoomType? roomType;
  final String content;
  final String phoneModel; // 手机型号名称
  final RookieTag? rookieTag;
  final bool isNewNoble; //新贵

  NewUserRanking(
      {this.uid = 0,
      this.name = '',
      this.sex = 0,
      this.icon = '',
      this.rid = 0,
      this.age = 0,
      this.vip = 0,
      this.isOnline = 0,
      this.roomType,
      this.content = '',
      this.phoneModel = '',
      this.rookieTag,
      this.isNewNoble = false});

  factory NewUserRanking.fromJson(Map<String, dynamic> json) {
    return NewUserRanking(
      uid: Util.parseInt(json['uid']),
      name: Util.notNullStr(json["name"]),
      sex: Util.parseInt(json["sex"]),
      icon: Util.notNullStr(json["icon"]),
      rid: Util.parseInt(json["rid"]),
      age: Util.parseInt(json["age"]),
      vip: Util.parseInt(json["vip"]),
      isOnline: Util.parseInt(json["is_online"]),
      roomType:
          (json["room_type"] is Map && (json["room_type"] as Map).isNotEmpty)
              ? RoomType.fromJson(json["room_type"])
              : null,
      content: Util.notNullStr(json["content"]),
      phoneModel: Util.notNullStr(json['phone_model']),
      rookieTag:
          (json["rookie_tag"] is Map && (json["rookie_tag"] as Map).isNotEmpty)
              ? RookieTag.fromJson(json["rookie_tag"])
              : null,
      isNewNoble: Util.parseBool(json['new_noble']),
    );
  }

  Sex get userSex {
    if (sex == 1) {
      return Sex.Male;
    } else {
      return Sex.Female;
    }
  }
}

class RoomType {
  final String label;
  final String val;
  final String color;
  final String show;
  List<Color> colors = [];

  RoomType.fromJson(Map data)
      : label = Util.notNullStr(data['label']),
        val = Util.notNullStr(data['val']),
        color = Util.notNullStr(data['color']),
        show = Util.notNullStr(data['show']) {
    var bg = data['bg'];
    if (bg is List) {
      for (var element in bg) {
        String colorStr = '0xff${(element as String).substring(1)}';
        Color color = Color(int.parse(colorStr));
        colors.add(color);
      }
    }
  }
}

class RookieTag {
  final int sevenNew;
  final int payLevel;

  RookieTag.fromJson(Map data)
      : sevenNew = Util.parseInt(data['seven_new']),
        payLevel = Util.parseInt(data['pay_level']);
}

class NewUserRankingListRsp extends BaseResponse {
  final List<NewUserRanking> list;
  final int more;
  final bool showTransfer;

  NewUserRankingListRsp(
      {super.success,
      super.msg,
      required this.list,
      this.more = 0,
      this.showTransfer = false});

  factory NewUserRankingListRsp.fromJson(Map<String, dynamic> json) {
    bool success = false;
    String? msg;
    List<NewUserRanking> resultList = [];
    int more = 0;
    bool showTransfer = false;
    try {
      success = Util.parseBool(json['success']);
      msg = Util.parseStr(json['msg']);
      showTransfer = Util.parseBool(json['show_transfer']);
      if (success) {
        Map data = json['data'];
        more = Util.parseInt(data['more']);
        resultList =
            Util.parseList(data['output'], (e) => NewUserRanking.fromJson(e));
      }
    } catch (e) {
      Log.d(e);
    }
    NewUserRankingListRsp rsp = NewUserRankingListRsp(
        success: success,
        msg: msg,
        list: resultList,
        more: more,
        showTransfer: showTransfer);
    return rsp;
  }
}

typedef ShowTransferCallback = void Function(bool show);

class NewUserRankingRepository extends LoadingMoreBase<NewUserRanking> {
  static const String defaultPath = 'mate/rank/new';
  final BuildContext context;

  int page = 1;
  bool _hasMore = true;
  bool forceRefresh = false;

  /// 网络接口请求路径
  final String _path;

  NewUserRankingRepository(this.context, {String? path})
      : _path = path ?? defaultPath;

  @override
  bool get hasMore => (_hasMore && length < 300) || forceRefresh;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) async {
    _hasMore = true;
    page = 1;
    forceRefresh = !notifyStateChanged;
    var result = await super.refresh(notifyStateChanged);
    forceRefresh = false;

    return result;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;
    try {
      NewUserRankingListRsp result = await loadFromNetwork(page, path: _path);
      if (page == 1) {
        clear();
      }

      for (var element in result.list) {
        add(element);
      }
      _hasMore = result.more > 0;
      page++;
      isSuccess = true;
    } catch (exception, stack) {
      isSuccess = false;
      Log.d(exception);
      Log.d(stack);
    }
    return isSuccess;
  }

  static Future<NewUserRankingListRsp> loadFromNetwork(int page,
      {String path = defaultPath}) async {
    Map<String, String> body = {};
    body['page'] = page.toString();
    body['type'] = 'new';
    if (path == defaultPath) {
      path = '$defaultPath?version=1';
    }
    XhrResponse response =
        await Xhr.postJson('${System.domain}$path', body, throwOnError: true);
    return NewUserRankingListRsp.fromJson(
        response.value() as Map<String, dynamic>);
  }
}

class NewUserChatCount extends ChangeNotifier {
  final _preKey = '_new_user_ranking_chat_count';

  /// 该入口每个陪陪每天只能私聊20个用户
  final _defaultCount = 20;

  final Set<int> ids = {};

  NewUserChatCount() {
    _init();
  }

  /// 初始化当天剩余私聊次数
  _init() {
    String? cache = Config.get('${Session.uid}$_preKey');
    if (cache.trim().isNotEmpty) {
      try {
        Map value = jsonDecode(cache);
        String dayTime = Util.notNullStr(value['dayTime']);
        if (_getCurrentDay() == dayTime) {
          Set list = (value['uid'] as List).toSet();
          for (var element in list) {
            if (element != null && element is int) {
              ids.add(element);
            }
          }
        }
      } catch (e) {
        Log.d(e);
      }
    }
    return ids.length;
  }

  int getRemainCount() {
    return _defaultCount - ids.length;
  }

  addUid(int uid) {
    ids.add(uid);
    save();

    notifyListeners();
  }

  save() async {
    if (ids.isEmpty) return;
    try {
      Map<String, dynamic> map = {};
      map['dayTime'] = _getCurrentDay();
      map['uid'] = ids.toList();
      Config.set('${Session.uid}$_preKey', jsonEncode(map));
    } catch (e) {
      Log.d(e);
    }
  }

  String _getCurrentDay() {
    DateTime now = DateTime.now();
    return '${now.year}${now.month}${now.day}';
  }
}

@JsonSerializable(createToJson: false)
class ReminderListRsp extends BaseResponse
    with PageListResponse<NewUserRanking> {
  bool more;

  @JsonKey(name: 'output')
  List<NewUserRanking> data;

  ReminderListRsp(
      {super.success, super.msg, this.data = const [], this.more = false});

  factory ReminderListRsp.fromJson(Map<String, dynamic> json) =>
      _$ReminderListRspFromJson(json);

  @override
  List<NewUserRanking> get items => data;

  @override
  bool get hasMore => more;
}

class ReminderRepository {
  static Future<ReminderListRsp> getReminderList(int page) async {
    try {
      Map<String, String> body = {};
      body['page'] = '$page';
      body['type'] = 'clock';
      XhrResponse response = await Xhr.postJson(
          '${System.domain}mate/rank/new?&version=1', body,
          throwOnError: true);
      if (response.error != null) {
        Log.d(response.error.toString());
        return ReminderListRsp(msg: response.error.toString(), success: false);
      }

      Map res = response.response as Map;
      if (!Util.parseBool(res['success']) || res['data'] == null) {
        return ReminderListRsp(msg: Util.parseStr(res['msg']), success: false);
      }
      try {
        ReminderListRsp responseData = ReminderListRsp.fromJson(res['data']);
        responseData.success = true;

        return responseData;
      } catch (e) {
        return ReminderListRsp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return ReminderListRsp(msg: e.toString(), success: false);
    }
  }
}

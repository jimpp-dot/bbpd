import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../k.dart';
part 'match_bean.g.dart';

@JsonSerializable()
class MatchSimpleInfoResponse extends BaseResponse {
  @JsonKey(name: 'like_num')
  final int? likeNum;
  @JsonKey(name: 'match_num')
  final String? residueNum;
  final int? count;

  MatchSimpleInfoResponse({
    bool success = false,
    String msg = '',
    this.likeNum,
    this.residueNum,
    this.count,
  }) : super(msg: msg, success: success);

  factory MatchSimpleInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$MatchSimpleInfoResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MatchSimpleInfoResponseToJson(this);
}

@JsonSerializable()
class MatchMessageInfoResponse extends BaseResponse {
  final int count;
  final int time;
  final String message;

  MatchMessageInfoResponse({
    bool success = false,
    String msg = '',
    this.count = 0,
    this.time = 0,
    this.message = '',
  }) : super(msg: msg, success: success);

  factory MatchMessageInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$MatchMessageInfoResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MatchMessageInfoResponseToJson(this);
}

@JsonSerializable()
class RecommendUserListResponse extends BaseResponse {
  @JsonKey(name: 'data')
  final List<RecommendUserItem>? items;
  @JsonKey(name: 'like_num')
  final int? likeNum;
  @JsonKey(name: 'match_num')
  final String? residueNum;

  RecommendUserListResponse({
    bool success = false,
    String msg = '',
    this.items,
    this.likeNum,
    this.residueNum,
  }) : super(msg: msg, success: success);

  factory RecommendUserListResponse.fromJson(Map<String, dynamic> json) =>
      _$RecommendUserListResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RecommendUserListResponseToJson(this);
}

@JsonSerializable()
class RecommendUserItem {
  String? name;
  String? uid;
  String? icon;
  String city;
  int distance;
  int? rid;
  @JsonKey(name: 'online_status')
  String? onlineStatus;
  @JsonKey(name: 'online_diff')
  String? lastOnlineTime;
  @JsonKey(defaultValue: false)
  bool? noData;
  @JsonKey(
    name: 'room_icon',
  )
  String? roomIcon;
  @JsonKey(name: 'room_tag')
  String? roomTag;
  @JsonKey(name: 'is_game', fromJson: Util.parseInt)
  int? isGame;

  RecommendUserItem({
    this.name,
    this.uid,
    this.rid,
    this.icon,
    this.city = '',
    this.distance = 0,
    this.onlineStatus,
    this.lastOnlineTime,
    this.noData,
    this.roomTag,
    this.isGame,
    this.roomIcon,
  });

  bool get distanceIsInvalid {
    return (distance <= 0);
  }

  bool get cityIsInvalid {
    return (city.trim().isEmpty);
  }

  bool get isPlaying {
    return (roomTag?.isNotEmpty ?? false);
  }

  String get roomTagStr {
    return 'dddddd';
  }

  String get distanceStr {
    if (distanceIsInvalid && cityIsInvalid) {
      return '';
    } else if (!distanceIsInvalid && !cityIsInvalid) {
      if (distance < 200000 && distance > 0) {
        return '${double.parse((distance / 1000).toStringAsFixed(1))}km';
      } else {
        return city;
      }
    } else {
      return distanceIsInvalid
          ? city
          : '${double.parse((distance / 1000).toStringAsFixed(1))}km';
    }
  }

  bool get isOnline {
    return (onlineStatus ?? '') == '0';
  }

  factory RecommendUserItem.fromJson(Map<String, dynamic> json) =>
      _$RecommendUserItemFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendUserItemToJson(this);
}

@JsonSerializable()
class MatchUserListResponse extends BaseResponse
    with PageListResponse<MatchUserItem> {
  @override
  @JsonKey(name: 'data')
  final List<MatchUserItem>? items;

  MatchUserListResponse({
    bool? success,
    String? msg,
    this.items,
  }) : super(msg: msg, success: success ?? false);

  factory MatchUserListResponse.fromJson(Map<String, dynamic> json) =>
      _$MatchUserListResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MatchUserListResponseToJson(this);
}

@JsonSerializable()
class MatchUserItem {
  String? id;
  String? name;
  String? icon;
  String? uid;
  @JsonKey(name: 'match_uid')
  String? matchId;
  @JsonKey(name: 'is_accept')
  String? isAccept;
  @JsonKey(name: 'match_message')
  String? matchMessage;
  String? deleted;
  @JsonKey(name: 'create_time')
  String? createTime;
  @JsonKey(name: 'update_time')
  String? updateTime;
  String? sex;
  String? age;
  @JsonKey(name: 'online_text')
  String? desText;

  MatchUserItem({
    this.id,
    this.name,
    this.icon,
    this.uid,
    this.matchId,
    this.isAccept,
    this.matchMessage,
    this.deleted,
    this.createTime,
    this.updateTime,
    this.sex,
    this.age,
    this.desText,
  });

  String get buttonTitle {
    if (isAccept == '0') {
      return K.personal_match_accept;
    } else if (isAccept == '1') {
      return K.personal_match_already_match;
    } else {
      return '';
    }
  }

  bool get isAccepted {
    return isAccept == '1';
  }

  factory MatchUserItem.fromJson(Map<String, dynamic> json) =>
      _$MatchUserItemFromJson(json);

  Map<String, dynamic> toJson() => _$MatchUserItemToJson(this);
}

class MatchRepository {
  /// 获取随机匹配用户
  static Future<RecommendUserListResponse> getRecommendMatchUsers(
      {int sex = 0}) async {
    String url = '${System.domain}games/usermatch/recommendUserList';
    try {
      XhrResponse response = await Xhr.getJson(url,
          params: {
            'longitude': Config.get('location.longitude', ''),
            'latitude': Config.get('location.latitude', ''),
            'sex': '$sex'
          },
          throwOnError: true);

      if (response.error != null) {
        Log.d(response.error.toString());
        return RecommendUserListResponse(
            msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (res['success'] != true) {
        return RecommendUserListResponse(msg: res['msg'], success: false);
      }
      try {
        Map data = res['data'] ?? <String, dynamic>{};
        data['success'] = true;
        RecommendUserListResponse responseData =
            RecommendUserListResponse.fromJson(data as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        return RecommendUserListResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return RecommendUserListResponse(msg: e.toString(), success: false);
    }
  }

  /// 快速匹配用户
  static Future<BaseResponse> fastMatchUser(List<String> uids,
      {bool isFastMatch = false}) async {
    if (uids.isEmpty) return BaseResponse(msg: '', success: false);
    String uidString = uids.join(',');
    String url = '${System.domain}games/usermatch/userMatch';
    try {
      Map<String, String> params = {
        'uids': uidString,
        'is_match_num': isFastMatch ? '1' : '0'
      };
      XhrResponse response = await Xhr.postJson(url, params);
      return BaseResponseReturn(response);
    } catch (e) {
      Log.d(e);
      return BaseResponse(msg: e.toString(), success: false);
    }
  }

  /// 接受匹配
  static Future<BaseResponse> acceptMatch(String id, String status) async {
    String url = '${System.domain}games/usermatch/acceptUser';
    try {
      Map<String, String> params = {'id': id, 'status': status};
      XhrResponse response = await Xhr.postJson(url, params);
      return BaseResponseReturn(response);
    } catch (e) {
      Log.d(e);
      return BaseResponse(msg: e.toString(), success: false);
    }
  }

  /// 清空匹配列表
  static Future<BaseResponse> clearMatchList() async {
    String url = '${System.domain}games/usermatch/delUserMatchList';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      return BaseResponseReturn(response);
    } catch (e) {
      Log.d(e);
      return BaseResponse(msg: e.toString(), success: false);
    }
  }

  /// 获取个人匹配列表
  static Future<MatchUserListResponse> getMatchUsers(int page) async {
    if (page == 2) return MatchUserListResponse(items: [], success: true);
    String url = '${System.domain}games/usermatch/getUserMatchList';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);

      if (response.error != null) {
        Log.d(response.error.toString());
        return MatchUserListResponse(
            msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (res['success'] != true) {
        return MatchUserListResponse(msg: res['msg'], success: false);
      }
      try {
        Map data = res;
        data['success'] = true;
        MatchUserListResponse responseData =
            MatchUserListResponse.fromJson(data as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        return MatchUserListResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return MatchUserListResponse(msg: e.toString(), success: false);
    }
  }

  /// 获取匹配简版信息
  static Future<MatchSimpleInfoResponse> getMatchSimpleInfo() async {
    String url = '${System.domain}games/usermatch/getUserLikeMatchNum';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);

      if (response.error != null) {
        Log.d(response.error.toString());
        return MatchSimpleInfoResponse(
            msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (res['success'] != true) {
        return MatchSimpleInfoResponse(msg: res['msg'], success: false);
      }
      try {
        Map data = res['data'] ?? <String, dynamic>{};
        data['success'] = true;
        MatchSimpleInfoResponse responseData =
            MatchSimpleInfoResponse.fromJson(data as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        return MatchSimpleInfoResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return MatchSimpleInfoResponse(msg: e.toString(), success: false);
    }
  }

  ///获取匹配请求
  static Future<MatchMessageInfoResponse> getMatchMessageInfo() async {
    String url = '${System.domain}games/usermatch/getMatchMessage';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);

      if (response.error != null) {
        Log.d(response.error.toString());
        return MatchMessageInfoResponse(
            msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (res['success'] != true) {
        return MatchMessageInfoResponse(msg: res['msg'], success: false);
      }
      try {
        Map data = res['data'] ?? <String, dynamic>{};
        data['success'] = true;
        MatchMessageInfoResponse responseData =
            MatchMessageInfoResponse.fromJson(data as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        return MatchMessageInfoResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return MatchMessageInfoResponse(msg: e.toString(), success: false);
    }
  }
}

BaseResponse BaseResponseReturn(
  XhrResponse response,
) {
  if (response.error != null) {
    Log.d(response.error.toString());
    return BaseResponse(msg: response.error.toString(), success: false);
  }
  Map res = response.value();
  if (!(res['success'] ?? false)) {
    return BaseResponse(msg: res['msg'], success: false);
  }
  try {
    return BaseResponse.fromJson(res as Map<String, dynamic>);
  } catch (e) {
    Log.d(e);
    return BaseResponse(
        msg: R.array('xhr_error_type_array')[6], success: false);
  }
}

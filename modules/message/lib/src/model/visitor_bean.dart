import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:message/k.dart';

part 'visitor_bean.g.dart';

@JsonSerializable(
    explicitToJson: true, includeIfNull: false, createToJson: false)
class VisitorData extends BaseResponse {
  final VisitorListBean? data;

  final int sum;

  final int num;

  final String sex;

  VisitorData(
      {required this.data,
      required this.sum,
      required this.num,
      required this.sex});

  factory VisitorData.fromJson(Map<String, dynamic> json) =>
      _$VisitorDataFromJson(json);
}

@JsonSerializable(
    explicitToJson: true, includeIfNull: false, createToJson: false)
class VisitorListBean {
  final int next; // 是否还有下页数据。[0表示没有，1表示有]
  final int page; // 当前页数
  @JsonKey(name: "have_forbidden")
  final bool haveForbidden;
  final List<UserBean> users;
  @JsonKey(name: "profile_integrity")
  final bool showProfileTips;

  VisitorListBean(
      {required this.next,
      required this.page,
      required this.haveForbidden,
      required this.users,
      required this.showProfileTips});

  factory VisitorListBean.fromJson(Map<String, dynamic> json) =>
      _$VisitorListBeanFromJson(json);
}

@JsonSerializable(
    explicitToJson: true, includeIfNull: false, createToJson: false)
class UserBean {
  final int uid;
  final String? name;
  final String? sex; // 'male', 'female'
  final int age;
  final int titleNew;
  final String? icon;
  final String? src; // 描述，访问了哪些页面
  final int time; // 访问时间
  @JsonKey(defaultValue: 1)
  final int vnum; // 第几次访问
  @JsonKey(defaultValue: 0)
  final int isnew; // 是否是新访客
  @JsonKey(defaultValue: 0)
  final int online; // 在线状态
  @JsonKey(defaultValue: 0)
  final int mic;
  final int rid;
  @JsonKey(defaultValue: 1)
  int visible; // 是否隐身  0：隐身 1：可见
  @JsonKey(name: 'little_alarm')
  final String? alarmLabel;

  /// 小闹钟标签

  UserBean({
    required this.uid,
    required this.name,
    required this.sex,
    required this.age,
    required this.titleNew,
    required this.icon,
    required this.src,
    required this.time,
    required this.vnum,
    required this.isnew,
    required this.online,
    required this.mic,
    required this.rid,
    required this.visible,
    required this.alarmLabel,
  }); // 所在房间id

  /// 能否展示小闹钟标签
  bool get isCanShowAlarmLabel =>
      (alarmLabel?.isNotEmpty == true) && Session.isAlarmWhiteGod;

  factory UserBean.fromJson(Map<String, dynamic> json) =>
      _$UserBeanFromJson(json);
}

@JsonSerializable(createToJson: false)
class RoomFootprintItem {
  @JsonKey(name: 'user_name')
  String? name;

  @JsonKey(name: 'user_icon')
  String? icon;

  int uid;
  int sex;
  int titleNew;
  int rid;

  @JsonKey(name: 'room_name')
  String? roomName;

  @JsonKey(name: 'room_state')
  int roomState; //0 已结束 1 未结束

  @JsonKey(name: 'visit_time')
  int visitTime;

  String? dateStr;

  RoomFootprintItem(this.name, this.icon, this.uid, this.sex, this.titleNew,
      this.rid, this.roomName, this.roomState, this.visitTime);

  factory RoomFootprintItem.fromJson(Map<String, dynamic> json) =>
      _$RoomFootprintItemFromJson(json);
}

@JsonSerializable(createToJson: false)
class RoomFootprintRsp extends BaseResponse {
  Map<String, Map<String, List<RoomFootprintItem>>?>? data;

  RoomFootprintRsp({super.success, super.msg, this.data});

  factory RoomFootprintRsp.fromJson(Map<String, dynamic> json) =>
      _$RoomFootprintRspFromJson(json);
}

class RoomFootprintSource extends LoadingMoreBase<RoomFootprintItem> {
  final VoidCallback? updateClearBtnCallBack;

  RoomFootprintSource(this.updateClearBtnCallBack);

  int page = 1;
  bool _hasMore = true;
  bool forceRefresh = false;

  @override
  bool get hasMore => _hasMore || forceRefresh;

  @override
  Future<bool> refresh([bool clearBeforeRequest = false]) async {
    _hasMore = true;
    page = 1;
    forceRefresh = !clearBeforeRequest;
    var result = await super.refresh(clearBeforeRequest);
    forceRefresh = false;

    return result;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;

    try {
      String url = '${System.domain}guest/roomFootmark?page=$page';
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      RoomFootprintRsp result =
          RoomFootprintRsp.fromJson(response.value() as Map<String, dynamic>);

      if (page == 1) {
        clear();
      }

      int count = 0;
      result.data?.forEach((key1, value1) {
        if (key1 == 'list') {
          value1?.forEach((key2, value2) {
            for (var element in value2) {
              if (value2.indexOf(element) == 0) {
                element.dateStr = _getDateStr(key2);
              }
              add(element);
              count++;
            }
          });
        }
      });

      _hasMore = (count == 200 ? true : false);
      page++;
      isSuccess = true;

      if (updateClearBtnCallBack != null) {
        updateClearBtnCallBack!();
      }
    } catch (exception, stack) {
      isSuccess = false;
      Log.d(exception);
      Log.d(stack);
    }

    return isSuccess;
  }

  String _getDateStr(String date) {
    DateTime now = DateTime.now();

    String dateStr = '${now.year}';
    if (now.month < 10) {
      dateStr += '0${now.month}';
    } else {
      dateStr += '${now.month}';
    }

    if (now.day < 10) {
      dateStr += '0${now.day}';
    } else {
      dateStr += '${now.day}';
    }

    if (date == dateStr) {
      return K.msg_room_footprint_today;
    }

    return date;
  }
}

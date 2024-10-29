// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitorData _$VisitorDataFromJson(Map<String, dynamic> json) {
  return VisitorData(
    data: json['data'] == null
        ? null
        : VisitorListBean.fromJson(json['data'] as Map<String, dynamic>),
    sum: Util.parseInt(json['sum']),
    num: Util.parseInt(json['num']),
    sex: Util.parseStr(json['sex']) ?? '',
  )
    ..success = Util.parseBool(json['success'])
    ..msg = Util.parseStr(json['msg']);
}

VisitorListBean _$VisitorListBeanFromJson(Map<String, dynamic> json) {
  return VisitorListBean(
      next: Util.parseInt(json['next']),
      page: Util.parseInt(json['page']),
      haveForbidden: Util.parseBool(json['have_forbidden']),
      users: Util.parseList(
          json['users'], (e) => UserBean.fromJson(e as Map<String, dynamic>)),
      showProfileTips: Util.parseBool(json['profile_integrity']));
}

UserBean _$UserBeanFromJson(Map<String, dynamic> json) {
  return UserBean(
    uid: Util.parseInt(json['uid']),
    name: Util.parseStr(json['name']),
    sex: Util.parseStr(json['sex']),
    age: Util.parseInt(json['age']),
    titleNew: Util.parseInt(json['titleNew']),
    icon: Util.parseStr(json['icon']),
    src: Util.parseStr(json['src']),
    time: Util.parseInt(json['time']),
    vnum: Util.parseInt(json['vnum']) ?? 1,
    isnew: Util.parseInt(json['isnew']) ?? 0,
    online: Util.parseInt(json['online']) ?? 0,
    mic: Util.parseInt(json['mic']) ?? 0,
    rid: Util.parseInt(json['rid']),
    visible: Util.parseInt(json['visible']) ?? 1,
    alarmLabel: Util.parseStr(json['little_alarm']),
  );
}

RoomFootprintItem _$RoomFootprintItemFromJson(Map<String, dynamic> json) {
  return RoomFootprintItem(
    Util.parseStr(json['user_name']),
    Util.parseStr(json['user_icon']),
    Util.parseInt(json['uid']),
    Util.parseInt(json['sex']),
    Util.parseInt(json['titleNew']),
    Util.parseInt(json['rid']),
    Util.parseStr(json['room_name']),
    Util.parseInt(json['room_state']),
    Util.parseInt(json['visit_time']),
  )..dateStr = Util.parseStr(json['dateStr']);
}

RoomFootprintRsp _$RoomFootprintRspFromJson(Map<String, dynamic> json) {
  return RoomFootprintRsp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: (json['data'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(
          k,
          (e as Map<String, dynamic>).map(
            (k, e) => MapEntry(
                k,
                Util.parseList(
                    e,
                    (e) =>
                        RoomFootprintItem.fromJson(e as Map<String, dynamic>))),
          )),
    ),
  );
}

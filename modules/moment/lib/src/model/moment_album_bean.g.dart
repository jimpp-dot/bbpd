// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moment_album_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumData _$AlbumDataFromJson(Map<String, dynamic> json) {
  return AlbumData(
    json['info'] == null
        ? null
        : AlbumUserInfo.fromJson(json['info'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AlbumDataToJson(AlbumData instance) => <String, dynamic>{
      'info': instance.info,
    };

AlbumUserInfo _$AlbumUserInfoFromJson(Map<String, dynamic> json) {
  return AlbumUserInfo(
    Util.parseStr(json['icon']),
    Util.parseStr(json['name']),
    Util.parseInt(json['is_online']) ?? 0,
    Util.parseInt(json['sex']),
    Util.parseInt(json['uid']),
    Util.parseInt(json['age']),
    Util.parseInt(json['tpnum']),
    Util.parseInt(json['in_room']),
    Util.parseInt(json['isfollow']),
  );
}

Map<String, dynamic> _$AlbumUserInfoToJson(AlbumUserInfo instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'name': instance.name,
      'is_online': instance.isOnline,
      'sex': instance.sex,
      'uid': instance.uid,
      'age': instance.age,
      'tpnum': instance.tpnum,
      'in_room': instance.in_room,
      'isfollow': instance.isfollow,
    };

AlbumPageResp _$AlbumPageRespFromJson(Map<String, dynamic> json) {
  return AlbumPageResp(
    success: Util.parseBool(json['success']),
    msg: Util.parseStr(json['msg']),
    data: json['data'] == null
        ? null
        : AlbumPage.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AlbumPageRespToJson(AlbumPageResp instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
      'data': instance.data,
    };

AlbumPage _$AlbumPageFromJson(Map<String, dynamic> json) {
  return AlbumPage(
    Util.parseInt(json['tpid']),
    Util.parseList(json['output'],
        (e) => MomentAlbumBean.fromJson(e as Map<String, dynamic>)),
    Util.parseInt(json['total']),
  );
}

Map<String, dynamic> _$AlbumPageToJson(AlbumPage instance) => <String, dynamic>{
      'tpid': instance.tpid,
      'total': instance.total,
      'output': instance.output,
    };

MomentAlbumBean _$MomentAlbumBeanFromJson(Map<String, dynamic> json) {
  return MomentAlbumBean(
    Util.parseInt(json['tpid']),
    Util.parseInt(json['total']),
    Util.parseInt(json['pos']),
    Util.parseStr(json['url']) ?? '',
  );
}

Map<String, dynamic> _$MomentAlbumBeanToJson(MomentAlbumBean instance) =>
    <String, dynamic>{
      'tpid': instance.tpid,
      'total': instance.total,
      'pos': instance.pos,
      'url': instance.url,
    };

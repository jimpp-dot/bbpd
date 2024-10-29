// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url_msg_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HighLightInfo _$HighLightInfoFromJson(Map<String, dynamic> json) {
  return HighLightInfo(
    Util.parseStr(json['url']),
    Util.parseStr(json['key']),
    Util.parseStr(json['content']),
  );
}

UrlMsgExtra _$UrlMsgExtraFromJson(Map<String, dynamic> json) {
  return UrlMsgExtra(
    Util.parseStr(json['type']),
    Util.parseList(json['highlight_list'],
        (e) => HighLightInfo.fromJson(e as Map<String, dynamic>)),
  );
}

UrlMsgItem _$UrlMsgItemFromJson(Map<String, dynamic> json) {
  return UrlMsgItem(
    Util.parseStr(json['content']),
    json['extra'] == null
        ? null
        : UrlMsgExtra.fromJson(json['extra'] as Map<String, dynamic>),
  );
}

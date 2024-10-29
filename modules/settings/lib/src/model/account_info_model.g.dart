// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountInfo _$AccountInfoFromJson(Map<String, dynamic> json) {
  return AccountInfo(
    Util.parseStr(json['name']),
    Util.parseStr(json['icon']),
    Util.parseInt(json['uid']),
  )..select = Util.parseBool(json['select']);
}

AccountUserInfo _$AccountUserInfoFromJson(Map<String, dynamic> json) {
  return AccountUserInfo(
    (json['small_accounts'] as List)
        .map((e) =>
            e == null ? null : AccountInfo.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

AboutConfig _$AboutConfigFromJson(Map<String, dynamic> json) {
  return AboutConfig(
    Util.parseStr(json['wechat_text']) ?? '',
    Util.parseStr(json['douyin_text']) ?? '',
    Util.parseStr(json['offical_prefix_text']) ?? '',
    Util.parseStr(json['offical_url_redirect']) ?? '',
    Util.parseStr(json['offical_url_text']) ?? '',
    Util.parseStr(json['notice']) ?? '',
    Util.parseStr(json['tel']) ?? '',
  );
}

AboutInfo _$AboutInfoFromJson(Map<String, dynamic> json) {
  return AboutInfo(
    json['config'] == null
        ? null
        : AboutConfig.fromJson(json['config'] as Map<String, dynamic>),
    Util.parseStr(json['data']),
  );
}

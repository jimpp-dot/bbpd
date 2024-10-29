import 'package:json_annotation/json_annotation.dart';
import 'package:shared/shared.dart';

part 'account_info_model.g.dart';

@JsonSerializable(createToJson: false)
class AccountInfo {
  int uid;
  String? icon;
  String? name;
  bool select = false;
  AccountInfo(this.name, this.icon, this.uid);
  factory AccountInfo.fromJson(Map<String, dynamic> json) =>
      _$AccountInfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class AccountUserInfo {
  @JsonKey(name: 'small_accounts')
  List<AccountInfo?>? smallAccounts;
  AccountUserInfo(this.smallAccounts);
  factory AccountUserInfo.fromJson(Map<String, dynamic> json) =>
      _$AccountUserInfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class AboutConfig {
  @JsonKey(name: 'wechat_text')
  String wechatText;
  @JsonKey(name: 'douyin_text')
  String douyinText;
  @JsonKey(name: 'offical_prefix_text')
  String prefixText;
  @JsonKey(name: 'offical_url_text')
  String urlText;
  @JsonKey(name: 'offical_url_redirect')
  String url;

  String tel;
  String notice;

  AboutConfig(this.wechatText, this.douyinText, this.prefixText, this.url,
      this.urlText, this.notice, this.tel);
  factory AboutConfig.fromJson(Map<String, dynamic> json) =>
      _$AboutConfigFromJson(json);
}

@JsonSerializable(createToJson: false)
class AboutInfo {
  AboutConfig? config;
  String? data;
  AboutInfo(this.config, this.data);

  String fullUrl(int uid, String uuid) {
    String url = '${config?.url ?? ''}?fu=$data&uid=$uid&uuid=$uuid';
    Log.d('fullUrl:$url');
    return Uri.encodeFull(url);
  }

  factory AboutInfo.fromJson(Map<String, dynamic> json) =>
      _$AboutInfoFromJson(json);
}

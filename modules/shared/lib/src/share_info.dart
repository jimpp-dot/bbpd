import 'util.dart';

class ShareInfo {
  final int? type;
  final String? title;
  final String? url;
  final String? desc;
  final String? icon;
  final String? wxUsername;
  final String? wxPath;
  final String? wxIcon;
  final ContentInfo? info;
  String? localImgPath;

  ShareInfo.fromJson(Map data)
      : type = Util.parseInt(data['share']),
        title = data['share_title'] ?? '',
        desc = data['share_desc'] ?? '',
        url = data['share_url'] ?? '',
        icon = data['share_icon'] ?? '',
        wxIcon = data['wx_icon'] ?? '',
        wxUsername = data['wx_user_name'] ?? '',
        wxPath = data['wx_path'] ?? '',
        info = (data['share_info'] == null
            ? null
            : ContentInfo.fromJson(data['share_info']));

  ShareInfo({
    this.type,
    this.title,
    this.url,
    this.desc,
    this.icon,
    this.wxUsername,
    this.wxPath,
    this.wxIcon,
    this.info,
    this.localImgPath,
  });

  @override
  String toString() {
    return 'ShareInfo{type: $type, title: $title, url: $url, desc: $desc, icon: $icon}';
  }
}

class ContentInfo {
  int num = 0;
  int total = 0;

  ContentInfo.fromJson(Map data) {
    num = Util.parseInt(data['num'], 0);
    total = Util.parseInt(data['total'], 0);
  }
}

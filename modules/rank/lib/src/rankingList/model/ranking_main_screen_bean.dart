import 'package:shared/shared.dart';

/// 一级Tab
class FirstTab {
  String title;

  /// 1.anchor 主播榜
  /// 2.user 用户榜
  /// 3.activity 活动榜
  String type;
  List<SecondTab> list;

  FirstTab({
    this.title = '',
    this.type = '',
    this.list = const [],
  });

  factory FirstTab.fromJson(Map<String, dynamic> json) {
    return FirstTab(
      title: Util.parseStr(json["title"]) ?? '',
      type: Util.parseStr(json["type"]) ?? '',
      list: Util.parseList(json['sub_type'], (e) => SecondTab.fromJson(e)),
    );
  }
}

/// 二级Tab
class SecondTab {
  String type;
  String title;

  SecondTab({
    this.type = '',
    this.title = '',
  });

  factory SecondTab.fromJson(Map<String, dynamic> json) {
    return SecondTab(
      type: Util.parseStr(json["type"]) ?? '',
      title: Util.parseStr(json["title"]) ?? '',
    );
  }
}

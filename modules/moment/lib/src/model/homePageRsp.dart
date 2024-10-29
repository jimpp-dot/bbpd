import 'package:shared/shared.dart';

import 'homePageItemData.dart';

class HomePageRsp {
  final bool success;
  final HomePageData? data;

  HomePageRsp(this.success, {this.data});

  HomePageRsp.fromJson(Map<String, dynamic> json)
      : success = json['success'],
        data = HomePageData.fromJson(json['data']);
}

class HomePageData {
  final int more;
  final List<HomePageItemData> items;
  final bool smallMood;

  HomePageData.fromJson(Map<String, dynamic> json)
      : more = Util.parseInt(json['more']),
        smallMood = Util.parseBool(json['small_mood']),
        items =
            Util.parseList(json['output'], (e) => HomePageItemData.fromJson(e));
}

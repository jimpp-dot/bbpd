import 'package:shared/shared.dart';

class OrderInfo {
  String text = '';
  int num = 0;
  List<String> icons = [];
  String title = '';
  List<ListTabHeadItem> tabs = [];

  OrderInfo.fromJson(Map json) {
    text = Util.parseStr(json['text']) ?? '';
    title = Util.parseStr(json['title']) ?? '';
    num = Util.parseInt(json['num']);
    icons = Util.parseList(json['icon'], (e) => Util.parseStr(e) ?? '');
    if (json['manito'] is Map && json['manito']['games'] is List) {
      tabs = Util.parseList(
          json['manito']['games'], (e) => ListTabHeadItem.fromJson(e));
    }
  }
}

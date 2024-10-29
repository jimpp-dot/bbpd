import 'package:shared/shared.dart';

import 'circle_page_resp.dart';

class CircleActivityData {
  final List<CircleActivity> dataList;
  final int more;

  CircleActivityData(this.more, this.dataList);

  factory CircleActivityData.fromJson(Map<String, dynamic> json) =>
      CircleActivityData(
        Util.parseInt(json['more']),
        Util.parseList(json['output'], (e) => CircleActivity.fromJson(e)),
      );
}

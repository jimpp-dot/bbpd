import 'package:shared/shared.dart';

import 'circle_page_resp.dart';

class CircleFriendPlayingData {
  final List<CircleFriendsActivity> dataList;
  final int more;

  CircleFriendPlayingData(this.more, this.dataList);

  factory CircleFriendPlayingData.fromJson(Map<String, dynamic> json) =>
      CircleFriendPlayingData(
        Util.parseInt(json['more']),
        Util.parseList(
            json['output'], (e) => CircleFriendsActivity.fromJson(e)),
      );
}

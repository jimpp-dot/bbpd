import 'package:shared/shared.dart';

import 'vip_mall_bean.dart';

class GuildMallTabInfo {
  final int score;
  final List<VipMallTab> tab;

  GuildMallTabInfo(this.score, this.tab);

  factory GuildMallTabInfo.fromJson(Map<String, dynamic> json) =>
      GuildMallTabInfo(
        Util.parseInt(json['score']),
        Util.parseList(json['tab'], (e) => VipMallTab.fromJson(e)),
      );
}

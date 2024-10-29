import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:quiver/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bonus_model.g.dart';

@JsonSerializable()
class BonusRoomMap {
  int rid;

  @JsonKey(fromJson: Util.parseIcon)
  String icon;

  BonusRoomMap(this.rid, this.icon);

  factory BonusRoomMap.fromJson(Map<String, dynamic> json) =>
      _$BonusRoomMapFromJson(json);
}

class BonusMapModel extends ChangeNotifier {
  final LruMap<int, String> bonusRoomMap =
      LruMap<int, String>(maximumSize: 200); //首页列表房间红包信息
  List<int>? rids;

  BonusMapModel() {
    eventCenter.addListener(
        EventConstant.WebsocketEventMessage, _onSocketMessage);
  }

  @override
  void dispose() {
    eventCenter.removeListener(
        EventConstant.WebsocketEventMessage, _onSocketMessage);
    super.dispose();
  }

  dynamic _onSocketMessage(String msg, dynamic data) async {
    if (data is! Map<String, dynamic>) return;
    Map<String, dynamic> tmp = data;
    if (tmp.isEmpty) return;

    if (tmp['name'] == 'packet.icon') {
      List<BonusRoomMap> bonusMap = Util.parseList(
          tmp['data'],
          (e) => BonusRoomMap.fromJson((e as Map)
              .map((key, value) => MapEntry<String, dynamic>('$key', value))));
      for (BonusRoomMap item in bonusMap) {
        bonusRoomMap[item.rid] = item.icon;
      }
      notifyListeners();
    }
  }
}

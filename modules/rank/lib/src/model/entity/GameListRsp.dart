import 'package:shared/shared.dart';
import 'package:rank/src/model/entity/gameListItem.dart';

class GameListRsp {
  bool success;
  List<GameListItem> items = [];
  bool hasMore;
  bool power;

  GameListRsp.fromJson(Map json)
      : success = Util.parseBool(json['success']),
        hasMore = Util.parseInt(json['more']) > 0,
        power = Util.parseBool(json['power']),
        items = Util.parseList(json['data'], (e) => GameListItem.fromJson(e));
}

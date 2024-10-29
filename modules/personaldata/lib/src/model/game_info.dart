import 'package:shared/shared.dart';

class RecentPlayingGame {
  final String key;
  final String name;
  final String icon;
  final int total;
  final List<GamePlayInfo>? playInfos;

  static List<GamePlayInfo>? parsePlayInfos(Map json) {
    List infoData = json['playinfos'];
    return infoData.map((element) => GamePlayInfo.formJson(element)).toList();
  }

  RecentPlayingGame.fromJson(Map json)
      : key = json['key'],
        name = json['name'],
        icon = json['icon'],
        total = Util.parseInt(json['total']),
        playInfos = RecentPlayingGame.parsePlayInfos(json);
}

class GamePlayInfo {
  final String key;
  final String name;
  final String value;

  GamePlayInfo.formJson(Map json)
      : key = json['key'],
        name = json['name'],
        value = '${json['value']}';
}

import 'package:shared/shared.dart';
import 'package:premade/src/model/gamePremadeItem.dart';

class BatchMatchConfig {
  final int thresholdTime; // 阀值时间,单位秒
  final int overTime; //超时时间，单位秒
  final List<GamePremadeItem> games;

  BatchMatchConfig({
    required this.thresholdTime,
    required this.overTime,
    required this.games,
  });

  factory BatchMatchConfig.fromMap(Map data) => BatchMatchConfig(
        thresholdTime: Util.parseInt(data['threshold_time'], 15),
        overTime: Util.parseInt(data['over_time'], 600),
        games:
            Util.parseList(data['games'], (e) => GamePremadeItem.fromJson(e)),
      );
}

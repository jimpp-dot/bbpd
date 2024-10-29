import 'package:shared/shared.dart';

import '../../protobuf/generated/common_room_heartrace.pb.dart';

class HeartRaceRepo {
  /// 心跳竞速：全量数据
  static Future<ResHeartRaceConfig> getHeartRaceConfig(int rid) async {
    String url = '${System.domain}go/room/heartrace/config';
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'rid': '$rid'}, pb: true, throwOnError: true);
      return ResHeartRaceConfig.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResHeartRaceConfig(msg: e.toString(), success: false);
    }
  }

  /// 心跳竞速：设置状态
  static Future<NormalNull> setState(int rid, String state) async {
    String url = '${System.domain}go/room/heartrace/setState';
    try {
      XhrResponse response = await Xhr.post(
          url, {'rid': '$rid', 'state': state},
          pb: true, throwOnError: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }

  /// 心跳竞速：加时
  static Future<NormalNull> delay(int rid, int second) async {
    String url = '${System.domain}go/room/heartrace/delay';
    try {
      XhrResponse response = await Xhr.post(
          url, {'rid': '$rid', 'second': '$second'},
          pb: true, throwOnError: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }

  /// 心跳竞速：查看可选关系
  /// index: [1-3],排名
  static Future<ResHeartRaceRelationConfig> relationConfig(
      int rid, int index) async {
    String url = '${System.domain}go/room/heartrace/relationConfig';
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'rid': '$rid', 'idx': '$index'},
          pb: true,
          throwOnError: true);
      return ResHeartRaceRelationConfig.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResHeartRaceRelationConfig(msg: e.toString(), success: false);
    }
  }

  /// 心跳竞速：接待给每组选关系
  /// index: [1-3],排名
  static Future<NormalNull> chooseRelation(
      int rid, int relationId, int duration, int index) async {
    String url = '${System.domain}go/room/heartrace/chooseRelation';
    try {
      XhrResponse response = await Xhr.post(
          url,
          {
            'rid': '$rid',
            'relation_id': '$relationId',
            'duration': '$duration',
            'idx': '$index'
          },
          pb: true,
          throwOnError: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }

  /// 心跳竞速：获取排行榜
  static Future<ResHeartRaceRank> getRank(int page) async {
    String url = '${System.domain}go/room/heartrace/rank';
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {
            'page': '$page',
          },
          pb: true,
          throwOnError: true);
      return ResHeartRaceRank.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResHeartRaceRank(msg: e.toString(), success: false);
    }
  }
}

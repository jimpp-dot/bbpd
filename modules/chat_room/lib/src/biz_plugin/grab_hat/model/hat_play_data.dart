import 'package:shared/shared.dart';

import '../../../protobuf/generated/grab_hat.pb.dart';

class GrabHatRepo {
  static Future<ResHatIndex> getCurrentHatInfo(int rid) async {
    String url = '${System.domain}go/yy/hat/index?rid=$rid';
    try {
      final response = await Xhr.get(url, pb: true, throwOnError: true);
      return ResHatIndex.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResHatIndex(success: false, message: e.toString());
    }
  }

  static Future<ResHatRandom> randomHat(int rid) async {
    String url = '${System.domain}go/yy/hat/random?rid=$rid';
    try {
      final response = await Xhr.get(url, pb: true, throwOnError: true);
      return ResHatRandom.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResHatRandom(success: false, message: e.toString());
    }
  }

  static Future<NormalNull> start(int rid, String ids, int countSeconds) async {
    String url = '${System.domain}go/yy/hat/start';
    try {
      final response = await Xhr.post(
          url, {'rid': '$rid', 'ids': ids, 'count_seconds': '$countSeconds'},
          pb: true, throwOnError: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  static Future<NormalNull> stop(int rid) async {
    String url = '${System.domain}go/yy/hat/stop';
    try {
      final response =
          await Xhr.post(url, {'rid': '$rid'}, pb: true, throwOnError: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }
}

class GrabHatPushData {
  final int state;
  final int expire;
  final String icon;
  final HatPositionData hat;

  GrabHatPushData(this.state, this.icon, this.expire, this.hat);

  factory GrabHatPushData.fromJson(Map<dynamic, dynamic> json) {
    return GrabHatPushData(
        Util.parseInt(json['state']),
        Util.parseStr(json['icon']) ?? '',
        Util.parseInt(json['expire']),
        HatPositionData.fromJson(json['hatList'] ?? {}));
  }
}

class HatPositionData {
  final int uid;
  final String hat;
  final String hatEffect;

  HatPositionData(this.uid, this.hat, this.hatEffect);

  factory HatPositionData.fromJson(Map<dynamic, dynamic> json) {
    return HatPositionData(
        Util.parseInt(json['uid']),
        Util.parseStr(json['image']) ?? '',
        Util.parseStr(json['animation']) ?? '');
  }
}

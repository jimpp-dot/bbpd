import 'package:shared/shared.dart';

class PigPunishData {
  final int uid;
  final String url;
  final int expire;

  PigPunishData(this.uid, this.url, this.expire);

  factory PigPunishData.fromJson(Map<dynamic, dynamic> json) {
    return PigPunishData(
      Util.parseInt(json['uid']),
      Util.parseIcon(json['url']),
      Util.parseInt(json['expire']),
    );
  }
}

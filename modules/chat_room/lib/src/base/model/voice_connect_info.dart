import 'package:shared/shared.dart';

class VoiceConnectInfo {
  final String token;

  VoiceConnectInfo(this.token);

  factory VoiceConnectInfo.fromJson(Map<String, dynamic> json) =>
      VoiceConnectInfo(
        Util.notNullStr(json['token']),
      );
}

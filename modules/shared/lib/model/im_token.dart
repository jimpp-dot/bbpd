import '../shared.dart';

class ImToken {
  /// 使用bbim
  static const int USE_PULSE_IM = 1;

  String token;

  int uid;

  int pulseIM;

  int heart;

  String socketAddress;

  String imDomain;

  ImToken(this.token, this.uid, this.pulseIM, this.heart, this.socketAddress,
      this.imDomain);

  static ImToken fromJson(Map data) {
    return ImToken(
        data["token"],
        Util.parseInt(data['uid']),
        Util.parseInt(data['slpIM']),
        Util.parseInt(data['heartbeat']),
        data["socketAddress"],
        data['imDomain']);
  }

  @override
  String toString() {
    return 'ImToken{token: $token, uid: $uid, pulseIM: $pulseIM, heart: $heart, socketAddress: $socketAddress, imDomain: $imDomain}';
  }
}

class ImTokenRepo {
  static Future<ImToken?> getImToken() async {
    String url = '${System.domain}cloud/token';
    XhrResponse response = await Xhr.postJson(url, {'env': 'prod'});
    ImToken? imToken;
    if (response.error == null) {
      if (response.response == null) {
        return imToken;
      }
      if (response.response is Map) {
        Map res = response.response as Map;
        if (res['success'] == true) {
          Map data = res['data'];
          imToken = ImToken.fromJson(data);
        } else {
          Log.d("Im request token error ${res['msg']}");
        }
      } else {
        Log.d("Im request token error ${response.response}");
      }
    } else {
      Log.d("Im request token error");
    }
    return imToken;
  }
}

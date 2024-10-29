class CryptSaltRsp {
  late bool success;
  late Data data;

  CryptSaltRsp.fromJson(Map<String, dynamic> json) {
    success = json['success'] ?? false;
    if (json.containsKey('data')) {
      data = Data.fromJson(json['data']);
    }
  }
}

class Data {
  String? salt;

  Data.fromJson(Map<String, dynamic> json) {
    salt = json['salt'] is String ? json['salt'] : null;
  }
}

import 'dart:convert';

/// 通信消息
class GamePayload {
  static const String req = 'req'; // 请求
  static const String res = 'res'; // 响应

  static int seq = DateTime.now().millisecondsSinceEpoch ~/ 1000; // 随机起始索引

  final String? name;
  final int? id;
  final String? type;
  final dynamic data;

  bool get isRequest => type == req;

  bool get isResponse => type == res;

  GamePayload({
    required this.name,
    this.id,
    this.type,
    this.data,
  });

  /// 接收数据
  factory GamePayload.fromJson(Map<String, dynamic> json) {
    int id = json['id'] ?? 0;
    String? type = json['type'];
    String? name = json['name'];
    var data = json['data'];
    // assert(data == null || (data is Map || data is Iterable));
    return GamePayload(name: name, id: id, type: type, data: data);
  }

  /// 请求数据
  factory GamePayload.request({required String name, dynamic data}) {
    // assert(data == null || (data is Map || data is Iterable));
    return GamePayload(name: name, id: seq++, type: req, data: data);
  }

  /// 响应请求
  GamePayload response(Object? data) {
    assert(isRequest);
    // assert(data == null || (data is Map || data is Iterable));
    return GamePayload(name: name, id: id, type: res, data: data);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map['name'] = name;
    if (id != null) {
      map['id'] = id;
    }
    if (type != null) {
      map['type'] = type;
    }
    if (data != null) {
      map['data'] = data;
    }
    return map;
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}

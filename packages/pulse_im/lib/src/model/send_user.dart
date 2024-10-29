import 'dart:convert';

import '../util/im_util.dart';

class SendUser {
  String? id;
  String? name;
  String? portraitUri;

  /// 扩展字段，不存入数据库, 业务需要使用可以通过使用扩展方法的信息添加
  Map<String, dynamic>? _extendFields;

  SendUser(this.id, this.name, this.portraitUri);

  SendUser._({
    this.id,
    this.name,
    this.portraitUri,
    Map<String, dynamic>? extendFields,
  }) : _extendFields = extendFields;

  static Map<String, dynamic> _toExtendFields(Map<String, dynamic> map) {
    return IMUtil.mapExcludeKeys(map, ['id', 'name', 'portraitUri', 'icon']);
  }

  factory SendUser.fromJson(Map<String, dynamic> map) {
    return SendUser._(
      id: IMUtil.parseStr(map['id']),
      name: IMUtil.parseStr(map['name']),
      portraitUri: IMUtil.parseStr(map['portraitUri'] ?? map['icon']),
      extendFields: _toExtendFields(map),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'portraitUri': portraitUri,
      ...(_extendFields ?? {}),
    };
  }

  String toJson() {
    Map map = toMap();
    return json.encode(map);
  }

  factory SendUser.fromUserJson(Map<String, dynamic> map) {
    return SendUser._(
      id: IMUtil.parseStr(map['uid']),
      name: IMUtil.parseStr(map['name']),
      portraitUri: IMUtil.parseStr(map['portraitUri'] ?? map['icon']),
      extendFields: _toExtendFields(map),
    );
  }

  Map<String, dynamic> toUserMap() {
    return {
      'uid': IMUtil.parseInt(id),
      'name': name,
      'portraitUri': portraitUri,
      ...(_extendFields ?? {}),
    };
  }

  String toUserJson() {
    Map map = toUserMap();
    return json.encode(map);
  }

  /// 添加扩展字段，注意会存入数据库，和MessageContent不同
  /// [name] 字段名
  /// [value] 字段值
  /// 可以在业务中进行字段扩展，例如
  /// ```
  ///  class SendUserExt on SendUser {
  ///   String? get extName => getExtendField('extName');
  ///   set extName(String? value) => setExtendField('extName', value);
  ///  }
  ///  ```
  void setExtendField(String name, dynamic value) {
    _extendFields ??= {};
    _extendFields![name] = value;
  }

  dynamic getExtendField(String name) {
    return _extendFields != null ? _extendFields![name] : null;
  }

  @override
  String toString() {
    return 'SendUser{id: $id, name: $name, portraitUri: $portraitUri}';
  }

  SendUser copyWith({
    String? id,
    String? name,
    String? portraitUri,
    Map<String, dynamic>? extendFields,
  }) {
    return SendUser._(
      id: id ?? this.id,
      name: name ?? this.name,
      portraitUri: portraitUri ?? this.portraitUri,
      extendFields: extendFields ?? _extendFields,
    );
  }
}

/// 发送的触发类型
class SentTrigger {
  static const int USER = 1;
  static const int SERVER = 2;
}

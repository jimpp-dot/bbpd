import 'dart:convert' show json;

import 'package:shared/shared.dart';

class DataInfo {
  final bool success;
  final List<ChatSkillInfo>? data;

  DataInfo(this.success, this.data);

  static DataInfo fromJson(jsonRes) {
    try {
      Map<String, dynamic> jsonMap =
          jsonRes is String ? json.decode(jsonRes) : jsonRes;
      List<ChatSkillInfo> data = [];

      for (var dataItem in jsonMap['data']) {
        data.add(ChatSkillInfo.fromJson(dataItem));
      }
      return DataInfo(Util.parseBool(jsonMap['success']), data);
    } catch (e) {
      return DataInfo(false, null);
    }
  }

  @override
  String toString() {
    return '{"success": $success,"data": $data}';
  }
}

class ChatSkillInfo {
  final int cid;
  final int dateline;
  final int is_default;
  final int num;
  final String? level;
  final String? icon;
  final String? name;
  final String? rid;
  final List<PriceInfo>? price;
  final List<String>? types;

  ChatSkillInfo(
      {required this.cid,
      required this.dateline,
      required this.is_default,
      required this.num,
      this.level,
      this.icon,
      this.name,
      this.rid,
      this.price,
      this.types});

  static ChatSkillInfo fromJson(jsonRes) {
    List<PriceInfo> price = [];
    List<String> types = [];

    for (var _priceItem in jsonRes['_price']) {
      price.add(PriceInfo.fromJson(_priceItem));
    }

    if (jsonRes['_types'] != null) {
      types = List<String>.from(jsonRes['_types']);
    }

    return ChatSkillInfo(
      cid: Util.parseInt(jsonRes['cid']),
      dateline: Util.parseInt(jsonRes['dateline']),
      is_default: Util.parseInt(jsonRes['is_default']),
      num: Util.parseInt(jsonRes['num']),
      level: jsonRes['_level'],
      icon: jsonRes['icon'],
      name: jsonRes['name'],
      rid: jsonRes['rid'],
      price: price,
      types: types,
    );
  }

  @override
  String toString() {
    return '{"cid": $cid,"dateline": $dateline,"is_default": $is_default,"num": $num,"_level": ${level != null ? json.encode(level) : 'null'},"icon": ${icon != null ? json.encode(icon) : 'null'},"name": ${name != null ? json.encode(name) : 'null'},"rid": ${rid != null ? json.encode(rid) : 'null'},"_price": $price,"_types": $types}';
  }
}

class PriceInfo {
  final int cheap;
  final int price;
  final String? uint;

  PriceInfo(this.cheap, this.price, this.uint);

  static PriceInfo fromJson(jsonRes) {
    return PriceInfo(Util.parseInt(jsonRes['cheap']),
        Util.parseInt(jsonRes['price']), Util.parseStr(jsonRes['uint']));
  }

  @override
  String toString() {
    return '{"cheap": $cheap,"price": $price,"uint": ${uint != null ? json.encode(uint) : 'null'}}';
  }
}

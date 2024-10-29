import 'dart:convert' show json;

import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chatOrderData.g.dart';

class ChatOrderData {
  int? status;
  String? state;
  DataInfo? data;

  ChatOrderData.fromParams({this.status, this.state, this.data});

  factory ChatOrderData(jsonStr) => jsonStr is String
      ? ChatOrderData.fromJson(json.decode(jsonStr))
      : ChatOrderData.fromJson(jsonStr);

  ChatOrderData.fromJson(jsonRes) {
    status = Util.parseInt(jsonRes['status']);
    state = Util.parseStr(jsonRes['state']);

    if (jsonRes['data'] is List) {
      if ((jsonRes['data'] as List).isNotEmpty) {
        data = DataInfo.fromJson(jsonRes['data'][0]);
      }
    } else if (jsonRes['data'] is Map) {
      data = DataInfo.fromJson(jsonRes['data']);
    }
  }

  @override
  String toString() {
    return '{"status": $status,"state": ${state != null ? json.encode(state) : 'null'},"data": $data}';
  }
}

@JsonSerializable()
class DataInfo {
  int vote;
  bool godsr;
  String? address;
  String? addressId;
  String? begin_time;
  String? cid;
  String? dateline;
  String? deleted;
  String? desc;
  String? id;
  String? is_new;
  String? isappeal;
  String? iscomplete;
  String? ispay;
  String? isvote;
  String? money;
  String? money_subsidy;
  String? num;
  String? pay_id;
  String? pay_time;
  String? price;
  String? price_origin;
  String? rate;
  String? sid;
  String? state;
  String? to;
  String? uid;
  String? uint;
  String? update_time;
  String? version;

  @JsonKey(name: '_gift', defaultValue: [])
  List<GiftInfo> gift;
  SkillInfo? skill;

  @JsonKey(defaultValue: 0)
  int cancelTime;

  DataInfo(
      this.vote,
      this.godsr,
      this.address,
      this.addressId,
      this.begin_time,
      this.cid,
      this.dateline,
      this.deleted,
      this.desc,
      this.id,
      this.is_new,
      this.isappeal,
      this.iscomplete,
      this.ispay,
      this.isvote,
      this.money,
      this.money_subsidy,
      this.num,
      this.pay_id,
      this.pay_time,
      this.price,
      this.price_origin,
      this.rate,
      this.sid,
      this.state,
      this.to,
      this.uid,
      this.uint,
      this.update_time,
      this.version,
      this.gift,
      this.skill,
      this.cancelTime);

  factory DataInfo.fromJson(Map<String, dynamic> json) =>
      _$DataInfoFromJson(json);
}

@JsonSerializable()
class SkillInfo {
  @JsonKey(name: '_display')
  String? display;

  @JsonKey(name: '_name')
  String? orgname;
  String? audio_description;
  String? audio_need;
  String? auth;
  String? cid;
  String? cond;
  String? cover_description;
  String? deleted;
  String? description;
  String? dpath;
  String? duration;
  String? example;
  String? free;
  String? game_id_need;
  String? icon;
  String? level;
  String? name;
  String? ordering;
  String? pid;
  String? pname;
  String? price;
  String? rate;
  String? rid;
  String? service_uid;
  String? type;
  String? types;
  String? uint;
  String? use_skill_cover;
  String? video_description;
  String? video_id;
  String? video_need;

  SkillInfo(
      this.display,
      this.orgname,
      this.audio_description,
      this.audio_need,
      this.auth,
      this.cid,
      this.cond,
      this.cover_description,
      this.deleted,
      this.description,
      this.dpath,
      this.duration,
      this.example,
      this.free,
      this.game_id_need,
      this.icon,
      this.level,
      this.name,
      this.ordering,
      this.pid,
      this.pname,
      this.price,
      this.rate,
      this.rid,
      this.service_uid,
      this.type,
      this.types,
      this.uint,
      this.use_skill_cover,
      this.video_description,
      this.video_id,
      this.video_need);

  factory SkillInfo.fromJson(Map<String, dynamic> json) =>
      _$SkillInfoFromJson(json);
}

@JsonSerializable()
class GiftInfo {
  int gid;
  int num;
  int price;
  String? name;

  GiftInfo(this.gid, this.num, this.price, this.name);

  factory GiftInfo.fromJson(Map<String, dynamic> json) =>
      _$GiftInfoFromJson(json);
}

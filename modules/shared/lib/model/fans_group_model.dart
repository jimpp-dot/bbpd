import 'package:shared/shared.dart';

/// 加入团信息
class FansGroupInfo {
  /// 团ID
  int? groupId;

  /// 粉丝团所属主播uid
  int uid = 0;

  /// 粉丝团名称
  String? name;

  /// 成员数
  int memberNum = 0;

  /// 是否加入，0：否，1：是
  int join = 0;

  /// 主播icon
  String? icon;

  /// xx的粉丝团
  String? joinTitle;

  /// 加入即享粉丝专属权益
  String? joinNote;

  /// 权益列表
  List<FansGroupRight>? rights;

  /// 礼物
  FansGroupGift? gift;

  bool get isJoined => ((join) == 1);

  String get iconUrl => Util.parseIcon(icon);

  FansGroupInfo.fromJson(Map<String, dynamic> json) {
    /// Log.d('FansGroupInfo, is_join: ${json['is_join']}');
    if (json.isNotEmpty) {
      groupId = Util.parseInt(json['kfg_id'], 0);
      uid = Util.parseInt(json['group_uid'], 0);
      name = Util.parseStr(json['group_name']);
      memberNum = Util.parseInt(json['member_num'], 0);
      join = Util.parseInt(json['is_join'], 0);
      icon = Util.parseStr(json['icon']);
      joinTitle = Util.parseStr(json['join_title']);
      joinNote = Util.parseStr(json['join_note']);
      dynamic gif = json['gift'];
      if (gif is Map) {
        gift = FansGroupGift.fromJson(gif as Map<String, dynamic>);
      }
      rights = Util.parseList(json['rights'],
          (e) => FansGroupRight.fromJson(e as Map<String, dynamic>));
    }
  }
}

class FansGroupRight {
  /// 权益名称
  String? name;

  /// 权益图片
  String? image;

  FansGroupRight.fromJson(Map<String, dynamic> json) {
    if (json.isNotEmpty) {
      name = Util.parseStr(json['name']);
      image = Util.parseStr(json['image']);
    }
  }
}

class FansGroupGift {
  /// 礼物ID
  int id = 0;

  /// 礼物类型
  String? type;

  /// 礼物名称
  String? name;

  /// 礼物价格（单位：分）
  double price = 0;

  /// 支付价格参考[PageGiftV2]
  int get payPrice => (((type ?? '') == 'coin') ? price : price * 100).round();

  FansGroupGift.fromJson(Map<String, dynamic> json) {
    if (json.isNotEmpty) {
      id = Util.parseInt(json['id'], 0);
      type = Util.parseStr(json['gift_type']);
      name = Util.parseStr(json['name']);
      price = Util.parseDouble(json['price'], 0.0);
    }
  }
}

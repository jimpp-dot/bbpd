import 'package:shared/shared.dart';

class ComboBanner {
  String comboId;
  int uid;
  String name;
  String icon;
  int vipLevel;
  int hitNum;
  String message;
  String giftIcon;

  // 本地对象的创建时间戳
  int localObjCreateTime = 0;

  ComboBanner({
    required this.comboId,
    required this.uid,
    required this.name,
    required this.icon,
    required this.vipLevel,
    required this.hitNum,
    required this.message,
    required this.giftIcon,
  }) {
    localObjCreateTime = DateTime.now().millisecondsSinceEpoch;
  }

  factory ComboBanner.fromJson(Map<String, dynamic> json) {
    return ComboBanner(
      comboId: Util.notNullStr(json["combo_id"]),
      uid: Util.parseInt(json["uid"]),
      name: Util.notNullStr(json["name"]),
      icon: Util.notNullStr(json["icon"]),
      vipLevel: Util.parseInt(json["vip_level"]),
      hitNum: Util.parseInt(json["hit_num"]),
      message: Util.notNullStr(json["message"]),
      giftIcon: Util.notNullStr(json["gift_icon"]),
    );
  }

  @override
  String toString() {
    return 'ComboBanner{comboId: $comboId, uid: $uid, name: $name, icon: $icon, vipLevel: $vipLevel, hitNum: $hitNum, message: $message, giftIcon: $giftIcon}';
  }
}

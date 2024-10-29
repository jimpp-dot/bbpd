import '../shared.dart';

class CompanionRankModel {
  final String? id; //序号
  final String? uid; //榜单其他人的uid
  final int? stay_secs; //陪伴时间单位秒
  String? name;
  final int? sex;
  final int? age;
  final int? titleNew;
  final String? icon;
  final int? relation; //0陌生人 1关注  2粉丝  3好友
  final int? degree; //亲密度
  final int? rank; //-1未上榜
  final int? rid; //如果在房间rid > 0
  final String? tag; //房间类型标签
  final RoomTagType? tagInfo;

  CompanionRankModel(
      {this.id,
      this.uid,
      this.stay_secs,
      this.name,
      this.sex,
      this.age,
      this.titleNew,
      this.icon,
      this.relation,
      this.degree,
      this.rank,
      this.rid,
      this.tag,
      this.tagInfo});

  factory CompanionRankModel.fromJson(Map<String, dynamic> json) {
    return CompanionRankModel(
        id: json['id'],
        uid: json["uid"] ?? Session.uid.toString(),
        stay_secs: json["stay_secs"],
        name: json["name"],
        sex: json["sex"],
        age: json["age"],
        titleNew: json["title_new"],
        icon: json["icon"],
        relation: json["relation"],
        degree: json["degree"],
        rank: json["rank"],
        rid: json["rid"] ?? 0,
        tag: json["tag"],
        tagInfo: (json["tag_info"] == null)
            ? null
            : RoomTagType.fromJson(json["tag_info"]));
  }
}

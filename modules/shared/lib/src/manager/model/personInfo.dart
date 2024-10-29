import 'homeListItem.dart';
import 'skillData.dart';

class PersonInfo {
  String? icon;
  String? nick;
  int? uid;
  int? cCid;
  int? sex;
  int? age;
  String? city; // 技能数
  String? position; // 邀约次数
  bool isGod = false;

  static PersonInfo formSkillData(SkillInfo? skill) {
    PersonInfo info = PersonInfo();

    if (skill != null) {
      info.icon = skill.icon;
      info.nick = skill.name;
      info.uid = skill.uid;
      info.cCid = skill.cid;
      info.sex = skill.sex;
      info.age = skill.age;
      info.city = skill.city;
      info.position = skill.position;
      info.isGod = true;
    }

    return info;
  }

  static PersonInfo formListItem(ListItem? item) {
    PersonInfo info = PersonInfo();

    if (item != null) {
      info.icon = item.icon;
      info.nick = item.nick;
      info.uid = item.uid;
      info.cCid = item.cCid;
      info.sex = item.sex;
      info.age = item.age;
      info.city = item.city;
      info.position = item.position;
      info.isGod = false;
      if (item.pid > 0 && !item.isInterests) {
        info.isGod = true;
      }
    }

    return info;
  }
}

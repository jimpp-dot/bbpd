import 'package:personaldata/k.dart';

class SkillConfig {
  String icon;
  String selected;
  String text;

  SkillConfig(this.icon, this.selected, this.text);
}

Map<String, SkillConfig> skillTypeSource = {
  'text':
      SkillConfig("skill_f11.png", "skill_f11s.png", K.personaldata_skill_f11),
  'online':
      SkillConfig("skill_f21.png", "skill_f21s.png", K.personaldata_skill_f21),
  'video':
      SkillConfig("skill_f31.png", "skill_f31s.png", K.personaldata_skill_f31),
  'offline':
      SkillConfig("skill_f41.png", "skill_f41s.png", K.personaldata_skill_f41),
};

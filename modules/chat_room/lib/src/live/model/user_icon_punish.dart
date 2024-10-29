import 'package:shared/shared.dart';
import 'package:chat_room/src/base/punish/model/punish_beans.dart';
import 'package:equatable/equatable.dart';

/// 解析头像UI惩罚
SystemPunishType _parseUserPunishType(int type) {
  switch (type) {
    case 1:
      return SystemPunishType.header;
    case 2:
      return SystemPunishType.mask;
    case 3:
      return SystemPunishType.paper;
  }
  return SystemPunishType.unknown;
}

///用户惩罚
class UserIconPunish extends Equatable {
  SystemPunishType type; //1搞怪头像框 2头像马赛克
  String content; // 对应type需要的内容
  int pageCount;

  UserIconPunish.fromJson(Map<String, dynamic> json)
      : type = _parseUserPunishType(Util.parseInt(json['type'])),
        content = Util.notNullStr(json['content']),
        pageCount = Util.parseInt(json['page_count']);

  UserIconPunish(
      {required this.type, required this.content, required this.pageCount});

  @override
  List<Object> get props => [type, content, pageCount];
}

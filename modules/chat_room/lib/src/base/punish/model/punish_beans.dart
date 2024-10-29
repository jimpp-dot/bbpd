import 'package:shared/shared.dart';
import 'package:equatable/equatable.dart';

/// 通用房间惩罚model
/// 房间惩罚分成头像类惩罚、声音类惩罚，不同类惩罚可以同时存在，同类惩罚使用最后一个
/// 头像类惩罚：头像马赛克、搞怪头像框、贴纸条、改名字
/// 声音类惩罚：捣乱背景音、特殊背景音、搞怪变声器

/// 所有的惩罚类型枚举
enum SystemPunishType {
  mask, //头像马赛克
  paper, //头像纸条
  header, //头像框
  stickyNote, //头像贴字条
  changeName, //昵称
  naughty, // 搞怪背景音
  special, // 特殊背景音
  funny, // 搞怪变声器
  unknown,
}

/// 解析系统惩罚类型
SystemPunishType parseSystemPunishType(String types) {
  try {
    String current =
        '${'SystemPunishType'.toLowerCase()}.${types.replaceAll('-', '').replaceAll('_', '').toLowerCase()}';
    return SystemPunishType.values.firstWhere((SystemPunishType type) {
      return type.toString().toLowerCase() == current;
    });
  } catch (e, s) {
    Log.e(e, stackTrace: s);
  }
  return SystemPunishType.unknown;
}

/// 用户惩罚
class UserPunish extends Equatable {
  final int id;
  final int uid;
  final SystemPunishType type; //1搞怪头像框 2头像马赛克
  final String content; // 对应type需要的内容
  final int pageCount; // 对应数量，贴纸条需要用到

  const UserPunish(
      {this.id = 0,
      this.uid = 0,
      this.type = SystemPunishType.unknown,
      this.content = '',
      this.pageCount = 0});

  @override
  List<Object> get props => [id, uid, type, content, pageCount];

  /// 语音惩罚
  bool isVoicePunish() {
    return SystemPunishType.naughty == type ||
        SystemPunishType.special == type ||
        SystemPunishType.funny == type;
  }

  /// 头像框惩罚
  bool isIconPunish() {
    return SystemPunishType.mask == type ||
        SystemPunishType.paper == type ||
        SystemPunishType.header == type ||
        SystemPunishType.stickyNote == type;
  }

  /// 改名字惩罚
  bool isNamePunish() {
    return SystemPunishType.changeName == type;
  }

  factory UserPunish.fromJson(Map<String, dynamic> json) {
    return UserPunish(
      id: Util.parseInt(json['id']),
      uid: Util.parseInt(json['uid']),
      type: parseSystemPunishType(Util.notNullStr(json['type'])),
      content: Util.notNullStr(json['content']),
      pageCount: Util.parseInt(json['paper_count']),
    );
  }
}

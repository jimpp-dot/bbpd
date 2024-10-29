import '../shared.dart';

class FriendItem {
  final int uid;
  final int? onlineStatus;
  final int? onlineDateline;
  int? redpoint;
  final int? online;
  final int? room;
  final String? roomIcon;
  final String? roomPrefix;
  final String? name;
  final String? mark;
  final String? icon;
  final String? tag;
  final String? title;
  final String? sign;
  final String? onlineDatelineDiff;
  final int? sex;
  final int? titleNew;
  final List? members;
  final UserConfig? userConfig;
  final int? distance;
  final String? onlineDiff;
  List<String>? memberIcons;
  bool isGroup = false;
  int? official;
  bool hasInvite = false;

  final String? extType;

  String? get markName {
    if (mark != null && mark!.isNotEmpty) {
      return mark;
    } else {
      return name;
    }
  }

  String? get onlineDiffStr {
    if (Util.validStr(onlineDiff)) {
      return onlineDiff!;
    }

    if (Util.validStr(onlineDatelineDiff)) {
      return onlineDatelineDiff;
    }

    return '';
  }

  String get distanceStr {
    return Util.getDistanceStr(distance);
  }

  FriendItem({
    required this.uid,
    this.onlineStatus,
    this.onlineDateline,
    this.redpoint,
    this.online,
    this.room,
    this.roomIcon,
    this.roomPrefix,
    this.name,
    this.mark,
    this.icon,
    this.tag,
    this.title,
    this.sign,
    this.onlineDatelineDiff,
    this.sex,
    this.titleNew,
    this.members,
    this.extType,
    this.memberIcons,
    this.userConfig,
    this.distance,
    this.onlineDiff,
  });

  @override
  bool operator ==(other) {
    return (other is FriendItem) && other.uid == uid;
  }

  FriendItem.fromJson(Map data)
      : uid = Util.parseInt(data['uid']),
        onlineStatus = Util.parseInt(data['online_status']),
        onlineDateline = Util.parseInt(data['online_dateline']),
        redpoint = Util.parseInt(data['redpoint']),
        online = Util.parseInt(data['online']),
        room = Util.parseInt(data['room']),
        sex = Util.parseInt(data['sex']),
        titleNew = Util.parseInt(data['title_new']),
        title = '${data['title']}',
        name = data['name'],
        mark = data['mark'],
        icon = data['icon'],
        roomIcon = data['roomicon'],
        roomPrefix = data['room_prefix'] ?? '',
        sign = data['sign'],
        onlineDatelineDiff = data['online_dateline_diff'],
        members = data['members'] ?? [],
        tag = data['tag'],
        extType = data['type'],
        official = data['official'] ?? 0,
        userConfig = UserConfig.fromJson(data['room_tag'] ?? {}),
        distance = Util.parseInt(data['distance']),
        onlineDiff = Util.parseStr(data['online_diff']);

  @override
  int get hashCode => uid;
}

import 'package:json_annotation/json_annotation.dart';
import 'package:shared/shared.dart';

part 'hilist_model.g.dart';

class PrivateHiListModel {
  Conversation? conversation;

  HiListUserItem? userInfo;

  UserConfig? userConfig;

  PrivateHiListModel(this.conversation, this.userInfo, this.userConfig);

  int get uid => userInfo?.uid ?? 0;
}

@JsonSerializable(createToJson: false)
class HiListUsers {
  List<HiListUserItem> users;

  HiListUsers(this.users);

  factory HiListUsers.fromJson(Map<String, dynamic> json) =>
      _$HiListUsersFromJson(json);
}

@JsonSerializable(createToJson: false)
class HiListUserItem {
  @JsonKey(fromJson: Util.parseInt)
  int uid;

  @JsonKey(fromJson: Util.parseInt)
  int sex;

  @JsonKey(fromJson: Util.parseInt)
  int age;

  String? name;

  String? icon;

  // 爵位
  @JsonKey(fromJson: Util.parseInt)
  int title;

  // 爵位
  @JsonKey(name: 'title_new', fromJson: Util.parseInt)
  int titleNew;

  // 照片数量
  @JsonKey(name: "photo_num", fromJson: Util.parseInt)
  int photoNum;

  // 人气等级
  @JsonKey(fromJson: Util.parseInt)
  int popularity;

  // vip等级
  @JsonKey(fromJson: Util.parseInt)
  int vip;

  @JsonKey(name: "icongray", fromJson: Util.parseBool)
  bool vipGrey;

  // 平台印记
  List<String> marks;

  // 最近在线时间
  @JsonKey(name: "online_dateline", fromJson: Util.parseInt)
  int onlineDateline;

  @JsonKey(name: "new_user", fromJson: Util.parseBool)
  bool newUser;

  int daka;

  int jiaren;

  HiListUserItem(
      this.uid,
      this.sex,
      this.age,
      this.name,
      this.icon,
      this.title,
      this.titleNew,
      this.photoNum,
      this.popularity,
      this.vip,
      this.vipGrey,
      this.marks,
      this.onlineDateline,
      this.newUser,
      this.daka,
      this.jiaren);

  factory HiListUserItem.fromJson(Map<String, dynamic> json) =>
      _$HiListUserItemFromJson(json);

  // 不在线，需要判断多少分钟之前在线
  static const ONLINE_NONE = 0;

  // 在线
  static const ONLINE_ONLINE = 1;

  // 在房间语聊中
  static const ONLINE_IN_ROOM = 2;

  // 和我在同一房间中
  static const ONLINE_IN_SAME_ROOM = 3;

  @override
  String toString() {
    return 'HiListUserItem{uid: $uid, sex: $sex, age: $age, name: $name, icon: $icon, title: $title, photoNum: $photoNum, popularity: $popularity, vip: $vip, marks: $marks, onlineDateline: $onlineDateline, newUser: $newUser}';
  }

  HiListUserItem.fromCloudChatUser(CloudChatUser user)
      : uid = user.hasUid() ? user.uid : 0,
        sex = user.hasSex() ? user.sex : 0,
        age = user.hasAge() ? user.age : 0,
        name = user.hasName() ? user.name : '',
        icon = user.hasIcon() ? user.icon : '',
        title = user.hasTitle() ? user.title : 0,
        titleNew = user.hasTitleNew() ? user.titleNew : 0,
        photoNum = user.hasPhotoNum() ? user.photoNum : 0,
        popularity = user.hasPopularity() ? user.popularity : 0,
        vip = user.hasVip() ? user.vip : 0,
        vipGrey = user.hasIconGray() ? user.iconGray : false,
        marks = user.marks.isNotEmpty ? user.marks : [],
        onlineDateline = user.hasOnlineDateline() ? user.onlineDateline : 0,
        newUser = user.hasNewUser() ? user.newUser : false,
        daka = user.hasDaka() ? user.daka : 0,
        jiaren = user.hasJiaren() ? user.jiaren : 0;
}

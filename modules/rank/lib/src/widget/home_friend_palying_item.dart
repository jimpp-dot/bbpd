import 'package:shared/shared.dart';

class HomeFriendItem {
  bool exposured = false;
  UserRelationType? relationType;
  int? rid;
  int? uid;
  String? roomProperty;
  bool? isBiz;
  String? roomIcon;
  int? sex;
  RoomTagType? tag;
  String roomName = '';
  String followDesc = '';
  int? onlineNum;
  String? ticketMark;

  HomeFriendItem.fromPb(FriendListItem item) {
    String relation = item.friendShip;
    if ('friend' == relation) {
      relationType = UserRelationType.Friend;
    } else if ('follow' == relation) {
      relationType = UserRelationType.Follow;
    } else {
      relationType = UserRelationType.Accompany;
    }
    rid = item.rid;
    uid = item.uid;
    roomProperty = item.property;
    isBiz = item.isBiz;
    roomIcon = item.icon;
    sex = item.sex;
    tag = item.typeName.toRoomTag();
    roomName = item.name;
    followDesc = item.followDesc;
    onlineNum = item.onlineNum;
    ticketMark = item.ticketMark;
  }
}

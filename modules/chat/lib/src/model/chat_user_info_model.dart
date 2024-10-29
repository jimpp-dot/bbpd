import 'package:shared/shared.dart';

class ChatUserInfoModel {
  final String? name;
  final int uid;
  final String? icon;
  final int age;
  final int sex;
  final String? city;
  final String? distance;
  final int friend;
  final int fans;
  final String? sign;
  final List<FriendTagItem> friendTags;
  final FeedItem? feedItem;

  ChatUserInfoModel(
      {this.name,
      this.icon,
      required this.uid,
      required this.age,
      required this.sex,
      this.city,
      this.distance,
      required this.friend,
      required this.fans,
      this.sign,
      required this.friendTags,
      this.feedItem});

  factory ChatUserInfoModel.fromJson(Map<String, dynamic> json) {
    return ChatUserInfoModel(
      name: Util.parseStr(json['name']) ?? '',
      icon: Util.parseStr(json['icon']) ?? '',
      age: Util.parseInt(json['age']),
      uid: Util.parseInt(json['uid']),
      sex: Util.parseInt(json['sex']),
      city: Util.parseStr(json['city']) ?? '',
      distance: Util.parseStr(json['distance_desc']) ?? '',
      friend: Util.parseInt(json['_friend']),
      fans: Util.parseInt(json['_fans']),
      sign: Util.parseStr(json['sign']),
      friendTags: Util.parseList(json['friend_tags'],
          (e) => FriendTagItem.fromJson(e as Map<String, dynamic>)),
      feedItem: json.containsKey('latest_feed') && json['latest_feed'] != null
          ? FeedItem.fromJson(json['latest_feed'])
          : null,
    );
  }
}

class FriendTagItem {
  final int tagId;
  final String? desc;

  FriendTagItem({required this.tagId, this.desc});

  factory FriendTagItem.fromJson(Map<String, dynamic> json) {
    return FriendTagItem(
      tagId: Util.parseInt(json['id']),
      desc: Util.parseStr(json['name']) ?? '',
    );
  }
}

class FeedItem {
  final String? content;
  final List<String> imgs;

  FeedItem({this.content, required this.imgs});

  factory FeedItem.fromJson(Map<String, dynamic> json) {
    return FeedItem(
      content: Util.parseStr(json['content']) ?? '',
      imgs: Util.parseList(json['imgs'], (e) => Util.notNullStr(e)),
    );
  }
}

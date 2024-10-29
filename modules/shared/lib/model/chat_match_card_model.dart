import '../shared.dart';

class ChatMatchCardModel {
  int? uid;
  int? sex;
  String? name;
  String? icon;
  int? age;
  int? isFollow;
  String? audioUrl;
  int? audioDuration;
  String? videoUrl;
  int? videoDuration;
  String? videoCover;
  String? desc;
  List<ChatTag> tags = [];
  List<TagColor> colors = [];
  String? audioLocal;
  String? title;
  String? subtitle;
  String? content;
  int? official;

  ChatMatchCardModel.fromJson(Map<String, dynamic> json) {
    uid = Util.parseInt(json['uid']);
    sex = Util.parseInt(json['sex']);
    icon = Util.parseStr(json['icon']);
    name = Util.parseStr(json['name']);
    age = Util.parseInt(json['age']);
    isFollow = Util.parseInt(json['isfollow']);
    Map<String, dynamic> fcard = json['fcard'];
    audioUrl = fcard['audio']['url'];
    audioDuration = Util.parseInt(fcard['audio']['duration']);
    videoUrl = fcard['video']['url'];
    videoDuration = Util.parseInt(fcard['video']['duration']);
    videoCover = fcard['video']['cover'];
    desc = Util.parseStr(fcard['desc']);
    tags = [];
    colors = [];
    for (var tag in fcard['tags']) {
      tags.add(ChatTag.fromJson(tag));
    }
    for (var color in fcard['color']) {
      colors.add(TagColor.fromJson(color));
    }
    title = fcard['dialog']['title'];
    subtitle = fcard['dialog']['subtitle'];
    content = fcard['dialog']['content'];
    official = json['official'] ?? 0;
  }

  ChatMatchCardModel.fromAccountFriendCard(Map<String, dynamic> json) {
    uid = Util.parseInt(json['uid']);
    sex = Util.parseInt(json['sex']);
    icon = Util.parseStr(json['icon']);
    name = Util.parseStr(json['name']);
    age = Util.parseInt(json['age']);
    isFollow = Util.parseInt(json['isFollow']);
    audioUrl = Util.parseStr(json['audio']);
    audioDuration = Util.parseInt(json['duration']);
    videoUrl = json['video']['url'];
    videoDuration = Util.parseInt(json['video']['duration']);
    videoCover = json['video']['cover'];
    desc = Util.parseStr(json['desc']);
    tags = [];
    colors = [];
    for (var tag in json['tags']) {
      tags.add(ChatTag.fromAccountFriendcardJson(tag));
    }
    for (var color in json['color']) {
      colors.add(TagColor.fromJson(color));
    }
    title = json['dialog']['title'];
    subtitle = json['dialog']['subtitle'];
    content = json['dialog']['content'];
  }

  ChatMatchCardModel();
}

class ChatTag {
  int? id;
  String? tag;
  String? url;

  ChatTag(this.tag, this.url, {this.id});

  ChatTag.fromJson(Map<String, dynamic> json)
      : tag = Util.parseStr(json['tag']),
        url = Util.parseStr(json['icon']);

  ChatTag.fromAccountFriendcardJson(Map<String, dynamic> json)
      : tag = Util.parseStr(json['name']),
        url = Util.parseStr(json['icon']);
}

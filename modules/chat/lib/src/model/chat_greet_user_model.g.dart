// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_greet_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatGreetUserModel _$ChatGreetUserModelFromJson(Map<String, dynamic> json) {
  return ChatGreetUserModel(
    Util.parseInt(json['uid']),
    Util.parseStr(json['name']),
    Util.parseStr(json['pic']),
    Util.parseInt(json['sex']),
    Util.parseInt(json['age']),
    Util.parseInt(json['vip']),
    Util.parseBool(json['icongray']),
    Util.parseInt(json['popularity']),
    Util.parseInt(json['title']),
    Util.parseInt(json['title_new']),
    Util.parseList(
        json['tags'], (e) => UserTag.fromJson(e as Map<String, dynamic>)),
    Util.parseList(json['friend_tags'],
        (e) => UserTag.fromJson(e as Map<String, dynamic>)),
    Util.parseList(json['mark'], (e) => Util.parseStr(e) ?? ''),
  )..audioInfo = json['card'] == null
      ? null
      : AudioInfo.fromJson(json['card'] as Map<String, dynamic>);
}

UserTag _$UserTagFromJson(Map<String, dynamic> json) {
  return UserTag(
    Util.parseInt(json['id']),
    Util.parseStr(json['name']),
  );
}

AudioInfo _$AudioInfoFromJson(Map<String, dynamic> json) {
  return AudioInfo(
    Util.parseStr(json['audio']),
    Util.parseInt(json['duration']),
  );
}

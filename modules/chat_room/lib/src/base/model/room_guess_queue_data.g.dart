// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_guess_queue_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuessQueueRoomConfigData _$GuessQueueRoomConfigDataFromJson(
    Map<String, dynamic> json) {
  return GuessQueueRoomConfigData(
    Util.parseInt(json['version']),
    Util.parseInt(json['state']),
    Util.parseInt(json['turns']),
    json['replay'] == null
        ? null
        : GuessQueueReplay.fromJson(json['replay'] as Map<String, dynamic>),
    json['replay_comment'] == null
        ? null
        : GuessQueueRePlayComment.fromJson(
            json['replay_comment'] as Map<String, dynamic>),
    json['replay_like'] == null
        ? null
        : GuessQueueRePlayLike.fromJson(
            json['replay_like'] as Map<String, dynamic>),
    Util.parseInt(json['cate_id']),
    Util.parseInt(json['state_deadline']),
    Util.notNullStr(json['cate_name']),
    Util.parseList(
        json['gift'], (e) => Gift.fromJson(Map<String, dynamic>.from(e))),
    Util.parseInt(json['line_uid']),
    Util.parseInt(json['replay_start_time']),
  );
}

GuessQueueReplay _$GuessQueueReplayFromJson(Map<String, dynamic> json) {
  return GuessQueueReplay(
    json['owner_info'] == null
        ? null
        : GuessQueueOwnerInfo.fromJson(
            json['owner_info'] as Map<String, dynamic>),
    json['drawer_info'] == null
        ? null
        : GuessQueueDrawerInfo.fromJson(
            json['drawer_info'] as Map<String, dynamic>),
    json['guesser_info'] == null
        ? null
        : GuessQueueGuesserInfo.fromJson(
            json['guesser_info'] as Map<String, dynamic>),
    Util.parseInt(json['total_turns']),
    Util.parseInt(json['current_turns']),
  );
}

GuessQueueOwnerInfo _$GuessQueueOwnerInfoFromJson(Map<String, dynamic> json) {
  return GuessQueueOwnerInfo(
    Util.parseInt(json['uid']),
    Util.notNullStr(json['icon']),
    Util.notNullStr(json['word']),
    Util.parseInt(json['line_id']),
  );
}

GuessQueueDrawerInfo _$GuessQueueDrawerInfoFromJson(Map<String, dynamic> json) {
  return GuessQueueDrawerInfo(
    Util.parseInt(json['uid']),
    Util.notNullStr(json['icon']),
    Util.notNullStr(json['guess_image']),
    Util.notNullStr(json['last_guess_word']),
  );
}

GuessQueueGuesserInfo _$GuessQueueGuesserInfoFromJson(
    Map<String, dynamic> json) {
  return GuessQueueGuesserInfo(
    Util.parseInt(json['uid']),
    Util.notNullStr(json['icon']),
    Util.notNullStr(json['guess_word']),
  );
}

GuessQueueRePlayComment _$GuessQueueRePlayCommentFromJson(
    Map<String, dynamic> json) {
  return GuessQueueRePlayComment(
    Util.notNullStr(json['from_word']),
    Util.notNullStr(json['to_word']),
    Util.notNullStr(json['image']),
    (json['vote'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(int.parse(k), Util.parseInt(e)),
    ),
    Util.parseInt(json['line_id']),
  );
}

GuessQueueRePlayLikeImage _$GuessQueueRePlayLikeImageFromJson(
    Map<String, dynamic> json) {
  return GuessQueueRePlayLikeImage(
    Util.parseInt(json['uid']),
    Util.notNullStr(json['guess_image']),
    Util.notNullStr(json['icon']),
    Util.notNullStr(json['name']),
  );
}

GuessQueueRePlayLike _$GuessQueueRePlayLikeFromJson(Map<String, dynamic> json) {
  return GuessQueueRePlayLike(
    Util.parseInt(json['line_id']),
    Util.parseInt(json['line_uid']),
    json['like'] == null
        ? null
        : GuessQueueRePlayLikeImage.fromJson(
            json['like'] as Map<String, dynamic>),
    Util.parseList(json['images'],
        (e) => GuessQueueRePlayLikeImage.fromJson(e as Map<String, dynamic>)),
    Util.notNullStr(json['line_icon']),
  );
}

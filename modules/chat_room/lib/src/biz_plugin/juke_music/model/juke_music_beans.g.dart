// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'juke_music_beans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JukeMusicGiftSetting _$JukeMusicGiftSettingFromJson(Map<String, dynamic> json) {
  return JukeMusicGiftSetting(
    Util.parseInt(json['gift_id']),
    Util.notNullStr(json['gift_name']),
    Util.getRemoteImgUrl(Util.notNullStr(json['gift_icon'])),
    Util.notNullStr(json['gift_type']),
    Util.parseInt(json['gift_price']),
    Util.parseInt(json['gift_count']),
    Util.parseInt(json['min']),
    Util.parseInt(json['max']),
  );
}

JukeMyMusicData _$JukeMyMusicDataFromJson(Map<String, dynamic> json) {
  return JukeMyMusicData(
    Util.parseList(json['song_list'],
        (e) => JukeMusic.fromJson(e as Map<String, dynamic>)),
    Util.parseList(json['setting_list'],
        (e) => JukeMusicGiftSetting.fromJson(e as Map<String, dynamic>)),
  );
}

JukeMusic _$JukeMusicFromJson(Map<String, dynamic> json) {
  return JukeMusic(
    Util.parseInt(json['id']),
    Util.notNullStr(json['song_name']),
    json['order_count'],
    Util.parseBool(json['hot']),
  );
}

JukeMusicUser _$JukeMusicUserFromJson(Map<String, dynamic> json) {
  return JukeMusicUser(
    Util.notNullStr(json['name']),
    Util.parseInt(json['uid']),
    Util.getUserIconUrl(Util.parseStr(json['icon'])) ?? '',
    Util.notNullStr(json['desc']),
  );
}

JukeUserOrderList _$JukeUserOrderListFromJson(Map<String, dynamic> json) {
  return JukeUserOrderList(
    json['singer'] == null
        ? null
        : JukeMusicUser.fromJson(json['singer'] as Map<String, dynamic>),
    Util.parseList(
        json['list'], (e) => JukeMusic.fromJson(e as Map<String, dynamic>)),
  );
}

JukeOrderInfo _$JukeOrderInfoFromJson(Map<String, dynamic> json) {
  return JukeOrderInfo(
    json['singer'] == null
        ? null
        : JukeMusicOrder.fromJson(json['singer'] as Map<String, dynamic>),
    json['room_charge'] == null
        ? null
        : JukeCharge.fromJson(json['room_charge'] as Map<String, dynamic>),
    json['user_charge'] == null
        ? null
        : JukeCharge.fromJson(json['user_charge'] as Map<String, dynamic>),
    Util.parseInt(json['total_price']),
  );
}

JukeMusicOrder _$JukeMusicOrderFromJson(Map<String, dynamic> json) {
  return JukeMusicOrder(
    Util.parseInt(json['id']),
    Util.notNullStr(json['song_name']),
    Util.parseInt(json['uid']),
    Util.notNullStr(json['name']),
    Util.getUserIconUrl(Util.parseStr(json['icon'])) ?? '',
  );
}

JukeCharge _$JukeChargeFromJson(Map<String, dynamic> json) {
  return JukeCharge(
    Util.parseInt(json['gift_id']),
    Util.notNullStr(json['gift_name']),
    Util.getRemoteImgUrl(Util.parseStr(json['gift_icon'])),
    Util.notNullStr(json['gift_type']),
    Util.parseInt(json['gift_price']),
    Util.parseInt(json['gift_count']),
    Util.parseInt(json['min']),
    Util.parseInt(json['max']),
    Util.parseInt(json['total_price']),
    Util.parseInt(json['uid']),
  );
}

JukeWaitMusicData _$JukeWaitMusicDataFromJson(Map<String, dynamic> json) {
  return JukeWaitMusicData(
    json['playing_song'] == null
        ? null
        : JukePlaySong.fromJson(json['playing_song'] as Map<String, dynamic>),
    Util.parseList(json['plan_songs'],
        (e) => JukePlaySong.fromJson(e as Map<String, dynamic>)),
    Util.parseInt(json['more']),
  );
}

JukePlaySong _$JukePlaySongFromJson(Map<String, dynamic> json) {
  return JukePlaySong(
    Util.parseInt(json['id']),
    Util.parseInt(json['order_uid']),
    Util.notNullStr(json['order_name']),
    Util.getUserIconUrl(Util.parseStr(json['order_icon'])) ?? '',
    Util.parseInt(json['singer_uid']),
    Util.notNullStr(json['singer_name']),
    Util.getUserIconUrl(Util.parseStr(json['singer_icon'])) ?? '',
    Util.notNullStr(json['last_songs']),
    Util.notNullStr(json['song_name']),
    Util.notNullStr(json['singer_tag']),
  );
}

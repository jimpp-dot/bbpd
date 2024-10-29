import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'juke_music_beans.g.dart';

/// 点唱礼金设置
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class JukeMusicGiftSetting {
  final int giftId;
  final String giftName;
  @JsonKey(fromJson: Util.getRemoteImgUrl)
  final String giftIcon;
  final String giftType;
  final int giftPrice;
  final int giftCount;
  final int min;
  final int max;

  JukeMusicGiftSetting(this.giftId, this.giftName, this.giftIcon, this.giftType,
      this.giftPrice, this.giftCount, this.min, this.max);

  factory JukeMusicGiftSetting.fromJson(Map<String, dynamic> json) =>
      _$JukeMusicGiftSettingFromJson(json);
}

/// 我的歌单列表数据
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class JukeMyMusicData {
  final List<JukeMusic> songList;
  final List<JukeMusicGiftSetting> settingList;

  JukeMyMusicData(this.songList, this.settingList);

  factory JukeMyMusicData.fromJson(Map<String, dynamic> json) =>
      _$JukeMyMusicDataFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class JukeMusic {
  final int id;
  final String songName;
  final orderCount;
  bool hot;

  JukeMusic(this.id, this.songName, this.orderCount, this.hot);

  factory JukeMusic.fromJson(Map<String, dynamic> json) =>
      _$JukeMusicFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class JukeMusicUser {
  final String name;
  final int uid;
  @JsonKey(fromJson: Util.getUserIconUrl)
  final String icon;
  final String desc;

  JukeMusicUser(this.name, this.uid, this.icon, this.desc);

  factory JukeMusicUser.fromJson(Map<String, dynamic> json) =>
      _$JukeMusicUserFromJson(json);
}

/// 用户可点唱歌单列表
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class JukeUserOrderList {
  final JukeMusicUser? singer; // 歌手信息
  final List<JukeMusic> list;

  JukeUserOrderList(this.singer, this.list); // 歌曲列表

  factory JukeUserOrderList.fromJson(Map<String, dynamic> json) =>
      _$JukeUserOrderListFromJson(json);
}

/// 订单确认页面
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class JukeOrderInfo {
  final JukeMusicOrder? singer;
  final JukeCharge? roomCharge;
  final JukeCharge? userCharge;
  final int totalPrice;

  JukeOrderInfo(this.singer, this.roomCharge, this.userCharge, this.totalPrice);

  factory JukeOrderInfo.fromJson(Map<String, dynamic> json) =>
      _$JukeOrderInfoFromJson(json);
}

/// 点歌订单歌曲信息
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class JukeMusicOrder {
  final int id; // 歌曲id
  final String songName; // 歌曲名称
  final int uid; // 歌手uid
  final String name; // 歌手名称
  @JsonKey(fromJson: Util.getUserIconUrl)
  final String icon;

  JukeMusicOrder(
      this.id, this.songName, this.uid, this.name, this.icon); // 歌手icon

  factory JukeMusicOrder.fromJson(Map<String, dynamic> json) =>
      _$JukeMusicOrderFromJson(json);
}

/// 房间礼金、点歌费用model
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class JukeCharge extends JukeMusicGiftSetting {
  final int totalPrice;
  final int uid;

  JukeCharge(int giftId, String giftName, String giftIcon, String giftType,
      int giftPrice, int giftCount, int min, int max, this.totalPrice, this.uid)
      : super(giftId, giftName, giftIcon, giftType, giftPrice, giftCount, min,
            max);

  factory JukeCharge.fromJson(Map<String, dynamic> json) =>
      _$JukeChargeFromJson(json);
}

/// 待唱歌单
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class JukeWaitMusicData {
  final JukePlaySong? playingSong;
  final List<JukePlaySong> planSongs;
  final int more;

  JukeWaitMusicData(this.playingSong, this.planSongs, this.more);

  factory JukeWaitMusicData.fromJson(Map<String, dynamic> json) =>
      _$JukeWaitMusicDataFromJson(json);
}

/// 待唱歌单-歌曲
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class JukePlaySong {
  final int id;
  final int orderUid;
  final String orderName;
  @JsonKey(fromJson: Util.getUserIconUrl)
  final String orderIcon;
  final int singerUid;
  final String singerName;
  @JsonKey(fromJson: Util.getUserIconUrl)
  final String singerIcon;
  final String songName;
  final String lastSongs;
  @JsonKey(fromJson: Util.getUserIconUrl)
  final String singerTag;

  JukePlaySong(
      this.id,
      this.orderUid,
      this.orderName,
      this.orderIcon,
      this.singerUid,
      this.singerName,
      this.singerIcon,
      this.lastSongs,
      this.songName,
      this.singerTag);

  factory JukePlaySong.fromJson(Map<String, dynamic> json) =>
      _$JukePlaySongFromJson(json);
}

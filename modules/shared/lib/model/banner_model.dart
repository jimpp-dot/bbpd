import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
part 'banner_model.g.dart';

/// 运营活动banner位
@JsonSerializable(createToJson: false)
class BannerModel {
  static const String position_friend_tab = 'friend_tab';
  static const String position_topic_tab = 'topic_tab';
  static const String position_song_tab = 'studio';

  /// 录音棚

  /// Banner ID
  @JsonKey(name: 'id', fromJson: Util.parseInt)
  final int id;
  @JsonKey(name: 'app_id', fromJson: Util.parseStr)
  final String appId;
  @JsonKey(name: 'type', fromJson: Util.parseStr)
  final String type;
  @JsonKey(name: 'stype', fromJson: Util.parseStr)
  final String stype;
  @JsonKey(name: 'position', fromJson: Util.parseStr)
  final String position;
  final String title;
  @JsonKey(name: 'image', fromJson: Util.getRemoteImgUrl)
  final String image;
  final String url;
  final String data;
  @JsonKey(name: 'ordering', fromJson: Util.parseInt)
  final int ordering;
  @JsonKey(name: 'deleted', fromJson: Util.parseInt)
  final int deleted;
  @JsonKey(name: 'begin_time', fromJson: Util.parseInt)
  final int beginTime;
  @JsonKey(name: 'end_time', fromJson: Util.parseInt)
  final int endTime;
  @JsonKey(name: 'dateline', fromJson: Util.parseInt)
  final int dateline;
  @JsonKey(name: 'role', fromJson: Util.parseInt)
  final int role;
  @JsonKey(name: 'cid', fromJson: Util.parseInt)
  final int cid;
  @JsonKey(name: 'duration', fromJson: Util.parseInt)
  final int duration;
  @JsonKey(name: 'room_type', fromJson: Util.parseInt)
  final int roomType;
  @JsonKey(name: 'room_ids', fromJson: Util.parseStr)
  final String roomIds;
  @JsonKey(name: 'settlement_channel', fromJson: Util.parseStr)
  final String settlementChannel;
  @JsonKey(ignore: true)
  bool hasReport = false;

  BannerModel(
      this.id,
      this.appId,
      this.type,
      this.stype,
      this.position,
      this.title,
      this.image,
      this.url,
      this.data,
      this.ordering,
      this.deleted,
      this.beginTime,
      this.endTime,
      this.dateline,
      this.role,
      this.cid,
      this.duration,
      this.roomType,
      this.roomIds,
      this.settlementChannel);

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);

  /// 获取Banner列表
  static Future<List<BannerModel>> loadBanners(String position) async {
    String url = '${System.domain}banner/show?version=4';
    try {
      XhrResponse response =
          await Xhr.postJson(url, {'position': position}, throwOnError: true);
      DataRsp<List<BannerModel>> resp =
          DataRsp<List<BannerModel>>.fromXhrResponse(
              response,
              (object) => Util.parseList(object,
                  (e) => BannerModel.fromJson(e as Map<String, dynamic>)));

      /// Log.d('loadBanners， size: ${resp?.data?.length}');
      return resp.data ?? [];
    } catch (e) {
      return [];
    }
  }
}

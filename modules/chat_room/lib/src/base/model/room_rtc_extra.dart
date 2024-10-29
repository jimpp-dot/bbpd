import 'package:shared/shared.dart';

class RoomRtcExtra {
  final List<RoomRtcExtraStream> extraList;

  RoomRtcExtra({required this.extraList});

  factory RoomRtcExtra.fromJson(Map<String, dynamic> json) {
    return RoomRtcExtra(
      extraList: Util.parseList(
          json["extra_list"], (e) => RoomRtcExtraStream.fromJson(e)),
    );
  }
}

class RoomRtcExtraStream {
  static const micOpen = 1;
  static const micClose = 2;

  int rid;
  int uid;
  String? streamID;

  /// 麦克风状态，1：开麦：2关麦.
  int mic;

  /// room连房策略,stream,单拉流形式
  String? zegoLinkType;

  RoomRtcExtraStream({
    required this.rid,
    required this.uid,
    required this.mic,
    this.streamID,
    this.zegoLinkType,
  });

  factory RoomRtcExtraStream.fromJson(Map<String, dynamic> json) {
    return RoomRtcExtraStream(
      rid: Util.parseInt(json["rid"]),
      uid: Util.parseInt(json["uid"]),
      mic: Util.parseInt(json["mic"]),
      streamID: Util.notNullStr(json["stream_id"]),
      zegoLinkType: Util.notNullStr(json["zego_link_type"]),
    );
  }

  @override
  String toString() {
    return 'RoomRtcExtraStream{rid: $rid, uid: $uid, mic: $mic}';
  }
}

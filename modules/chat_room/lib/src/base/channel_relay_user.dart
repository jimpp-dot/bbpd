import 'package:chat_room/src/live/live_pk_config_v3.dart';
import 'package:chat_room/src/protobuf/generated/room_cross_pk.pb.dart';

/// 跨房连麦用户信息
class ChannelRelayUser {
  final int uid;
  final int rid;
  final int mic;

  /// 用户是否被禁麦: //1开麦 2关麦

  ChannelRelayUser.fromLivePKUserOnMicItem(LivePKUserOnMicItem item)
      : uid = item.uid,
        rid = item.rid,
        mic = item.mic;

  ChannelRelayUser.fromRoomCrossPkRoleInfo(RoomCrossPkRoleInfo item)
      : uid = item.uid,
        rid = item.rid,
        mic = item.micStatus;
}

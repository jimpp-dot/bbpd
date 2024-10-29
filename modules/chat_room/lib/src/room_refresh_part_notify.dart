import 'dart:typed_data';

import 'package:shared/shared.dart';
import 'package:chat_room/src/base/widget/room_vap_overlay.dart';
import 'package:chat_room/src/base/widget/topLive.dart';
import 'package:chat_room/src/protobuf/generated/game_laya_wolf.pb.dart';
import 'package:chat_room/src/protobuf/generated/room.refresh.mic.on.pb.dart';
import 'package:chat_room/src/protobuf/generated/room.refresh.wait.mic.pb.dart';
import 'package:chat_room/src/protobuf/generated/room_effect.pb.dart';

import '../chat_room.dart';

class RoomRefreshPartNotify {
  static const String Room_Refresh_Mic_On = 'Room.Refresh.Mic.On'; // 麦上信息 刷新
  static const String Room_Refresh_Wait_Mic =
      'Room.Refresh.Wait.Mic'; //  排麦信息 刷新
  static const String ROOM_EFFECT_COMMON_VAP =
      'Room.Effect.Common.Vap'; //  通用的房间vap动画
  /// 房间公屏Tab信息刷新
  static const String Room_Drainage_Refresh = 'room.drainage.refresh';

  /// 大小房入口，新增或关闭

  static const String Room_Drainage_Event = 'room.drainage.event';

  static const String Game_Laya_Wolf_Update_Mic = 'games.room.wolf.update.mic';

  late ChatRoomData _room;

  RoomRefreshPartNotify(ChatRoomData room) {
    _room = room;
    _init();
  }

  void _init() {}

  void dispose() {}

  bool handleInner(String socketName, Uint8List? buffer) {
    switch (socketName) {
      case Room_Refresh_Mic_On:
        _onEventMicOn(buffer);
        return true;
      case Room_Refresh_Wait_Mic:
        _onEventWaitMic(buffer);
        return true;
      case ROOM_EFFECT_COMMON_VAP:
        _onEventEffectCommonVap(buffer);
        return true;
      case Room_Drainage_Refresh:
        _onEventDrainageRefresh(buffer);
        return true;
      case Room_Drainage_Event:
        _onEventDrainageEvent(buffer);
        return true;
      case Game_Laya_Wolf_Update_Mic:
        _onEventGameLayaWolfUpdateMic(buffer);
        return true;
      default:
        break;
    }
    return false;
  }

  /// 麦上 信息
  void _onEventMicOn(Uint8List? value) async {
    Log.d("RoomRefreshPartNotify => _onEventMicOn");
    if (value != null) {
      MicOnUserList data = MicOnUserList.fromBuffer(value);
      List<RoomPosition> positions = data.onMicList
          .map(
            (item) => RoomPosition.fromJson(
              _room.config?.game,
              item.toProto3Json() as Map,
              _room.getGlobalKey(item.position),
              factoryType: _room.config?.factoryType,
            ),
          )
          .toList();
      _room.onMicOnListChanged(data.type, positions);
    }
  }

  /// 排麦 信息
  void _onEventWaitMic(Uint8List? value) {
    Log.d("RoomRefreshPartNotify => _onEventWaitMic");
    if (value != null) {
      WaitMic data = WaitMic.fromBuffer(value);
      Log.d("RoomRefreshPartNotify => _onEventWaitMic data: $data");
      _room.onWaitChanged(data.wait);
      _room.onWaitForBossChanged(data.waitForBoss);
      _room.onWaitForAuctionChanged(data.waitForAuction);
    }
  }

  /// VAP 通用动画
  void _onEventEffectCommonVap(Uint8List? value) {
    Log.d("RoomRefreshPartNotify => _onEventEffectCommonVap");
    if (value != null) {
      IconVapEffect data = IconVapEffect.fromBuffer(value);
      Log.d("RoomRefreshPartNotify => _onEventEffectCommonVap data: $data");

      /// 播放VAP动画
      if (data.url.isNotEmpty && data.size > 0) {
        RoomVapOverlay.show(
          context: System.context,
          vapUrl: data.url,
          vapSize: data.size,
          textList: data.contents,
          imageList: data.images,
        );
      }
    }
  }

  /// 房间公屏Tab刷新
  void _onEventDrainageRefresh(Uint8List? value) {
    if (value == null) return;
    _room.onEventDrainageRefresh(value);
  }

  /// 大小房入口，新增或关闭
  void _onEventDrainageEvent(Uint8List? value) {
    if (value == null) return;
    _room.onEventDrainageEvent(value);
  }

  /// laya狼人杀房小窗后处理麦位
  void _onEventGameLayaWolfUpdateMic(Uint8List? value) {
    if (value == null) return;
    if (ChatRoomUtil.isLayaWolf(_room.config) && TopLiveTool.isShowing) {
      //laya-wolf房型 且 在小窗
      GamesWolfUpdateMicMessage gamesWolfUpdateMicMessage =
          GamesWolfUpdateMicMessage.fromBuffer(value);
      if (System.debug) {
        Log.d(
            'gamesWolfUpdateMicMessage=${gamesWolfUpdateMicMessage.toString()}');
      }
      bool flag = false;
      if (gamesWolfUpdateMicMessage.status.isNotEmpty) {
        GamesWolfUpdateMicMessage_Status? status = gamesWolfUpdateMicMessage
            .status
            .firstWhereOrNull((element) => element.uid == Session.uid);
        if (status != null) {
          flag = true;
          int speak = status.speak;
          if (speak == 1) {
            //可说话,开麦
            if (_room.mute) {
              //如果当前闭麦了,开麦
              if (ChatRoomUtil.isUidOnPosition(Session.uid)) {
                //在麦上
                _room.setMute(false);
              }
            }
          } else if (speak == 2) {
            //不可说话,闭麦
            if (!_room.mute) {
              //如果当前开麦了,闭麦
              _room.setMute(true);
            }
          }

          int listen = status.listen;
          if (listen == 1) {
            //可听
            _room.rtcController.engine?.muteAllRemoteAudioStreams(false);
          } else if (listen == 2) {
            //不可听
            _room.rtcController.engine?.muteAllRemoteAudioStreams(true);
          }
        }
      }
      // 观众
      if (!flag && !ChatRoomUtil.isUidOnPosition(Session.uid)) {
        //用户不在麦位上且该用户没在上面数据处理过
        if (gamesWolfUpdateMicMessage.audienceStatus == 1) {
          // 可听
          _room.rtcController.engine?.muteAllRemoteAudioStreams(false);
        } else if (gamesWolfUpdateMicMessage.audienceStatus == 2) {
          // 不可听
          _room.rtcController.engine?.muteAllRemoteAudioStreams(true);
        }
      }
    }
  }
}

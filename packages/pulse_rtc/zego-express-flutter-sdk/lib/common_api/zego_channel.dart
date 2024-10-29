import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:zego_express_engine/zego_express_engine.dart';
import 'zego_engine.dart';

/// 即构的多房间
/// 同一用户可以同时加入多个房间，目前可进入的总房间数最多为两个。用户加入房间后，
/// 只能在主房间中推流，但可以在所有房间中拉流，并且可以正常接收每个房间的信令和回调。
///
/// https://doc-zh.zego.im/article/4799
///
class ZegoMultiRoom implements RtcMultiChannel {
  String? roomID;
  String? _mainRoomToken;
  ZegoRoomState? roomState;
  final ZegoEngine _zegoEngine;

  ZegoExpressEngine get _engine => ZegoExpressEngine.instance;

  ZegoMultiRoom(this._zegoEngine);

  bool? muteAllRemoteAudio;

  int _volume = 80;

  Future<void> initData(String roomID, String mainToken) async {
    if (roomID != roomID) {
      rtcLog('ZegoMultiRoom roomID changed,preId=$roomID,targetId=$roomID,destroy');
      await destroy();
    }
    roomID = roomID;
    _mainRoomToken = mainToken;
  }

  @override
  Future<void> destroy() async {
    if (roomID == null) {
      return;
    }
    await ZegoExpressEngine.instance.logoutRoom(roomID!);
    roomID = null;
    _mainRoomToken = null;
    roomState = null;
    return;
  }

  @override
  Future<void> joinChannel(String token, String optionalInfo, int optionalUid, ChannelMediaOptions options) async {
    if (roomID == null || _mainRoomToken == null) {
      rtcLog('ZegoMultiRoom joinChannel param is null,just return,channel->$roomID,mainToken->$_mainRoomToken');
      return;
    }
    if (roomState == ZegoRoomState.Connecting || roomState == ZegoRoomState.Connected) {
      rtcLog('ZegoMultiRoom joinChannel already in room->$roomID,just return.');
      return;
    }
    ZegoUser user = ZegoUser.id('$optionalUid');
    var config = ZegoRoomConfig.defaultConfig();
    config.isUserStatusNotify = true;
    // Zego 使用主房间的Token加入其它房间
    config.token = _mainRoomToken!;
    rtcLog('ZegoMultiRoom joinChannel loginMultiRoom optionalUid->$optionalUid,channel->$roomID,mainToken->$_mainRoomToken');
    await ZegoExpressEngine.instance.loginRoom(roomID!, user, config: config);
    if (options.autoSubscribeAudio == false) {
      muteAllRemoteAudio = true;
    }
    return;
  }

  @override
  Future<void> leaveChannel() async {
    if (roomID != null) {
      rtcLog('ZegoMultiRoom leaveChannel channel->$roomID');
      await ZegoExpressEngine.instance.logoutRoom(roomID!);
      roomID = null;
      _mainRoomToken = null;
    }
    return;
  }

  @override
  Future<void> muteAllRemoteAudioStreams(bool muted) async {
    if (roomID == null) return;
    muteAllRemoteAudio = muted;
    rtcLog('ZegoMultiRoom muteAllRemoteAudioStreams muted=$muted,channel->$roomID');
    _zegoEngine.getRoomStream(roomID!).forEach((element) {
      _engine.mutePlayStreamAudio(element.streamID, muted);
    });
  }

  /// Zego 目前只能拉流
  @override
  Future<void> setClientRole(ClientRole role) async {
    return;
  }

  @override
  Future<void> adjustPlaybackSignalVolume(int volume) async {
    _volume = volume;
    if (roomID == null) return;
    rtcLog('ZegoMultiRoom adjustPlaybackSignalVolume volume=$volume');
    _zegoEngine.getRoomStream(roomID!).forEach((element) {
      _engine.setPlayVolume(element.streamID, volume);
    });
    return;
  }

  @override
  int getPlaybackSignalVolume() {
    return _volume;
  }

  @override
  Future<void> muteRemoteAudioStream(int uid, bool muted) async {
    await _zegoEngine.muteRemoteAudioStream(uid, muted);
    return;
  }
}

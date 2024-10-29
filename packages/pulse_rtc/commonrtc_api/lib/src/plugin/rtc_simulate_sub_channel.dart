import '../bean/beans.dart';
import 'rtc_speaker.dart';
import '../rtc_api.dart';
import '../rtc_engine.dart';
import '../util/log.dart';

class RtcSimulateSubChannel implements RtcSimulateChannelInterface {
  late final RtcEngine _rtcEngine;
  late final RtcSpeaker _rtcSpeaker;

  RtcSimulateSubChannel(RtcEngine rtcEngine, RtcSpeaker rtcSpeaker)
      : _rtcEngine = rtcEngine,
        _rtcSpeaker = rtcSpeaker;

  SubChannel? _pubChannel;

  List<SubChannel> _privateChannels = [];

  @override
  Future<void> setSubPubChannel(SubChannel pubChannel) {
    _pubChannel = pubChannel;
    return Future.value(null);
  }

  Future<void> unMutePubChannel() async {
    rtcLog('sync sub channel unMutePubChannel=$_pubChannel');
    _pubChannel?.uids.where((e) => e > 0).forEach((uid) {
      /// 如果用户在麦位上且被屏蔽，解除屏蔽
      if (_rtcSpeaker.mutedUserIds.contains(uid)) {
        _rtcEngine.muteRemoteAudioStream(uid, false).then((ret) {
          if (ret == 0) {
            _rtcSpeaker.removeMutedUserId(uid);
          }
        });
      }
    });
    return;
  }

  @override
  Future<void> setSubPrivateChannel(List<SubChannel>? subChannels) async {
    _privateChannels = subChannels ?? [];
    return;
  }

  @override
  Future<void> syncSubChannelStreamState() async {
    rtcLog('sync sub channel _pubChannel=$_pubChannel');
    rtcLog('sync sub channel _privateChannels=$_privateChannels');
    bool noPrivate = _privateChannels.isEmpty;
    int currentUid = _rtcEngine.useDelegate?.uidFuc?.call() ?? 0;

    /// 没有子频道
    if (noPrivate || currentUid == 0) {
      await unMutePubChannel();
    } else {
      for (int index = 0; index < _privateChannels.length; index++) {
        var channel = _privateChannels[index];

        // 当前用户在子频道,默认子频道配置
        if (channel.uids.contains(currentUid)) {
          // 在子频道里
          // 屏蔽了公有频道
          if (!channel.listenPub) {
            _pubChannel?.uids.where((uid) => uid > 0 && !channel.uids.contains(uid)).forEach((uid) {
              rtcLog('sync sub channel un mute uid=$uid');

              _rtcEngine.muteRemoteAudioStream(uid, true).then((ret) {
                _rtcSpeaker.addMutedUserId(uid);
              });
            });
          } else {
            // 需要收听公有频道
            _pubChannel?.uids.where((uid) => uid > 0 && _rtcSpeaker.mutedUserIds.contains(uid)).forEach((uid) {
              rtcLog('sync sub channel mute uid=$uid');

              _rtcEngine.muteRemoteAudioStream(uid, false).then((ret) {
                _rtcSpeaker.removeMutedUserId(uid);
              });
            });
          }

          /// 收听同频道用户
          for (var uid in channel.uids) {
            if (_rtcSpeaker.mutedUserIds.contains(uid)) {
              rtcLog('unmute my channel uid =$uid');

              _rtcEngine.muteRemoteAudioStream(uid, false).then((ret) {
                _rtcSpeaker.removeMutedUserId(uid);
              });
            }
          }
        } else {
          rtcLog('sync sub channel  not in channel');

          /// 只针对不在公麦，并且设置不听公麦的用户，屏蔽不是自己频道里面的音频
          channel.uids.where((uid) => !channel.listenPub && _pubChannel != null && !_pubChannel!.uids.contains(uid)).forEach((uid) {
            rtcLog('mute not in private channel uid = $uid');

            _rtcEngine.muteRemoteAudioStream(uid, true).then((ret) {
              if (ret == 0) {
                _rtcSpeaker.addMutedUserId(uid); //存储被屏蔽的用户id
              }
            });
          });
        }
      }
    }
  }
}

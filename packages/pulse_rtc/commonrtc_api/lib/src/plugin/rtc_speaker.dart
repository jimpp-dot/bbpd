import 'dart:async';

import '../bean/beans.dart';
import '../rtc_engine.dart';
import '../util/log.dart';

class RtcSpeaker {
  static const bool debug = false;

  RtcEngine engine;

  Timer? _speakerTimer;
  static const int _speakerTimeOutPeriod = 500;

  Map<int, bool> _speakers = {};
  final Map<int, int> _speakersWithTime = {};

  /// 记录上一次的发言时间，用于筛选出持续低音量的用户（也作为正在发言的用户）
  final Map<int, int> _speakersWithLastTime = {};

  bool _cancel = false;

  Map<int, bool> get speakers => _speakers;

  Map<int, int> get speakersWithTime => _speakersWithTime;

  final Set<int> _mutedUserIds = {}; //因为卡麦被禁止接受音频的id

  Set<int> get mutedUserIds {
    return _mutedUserIds;
  }

  addMutedUserId(int id) {
    _mutedUserIds.add(id);
  }

  removeMutedUserId(int id) {
    _mutedUserIds.remove(id);
  }

  RtcSpeaker(this.engine);

  void release() {
    cancelSpeakerTimer();
    _speakers.clear();
    _speakersWithTime.clear();
    _speakersWithLastTime.clear();
    _mutedUserIds.clear();
  }

  cancelSpeakerTimer() {
    _speakerTimer?.cancel();
    _cancel = true;
  }

  startSpeakerTimer() {
    _speakerTimer?.cancel();
    _speakerTimer = Timer.periodic(const Duration(milliseconds: _speakerTimeOutPeriod), _onSpeakerTick);
    _cancel = false;
  }

  _onSpeakerTick(Timer timer) {
    if (debug) {
      rtcLog('RtcSpeaker ------ _onSpeakerTimeout method ------');
    }
    if (!timer.isActive) return;
    if (_cancel == true) return;

    engine.useDelegate?.speakerTickCallback?.call(_speakerTimeOutPeriod);

    int now = DateTime.now().millisecondsSinceEpoch;
    Map<int, bool> res = {};
    _speakersWithTime.forEach((int uid, int time) {
      if (now - time < 1500) {
        res[uid] = true;
      }
    });
    List<int> resList = res.keys.toList();
    resList.sort();

    List<int> speakersList = _speakers.keys.toList();
    speakersList.sort();

    if (resList.join(',') == speakersList.join(',')) {
      return;
    }

    _speakers = res;
    if (debug) {
      rtcLog('RtcSpeaker _onSpeakerTimeout _speakers->$_speakers');
    }

    engine.useDelegate?.speakersChange?.call();
  }

  void handlerAudioVolumeCallback(List<AudioVolumeInfo> speakers, int totalVolume) {
    int length = speakers.length;
    int now = DateTime.now().millisecondsSinceEpoch;

    for (int i = 0; i < length; i++) {
      AudioVolumeInfo item = speakers.elementAt(i);
      if (debug) {
        rtcLog('RtcSpeaker ------ AudioVolumeCallback item$i.uid=${item.uid},volume=${item.volume}');
      }
      if (item.volume >= 4) {
        bool speaking = false;

        if (item.volume >= 8) {
          // 大于8直接认为是说话状态
          speaking = true;
        } else {
          // [4,8),需要看是否持续说话，持续音量大于4认为是说话
          if (_speakersWithLastTime[item.uid] != null && now - _speakersWithLastTime[item.uid]! < 1000) {
            speaking = true;
          }
        }

        // 音量大于10的记录下来
        _speakersWithLastTime[item.uid] = now;

        if (!speaking) {
          continue;
        }
        bool needNotify = false;
        //本地用户说话
        if (item.uid == 0) {
          if ((engine.useDelegate?.uidFuc != null)) {
            _speakersWithTime[engine.useDelegate!.uidFuc!.call()] = now;
          }
          needNotify = true;
        } else if (engine.useDelegate?.canSpeak != null) {
          // 业务层面：当前用户是否可以讲话
          if (engine.useDelegate?.canSpeak?.call(item.uid) == true) {
            if (debug) {
              rtcLog('RtcSpeaker ------ AudioVolumeCallback item$i.uid=${item.uid},volume=${item.volume},isSpeaker true');
            }
            _speakersWithTime[item.uid] = now;
            needNotify = true;
          } else {
            if (debug) {
              rtcLog('RtcSpeaker ------ AudioVolumeCallback ghost item$i.uid=${item.uid},volume=${item.volume}');
            }

            /// 可能是一个幽灵麦
            engine.muteRemoteAudioStream(item.uid, true).then((ret) {
              if (ret == 0) {
                _mutedUserIds.add(item.uid); //存储被屏蔽的用户id
              }
            });
          }
        }
        if (debug) {
          rtcLog(
              'RtcSpeaker ------ AudioVolumeCallback item$i.uid=${item.uid},volume=${item.volume},needNotify=$needNotify,_speakersWithTime=$_speakersWithTime');
        }
        if (needNotify) {
          engine.useDelegate?.talking?.call(item.uid, item.volume, now, item.vad);
        }
      }
    }
  }

  /// 恢复被静音的用户的
  recoverMutedUserList(List<int>? uidList) {
    uidList?.forEach((id) {
      recoverMutedUser(id);
    });
  }

  /// 恢复被静音的用户的
  void recoverMutedUser(int id, {bool? force = false}) {
    if (_mutedUserIds.contains(id) || force == true) {
      engine.muteRemoteAudioStream(id, false).then((ret) {
        if (ret == 0) {
          _mutedUserIds.remove(id);
        }
      });
    }
  }
}

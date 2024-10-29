import '../bean/beans.dart';
import '../bean/enums.dart';
import '../rtc_engine.dart';
import '../util/log.dart';
import 'package:audio_volume_prob/audio_volume_prob.dart';

class RtcVad {
  static const _volumeIndicationInterval = 500;

  final RtcEngine _engine;

  RtcVad(this._engine);

  /// 语音活动检测(Voice Activity Detection,VAD)
  /// 是否启用vad
  bool vadEnabled = false;

  int vadInterval = 60; //多少秒静音之后关闭声网录音开启vad

  /// 为true表示开麦时因为检测不到语音而关闭的声网上行语音流
  bool _streamMuted = false;

  /// 表示开麦时连续检测不到语音的次数
  int _vadZeroCount = 0;

  final bool _vadTestMode = false;
  int _vadValidCount = 0;

  void _startVad() async {
    if (!vadEnabled) return;
    if (_vadTestMode) {
      _vadValidCount = 0;
    }
    AudioVolumeProb.onVadUpdated = _onVadUpdated;
    AudioVolumeProb.start();
  }

  /// vad: 0表示未检测到人声，1表示检测到，-1表示检测失败，应立即停止检测
  void _onVadUpdated(int vad) async {
    if (_vadTestMode) {
      if (vad == 1) {
        _vadValidCount++;
        if (_vadValidCount == 50) {
          vad = 1;
          _vadValidCount = 0;
        } else {
          vad = 0;
        }
      }
    }
    if (!vadEnabled) return;
    print('RtcVad._onVadUpdated vad = $vad');
    if (_streamMuted && vad != 0 && (_engine.useDelegate?.isMic ?? false)) {
      stopVad();
      rtcLog('RtcVad. human voice ClientRole->Broadcaster');
      await _engine.changeVadClientRole(ClientRole.Broadcaster);
      _streamMuted = false;
    }
  }

  void stopVad() async {
    if (!vadEnabled) return;
    _vadZeroCount = 0;
    AudioVolumeProb.onVadUpdated = null;
    AudioVolumeProb.stop();
  }

  handleAudioVolumeIndication(AudioVolumeInfo? selfSpeaker) async {
    if (!vadEnabled || selfSpeaker == null) return;
    if (selfSpeaker.vad == 0) {
      _vadZeroCount++;
      rtcLog('RtcVad.handleAudioVolumeIndication : ${selfSpeaker.volume}, _vadZeroCount: $_vadZeroCount');
      var maxCount = vadInterval * 1000 / _volumeIndicationInterval;
      if (_vadZeroCount >= maxCount) {
        rtcLog('RtcVad. no human voice ClientRole->Audience');
        await _engine.changeVadClientRole(ClientRole.Broadcaster);
        _startVad();
        _streamMuted = true;
        _vadZeroCount = 0;
      }
    } else {
      _vadZeroCount = 0;
    }
  }
}

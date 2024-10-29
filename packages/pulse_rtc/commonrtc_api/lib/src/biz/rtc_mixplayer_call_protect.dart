import 'package:commonrtc_api/src/util/throttle.dart';

/// Agora保护逻辑:startAudioMixing，pause，resume 频繁调用保护，防止500ms内连续调用音频混流接口
/// 频繁调用会出现AudioMixingStateCode.Failed,errorCode=AudioMixingReason.TooFrequentCall错误.
mixin RtcMixPlayerCallProtect {
  final Throttle _playerFrequentThrottle = Throttle(duration: const Duration(milliseconds: 550));

  void rtcMixCall(Function func, {Function? preventFuc}) {
    _playerFrequentThrottle.call(func, preventFuc: preventFuc);
  }

  void rtcMixCallDestroy() {
    _playerFrequentThrottle.dispose();
  }
}

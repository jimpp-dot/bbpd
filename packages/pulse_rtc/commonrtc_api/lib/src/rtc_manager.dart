import 'bean/enums.dart';
import 'rtc_api.dart';

class RtcManager {
  static final RtcManager inst = RtcManager._();

  RtcManager._();

  static final Map<RtcEngineEnum, RtcEngineInterface> _rtcEngineMap = {};

  void registerRtcEngine(List<RtcEngineInterface> engineList) {
    for (var element in engineList) {
      _rtcEngineMap[element.getEnum()] = element;
    }
  }

  void unregisterRtcEngine(RtcEngineEnum name) {
    _rtcEngineMap.remove(name);
  }

  /// 包内访问，获取引擎使用 RtcEngine.get()
  RtcEngineInterface? getRtcEngine(RtcEngineEnum name) {
    return _rtcEngineMap[name];
  }

  List<RtcEngineEnum> registeredEngine() {
    return _rtcEngineMap.keys.toList();
  }
}

import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';

class MomentRecordVoiceModel extends ChangeNotifier {
  static const String eventBarrageCancelRecord =
      "hisong_video_barrage_cancel_record";

  bool _visible = false;
  bool _fingerInRange = true;
  int _recordTimeS = 0;

  int _topicId = 0;
  int _topicUid = 0;
  int _seekBarChangedMs = 0;
  int _seekBarCurrent = 0;
  int _mediaDuration = 0;

  bool get visible => _visible;
  bool get fingerInRange => _fingerInRange;
  int get recordTimeS => _recordTimeS;

  int get topicId => _topicId;
  int get topicUid => _topicUid;
  int get seekBarChangedMs => _seekBarChangedMs;
  int get seekBarCurrent => _seekBarCurrent;
  int get mediaDuration => _mediaDuration;

  set visible(bool flag) {
    if (_visible != flag) {
      _visible = flag;

      if (!_visible) {
        _fingerInRange = true;
        _recordTimeS = 0;
      }

      _notify();
    }
  }

  set fingerInRange(bool flag) {
    if (_fingerInRange != flag) {
      _fingerInRange = flag;

      _notify();
    }
  }

  set recordTimeS(int time) {
    if (_recordTimeS != time) {
      _recordTimeS = time;

      _notify();
    }
  }

  void _notify() {
    if (hasListeners) {
      notifyListeners();
    }
  }

  void updateRecordConfigure(
      {required int topicId,
      required int topicUid,
      required int seekBarChangedMs,
      required int seekBarCurrent,
      required int mediaDuration}) {
    _topicId = topicId;
    _topicUid = topicUid;
    _seekBarChangedMs = seekBarChangedMs;
    _seekBarCurrent = seekBarCurrent;
    _mediaDuration = mediaDuration;
  }

  void cancelRecord() {
    eventCenter.emit(eventBarrageCancelRecord);
  }
}

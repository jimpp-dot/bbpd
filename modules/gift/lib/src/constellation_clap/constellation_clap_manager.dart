import 'dart:async';

import 'package:shared/shared.dart';
import 'package:gift/src/constellation_clap/constellation_clap_main_dialog.dart';
import 'package:gift/src/constellation_clap/constellation_clap_repo.dart';
import 'package:gift/src/constellation_clap/pb/generated/zodiac.pb.dart';
import 'package:gift/src/constellation_clap/resource_manager.dart';

// -1 初始可发起网络请求; 1 条件还不满足; 2 条件满足，可拍; 3. 已拍下; 4. 任务完成or过期;  5 条件不可能满足
const int _stateIdle = -1;
const int _stateCanClap = 2;
const int _stateClapDone = 3;
const int _stateTaskOver = 4;
const int _stateImpossible = 5;

class ConstellationClapManager {
  static const String eventFloatUpdateKey = 'constellation_clap_float_update';

  static ConstellationClapManager? _manager;
  static int _state = _stateIdle;

  Timer? _timer;
  bool _requesting = false;
  ZodiacPaiResultData? _resultData;

  static Future<void> init({bool firstLaunch = false}) async {
    if (firstLaunch) {
      _state = _readState();
      _manager?._timer?.cancel();
      _manager = ConstellationClapManager();
    }

    if (_state != _stateIdle) {
      return;
    }

    if (_manager?._timer?.isActive ?? false) {
      return;
    }

    _manager!._requestPopupData();
  }

  static ZodiacPaiResultData? getResultData() {
    return _manager?._resultData;
  }

  static void notifyHomeFloatUpdate(ZodiacPaiResultData? data) {
    _manager?._resultData = data;
    eventCenter.emit(eventFloatUpdateKey, data);
  }

  Future<void> _requestPopupData() async {
    if (_requesting) {
      return;
    }
    _requesting = true;
    final res = await ConstellationClapRepo.mainDialog();
    _requesting = false;

    if (res.success) {
      _state = res.data.state;
      if (_state == _stateCanClap) {
        _timer?.cancel();
        _timer = null;
        await ResourceManager.precache();
        if (res.data.delay > 0) {
          _timer =
              Timer(Duration(seconds: res.data.delay + 2), _requestPopupData);
          _state = _stateIdle;
        } else {
          if (!_readDialogShow()) {
            Future.delayed(const Duration(seconds: 2), () {
              ConstellationClapMainDialog.show(System.context, data: res.data);
              _writeDialogShow();
            });
          }
        }
      } else if (_state == _stateClapDone) {
        await ResourceManager.precache();
        _requestResultData();
      } else if (_state == _stateTaskOver || _state == _stateImpossible) {
        _writeState(_state);
      } else {
        _state = _stateIdle;
      }
    }
  }

  Future<void> _requestResultData() async {
    if (_requesting) {
      return;
    }
    _requesting = true;
    final res = await ConstellationClapRepo.resultDialog(mission: 0);
    _requesting = false;
    if (res.success) {
      notifyHomeFloatUpdate(res.data);
    } else {
      _state = _stateIdle;
    }
  }

  static int _readState() {
    return Config.getInt(
        'constellation_clap_state_${Session.uid}}', _stateIdle);
  }

  static void _writeState(int state) {
    Config.set('constellation_clap_state_${Session.uid}}', state.toString());
  }

  static bool _readDialogShow() {
    return Config.getBool('constellation_clap_dialog_show_${Session.uid}}');
  }

  static void _writeDialogShow() {
    Config.setBool('constellation_clap_dialog_show_${Session.uid}}', true);
  }
}

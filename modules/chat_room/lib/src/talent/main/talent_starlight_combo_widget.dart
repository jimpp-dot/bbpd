import 'package:flutter/cupertino.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/widget/gift_combo/combo_banner_widget.dart';
import 'package:chat_room/src/base/widget/gift_combo/model/combo_banner_model.dart';
import 'package:chat_room/src/talent/data/talent_models.dart';

import '../talent_constants.dart';

/// 星光礼物连击动画效果
class StarlightComboWidget extends StatefulWidget {
  final ChatRoomData room;

  const StarlightComboWidget({required this.room, super.key});

  @override
  _StarlightComboWidgetState createState() => _StarlightComboWidgetState();
}

class _StarlightComboWidgetState extends State<StarlightComboWidget>
    with WidgetsBindingObserver {
  /// UI视图使用到的data
  final List<ComboBanner> _data = <ComboBanner>[];

  /// 数据buff缓存data
  final List<ComboBanner> _buffer = <ComboBanner>[];

  final int _maxNum = 3;

  AppLifecycleState _appLifecycleState = AppLifecycleState.resumed;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    widget.room
        .addListener(RoomConstant.Event_Room_Combo_Gift, _handleComboGift);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    widget.room
        .removeListener(RoomConstant.Event_Room_Combo_Gift, _handleComboGift);
  }

  @override
  Widget build(BuildContext context) {
    // Log.d(TAG, 'build comboBanner->${_data.length}');
    if (_data.isEmpty) {
      return const SizedBox.shrink();
    }
    return IgnorePointer(
        child: ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 9.dp);
      },
      itemBuilder: (BuildContext context, int index) {
        var combo = _data[index];
        return ComboBannerWidget(
          key: ValueKey(combo.comboId),
          data: combo,
          onComplete: (co) {
            _deleteCombo(co);
          },
        );
      },
      itemCount: _data.length,
      addAutomaticKeepAlives: true,
    ));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _appLifecycleState = state;
    if (AppLifecycleState.resumed == _appLifecycleState &&
        _buffer.isNotEmpty &&
        _data.length < _maxNum) {
      _delayToPlay();
    }
  }

  _handleComboGift(String type, Object? da) async {
    Log.d(tag: TAG, 'msg--->1 combo gift _data=$da');
    try {
      var comboStar =
          da is Map ? ComboStarGift.fromJson(da as Map<String, dynamic>) : null;
      if (comboStar == null) {
        return;
      }

      var banner = convertComboBanner(comboStar);

      bool update = false;
      for (var combo in _data) {
        if (combo.comboId == banner.comboId) {
          combo.hitNum = banner.hitNum;
          update = true;
          break;
        }
      }

      if (_appLifecycleState == AppLifecycleState.resumed) {
        if (!update && _data.length < _maxNum) {
          _data.add(banner);
        }
        _notifyUI();
      } else {
        _buffer.add(banner);
      }

      // Log.d(TAG, 'msg--->2 combo gift comboBanner->$comboBanner');
    } catch (e) {
      Log.d(e);
    }
  }

  void _deleteCombo(ComboBanner banner) {
    if (_data.contains(banner)) {
      _data.remove(banner);
      if (_buffer.isNotEmpty &&
          _appLifecycleState == AppLifecycleState.resumed) {
        while (_data.length < _maxNum && _buffer.isNotEmpty) {
          _data.add(_buffer.removeAt(0));
        }
        _notifyUI();
      }
    }
  }

  _delayToPlay() async {
    _removeOutdatedDataFromBuffer(); //_buffer最多剩余_maxNum个
    if (_data.length == _maxNum) {
      return;
    }

    await Future.delayed(const Duration(milliseconds: 250));
    bool changed = false;

    List<ComboBanner> usedBufferItems = [];
    for (var item in _buffer) {
      if (_data.length < _maxNum) {
        usedBufferItems.add(item);
        _data.add(item);
        changed = true;
      }
    }
    for (var item in usedBufferItems) {
      _buffer.remove(item);
    }

    if (changed) {
      _notifyUI();
    }
  }

  void _removeOutdatedDataFromBuffer() {
    int now = DateTime.now().millisecondsSinceEpoch;
    _buffer.removeWhere((item) => now - item.localObjCreateTime >= 1000 * 30);

    if (_buffer.length > _maxNum) {
      _buffer.removeRange(0, _buffer.length - _maxNum);
    }
  }

  void _notifyUI() {
    if (mounted) setState(() {});
  }
}

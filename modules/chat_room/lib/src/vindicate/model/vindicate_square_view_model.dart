import 'package:chat_room/src/vindicate/model/vindicate_data.dart';
import 'package:chat_room/src/vindicate/model/vindicate_record_history.dart';
import 'package:flutter/cupertino.dart';

/// 表白广场ViewModel
class VindicateSquareViewModel extends ChangeNotifier {
  /// 是否只展示自己的礼物记录
  bool isShowMeGiftRecordOnly = false;

  /// 所有表白活动记录
  final VindicateRecordHistory<VindicateRecordData> _allRecordHistory =
      VindicateRecordHistory();

  /// 只有我自己的表白活动记录
  final VindicateRecordHistory<VindicateRecordData> _mineOnlyRecordHistory =
      VindicateRecordHistory(onlyMe: 1);

  /// 当前正在展示的记录
  late VindicateRecordHistory<VindicateRecordData> currentShowRecordHistory;

  VindicateSquareViewModel() {
    currentShowRecordHistory = _allRecordHistory;
  }

  /// 是否只展示自己的相关记录
  void actionForShowMeRecordOnly(bool isMeOnly) {
    isShowMeGiftRecordOnly = isMeOnly;

    /// 如果是之前没有加载过，则进行加载
    // if (isShowMeGiftRecordOnly) {
    //   if (_mineOnlyRecordHistory.length == 0) {
    //     _mineOnlyRecordHistory.refresh(false);
    //   }
    // } else {
    //   if (_allRecordHistory.length == 0) {
    //     _allRecordHistory.refresh(false);
    //   }
    // }

    currentShowRecordHistory =
        isShowMeGiftRecordOnly ? _mineOnlyRecordHistory : _allRecordHistory;
    currentShowRecordHistory.refresh();
    notifyListeners();
  }
}

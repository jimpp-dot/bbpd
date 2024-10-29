import 'package:chat_room/src/confess_v2/model/confess_v2_record_history.dart';
import 'package:flutter/cupertino.dart';

/// 恋爱头条ViewModel
class ConfessV2SquareViewModel extends ChangeNotifier {
  /// 所有表白活动记录
  final ConfessV2RecordHistory allRecordHistory = ConfessV2RecordHistory();

  /// 只有我自己的表白活动记录
  final ConfessV2RecordHistory mineOnlyRecordHistory =
      ConfessV2RecordHistory(onlyMe: 1);
}

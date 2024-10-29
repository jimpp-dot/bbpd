import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../gpk_constants.dart';
import '../gpk_helper.dart';
import '../model/gpk_model.dart';
import '../model/gpk_repo.dart';
import '../widget/best_sender_dialog.dart';
import '../widget/gpk_result_dialog.dart';
import '../widget/gpk_timer_picker.dart';

class GPKViewModel extends ChangeNotifier {
  late ChatRoomData _room;
  GPKRoomPkData? data;

  void init(ChatRoomData room) {
    _room = room;
    data = room.config?.gpkRoomPkData;
    _room.addListener('${RoomConstant.Event_Prefix}room.group.pk.new.result', _onResultEvent);
  }

  @override
  void dispose() {
    _room.removeListener('${RoomConstant.Event_Prefix}room.group.pk.new.result', _onResultEvent);
    _room.emit(RoomConstant.Event_Local_Punish_Refresh, null);
    super.dispose();
  }

  void _onResultEvent(String type, data) {
    if (data is Map) {
      GPKResultData gpkResultData = GPKResultData.fromJson(data);
      GPKResultDialog.show(context: Constant.context, room: _room, data: gpkResultData);
      if (gpkResultData.card?.uid == Session.uid) {
        BestSenderDialog.show(context: Constant.context, prop: gpkResultData.card!);
      }
    }
  }

  void refreshData(ChatRoomData room) {
    data = room.config?.gpkRoomPkData;
    // notifyListeners();
    // 更新语音惩罚
    GPKPosModel? posModel = getLeftSideData()?.list.firstWhereOrNull((e) => e.uid == Session.uid);
    posModel ??= getRightSideData()?.list.firstWhereOrNull((e) => e.uid == Session.uid);
    _room.emit(RoomConstant.Event_Local_Punish_Refresh, posModel?.getVoicePunish());
  }

  GPKSideData? getLeftSideData() {
    return data?.leftSide;
  }

  GPKSideData? getRightSideData() {
    return data?.rightSide;
  }

  GPKState? get state => data?.state;

  int? get rule => data?.pkRule;

  int remainingTime() {
    int time = 0;
    if (state == GPKState.pk_ing) {
      time = data?.pkTimeLeft ?? 0;
    } else if (state == GPKState.punish_ing) {
      time = data?.punishTimeLeft ?? 0;
    }
    return time;
  }

  /// 是否可以显示结束按钮，只有主持（接待）才显示
  bool isCreatorOrReception() {
    return GPKHelper.isCreatorOrReception(_room);
  }

  bool _isShowTimerPicker = false;
  List<int>? _minuteList;

  Future<void> onClickPkStatusWidget(BuildContext context) async {
    if (!isCreatorOrReception() || state != GPKState.pk_ing || _isShowTimerPicker) {
      return;
    }

    if (_minuteList == null) {
      var mList = <int>[];
      for (var i = 0, step = 1; i <= 10; i = i + step) {
        mList.add(i);
      }
      _minuteList = mList;
    }

    _isShowTimerPicker = true;
    GPKTimerResult? result =
        await showTimerPickerPopup(context: context, title: K.room_gpk_delay_timer_picker_title, minSecond: 10, minuteList: _minuteList);
    _isShowTimerPicker = false;
    if (result == null) {
      return;
    }

    var delayTime = Duration(seconds: result.second, minutes: result.minute).inSeconds;

    var resp = await GPKRepo.delayPk(_room.rid, Session.uid, delayTime);
    if (true == resp.success) {
      return;
    } else if (resp.msg?.isNotEmpty == true) {
      Fluttertoast.showToast(msg: resp.msg);
    }
  }

  // bool get showEnd => state == GPKState.pk_ing || state == GPKState.punish_ing;

  void endGPK(BuildContext context) {
    switch (state) {
      case GPKState.pk_ing:
        showEndPKDialog(context);
        break;
      case GPKState.punish_ing:
        showEndPunishDialog(context);
        break;
      default:
        showEndPKDialog(context); // 兼容异常状态
        break;
    }
  }

  Future<bool?> showEndPKDialog(BuildContext context) async {
    return await showDialog<bool>(
        context: context,
        builder: (context) {
          return ConfirmDialog(
            title: K.room_gpk_end_pk,
            width: 280,
            contentBuilder: (context) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    K.room_gpk_end_pk_content,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: R.color.secondTextColor,
                      fontSize: 14,
                    ),
                  ),
                ),
              );
            },
            positiveButton: PositiveButton(
              text: K.sure,
              onPressed: () async {
                var resp = await GPKRepo.endPk(_room.rid, Session.uid);
                if (true == resp.success) {
                  Navigator.of(context).pop(true);
                  return;
                } else if (resp.msg?.isNotEmpty == true) {
                  Fluttertoast.showToast(msg: resp.msg);
                }
                Navigator.of(context).pop(false);
              },
            ),
          );
        });
  }

  Future<bool?> showEndPunishDialog(BuildContext context) async {
    return await showDialog<bool>(
        context: context,
        builder: (context) {
          return ConfirmDialog(
            title: K.room_gpk_end_punish,
            content: K.room_gpk_end_punish_content,
            positiveButton: PositiveButton(
              text: K.sure,
              onPressed: () async {
                var resp = await GPKRepo.endPunish(_room.rid, Session.uid);
                if (true == resp.success) {
                  Navigator.of(context).pop(true);
                  return;
                } else if (resp.msg?.isNotEmpty == true) {
                  Fluttertoast.showToast(msg: resp.msg);
                }
                Navigator.of(context).pop(false);
              },
            ),
          );
        });
  }
}

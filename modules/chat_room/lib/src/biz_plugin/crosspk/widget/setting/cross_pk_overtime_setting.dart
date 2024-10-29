import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/crosspk/model/repo.dart';
import 'package:flutter/material.dart';

const _overtimeList = [3, 5, 10, 30]; // 加时时间，单位分钟

const _pkActionOvertime = 'pk_action_overtime'; // 加时
const _pkActionEnd = 'pk_action_end'; // 结束PK

/// 跨房PK加时设置
class CrossPKOvertimeSetting extends StatelessWidget {
  const CrossPKOvertimeSetting({Key? key}) : super(key: key);

  static Future show(BuildContext context, int rid) async {
    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return const CrossPKOvertimeSetting();
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }
    if (result.value == null) return;

    if (result.value?.key == _pkActionOvertime) {
      bool? sure = await showDialog(
        context: context,
        builder: (context) {
          return CustomAlertDialog(
            content: K.live_pk_overtime_apply_confirm_title,
            positiveButton: PositiveButton(text: K.send_apply),
            negativeButton: const NegativeButton(),
          );
        },
      );
      if (sure == true) {
        NormalNull resp = await CrossPKRepo.applyOvertime(
            rid, Util.parseInt(result.value?.extra ?? 0) * 60);
        if (resp.success) {
          Fluttertoast.showCenter(msg: K.cross_pk_overtime_success);
        }
      }
    } else if (result.value?.key == _pkActionEnd) {
      bool? sure = await showDialog(
          context: context,
          builder: (context) {
            return CustomAlertDialog(
              content: K.live_pk_end_apply_confirm_title,
              positiveButton: PositiveButton(text: K.send_apply),
              negativeButton: const NegativeButton(),
            );
          });
      if (sure == true) {
        NormalNull resp = await CrossPKRepo.applyEnd(rid);
        if (resp.success) {
          Fluttertoast.showCenter(msg: K.cross_pk_end_appy_success);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<SheetItem> res = [];

    for (var element in _overtimeList) {
      res.add(SheetItem(
          '$element${K.room_unit_minute}', _pkActionOvertime, element));
    }
    res.add(SheetItem(
        K.live_pk_over_now, _pkActionEnd, null, null, K.live_Pk_end_sub_desc));

    return RadioBottomSheet(title: K.live_pk_overtime_and_end, data: res);
  }
}

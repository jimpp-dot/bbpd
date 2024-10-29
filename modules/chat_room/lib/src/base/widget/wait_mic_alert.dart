import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/model/roomConstant.dart';
import 'package:chat_room/src/base/model/roomRepository.dart';
import 'package:chat_room/src/base/model/wait_mic_user.dart';

class WaitMicAlertDialog extends StatelessWidget {
  final WaitMicUserInfo waitMicUserInfo;

  const WaitMicAlertDialog({super.key, required this.waitMicUserInfo});

  @override
  Widget build(BuildContext context) {
    return ConfirmDialog(
      content: '${waitMicUserInfo.name}${K.ktv_apply_for_mic}',
      positiveButton: PositiveButton(
        text: BaseK.K.base_agree,
      ),
      negativeButton: NegativeButton(
        text: BaseK.K.refuse,
      ),
    );
  }

  static Future<void> show(BuildContext context, int rid) async {
    WaitMicUserListRsp rsp =
        await WaitMicRepository.getWaitList(rid, false, false);

    if (rsp.success &&
        rsp.waitMicUsers != null &&
        rsp.waitMicUsers!.isNotEmpty) {
      WaitMicUserInfo waitMicUserInfo = rsp.waitMicUsers![0];
      showDialog(
        context: context,
        builder: (_) => WaitMicAlertDialog(waitMicUserInfo: waitMicUserInfo),
      ).then((value) {
        if (value == true) {
          RoomRepository.joinMic(rid, -1,
              uid: waitMicUserInfo.uid, needCertify: false);
        } else if (value == false) {
          String url = '${System.domain}room/queue?version=2';
          Map<String, String> post = {
            'rid': '$rid',
            'uid': '${waitMicUserInfo.uid}',
            'position': RoomConstant.Queue_Quite.toString(),
          };
          Xhr.postJson(url, post);
        } else {
          // value为空
        }
      });
    }
  }
}

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import '../../../k.dart';

class InviteMicDialog {
  static const LOG_TAG = "InviteMicDialog";
  static bool isShow = false;

  static showInviteDialog(MicInviter micInviter) async {
    if (isShow) {
      Log.d('$LOG_TAG is show, do nothing');
      return;
    }

    isShow = true;

    bool? confirm = await showDialog(
        context: Constant.context,
        builder: (BuildContext context) {
          return ConfirmDialog(
            title: K.room_invite_mic_desc([micInviter.inviterName]),
            negativeButton: NegativeButton(
              text: K.room_invite_mic_no,
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            positiveButton: PositiveButton(
              text: K.room_invite_mic_yes,
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          );
        });

    await postInviteResult(micInviter, confirm);

    isShow = false;
  }

  static postInviteResult(MicInviter micInviter, bool? accept) async {
    if (accept == null) {
      return;
    }

    try {
      final postData = <String, String>{
        "rid": micInviter.rid.toString(),
        "accept_status": accept ? "1" : "0",
        "position": micInviter.position.toString(),
        "vrid": micInviter.vrid.toString(),
        "inviter_uid": micInviter.inviterUid.toString()
      };

      XhrResponse response = await Xhr.postJson(
          "${System.domain}room/acceptJoinMicro", postData,
          throwOnError: false);
      if (response.error != null) {
        Log.d("postInviteResult error and msg = ${response.error.toString()}",
            tag: LOG_TAG);
        return;
      }

      Map res = response.response as Map;
      if (!(res['success'] ?? false)) {
        Log.d("postInviteResult error and result flag = false", tag: LOG_TAG);
        return;
      }

      Log.d("postInviteResult success and joinMic start", tag: LOG_TAG);
      if (micInviter.vrid > 0) {
        /// todo
        return;
      }
      await RoomRepository.joinMic(
        micInviter.rid,
        micInviter.position,
        uid: Session.uid,
        inviterId: micInviter.inviterUid,
        needCertify: true,
        type: ChatRoomData.getInstance()?.needVerify ?? 0,
        newType: ChatRoomData.getInstance()?.needVerifyNew ?? 0,
      );
    } catch (e) {
      Log.d("postInviteResult error and result and has exception $e",
          tag: LOG_TAG);
    }
  }
}

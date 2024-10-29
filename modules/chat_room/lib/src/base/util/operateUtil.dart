import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/src/base/message/message_send_data.dart';
import 'package:chat_room/src/bonus/model/bonus_beans.dart';
import 'package:chat_room/src/bonus/model/bonus_model.dart';
import 'package:chat_room/src/bonus/model/bonus_repo.dart';
import 'package:chat_room/src/talent/data/talent_repo.dart';
import 'package:chat_room/src/talent/talent_helper.dart';
import '../../../chat_room.dart';
import 'package:provider/provider.dart' hide Selector;

///该类为一些通用操作
///
class OperateUtil {
  static OperateUtil? _instance;

  static OperateUtil getInstance() {
    return _instance ??= OperateUtil();
  }

  //房间-下麦
  micLeavel(int rid, [int uid = 0]) async {
    RoomRepository.leavelMic(rid, uid);
  }

  //房间-关房
  roomClose(int rid) async {
    RoomRepository.close(rid);
  }

  joinMic(int rid, int position, int uid, int needCertify,
      int needVerifyNew) async {
    RoomRepository.joinMic(rid, position,
        uid: uid, needCertify: true, type: needCertify, newType: needVerifyNew);
  }

  /// 检查auth
  ///
  /// 返回true，表示通过；否则，不通过
  static Future<bool> checkAuth(
      BuildContext context, ChatRoomData room, String refer) async {
    /// 是否需要验证， 0是不需要 1是本机验证，2是身份认证
    if (Utility.isNeedVerify(room.needVerify, room.needVerifyNew)) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      bool suc = await loginManager.openAuthDialog(context,
          type: room.needVerify, newType: room.needVerifyNew, refer: refer);
      if (suc == true) {
        /// 根据认证返回值更新状态
        room.needVerify = 0;
        room.needVerifyNew = 0;
      }
      return false;
    }
    return true;
  }

  /// 房间发送文本内容
  static Future<bool> sendText(
      BuildContext context, ChatRoomData? room, String value) async {
    bool result = false;
    if (room == null) return result;
    try {
      int isGuess = 0;
      if (room.config?.game == Games.Guess) {
        IDrawGuessManager? drawGuessManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_DRAW_GUESS);
        if (drawGuessManager?.isDrawing() ?? false) {
          isGuess = 1;
        }
      }

      result = (await room.sendMessage(value, MessageSendData.msgExtraJsonEncode(room, isGuess: isGuess))).success;

      if (result && room.config?.property != RoomProperty.virtual) {
        Tracker.instance.track(
          TrackEvent.room_public_chat,
          properties: {
            'rid': room.realRid,
            'msg_type': 'text',
            if (!Util.isNullOrEmpty(room.config?.typeName))
              'type_label': room.config?.typeName,
            if (!Util.isNullOrEmpty(room.config?.originalRFT))
              'room_factory_type': room.config?.originalRFT,
            if (!Util.isNullOrEmpty(room.config?.settlementChannel))
              'settlement_channel': room.config?.settlementChannel,
          },
        );

        //口令红包，发公屏时公屏内容与口令红包的口令一致，接口通知服务端
        BonusModel bonusModel = context.read<BonusModel>();
        BonusInfo? curBonus = bonusModel.value?.curBonus;
        if ((curBonus?.sign?.isNotEmpty ?? false) && curBonus?.sign == value) {
          BonusRepo.reportSign(curBonus!.id, room.rid, value);
        }

        if (ChatRoomUtil.isLiveTalent(room.config) &&
            TalentHelper.ifCanSendMsg()) {
          TalentRepo.sendChatMsg(rid: room.rid);
          TalentHelper.recordSendMsgTime();
        }
      }
    } catch (e) {
      //Toast.showCenter(Constant.context, e.message);
    }
    return result;
  }
}

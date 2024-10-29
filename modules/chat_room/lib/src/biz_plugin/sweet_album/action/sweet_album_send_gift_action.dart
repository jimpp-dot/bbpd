import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/sweet_album/pb/generated/sweet_album.pb.dart';
import 'package:flutter/material.dart';

mixin SweetAlbumSendGiftAction<T extends StatefulWidget> on State<T> {
  Future sendGift(int targetUid, SweetAlbumGiftItem gift, int giftNum,
      ValueChanged<int> onPayed,
      {ValueChanged<int>? onRoomSend}) async {
    int rid = await BaseRequestManager.getRoomId(targetUid);
    if (rid > 0 &&
        ChatRoomData.getInstance()?.rid != rid &&
        onRoomSend != null) {
      Navigator.pop(System.context);
      IRoomManager roomManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.openChatRoomScreenShow(
        System.context,
        rid,
        onPageLoad: () async {
          bool? result = await showDialog(
            context: System.context,
            builder: (context) => ConfirmDialog(
              title: K.room_notice,
              content: K.room_sweet_album_confirm_room_send,
              negativeButton: const NegativeButton(),
              positiveButton: const PositiveButton(),
            ),
          );
          if (result == true) {
            _doSendGift(targetUid, gift, giftNum, onRoomSend, rid);
          }
        },
      );
      return;
    }
    return _doSendGift(targetUid, gift, giftNum, onPayed, rid);
  }

  Future _doSendGift(int targetUid, SweetAlbumGiftItem gift, int giftNum,
      ValueChanged<int> onPayed, int rid) async {
    int price = gift.price;

    /// 先判断是否余额不足
    IPayManager payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    SheetCallback? result =
        await payManager.showRechargeSheet(System.context, price * giftNum);
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }

    payManager.pay(
      System.context,
      key: 'gift',
      type: result.value?.key ?? '',
      refer: 'gift',
      args: {
        'money': price * giftNum,
        'type': rid > 0 ? 'package' : 'chat-gift',
        'params': {
          'rid': rid,
          if (rid > 0) 'uids': '$targetUid',
          if (rid == 0) 'to': targetUid,
          'giftId': gift.giftId,
          'giftNum': giftNum,
          'price': price,
          'cid': 0,
          'ctype': '',
          'duction_money': 0,
          'version': 2,
          'num': giftNum,
          'gift_type': 'normal',
          'star': 0,
          'all_mic': 0,
          'sweet_album': 1,
        },
      },
      showLoading: true,
      onPayed: () {
        onPayed(giftNum);
        if (rid > 0) {
          if (ChatRoomData.getInstance()?.rid != rid) {
            IRoomManager roomManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_BASE_ROOM);
            roomManager.openChatRoomScreenShow(System.context, rid);
          }
        } else {
          IChatManager chatManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_CHAT);
          chatManager.openUserChatScreen(Constant.context,
              type: 'private', targetId: targetUid);
        }
      },
    );
  }
}

import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/sweet_album/action/sweet_album_send_gift_action.dart';
import 'package:chat_room/src/biz_plugin/sweet_album/pb/generated/sweet_album.pb.dart';
import 'package:chat_room/src/biz_plugin/sweet_album/widget/sweet_album_send_btn.dart';
import 'package:flutter/material.dart';

/// 甜蜜相册点击礼物弹窗
class SweetAlbumGiftDialog extends StatefulWidget {
  final int targetUid;
  final SweetAlbumGiftItem gift;
  final bool unlocked;
  final List<SweetAlbumNumConfig> numConfig;
  final ValueChanged<int> onRoomSend;

  const SweetAlbumGiftDialog(
      {super.key,
      required this.targetUid,
      required this.gift,
      required this.unlocked,
      required this.numConfig,
      required this.onRoomSend});

  static Future show(
      BuildContext context,
      int targetUid,
      SweetAlbumGiftItem gift,
      bool unlocked,
      List<SweetAlbumNumConfig> numConfig,
      ValueChanged<int> onRoomSend) {
    return DialogTransition.scaleShow(
      context: context,
      builder: (context) => SweetAlbumGiftDialog(
          targetUid: targetUid,
          gift: gift,
          unlocked: unlocked,
          numConfig: numConfig,
          onRoomSend: onRoomSend),
    );
  }

  @override
  _SweetAlbumGiftDialogState createState() => _SweetAlbumGiftDialogState();
}

class _SweetAlbumGiftDialogState extends State<SweetAlbumGiftDialog>
    with SweetAlbumSendGiftAction {
  int _num = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 78.dp),
          Container(
            width: 280.dp,
            height: 256.5.dp,
            padding: EdgeInsetsDirectional.only(top: 24.dp, bottom: 24.dp),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        RoomAssets.chat_room$sweet_album_bg_dialog_webp),
                    fit: BoxFit.fill)),
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: widget.gift.giftIcon,
                  width: 100.dp,
                  height: 100.dp,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 4.dp),
                Text(
                  widget.gift.giftName,
                  style: TextStyle(
                      fontSize: 15.dp,
                      color: Colors.black.withOpacity(0.9),
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 1.dp),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.only(top: 3.dp, bottom: 1.dp),
                      child: R.img(MoneyConfig.moneyIcon,
                          width: 10.dp, height: 10.dp, wholePath: true),
                    ),
                    NumText(
                      '${widget.gift.price}',
                      style: TextStyle(
                          fontSize: 14.dp,
                          color: Colors.black.withOpacity(0.9),
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                const Spacer(),
                widget.unlocked
                    ? SweetAlbumSendBtn(
                        gift: widget.gift,
                        sendNum: _num,
                        chooseNumConfig: widget.numConfig,
                        onLeftTap: (count) {
                          refresh(() {
                            _num = count;
                          });
                        },
                        onRightTap: (int n) {
                          sendGift(
                              widget.targetUid, widget.gift, n > 0 ? n : _num,
                              (count) {
                            Navigator.pop(context, count);
                          }, onRoomSend: widget.onRoomSend);
                        },
                      )
                    : _buildLockedBtn(),
              ],
            ),
          ),
          SizedBox(height: 30.dp),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: R.img(RoomAssets.chat_room$confess_v2_ic_dialog_close_webp,
                width: 48.dp, height: 48.dp),
          ),
        ],
      ),
    );
  }

  Widget _buildLockedBtn() {
    return Container(
      width: 130.dp,
      height: 44.dp,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(22),
        border: Border.all(color: const Color(0xFFFFFCEF), width: 1.5),
        gradient: const LinearGradient(
            colors: [Color(0xFFDAD7DD), Color(0xFFC2B8CE)]),
      ),
      child: Text(K.room_wait_unlock,
          style: Util.youSheBiaoTiYuan
              .copyWith(fontSize: 20.dp, color: Colors.white)),
    );
  }
}

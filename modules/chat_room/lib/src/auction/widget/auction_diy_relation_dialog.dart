import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'dart:math';

import 'package:chat_room/chat_room.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/src/auction/model/auction_repo.dart';
import 'package:flutter/material.dart';

import '../../protobuf/generated/auction.pb.dart';

class AuctionDiyRelationStatusDialog extends StatefulWidget {
  final AuctionConfigMessage auctionData;
  final AuctionRelationTotalProgressItem data;

  const AuctionDiyRelationStatusDialog(
      {Key? key, required this.auctionData, required this.data})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => AuctionDiyRelationStatusState();

  static show(BuildContext context, AuctionConfigMessage auctionData,
      AuctionRelationTotalProgressItem data) {
    return displayModalBottomSheet(
      context: context,
      defineBarrierColor: const Color(0x1A000000),
      maxHeightRatio: 1.0,
      builder: (context) =>
          AuctionDiyRelationStatusDialog(auctionData: auctionData, data: data),
    );
  }
}

class AuctionDiyRelationStatusState
    extends State<AuctionDiyRelationStatusDialog> {
  final TextEditingController _textController = TextEditingController(text: '');

  bool enable = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (widget.data.diyStatus == 1) {
      /// 任务未完成
      child = _buildBodyByTask();
    } else if (widget.data.diyStatus == 2) {
      /// 任务已完成
      child = _buildBodyByDiy();
    } else {
      /// 审核中/审核失败/审核成功； 审核失败及审核成功 为 预留处理
      child = _buildBodyByCheck();
    }
    return GestureDetector(
      onTap: () {}, // 消费点击事件
      child: child,
    );
  }

  Widget _buildBodyByCheck() {
    return Container(
      width: Util.width,
      height: 300 + Util.iphoneXBottom,
      decoration: const BoxDecoration(
        borderRadius:
            BorderRadiusDirectional.vertical(top: Radius.circular(16)),
        color: Colors.white,
      ),
      alignment: AlignmentDirectional.center,
      padding: EdgeInsets.only(bottom: Util.iphoneXBottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          _buildTitle(),
          const SizedBox(height: 25),
          _buildAuctionIcons(),
          const SizedBox(height: 12),
          _buildAuctionNames(),
          const SizedBox(height: 12),
          _buildDiyName(),
          const Spacer(),
          _buildBtnByCheck(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildDiyName() {
    Color textColor = Colors.white;
    if (widget.data.level == 2) {
      textColor = const Color(0xFF8A3E1B);
    } else if (widget.data.level == 3) {
      textColor = const Color(0xFF25234B);
    }
    return Container(
      width: 64,
      height: 22,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            R.imagePath(
              RoomAssets.defend_ic_defend_tips_x_webp(widget.data.level),
              package: ComponentManager.MANAGER_BASE_ROOM,
            ),
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${widget.data.title}${widget.data.diyName}",
            style: R.textStyle.medium12.copyWith(fontSize: 9, color: textColor),
          ),
        ],
      ),
    );
  }

  Widget _buildBtnByCheck() {
    String btnStr = K.room_auction_diy_checking;
    if (widget.data.diyStatus == 4) {
      btnStr = K.room_auction_diy_check_failure;
    } else if (widget.data.diyStatus == 5) {
      btnStr = K.room_auction_diy_check_success;
    }
    return Container(
      width: double.infinity,
      height: 52,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: ShapeDecoration(
        gradient: LinearGradient(
            colors: R.colors.mainBrandGradientColors
                .map((e) => e.withOpacity(0.5))
                .toList()),
        shape: const StadiumBorder(),
      ),
      alignment: AlignmentDirectional.center,
      child: Text(
        btnStr,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildBodyByDiy() {
    double height = 320 + Util.iphoneXBottom;
    double keyboard = MediaQuery.of(context).viewInsets.bottom;
    if (keyboard > 0) {
      height = max(260 + keyboard, height);
    }
    return Container(
      width: Util.width,
      height: height,
      decoration: const BoxDecoration(
        borderRadius:
            BorderRadiusDirectional.vertical(top: Radius.circular(16)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(bottom: Util.iphoneXBottom),
      alignment: AlignmentDirectional.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          _buildTitle(),
          const SizedBox(height: 25),
          _buildAuctionIcons(),
          const SizedBox(height: 12),
          _buildAuctionNames(),
          const SizedBox(height: 30),
          _buildInputDiy(),
          const Spacer(),
          _buildBtnByCommit(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildInputDiy() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.data.title,
          style: TextStyle(
            color: R.color.mainTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 177,
          height: 46,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          alignment: AlignmentDirectional.centerStart,
          decoration: BoxDecoration(
            color: R.color.secondBgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            onChanged: _onChangeValue,
            cursorColor: R.color.mainBrandColor,
            decoration: InputDecoration(
              hintText: widget.data.defendName,
              border: InputBorder.none,
              hintStyle: TextStyle(
                  color: R.color.thirdTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
              isDense: true,
              counterText: '',
            ),
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 16,
                color: R.color.mainTextColor,
                fontWeight: FontWeight.w600),
            controller: _textController,
            autocorrect: false,
            maxLength: 4,
            minLines: 1,
            textInputAction: TextInputAction.done,
            keyboardAppearance: Brightness.light,
          ),
        ),
      ],
    );
  }

  void _onChangeValue(String text) {
    enable = (text.isNotEmpty == true);
    refresh();
  }

  Widget _buildAuctionNames() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          constraints: const BoxConstraints(
            maxWidth: 160,
          ),
          child: Text(
            widget.auctionData.auctionUser.name,
            style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 4),
        const Text(
          "&",
          style: TextStyle(
            color: Color(0xFFFF5F7D),
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 4),
        Container(
          constraints: const BoxConstraints(
            maxWidth: 160,
          ),
          child: Text(
            widget.auctionData.defendUser.name,
            style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildAuctionIcons() {
    return SizedBox(
      width: 108,
      height: 56,
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: _buildAvatar(widget.auctionData.auctionUser.icon),
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: _buildAvatar(widget.auctionData.defendUser.icon),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(String url) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: const Color(0xFFFF95D6),
          width: 1,
        ),
      ),
      alignment: AlignmentDirectional.center,
      child: CommonAvatar(
        path: url,
        size: 56,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildBtnByCommit() {
    return InkWell(
      onTap: _onTapDiyCommit,
      child: Container(
        width: double.infinity,
        height: 52,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            colors: enable
                ? R.color.mainBrandGradientColors
                : R.color.mainBrandGradientColors
                    .map((e) => e.withOpacity(0.5))
                    .toList(),
          ),
          shape: const StadiumBorder(),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          K.submit,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _onTapDiyCommit() async {
    String diyText = _textController.text.trim();
    if (diyText.isNotEmpty == true) {
      NormalNull res = await AuctionRepo.commitDiyRelation(
          rid: widget.auctionData.rid, diyName: diyText);
      if (res.success) {
        Fluttertoast.showCenter(msg: K.room_auction_diy_commit_apply);
        Navigator.of(context).pop();
      } else {
        Fluttertoast.showCenter(msg: res.msg);
      }
    }
  }

  Widget _buildBodyByTask() {
    return Container(
      width: Util.width,
      height: 300 + Util.iphoneXBottom,
      decoration: const BoxDecoration(
        borderRadius:
            BorderRadiusDirectional.vertical(top: Radius.circular(16)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(bottom: Util.iphoneXBottom),
      alignment: AlignmentDirectional.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          _buildTitle(),
          const SizedBox(height: 25),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              K.room_auction_diy_task_title([(widget.data.title)]),
              style: TextStyle(
                color: R.color.mainTextColor.withOpacity(0.5),
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            height: 80,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F7F9),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: AlignmentDirectional.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  MoneyConfig.moneyIcon,
                  width: 48,
                  height: 48,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        K.room_auction_diy_task_content(
                            ['${widget.data.price}']),
                        style: TextStyle(
                          color: R.color.mainTextColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        K.room_auction_diy_task_result,
                        style: TextStyle(
                          color: R.color.mainTextColor.withOpacity(0.4),
                          fontSize: 13,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          _buildBtnBySend(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      K.room_auction_diy_title,
      style: TextStyle(
        color: R.color.mainTextColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildBtnBySend() {
    int targetId = 0;
    if (widget.auctionData.auctionUser.uid == Session.uid) {
      targetId = widget.auctionData.defendUser.uid;
    } else if (widget.auctionData.defendUser.uid == Session.uid) {
      targetId = widget.auctionData.auctionUser.uid;
    }
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
        IGiftManager giftManager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
        if (targetId > 0) {
          giftManager.showRoomGiftPanel(context,
              room: ChatRoomData.getInstance(),
              uid: targetId,
              refer: 'auction_diy');
        } else {
          giftManager.showRoomGiftPanel(context,
              room: ChatRoomData.getInstance());
        }
      },
      child: Container(
        width: double.infinity,
        height: 52,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: ShapeDecoration(
          gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
          shape: const StadiumBorder(),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          K.room_send,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

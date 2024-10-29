import 'dart:ui';

import 'package:gift/k.dart';
import 'package:shared/k.dart' as base;
import 'package:get/get.dart';
import 'package:chat_room/chat_room.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gift/assets.dart';
import 'package:gift/slp_src/widget/slp_page_gift_item.dart';

import 'graffiti_gift_controller.dart';
import 'graffiti_gift_user_list.dart';
import 'graffiti_gift_widget.dart';

/// 涂鸦礼物面板
class GraffitiGiftPanel extends StatefulWidget {
  final ChatRoomData room;
  final int uid;

  const GraffitiGiftPanel({super.key, required this.room, this.uid = 0});

  static Future<void> show(
      BuildContext context, ChatRoomData room, int uid) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GraffitiGiftPanel(room: room, uid: uid),
    );
  }

  @override
  State<GraffitiGiftPanel> createState() => _GraffitiGiftPanelState();
}

class _GraffitiGiftPanelState extends State<GraffitiGiftPanel> {
  late GraffitiGiftController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Get.put(GraffitiGiftController(widget.room, widget.uid));
  }

  @override
  void dispose() {
    Get.delete<GraffitiGiftController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBack(),
          Expanded(child: _buildGraffitiArea()),
          _buildGraffitiHandler(),
          _buildGiftPanel(),
        ],
      ),
    );
  }

  Widget _buildBack() {
    return Container(
      height: 32,
      margin: const EdgeInsetsDirectional.only(top: 6, end: 12, bottom: 6),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => Navigator.of(context).maybePop(),
        child: Padding(
          padding: const EdgeInsetsDirectional.all(4),
          child: R.img(RoomAssets.chat_room$back_svg, width: 24, height: 24),
        ),
      ),
    );
  }

  /// 涂鸦区域
  Widget _buildGraffitiArea() {
    return GetBuilder<GraffitiGiftController>(
      id: graffitiAreaKey,
      builder: (controller) => Container(
        width: Util.width,
        padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
        child: DottedBorder(
          dashPattern: const [2, 4],
          strokeWidth: 2,
          color: Colors.white,
          radius: const Radius.circular(16),
          borderType: BorderType.RRect,
          child: GraffitiGiftWidget(
            icon: controller.selectedGift?.icon,
            srcList: controller.srcList,
            onPointAdded: controller.onPointAdded,
          ),
        ),
      ),
    );
  }

  /// 涂鸦礼物操作栏
  Widget _buildGraffitiHandler() {
    return GetBuilder<GraffitiGiftController>(
      id: giftTipsKey,
      builder: (controller) => Container(
        height: 44,
        padding: const EdgeInsetsDirectional.only(start: 16, end: 8),
        alignment: AlignmentDirectional.center,
        child: Row(
          children: [
            if (controller.showGiftTips)
              _buildGiftTips(controller.graffitiPointCount,
                  controller.selectedUids.length, controller.selectedGift!),
            const Spacer(),
            _buildActionBtn(
                Assets.gift$gift_ic_cancel_webp, controller.onCancelDraw),
            _buildActionBtn(
                Assets.gift$gift_ic_clear_webp, controller.onClearDraw),
          ],
        ),
      ),
    );
  }

  /// 礼物提示
  Widget _buildGiftTips(int giftCount, int userCount, BbGiftPanelGift gift) {
    List<String> pattern = ['$giftCount', '$userCount'];
    return Row(
      children: [
        EasyRichText(
          K.gift_graffiti_tips(['$giftCount', gift.name, '$userCount']),
          defaultStyle: const TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
          patternList: pattern
              .map(
                (item) => EasyRichTextPattern(
                  targetString: item,
                  style: TextStyle(
                      color: R.color.mainBrandColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              )
              .toList(),
        ),
        R.img(MoneyConfig.moneyIcon, width: 12, height: 12),
        NumText(
          '${giftCount * userCount * gift.price}',
          style: const TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  /// 操作按钮
  Widget _buildActionBtn(String icon, VoidCallback action) {
    return GestureDetector(
      onTap: action,
      child: Padding(
        padding: const EdgeInsetsDirectional.all(8),
        child: R.img(icon, width: 22, height: 22),
      ),
    );
  }

  /// 礼物显示面板
  Widget _buildGiftPanel() {
    return Container(
      height: 228,
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      decoration: const BoxDecoration(
        color: Color(0xB3171621),
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        children: [
          if (_controller.showUserList) _buildUserList(),
          Expanded(child: _buildGiftList()),
          _buildGiftHandleBar(),
        ],
      ),
    );
  }

  Widget _buildUserList() {
    return Container(
      height: 60,
      padding: const EdgeInsetsDirectional.only(top: 14, bottom: 14),
      child: const GraffitiGiftUserList(),
    );
  }

  Widget _buildGiftList() {
    return Container(
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsetsDirectional.only(top: 6, bottom: 6),
      child: GetBuilder<GraffitiGiftController>(
        id: giftListKey,
        builder: (controller) {
          switch (controller.screenStatus) {
            case ScreenStatus.Loading:
              return const Loading();
            case ScreenStatus.Error:
            case ScreenStatus.Empty:
              return _buildError();
            case ScreenStatus.Ready:
              return SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var gift = controller.giftList[index];
                    return SizedBox(
                      width: 84,
                      height: 100,
                      child: SlpPageGiftItem(
                        gift: gift,
                        selected: controller.isGiftSelected(gift),
                        onGiftTaped: controller.onGiftTap,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemCount: controller.giftList.length,
                ),
              );
          }
        },
      ),
    );
  }

  Widget _buildError() {
    return GestureDetector(
      onTap: _controller.loadGraffitiGiftList,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          R.img(RoomAssets.chat_room$room_ic_refresh_small_svg,
              width: 20, height: 20, color: Colors.white70),
          const SizedBox(height: 5),
          Text(
            base.K.server_return_error_retry,
            style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

  Widget _buildGiftHandleBar() {
    return GetBuilder<GraffitiGiftController>(
      id: moneyKey,
      builder: (controller) => Container(
        height: 52,
        alignment: AlignmentDirectional.center,
        child: Row(
          children: [
            R.img(MoneyConfig.moneyIcon, width: 20, height: 20),
            const SizedBox(width: 2),
            NumText(
              MoneyConfig.moneyNum(controller.money, fractionDigits: 2),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            _buildRecharge(),
            const Spacer(),
            _buildSendBtn(),
          ],
        ),
      ),
    );
  }

  Widget _buildRecharge() {
    return GestureDetector(
      onTap: () => _controller.recharge(context),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 6, end: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              K.gift_recharge,
              style: TextStyle(
                  color: R.color.mainBrandColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            Icon(Icons.navigate_next, color: R.color.mainBrandColor, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSendBtn() {
    return GestureDetector(
      onTap: () => _controller.sendGraffitiGift(context),
      child: Container(
        width: 68,
        height: 30,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: R.color.mainBrandGradientColors),
          borderRadius: const BorderRadiusDirectional.all(Radius.circular(15)),
        ),
        child: Text(
          K.give_something,
          style: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

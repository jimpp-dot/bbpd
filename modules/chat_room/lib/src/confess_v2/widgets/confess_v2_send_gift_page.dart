import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/src/base/widget/fade_animation_widget.dart';
import 'package:chat_room/src/confess_v2/model/confess_v2_data.dart';
import 'package:chat_room/src/confess_v2/model/confess_v2_send_gift_view_model.dart';
import 'package:chat_room/src/confess_v2/model/confess_v2_view_model.dart';
import 'package:chat_room/src/confess_v2/pb/generated/confess_v2.pb.dart';
import 'package:chat_room/src/confess_v2/widgets/components/rule_button.dart';
import 'package:flutter/material.dart';

import 'components/confess_v2_gift_animate_box.dart';
import 'components/confess_v2_send_btn.dart';
import 'package:provider/provider.dart' hide Selector;

/// 恋爱旅行--主操作页面
class ConfessV2SendGiftPage extends StatelessWidget {
  const ConfessV2SendGiftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PositionedDirectional(
          top: 4.dp,
          child: R.img(
            RoomAssets.chat_room$confess_v2_bg_travel_page_webp,
            width: Util.width,
            height: 540.dp,
            fit: BoxFit.fill,
          ),
        ),
        Column(
          children: [
            _onMicUsersListWidget(context),
            _currentGiftDescriptionLabel(context),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.5.dp),
              child: const _GiftsControllerWidget(),
            ),
            SizedBox(height: 14.5.dp),
            _sendBtn(context),
          ],
        ),
      ],
    );
  }

  /// 在麦位上的用户列表
  Widget _onMicUsersListWidget(BuildContext context) {
    Widget userAvatar(ConfessV2RoomPosition? user, {bool isSelected = false}) {
      return GestureDetector(
        onTap: () => context
            .read<ConfessV2SendGiftViewModel>()
            .actionForSwitchSelectedUser(user),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              width: 32.dp,
              height: 32.dp,
              alignment: AlignmentDirectional.center,
              decoration: !isSelected
                  ? null
                  : BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(16.dp),
                      gradient: const LinearGradient(
                        begin: AlignmentDirectional.topStart,
                        end: AlignmentDirectional.bottomEnd,
                        colors: [
                          Color(0xFF7D2EE6),
                          Color(0xFFFF6BB3),
                        ],
                      ),
                    ),
              child: CommonAvatar(
                key: user?.key,
                size: isSelected ? 30.dp : 32.dp,
                path: user?.roomPosition.icon,
                shape: BoxShape.circle,
              ),
            ),
            if (isSelected)
              PositionedDirectional(
                top: 12.dp,
                end: 0,
                child: R.img(
                  RoomAssets.chat_room$confess_v2_ic_user_sel_webp,
                  width: 12.dp,
                  height: 12.dp,
                ),
              ),
          ],
        ),
      );
    }

    return Consumer<ConfessV2ViewModel>(
      builder: (context, model, child) {
        final users = context.select<ConfessV2SendGiftViewModel,
            List<ConfessV2RoomPosition>>((model) => model.micUsers ?? []);
        final selectedUser =
            context.select<ConfessV2SendGiftViewModel, ConfessV2RoomPosition?>(
                (model) => model.selectedUser);

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: 60.dp,
                alignment: AlignmentDirectional.center,
                margin: EdgeInsetsDirectional.only(start: 20.dp, end: 16.dp),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadiusDirectional.all(Radius.circular(12.dp)),
                  border: Border.all(width: 1, color: const Color(0x33FFFFFF)),
                  color: const Color(0x33FFFFFF),
                ),
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 12.dp),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final theUser = users[index];
                    var isSelected = false;
                    if (selectedUser != null &&
                        selectedUser.roomPosition.uid ==
                            theUser.roomPosition.uid) {
                      isSelected = true;
                    }
                    return userAvatar(theUser, isSelected: isSelected);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 12.dp);
                  },
                  itemCount: users.length,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 4.dp),
              child: const RuleBtn(),
            ),
            SizedBox(width: 20.dp),
          ],
        );
      },
    );
  }

  /// 当前礼物的说明
  Widget _currentGiftDescriptionLabel(BuildContext context) {
    var description = context.select<ConfessV2SendGiftViewModel, String>(
        (model) => model.currentShowGiftDescription);

    var valueKey = context.select<ConfessV2SendGiftViewModel, ValueKey?>(
        (model) => model.currentShowGiftDescriptionKey);

    Widget renderText() {
      return Container(
        constraints: BoxConstraints(minHeight: 36.dp),
        margin: EdgeInsetsDirectional.only(
            top: 11.dp, bottom: 4.dp, start: 20.dp, end: 20.dp),
        alignment: AlignmentDirectional.center,
        child: Text(
          description,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13.dp,
            color: Colors.white,
            shadows: const [
              Shadow(
                  color: Color(0xFF9B7AE5),
                  offset: Offset(0, 0.5),
                  blurRadius: 0)
            ],
          ),
        ),
      );
    }

    return FadeAnimationWidget(
      fadeDuration: 1000,
      key: valueKey,
      child: renderText(),
    );
  }

  /// 赠送按钮
  Widget _sendBtn(BuildContext context) {
    var currentUserGifts =
        context.select<ConfessV2SendGiftViewModel, List<ConfessStage>?>(
            (model) => model.currentUserGifts);

    if (Util.isCollectionEmpty(currentUserGifts)) {
      /// 如果当前主播的礼物数据为空，可能是因为还未加载出来，可使用默认礼物数据占据
      currentUserGifts =
          context.select<ConfessV2SendGiftViewModel, List<ConfessStage>?>(
              (model) => model.getDefaultGifts());
      if (Util.isCollectionEmpty(currentUserGifts)) {
        return Container();
      }
    }

    final num = context.select<ConfessV2SendGiftViewModel, int>(
        (model) => model.selectedGiftNum);

    return ConfessV2SendBtn(
      sendNum: num,
      chooseNumConfig:
          context.watch<ConfessV2SendGiftViewModel>().chooseNumConfig,
      onLeftTap: (num) {
        context.read<ConfessV2SendGiftViewModel>().actionForChangeGiftNum(num);
      },
      onRightTap: () => context.read<ConfessV2ViewModel>().actionForSendGift(),
    );
  }
}

/// 6个礼物控制组件
class _GiftsControllerWidget extends StatelessWidget {
  const _GiftsControllerWidget();

  @override
  Widget build(BuildContext context) {
    final sendGiftViewModel = context.watch<ConfessV2SendGiftViewModel>();

    var currentUserGifts =
        context.select<ConfessV2SendGiftViewModel, List<ConfessStage>?>(
            (model) => model.currentUserGifts);
    final selectedGift =
        context.select<ConfessV2SendGiftViewModel, ConfessStage?>(
            (model) => model.selectedGift);

    if (Util.isCollectionEmpty(currentUserGifts)) {
      currentUserGifts =
          context.select<ConfessV2SendGiftViewModel, List<ConfessStage>?>(
              (model) => model.getDefaultGifts());
      if (Util.isCollectionEmpty(currentUserGifts)) {
        return const SizedBox();
      }
    }

    List<Widget> giftList = [];
    for (int i = 0; i < 6; i++) {
      giftList.add(ConfessV2GiftAnimateBox(
        key: sendGiftViewModel.giftKeyList[i],
        gift: currentUserGifts![i],
        prevGift: currentUserGifts[i == 0 ? 0 : i - 1],
        isSelected: selectedGift?.giftId == currentUserGifts[i].giftId,
        onTap: _onGiftBoxClick,
      ));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(top: 43.5.dp),
              child: giftList[0],
            ),
            giftList[1],
            Padding(
              padding: EdgeInsetsDirectional.only(top: 43.5.dp),
              child: giftList[2],
            ),
          ],
        ),
        SizedBox(height: 30.5.dp),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            giftList[5],
            Padding(
              padding: EdgeInsetsDirectional.only(top: 43.dp),
              child: giftList[4],
            ),
            giftList[3],
          ],
        ),
      ],
    );
  }

  /// 礼物点击事件
  void _onGiftBoxClick(ConfessStage gift, BuildContext context) {
    final sendGiftViewModel = context.read<ConfessV2SendGiftViewModel>();
    sendGiftViewModel.onSelectGift(gift,
        onUnlockGiftDialogSendBtnTap: (gift, uid) {
      context.read<ConfessV2ViewModel>().actionForSendGift();
    });
  }
}

import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/src/base/widget/fade_animation_widget.dart';
import 'package:chat_room/src/vindicate/model/vindicate_data.dart';
import 'package:chat_room/src/vindicate/model/vindicate_send_gift_view_model.dart';
import 'package:chat_room/src/vindicate/model/vindicate_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/vindicate_gift_animate_box.dart';
import 'components/vindicate_send_btn.dart';
import 'vindicate_send_one_user_header_widget.dart';

/// 表白活动--想对你说页面
class VindicateSendGiftPage extends StatelessWidget {
  const VindicateSendGiftPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _onMicUsersListWidget(context),
          _currentGiftDescriptionLabel(context),
          const _GiftsControllerWidget(),
          const SizedBox(
            height: 22,
          ),
          _sendBtn(context)
        ],
      ),
    );
  }

  /// 在麦位上的用户列表
  Widget _onMicUsersListWidget(BuildContext context) {
    final from =
        context.select<VindicateViewModel, int?>((value) => value.from);
    if (from == 1) {
      return const Padding(
        padding: EdgeInsetsDirectional.only(top: 12, bottom: 16),
        child: VindicateSendOneUserHeaderWidget(),
      );
    }

    Widget userAvatar(VindicateRoomPosition? user, {bool isSelected = false}) {
      return GestureDetector(
        onTap: () => context
            .read<VindicateSendGiftViewModel>()
            .actionForSwitchSelectedUser(user),
        child: Stack(
          alignment: AlignmentDirectional.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 32,
              width: 32,
              decoration: isSelected
                  ? BoxDecoration(
                      borderRadius: const BorderRadiusDirectional.all(
                          Radius.circular(16.0)),
                      border: Border.all(
                          color: const Color(0xFFF448B3),
                          width: isSelected ? 1.0 : 0.0),
                    )
                  : null,
              child: CommonAvatar(
                key: user?.key,
                size: 32,
                path: user?.roomPosition.icon,
                borderRadius:
                    const BorderRadiusDirectional.all(Radius.circular(16.0)),
              ),
            ),
            if (isSelected)
              PositionedDirectional(
                top: 10,
                end: -6,
                child: Container(
                  alignment: AlignmentDirectional.center,
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFFA7EDA),
                        Color(0xFFF448B3),
                      ],
                    ),
                    borderRadius:
                        BorderRadiusDirectional.all(Radius.circular(8)),
                  ),
                  child: R.img(RoomAssets
                      .chat_room$vindicate_vindicate_checkbox_selected_webp),
                ),
              ),
          ],
        ),
      );
    }

    return Consumer<VindicateViewModel>(
      builder: (context, model, child) {
        final users = context.select<VindicateSendGiftViewModel,
            List<VindicateRoomPosition>>((model) => model.micUsers ?? []);
        final selectedUser =
            context.select<VindicateSendGiftViewModel, VindicateRoomPosition?>(
                (model) => model.selectedUser);

        return Container(
          height: 60,
          alignment: AlignmentDirectional.center,
          margin: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            borderRadius:
                const BorderRadiusDirectional.all(Radius.circular(12)),
            border: Border.all(width: 1.0, color: const Color(0x33FFFFFF)),
            color: const Color(0x33FFFFFF),
          ),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final theUser = users[index];
              var isSelected = false;
              if (selectedUser != null &&
                  selectedUser.roomPosition.uid == theUser.roomPosition.uid) {
                isSelected = true;
              }
              return userAvatar(theUser, isSelected: isSelected);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 12,
              );
            },
            itemCount: users.length,
          ),
        );
      },
    );
  }

  /// 当前礼物的说明
  Widget _currentGiftDescriptionLabel(BuildContext context) {
    var description = context.select<VindicateSendGiftViewModel, String>(
        (model) => model.currentShowGiftDescription);

    var valueKey = context.select<VindicateSendGiftViewModel, ValueKey?>(
        (model) => model.currentShowGiftDescriptionKey);

    Widget renderText() {
      return Container(
        height: 36,
        margin: const EdgeInsetsDirectional.only(
            top: 4, bottom: 16, start: 37, end: 37),
        alignment: AlignmentDirectional.center,
        child: Text(
          description,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: R.textStyle.regular14
              .copyWith(fontSize: 13, color: const Color(0xFF313131)),
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
        context.select<VindicateSendGiftViewModel, List<VindicateGiftData>?>(
            (model) => model.currentUserGifts);

    if (Util.isCollectionEmpty(currentUserGifts)) {
      /// 如果当前主播的礼物数据为空，可能是因为还未加载出来，可使用默认礼物数据占据
      currentUserGifts =
          context.select<VindicateSendGiftViewModel, List<VindicateGiftData>?>(
              (model) => model.getDefaultGifts());
      if (Util.isCollectionEmpty(currentUserGifts)) {
        return Container();
      }
    }

    final num = context.select<VindicateSendGiftViewModel, int>(
        (model) => model.selectedGiftNum);

    return VindicateSendBtn(
      sendNum: num,
      chooseNumConfig:
          context.watch<VindicateSendGiftViewModel>().chooseNumConfig,
      onLeftTap: (num) {
        context.read<VindicateSendGiftViewModel>().actionForChangeGiftNum(num);
      },
      onRightTap: () => context.read<VindicateViewModel>().actionForSendGift(),
    );
  }
}

/// 四个礼物控制组件
class _GiftsControllerWidget extends StatelessWidget {
  const _GiftsControllerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sendGiftViewModel = context.watch<VindicateSendGiftViewModel>();

    var currentUserGifts =
        context.select<VindicateSendGiftViewModel, List<VindicateGiftData>?>(
            (model) => model.currentUserGifts);
    final selectedGift =
        context.select<VindicateSendGiftViewModel, VindicateGiftData?>(
            (model) => model.selectedGift);

    // if (currentUserGifts == null || currentUserGifts.isEmpty || selectedGift == null) return Container();

    if (Util.isCollectionEmpty(currentUserGifts)) {
      currentUserGifts =
          context.select<VindicateSendGiftViewModel, List<VindicateGiftData>?>(
              (model) => model.getDefaultGifts());
      if (Util.isCollectionEmpty(currentUserGifts)) {
        return Container();
      }
    }

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VindicateGiftAnimateBox(
              key: sendGiftViewModel.topStartKey,
              gift: currentUserGifts![0],
              nextGift: currentUserGifts[1],
              isSelected: selectedGift?.giftId == currentUserGifts[0].giftId,
              onTap: _onGiftBoxClick,
            ),
            Expanded(
              child: _nextGiftUnlockLine(context, currentUserGifts[0]),
            ),
            VindicateGiftAnimateBox(
              key: sendGiftViewModel.topEndKey,
              gift: currentUserGifts[1],
              nextGift: currentUserGifts[2],
              isSelected: selectedGift?.giftId == currentUserGifts[1].giftId,
              onTap: _onGiftBoxClick,
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 48),
          child: Row(
            children: [
              VindicateGiftAnimateBox(
                key: sendGiftViewModel.bottomEndKey,
                gift: currentUserGifts[3],
                nextGift: currentUserGifts[0],
                isSelected: selectedGift?.giftId == currentUserGifts[3].giftId,
                onTap: _onGiftBoxClick,
              ),
              const Spacer(),
              VindicateGiftAnimateBox(
                key: sendGiftViewModel.bottomStartKey,
                gift: currentUserGifts[2],
                nextGift: currentUserGifts[3],
                isSelected: selectedGift?.giftId == currentUserGifts[2].giftId,
                onTap: _onGiftBoxClick,
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// 下一阶段礼物解锁
  Widget _nextGiftUnlockLine(
      BuildContext context, VindicateGiftData? giftData) {
    final isAnimating = context
        .select<VindicateSendGiftViewModel, bool>((model) => model.isAnimating);

    if (giftData == null ||
        Util.isNullOrEmpty(giftData.probabilityTxt) ||
        isAnimating) return Container();

    return Container(
      margin: const EdgeInsetsDirectional.only(start: 6.0, end: 6.0, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            giftData.probabilityTxt,
            textAlign: TextAlign.center,
            style: R.textStyle.medium12
                .copyWith(color: const Color(0xFFEE29A4), fontSize: 11),
          ),
          Container(
            child: R.img(
                RoomAssets.chat_room$confession_confession_corrugation_webp,
                fit: BoxFit.fitWidth),
          )
        ],
      ),
    );
  }

  /// 礼物点击事件
  void _onGiftBoxClick(VindicateGiftData gift, BuildContext context) {
    final sendGiftViewModel = context.read<VindicateSendGiftViewModel>();
    sendGiftViewModel.onSelectGift(gift,
        onUnlockGiftDialogSendBtnTap: (gift, uid) {
      context.read<VindicateViewModel>().actionForSendGift();
    });
  }
}

import 'package:shared/shared.dart';
import 'package:chat_room/src/vindicate/model/vindicate_send_gift_view_model.dart';
import 'package:chat_room/src/vindicate/model/vindicate_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' hide Selector;

/// 一对一赠送表白礼物
class VindicateSendOneUserHeaderWidget extends StatelessWidget {
  const VindicateSendOneUserHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: GradientBorder(
        borderGradient: const LinearGradient(
          colors: [Color(0xFFFFA0DB), Color(0xFFFF71CA)],
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
        ),
        borderWidth: 1.5,
        borderRadius: 30,
        child: Container(
          width: 263,
          margin: const EdgeInsetsDirectional.all(1.5),
          padding: const EdgeInsets.symmetric(horizontal: 2.5, vertical: 2.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(30),
            color: Colors.white,
          ),
          alignment: AlignmentDirectional.center,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              ..._bgIcons,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _selfAvatar(context),
                  const Spacer(),
                  const _UnlockLevelLabel(),
                  const Spacer(),
                  _userAvatar(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> get _bgIcons {
    return [
      PositionedDirectional(
        start: 63,
        width: 33,
        height: 10,
        child: R.img('vindicate/single_user/ic_pink_line.webp',
            package: ComponentManager.MANAGER_BASE_ROOM, fit: BoxFit.fitWidth),
      ),
      PositionedDirectional(
        end: 63,
        width: 33,
        height: 10,
        child: R.img('vindicate/single_user/ic_pink_line_mirror.webp',
            package: ComponentManager.MANAGER_BASE_ROOM, fit: BoxFit.fitWidth),
      ),
      PositionedDirectional(
        width: 40,
        height: 34,
        child: R.img('vindicate/single_user/ic_heart_middle.webp',
            package: ComponentManager.MANAGER_BASE_ROOM, fit: BoxFit.fitWidth),
      ),
      PositionedDirectional(
        top: 5,
        start: 73,
        width: 17,
        height: 15,
        child: R.img('vindicate/single_user/ic_heart_left.webp',
            package: ComponentManager.MANAGER_BASE_ROOM, fit: BoxFit.fitWidth),
      ),
      PositionedDirectional(
        bottom: 8,
        end: 81,
        width: 12,
        height: 11,
        child: R.img('vindicate/single_user/ic_heart_right.webp',
            package: ComponentManager.MANAGER_BASE_ROOM, fit: BoxFit.fitWidth),
      ),
    ];
  }

  Widget _userAvatar(BuildContext context) {
    final selectedUser =
        context.select<VindicateSendGiftViewModel, VindicateRoomPosition?>(
            (value) => value.selectedUser);
    final userIcon = selectedUser?.roomPosition.icon ?? '';

    Key? key;
    if (selectedUser != null) {
      key = selectedUser.key;
    }

    return CommonAvatar(
      key: key,
      size: 52,
      path: userIcon,
      borderRadius: const BorderRadiusDirectional.all(Radius.circular(26.0)),
    );
  }

  Widget _selfAvatar(BuildContext context) {
    return CommonAvatar(
      size: 52,
      path: Session.icon,
      borderRadius: const BorderRadiusDirectional.all(Radius.circular(26.0)),
    );
  }
}

/// 当前解锁阶段
class _UnlockLevelLabel extends StatelessWidget {
  const _UnlockLevelLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final label = context.select<VindicateSendGiftViewModel, String>(
        (value) => value.currentUnlockLevel);

    if (label.isEmpty) return const SizedBox.shrink();

    return Text(
      label,
      style: R.textStyle.medium14
          .copyWith(fontSize: 13, color: const Color(0xFFFF58B4)),
    );
  }
}

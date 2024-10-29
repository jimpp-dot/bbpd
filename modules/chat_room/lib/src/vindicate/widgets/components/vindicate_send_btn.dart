import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/vindicate/widgets/components/vindicate_gift_send_num_pull_menu.dart';
import 'package:flutter/material.dart';

class VindicateSendBtn extends StatelessWidget {
  /// 赠送数量
  final int sendNum;

  final borderRadius = const Radius.circular(24);

  final Map? chooseNumConfig;

  final Function(int num)? onLeftTap;

  final VoidCallback? onRightTap;

  final GlobalKey _leftHalfGlobalKey = GlobalKey();

  VindicateSendBtn(
      {Key? key,
      this.sendNum = 1,
      this.onLeftTap,
      this.onRightTap,
      this.chooseNumConfig})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 180,
      padding: const EdgeInsetsDirectional.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.all(borderRadius),
        gradient: const LinearGradient(
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
          colors: [
            Color(0xFFFFFEE5),
            Color(0xFFFFFFFF),
            Color(0xFFFFF8B2),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(child: _leftHalfBtn(context)),
          Expanded(
            child: _rightHalfBtn,
          ),
        ],
      ),
    );
  }

  Widget _leftHalfBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// 弹出下拉菜单

        final renderObj = _leftHalfGlobalKey.currentContext?.findRenderObject();
        if (renderObj != null && renderObj is RenderBox) {
          final renderBox = renderObj;
          final offset = renderBox.localToGlobal(Offset.zero);
          final rect = Rect.fromLTWH(offset.dx, offset.dy, renderBox.size.width,
              renderBox.size.height);

          VindicateGiftNumSelectMenu.show(context,
                  chooseNumConfig ?? {"1": "一心一意"}, sendNum, rect, Offset.zero)
              .then((value) {
            onLeftTap?.call(value ?? 1);
          });
        }
      },
      child: Container(
        alignment: AlignmentDirectional.center,
        key: _leftHalfGlobalKey,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.only(
              topStart: borderRadius, bottomStart: borderRadius),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "x$sendNum",
              style:
                  R.textStyle.medium16.copyWith(color: const Color(0xFF313131)),
            ),
            const SizedBox(
              width: 2,
            ),
            R.img(RoomAssets.chat_room$ic_arrow_down_png,
                width: 12, height: 12, color: const Color(0x80313131)),
          ],
        ),
      ),
    );
  }

  Widget get _rightHalfBtn {
    return GestureDetector(
      onTap: () => onRightTap?.call(),
      child: Container(
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
              topEnd: borderRadius, bottomEnd: borderRadius),
          gradient: const LinearGradient(
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
            colors: [Color(0xFFFB8DFF), Color(0xFFB248F4)],
          ),
        ),
        child: Text(
          K.room_send,
          style: R.textStyle.medium16.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

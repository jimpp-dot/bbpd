import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/src/confess_v2/widgets/components/confess_v2_gift_send_num_pull_menu.dart';
import 'package:flutter/material.dart';

class ConfessV2SendBtn extends StatefulWidget {
  /// 赠送数量
  final int sendNum;
  final Map<String, String>? chooseNumConfig;
  final Function(int num)? onLeftTap;
  final VoidCallback? onRightTap;

  const ConfessV2SendBtn(
      {super.key,
      this.sendNum = 1,
      this.onLeftTap,
      this.onRightTap,
      this.chooseNumConfig});

  @override
  State<StatefulWidget> createState() => _ConfessV2SendBtnState();
}

class _ConfessV2SendBtnState extends State<ConfessV2SendBtn>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final GlobalKey _leftHalfGlobalKey = GlobalKey();
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _rotationAnimation = Tween(begin: 0.0, end: 0.5).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.dp,
      height: 50.dp,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(25.dp),
        gradient: const LinearGradient(
          begin: AlignmentDirectional.centerStart,
          end: AlignmentDirectional.centerEnd,
          colors: [Color(0xFFFFFF94), Color(0xFFFAE05A)],
          stops: [0, 0.25],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(child: _buildNumBtn(context)),
          GestureDetector(
            onTap: () => widget.onRightTap?.call(),
            child: R.img(
              RoomAssets.chat_room$confess_v2_btn_send_webp,
              width: 140.dp,
              height: 50.dp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumBtn(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        /// 弹出下拉菜单
        final renderObj = _leftHalfGlobalKey.currentContext?.findRenderObject();
        if (renderObj != null && renderObj is RenderBox) {
          final renderBox = renderObj;
          final offset = renderBox.localToGlobal(Offset.zero);
          final rect = Rect.fromLTWH(offset.dx, offset.dy, renderBox.size.width,
              renderBox.size.height);

          _controller.forward();
          ConfessV2GiftNumSelectMenu.show(
                  context,
                  widget.chooseNumConfig ?? {'1': '一心一意'},
                  widget.sendNum,
                  rect,
                  Offset.zero)
              .then((value) {
            widget.onLeftTap?.call(value ?? 1);
            _controller.reverse();
          });
        }
      },
      child: Container(
        key: _leftHalfGlobalKey,
        alignment: AlignmentDirectional.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 10.dp),
            NumText(
              '${widget.sendNum}',
              style: TextStyle(
                  fontSize: 18.dp,
                  color: const Color(0xFFC76713),
                  fontWeight: FontWeight.bold),
            ),
            RotationTransition(
              turns: _rotationAnimation,
              child: R.img(
                RoomAssets.chat_room$confess_v2_ic_num_arrow_webp,
                width: 12.dp,
                height: 12.dp,
              ),
            )
          ],
        ),
      ),
    );
  }
}

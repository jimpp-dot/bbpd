import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/sweet_album/pb/generated/sweet_album.pb.dart';
import 'package:chat_room/src/biz_plugin/sweet_album/widget/sweet_album_common_btn.dart';
import 'package:chat_room/src/biz_plugin/sweet_album/widget/sweet_album_gift_num_menu.dart';
import 'package:flutter/material.dart';

class SweetAlbumSendBtn extends StatefulWidget {
  final SweetAlbumGiftItem gift;

  /// 赠送数量
  final int sendNum;
  final List<SweetAlbumNumConfig> chooseNumConfig;
  final Function(int count)? onLeftTap;
  final ValueChanged<int>? onRightTap;

  const SweetAlbumSendBtn(
      {super.key,
      required this.gift,
      this.sendNum = 1,
      this.onLeftTap,
      this.onRightTap,
      required this.chooseNumConfig});

  @override
  State<StatefulWidget> createState() => _SweetAlbumSendBtnState();
}

class _SweetAlbumSendBtnState extends State<SweetAlbumSendBtn>
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
    return SizedBox(
      width: 190.dp,
      height: 44.dp,
      child: Stack(
        children: [
          R.img(
            RoomAssets.chat_room$sweet_album_bg_send_bar_webp,
            width: 190.dp,
            height: 44.dp,
          ),
          Row(
            children: [
              SizedBox(
                  width: 60.dp, height: 44.dp, child: _buildNumBtn(context)),
              SweetAlbumCommonBtn(
                  text: K.room_send_gift,
                  onTap: () => widget.onRightTap?.call(0)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNumBtn(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (widget.chooseNumConfig.isEmpty) {
          return;
        }

        /// 弹出下拉菜单
        final renderObj = _leftHalfGlobalKey.currentContext?.findRenderObject();
        if (renderObj != null && renderObj is RenderBox) {
          final renderBox = renderObj;
          final offset = renderBox.localToGlobal(Offset.zero);
          final rect = Rect.fromLTWH(offset.dx, offset.dy, renderBox.size.width,
              renderBox.size.height);

          _controller.forward();
          SweetAlbumGiftNumMenu.show(context, widget.gift,
                  widget.chooseNumConfig, widget.sendNum, rect, Offset.zero)
              .then((value) {
            _controller.reverse();
            if (value is int) {
              widget.onLeftTap?.call(value);
            } else if (value is Pair) {
              widget.onRightTap?.call(value.second);
            }
          });
        }
      },
      child: Container(
        key: _leftHalfGlobalKey,
        alignment: AlignmentDirectional.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 15.5.dp),
            NumText(
              '${widget.sendNum}',
              style: TextStyle(
                  fontSize: 18.dp,
                  color: const Color(0xFFBC5B11),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 1.5.dp),
            RotationTransition(
              turns: _rotationAnimation,
              child: R.img(
                RoomAssets.chat_room$confess_v2_ic_num_arrow_webp,
                color: const Color(0xFFBC5B11),
                width: 12.dp,
                height: 12.dp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/widget/user_icon_outerborder.dart';

/// 分组PK创建选人位
class GPKCreatePosWidget extends StatefulWidget {
  final int id;
  final String? name;
  final String? imgUrl;
  final VoidCallback? onClickListener;

  /// 加号Widget
  const GPKCreatePosWidget.addWidget({
    super.key,
    this.onClickListener,
  })  : id = -1,
        name = null,
        imgUrl = null;

  /// 用户座位
  const GPKCreatePosWidget.avatarWidget({
    super.key,
    required this.id,
    this.name,
    this.imgUrl,
    this.onClickListener,
  });

  @override
  _GPKCreatePosWidgetState createState() => _GPKCreatePosWidgetState();
}

class _GPKCreatePosWidgetState extends State<GPKCreatePosWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onClickListener?.call();
      },
      child: Column(
        children: <Widget>[
          _buildAddAvatar(),
          _buildText(),
        ],
      ),
    );
  }

  /// 添加按钮/用户的头像
  _buildAddAvatar() {
    Widget child;
    if (widget.id > 0) {
      child =
          CommonAvatar(path: widget.imgUrl, size: 48, shape: BoxShape.circle);
    } else {
      child = R.img(RoomAssets.chat_room$gpk_gpk_pos_add_svg,
          width: 24, height: 24);
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(33),
            shape: BoxShape.circle,
          ),
          child: Center(child: child),
        ),
        const UserOuterBorderWidget(
          size: 50,
        ),
      ],
    );
  }

  /// 底部文案：虚位以待/用户昵称
  _buildText() {
    String name;
    if (widget.id > 0) {
      name = widget.name!;
    } else {
      name = K.room_gpk_c_add;
    }

    return Container(
      padding: const EdgeInsets.only(top: 4),
      width: 50,
      child: Center(
        child: Text(
          name,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}

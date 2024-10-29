import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/wedding/mode/wedding_combo_data.dart';

class WeddingComboGiftView extends StatefulWidget {
  const WeddingComboGiftView(
      {super.key,
      this.giftType,
      required this.giftItem,
      this.onComplete,
      this.alignment,
      this.animationDuration});

  final String? giftType;
  final WeddingComboGiftItem giftItem;
  final ValueChanged<WeddingComboGiftItem>? onComplete;
  final AlignmentDirectional? alignment;
  final int? animationDuration;

  @override
  _WeddingComboGiftViewState createState() => _WeddingComboGiftViewState();
}

class _WeddingComboGiftViewState extends State<WeddingComboGiftView> {
  late AlignmentDirectional _alignment;

  @override
  void initState() {
    super.initState();
    _alignment = widget.alignment ?? AlignmentDirectional.bottomStart;
  }

  _startAnimation() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _alignment = AlignmentDirectional(_alignment.start, -1.3);
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: AnimatedAlign(
        duration: Duration(milliseconds: widget.animationDuration ?? 3000),
        alignment: _alignment,
        onEnd: () {
          if (widget.onComplete != null) widget.onComplete!(widget.giftItem);
        },
        child: CachedNetworkImage(
          width: widget.giftItem.w.dp,
          height: widget.giftItem.h.dp,
          imageUrl: widget.giftItem.imageUrl,
          loadComplete: _startAnimation, //图片下载完成再开始动画
        ),
      ),
    );
  }
}

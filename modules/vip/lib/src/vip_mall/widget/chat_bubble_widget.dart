import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

/// 聊天气泡
///
class ChatBubbleWidget extends StatelessWidget {
  final String image;
  final String? text;
  final Color? color;
  final bool showText;
  final int? liveOnly;
  final String? liveLabel;
  final double ratio;

  const ChatBubbleWidget(
      {super.key, required this.image, this.text, this.color, this.showText = true, this.liveOnly, this.liveLabel, this.ratio = 1.0});

  @override
  Widget build(BuildContext context) {
    // Log.d('image:${image}');
    // Log.d('ratio:${ratio}');
    // Log.d('ratio2:${3 / (ratio > 1 ? 1 : ratio)}');
    return Container(
      margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
      constraints: BoxConstraints(minHeight: 48 * ratio, minWidth: 66 * ratio),
      child: Stack(
        children: <Widget>[
          PositionedDirectional(
            start: 0,
            top: 0,
            end: 0,
            bottom: 0,
            child: CachedNetworkImage(
              key: ValueKey('bubble-$image'),
              imageUrl: image,
              centerSlice: Rect.fromLTWH(32 * ratio, 23 * ratio, 2 * ratio, 2 * ratio),
              scale: 3 / (ratio > 1 ? 1 : ratio),
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.fromSTEB(26 * ratio, 15 * ratio, 29 * ratio, 13 * ratio),
            child: Text(
              showText ? (text ?? '') : '', // 部分使用的地方控件太小，显示文字就越界
              style: TextStyle(
                color: color ?? Colors.white,
                fontSize: 11 * ratio,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (liveOnly != null && liveOnly == 1 && liveLabel != null && liveLabel!.isNotEmpty)
            UserLiveLabelWidget(liveLabel, UserLiveLabelType.bubble),
        ],
      ),
    );
  }
}

import 'package:shared/shared.dart';
import 'package:chat/src/msg/config.dart';
import 'package:flutter/material.dart';

/// 魔法消息
class DisplayMagicMsg extends StatefulWidget {
  final MessageContent message;
  final Map extra;
  final MessageDisplayDirection direction;

  const DisplayMagicMsg(
      {super.key,
      required this.message,
      required this.extra,
      required this.direction});

  @override
  _DisplayMagicMsgState createState() => _DisplayMagicMsgState();
}

class _DisplayMagicMsgState extends State<DisplayMagicMsg> {
  static final Set<MessageContent> _autoPlayedSet = {};

  @override
  void initState() {
    super.initState();
    if (widget.message.inlineExtra != null &&
        widget.message.inlineExtra?.isNotEmpty == true) {
    } else {
      WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
        if (_autoPlayedSet.contains(widget.message)) {
          return;
        }
        _autoPlayedSet.add(widget.message);
        eventCenter.emit('UserChat.PlayGift', widget.message);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String bgUrl = Util.parseStr(widget.extra['magic_bubble']) ?? '';
    Color textColor =
        Util.parseColor(widget.extra['bubble_txt_color']) ?? Colors.transparent;
    double w = 32;
    double h = 120 / 198 * w + 1;
    return GestureDetector(
      onTap: () {
        eventCenter.emit("UserChat.PlayGift", widget.message);
      },
      child: Stack(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            clipBehavior: Clip.none,
            children: [
              const SizedBox(width: 66, height: 10),
              Positioned.fill(
                child: CachedNetworkImage(
                  imageUrl: Util.parseIcon(bgUrl),
                  centerSlice: Rect.fromLTWH(w, h, 1, 1),
                  scale: 3,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text(
                  widget.message.content,
                  maxLines: 100,
                  softWrap: true,
                  style: R.textStyle.body1
                      .copyWith(fontSize: 16, color: textColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

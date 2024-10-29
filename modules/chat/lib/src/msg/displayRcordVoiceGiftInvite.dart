import 'package:shared/shared.dart';
import 'package:chat/k.dart';
import 'package:flutter/material.dart';

/// 收到录音礼物定制邀请
class DisplayRecordVoiceGiftInvite extends StatefulWidget {
  final MessageContent message;
  final Map extra;

  const DisplayRecordVoiceGiftInvite(
      {Key? key, required this.message, required this.extra})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DisplayRecordVoiceGiftInviteState();
  }
}

class _DisplayRecordVoiceGiftInviteState
    extends State<DisplayRecordVoiceGiftInvite> {
  @override
  Widget build(BuildContext context) {
    String content = widget.message.content;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 236,
          height: 128,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: R.colors.mainBrandGradientColors,
            ),
          ),
        ),
        PositionedDirectional(
          top: 0,
          end: 0,
          child: R.img(
            'intimate_interact/msg_gift_wave.png',
            width: 188,
            height: 128,
            package: ComponentManager.MANAGER_GIFT,
          ),
        ),
        PositionedDirectional(
          top: -16,
          end: 0,
          child: R.img(
            'record_voice_gift_logo.webp',
            width: 88,
            height: 88,
            package: ComponentManager.MANAGER_GIFT,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            Container(
              width: 142,
              margin: const EdgeInsetsDirectional.only(start: 12),
              child: Text(
                content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            _buildBtn(),
          ],
        ),
      ],
    );
  }

  Widget _buildBtn() {
    return GestureDetector(
      onTap: _tapOpen,
      child: Container(
        width: 212,
        height: 40,
        alignment: AlignmentDirectional.center,
        margin: const EdgeInsetsDirectional.only(start: 12, end: 12),
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          color: Colors.white,
        ),
        child: Text(
          K.view_now,
          style: TextStyle(
            fontSize: 13,
            color: R.colors.highlightColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Future<void> _tapOpen() async {
    // IGiftManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
    // manager.checkReceiveCustomVoiceInvite(_id);
  }
}

import 'package:shared/shared.dart';
import 'package:chat/src/msg/config.dart';
import 'package:flutter/material.dart';

import '../../assets.dart';

/// 私聊语音消息
///
class VoiceMessageWidget extends StatefulWidget {
  final bool modify;
  final MessageDisplayDirection direction;
  final MessageContent message;

  const VoiceMessageWidget(this.modify, this.direction, this.message,
      {super.key});

  @override
  State<VoiceMessageWidget> createState() => _VoiceMessageWidgetState();
}

class _VoiceMessageWidgetState extends State<VoiceMessageWidget> {
  int _leftSeconds = 0;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener('Home.Audio.Play', _onAudioPlay);
    eventCenter.addListener('Home.Audio.Stop', _onAudioPlay);
    _leftSeconds = widget.message.duration ?? 0;
  }

  @override
  void dispose() {
    eventCenter.removeListener('Home.Audio.Play', _onAudioPlay);
    eventCenter.removeListener('Home.Audio.Stop', _onAudioPlay);
    super.dispose();
  }

  _onAudioPlay(String type, dynamic data) {
    if (!mounted) {
      return;
    }

    Map res = data;
    String audioUrl = res['url'];
    int seconds = res['seconds'];
    int messageId = res['messageid'];
    if (type == 'Home.Audio.Play') {
      if (audioUrl == widget.message.audioData) {
        if ((Util.parseInt(messageId) > 0 &&
            messageId != widget.message.messageId)) {
          return;
        }
        setState(() {
          _leftSeconds = seconds;
        });
      }
    } else if (type == 'Home.Audio.Stop') {
      setState(() {
        _leftSeconds = widget.message.duration ?? 0;
      });
    }
  }

  void _onVoicePlay(int messageId) async {
    MessageContent? message = await Im.getMessage(messageId);
    if (message == null) return;
    _onVoicePlayForBBim(messageId, message);
  }

  void _onVoicePlayForBBim(int messageId, MessageContent message) async {
    if (message.audioData != null && message.audioData!.startsWith('http')) {
      AudioPlay.instance().play(message.audioData!, message.duration ?? 0,
          messageId: message.messageId);
    } else {
      PulseIMWrapper.stopPlayVoice();
      await PulseIMWrapper.startPlayVoice(message.audioData ?? '', messageId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          widget.modify ? null : () => _onVoicePlay(widget.message.messageId),
      child: widget.direction == MessageDisplayDirection.Left
          ? Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: R.img(
                    Assets.chat$chat_voice_msg_left_svg,
                    width: 24.0,
                    height: 24.0,
                    color: R.colors.mainTextColor,
                    fit: BoxFit.cover,
                    package: ComponentManager.MANAGER_CHAT,
                  ),
                ),
                Text(
                  "$_leftSeconds \"",
                  style: R.textStyle.body1.copyWith(
                    color: R.colors.mainTextColor,
                  ),
                ),
                const SizedBox(width: 12),
              ],
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: 12),
                Text("$_leftSeconds \"",
                    style: R.textStyle.body1.copyWith(
                      color: R.colors.mainTextColor,
                    )),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: R.img(
                    Assets.chat$chat_voice_msg_right_svg,
                    width: 24.0,
                    height: 24.0,
                    fit: BoxFit.cover,
                    color: R.colors.mainTextColor,
                    package: ComponentManager.MANAGER_CHAT,
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
    );
  }
}

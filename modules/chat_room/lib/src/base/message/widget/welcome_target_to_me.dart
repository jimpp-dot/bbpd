// ignore_for_file:import_of_legacy_library_into_null_safe

import 'package:shared/shared.dart' hide MessageContent, MessageType;
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

import '../message_send_data.dart';
import '../message_send_frequency.dart';
import '../../../../k.dart';

class WelcomeTargetToMe extends StatefulWidget {
  final MessageContent message;
  final ChatRoomData room;
  final BoxDecoration bodyDecoration;

  const WelcomeTargetToMe(
      {super.key,
      required this.room,
      required this.message,
      required this.bodyDecoration});

  @override
  State<WelcomeTargetToMe> createState() => _WelcomeTargetToMeState();
}

class _WelcomeTargetToMeState extends State<WelcomeTargetToMe> {
  late List<GiftItem> gifs;

  @override
  void initState() {
    gifs = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.fromSTEB(8, 2, 0, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: widget.bodyDecoration,
            padding: const EdgeInsetsDirectional.fromSTEB(8, 6, 8, 6),
            child: RichText(
                text: TextSpan(
                    style: messageTextStyle.copyWith(
                      color: Colors.white,
                      fontFamily: Util.fontFamily,
                    ),
                    children: <TextSpan>[
                  TextSpan(
                      text: '@${Session.name}，',
                      style: const TextStyle(color: Color(0xFFFFE735))),
                  TextSpan(text: widget.message.message)
                ])),
          ),
          if (widget.message.localRamCache['WelcomeTargetToMeDidReplay'] ==
              null) ...[
            const SizedBox(
              height: 8,
            ),
            Container(
              decoration: BoxDecoration(
                color: widget.bodyDecoration.color,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(K.room_welcome_target_to_me_tips,
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 48,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...List.generate(gifs.length, (index) {
                          GiftItem item = gifs[index];
                          return Padding(
                            padding: EdgeInsetsDirectional.only(
                                start: index > 0 ? 20 : 0),
                            child: GestureDetector(
                              onTap: () async {
                                try {
                                  Tracker.instance
                                      .track(TrackEvent.click, properties: {
                                    'click_page': 'public_channel_reply_meme'
                                  });
                                  bool success = await sendEmoji(item);
                                  if (success) {
                                    if (mounted) {
                                      setState(() {
                                        widget.message.localRamCache[
                                                'WelcomeTargetToMeDidReplay'] =
                                            true;
                                      });
                                    }
                                  }
                                } catch (e) {
                                  Toast.showCenter(Constant.context, '$e');
                                  return;
                                }
                              },
                              child: Column(
                                children: [
                                  CachedNetworkImage(
                                      imageUrl: EmoteUtil.emoteImgUrl(item.key),
                                      fadeInDuration:
                                          const Duration(microseconds: 0),
                                      fadeOutDuration:
                                          const Duration(microseconds: 0),
                                      width: 30,
                                      height: 30),
                                  Text(
                                    item.name,
                                    style: const TextStyle(
                                        fontSize: 12.0, color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]
        ],
      ),
    );
  }

  Future<bool> sendEmoji(GiftItem item) async {
    Map<String, dynamic> extra = {
      'emote': item.key,
      'emote_sender': Session.uid,
      'duration': item.duration,
      'now': widget.room.serverTime,
    };

    DataRsp dataRsp = await widget.room.sendMessage(
      item.name,
      MessageSendData.msgExtraJsonEncode(widget.room, extra: extra),
      checkFrequency: MsgSendFrequency.instance.isEmoteRestrict(),
    );
    return dataRsp.success;
  }
}

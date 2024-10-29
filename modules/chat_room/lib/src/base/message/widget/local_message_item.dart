import 'dart:convert';

import 'package:shared/shared.dart' hide MessageContent;
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/roomNavUtil.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../repo/room_options_repo.dart';

class LocalMessageItem extends StatelessWidget {
  final MessageContent message;
  final ChatRoomData room;

  const LocalMessageItem(this.message, this.room, {super.key});

  void _changeRoomPrivacy(BuildContext context) async {
    List<SheetItem> res = [];

    res.add(SheetItem(K.room_set_public, "room_set_public"));
    res.add(SheetItem(K.room_set_private, "room_set_private"));
    res.add(SheetItem(K.room_set_only_friend, "room_set_only_friend"));
    res.add(SheetItem(K.room_set_only_fans, "room_set_only_fans"));

    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(title: K.room_operate_options, data: res);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }

    List<String> keys = [
      'room_set_public',
      'room_set_private',
      'room_set_only_friend',
      'room_set_only_fans',
    ];
    int selectIndex = keys.indexOf(result.value!.key);
    Map<String, String> params = {
      'options': json.encode([
        {'type': 'private_level', 'value': selectIndex.toString()},
      ])
    };

    try {
      BaseResponse baseResponse =
          await RoomOptionsRepo.optionsSave(room.realRid, params);
      if (baseResponse.success == false && baseResponse.msg != null) {
        Fluttertoast.showCenter(msg: baseResponse.msg);
      }
    } catch (e) {
      Fluttertoast.showCenter(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return _renderLocalMessage(context, message);
  }

  Widget _renderLocalMessage(BuildContext context, MessageContent message) {
    Map? extra = message.extra;
    String? navType, navText;
    List<TextSpan> spans = [];
    VoidCallback? onTap;

    if (extra != null) {
      navType = Util.parseStr(extra['nav-type']);
      navText = Util.parseStr(extra['nav-text']);

      if (navType == 'inputGameId') {
        List<TextSpan> spans = [];
        VoidCallback? onTap;
        if (navText != null) {
          spans.add(TextSpan(
              text: navText,
              style:
                  messageTextStyle.copyWith(color: const Color(0xFFFAA619))));

          onTap = () {
            RoomNavUtil.openInputGameIdScreen(context, room.config?.type ?? '');
          };
        }

        return GestureDetector(
          onTap: onTap,
          child: RichText(
            text: TextSpan(
              text: message.message,
              style: messageTextStyle.copyWith(
                fontFamily: Util.fontFamily,
              ),
              children: spans,
            ),
          ),
        );
      } else if (navType == 'inviteFriend') {
        onTap = () {
          ISettingManager settingManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_SETTINGS);
          settingManager.share(context, room.realRid,
              tp: 1, needInApp: true, newShareInRoom: true, rid: room.realRid);
        };
        spans.add(TextSpan(
            text: Util.notNullStr(extra['nav-text1']),
            style: messageTextStyle));
        spans.add(TextSpan(
            text: Util.notNullStr(extra['nav-text2']),
            style: messageTextStyle.copyWith(color: const Color(0xFFFAA619))));
        spans.add(TextSpan(
            text: Util.notNullStr(extra['nav-text3']),
            style: messageTextStyle));
      } else if (navType == 'changeRoomPrivacyClick') {
        return Text.rich(
          TextSpan(
            children: <InlineSpan>[
              TextSpan(
                text: message.message,
                style: messageTextStyle,
              ),
              WidgetSpan(
                child: GestureDetector(
                  onTap: () => _changeRoomPrivacy(context),
                  child: Container(
                    margin: const EdgeInsetsDirectional.only(
                        start: 5, top: 3, bottom: 3),
                    alignment: AlignmentDirectional.center,
                    width: 60,
                    height: 18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: R.color.mainBrandGradientColors,
                      ),
                    ),
                    child: Text(
                      K.room_set_room_public,
                      style: messageTextStyle.copyWith(
                          color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      } else if (navType == 'changeRoomPrivacy') {
        spans.add(TextSpan(
            text: Util.notNullStr(extra['nav-text1']),
            style: messageTextStyle));
        spans.add(TextSpan(
            text: Util.notNullStr(extra['nav-text2']),
            style: messageTextStyle.copyWith(color: const Color(0xFFFAA619))));
        spans.add(TextSpan(
            text: Util.notNullStr(extra['nav-text3']),
            style: messageTextStyle));
      } else if (navType == 'security') {
        List<String>? list = navText?.split('%s');

        if (list == null || list.length < 2) return const SizedBox.shrink();

        return RichText(
          text: TextSpan(
            style: TextStyle(
              fontFamily: Util.fontFamily,
            ),
            children: <InlineSpan>[
              TextSpan(
                text: list[0],
                style: messageTextStyle.copyWith(
                    color: const Color(0xFFFFC900),
                    fontFamily: Util.fontFamily),
              ),
              TextSpan(
                text: Util.notNullStr(extra['jump-text']),
                style: messageTextStyle.copyWith(
                    color: const Color(0xFFFFC900),
                    fontWeight: FontWeight.w600,
                    fontFamily: Util.fontFamily),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    if (extra['jump-url'] != null) {
                      BaseWebviewScreen.show(context,
                          url: Util.notNullStr(extra['jump-url']));
                    }
                  },
              ),
              TextSpan(
                text: list[1],
                style: messageTextStyle.copyWith(
                    color: const Color(0xFFFFC900),
                    fontFamily: Util.fontFamily),
              ),
            ],
          ),
        );
      }
    }

    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          text: message.message,
          style:
              messageTextStyle.copyWith(color: Colors.white.withOpacity(0.6)),
          children: spans,
        ),
      ),
    );
  }
}

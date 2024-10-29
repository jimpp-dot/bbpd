import 'package:shared/k.dart';
import 'package:shared/shared.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/material.dart';

const String rtcTypeServer = 'Server';
const String rtcTypeZego = 'Zego';
const String rtcTypeAgora = 'Agora';
const String rtcTypeTencent = 'Tencent';

Future<int?> showRoomRtcSelectDialog(BuildContext context) async {
  return showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(
            K.base_rtc_room_type,
            style: TextStyle(fontSize: 16, color: R.color.mainTextColor),
          ),
          backgroundColor: R.color.mainBgColor,
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, 0);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  rtcTypeServer,
                  style: TextStyle(color: R.color.mainTextColor),
                ),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, RtcBizConfig.rtcTypeAgora);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  rtcTypeAgora,
                  style: TextStyle(color: R.color.mainTextColor),
                ),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, RtcBizConfig.rtcTypeZego);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  rtcTypeZego,
                  style: TextStyle(color: R.color.mainTextColor),
                ),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, RtcBizConfig.rtcTypeTencent);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  rtcTypeTencent,
                  style: TextStyle(color: R.color.mainTextColor),
                ),
              ),
            ),
          ],
        );
      });
}

String getCurRoomRtcDes(int type) {
  switch (type) {
    case RtcBizConfig.rtcTypeZego:
      return rtcTypeZego;
    case RtcBizConfig.rtcTypeAgora:
      return rtcTypeAgora;
    case RtcBizConfig.rtcTypeTencent:
      return rtcTypeTencent;
    default:
      return rtcTypeServer;
  }
}

import 'dart:typed_data';

import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/biz_plugin/crosspk/model/repo.dart';
import 'package:chat_room/src/protobuf/generated/room_cross_pk.pb.dart';

/// 邀请弹窗 - 排位
class CrossPKInviteQualifyingDialog extends StatefulWidget {
  final int rid;
  final RoomCrossPkQualifyingAffirmMessage data;

  const CrossPKInviteQualifyingDialog({
    Key? key,
    required this.rid,
    required this.data,
  }) : super(key: key);

  @override
  State createState() => _CrossPKInviteQualifyingDialogState();

  static Future<void> show({
    required BuildContext context,
    required int rid,
    Object? value,
  }) async {
    if (value != null && value is Uint8List) {
      RoomCrossPkQualifyingAffirmMessage message =
          RoomCrossPkQualifyingAffirmMessage.fromBuffer(value);
      Log.d("CrossPKInviteQualifyingDialog message: $message");
      return showDialog(
        context: context,
        builder: (context) =>
            CrossPKInviteQualifyingDialog(rid: rid, data: message),
        barrierDismissible: false,
        routeSettings:
            const RouteSettings(name: 'CrossPKInviteQualifyingDialog'),
      );
    }
  }
}

class _CrossPKInviteQualifyingDialogState
    extends State<CrossPKInviteQualifyingDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 24),
        Text(
          K.room_cross_pk_invite_qualifying_title,
          style: const TextStyle(
              color: Color(0xFF313131),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        Container(
          height: 150,
          margin: const EdgeInsetsDirectional.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Color(0xFFFEF4FF), Color(0xFFF0F8FF)]),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      K.room_cross_pk_invite_qualifying_tip_1,
                      style: const TextStyle(
                          color: Color(0xFFFF5C99),
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      K.room_cross_pk_invite_qualifying_tip_2,
                      style: TextStyle(
                          color: R.color.secondTextColor, fontSize: 13),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(12),
                    bottomEnd: Radius.circular(12)),
                child: PkScoreWidget.noScore(),
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GradientButton(
              K.room_refuse_pk,
              onTap: () {
                CrossPKRepo.reject(
                  widget.rid,
                  0,
                  mode: widget.data.mode,
                  inviteMode: widget.data.inviteMode,
                  version: widget.data.pkId,
                );
                Navigator.of(context).maybePop();
              },
              colors: const [Color(0xFFF5F5F5), Color(0xFFF5F5F5)],
              width: 120,
              height: 48,
              textStyle:
                  const TextStyle(color: Color(0xB3202020), fontSize: 15),
            ),
            const SizedBox(width: 12),
            GradientButton(
              K.room_accept_pk,
              onTap: () {
                CrossPKRepo.accept(
                  widget.rid,
                  0,
                  mode: widget.data.mode,
                  inviteMode: widget.data.inviteMode,
                  version: widget.data.pkId,
                );
                Navigator.of(context).maybePop();
              },
              colors: const [Color(0xFF65A1FF), Color(0xFFFE6790)],
              width: 120,
              height: 48,
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildTimer(),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildTimer() {
    int timer = 10;
    if (timer <= 0) {
      return const SizedBox.shrink();
    }

    return TimerWidget(
      stop: Duration(seconds: timer),
      onTick: () {
        timer--;
        if (timer <= 0) {
          if (ModalRoute.of(context)?.isActive ?? false) {
            Navigator.of(context).maybePop();
          }
        }
      },
      builder: (context) {
        return Text(
          widget.data.actionWhenTimeout == 0
              ? K.live_pk_agree_timer(['$timer'])
              : K.room_live_pk_refuse_timer(['$timer']),
          style: const TextStyle(
            color: Color(0x99313131),
            fontSize: 12,
          ),
        );
      },
    );
  }
}

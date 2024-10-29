import 'dart:typed_data';

import 'package:chat_room/k.dart';
import 'dart:async';
import 'dart:math';

import 'package:shared/shared.dart';
import 'package:chat_room/src/biz_plugin/crosspk/model/repo.dart';
import 'package:chat_room/src/protobuf/generated/room_cross_pk.pb.dart';
import 'package:flutter/material.dart';

/// 约战 - 申请结束 dialog
class CrossPKApplyEndDialog extends StatefulWidget {
  final int rid;
  final RoomCrossPkEndVoteMessage message;

  const CrossPKApplyEndDialog(
      {Key? key, required this.rid, required this.message})
      : super(key: key);

  @override
  _CrossPKApplyEndDialogState createState() {
    return _CrossPKApplyEndDialogState();
  }

  static Future<void> show(
      {required BuildContext context, required int rid, Object? data}) async {
    //print('CrossPKApplyEndDialog show data=$data');
    if (data is Uint8List) {
      RoomCrossPkEndVoteMessage message =
          RoomCrossPkEndVoteMessage.fromBuffer(data);
      return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => CrossPKApplyEndDialog(rid: rid, message: message),
      );
    }
  }
}

class _CrossPKApplyEndDialogState extends State<CrossPKApplyEndDialog> {
  late Timer timer;

  Future _vote(bool agree) async {
    CrossPKRepo.voteEnd(widget.rid, agree, widget.message.versionCode);
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick >= 60) {
        if (mounted) {
          Navigator.of(context).pop();
        }
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 312.dp,
          height: 320.dp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              R.img(
                "crosspk/ic_cross_pk_overtime_dialog_bg.webp",
                width: 312.dp,
                height: 290.dp,
                package: ComponentManager.MANAGER_BASE_ROOM,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 16, end: 16, top: 24, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      K.cross_pk_overtime_title,
                      style: const TextStyle(
                        color: Color(0xFF313131),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildContent(),
                    const SizedBox(height: 16),
                    _buildButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFFEF4FF), Color(0xFFF0F8FF)],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonAvatar(
                path: widget.message.sender.icon,
                size: 52.dp,
                shape: BoxShape.circle,
              ),
              const SizedBox(height: 4),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        widget.message.sender.name,
                        style: const TextStyle(
                          color: Color(0xFF313131),
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 2),
                    UserSexWidget(sex: widget.message.sender.sex, size: 14),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.message.content,
                style: const TextStyle(
                  color: Color(0xFF313131),
                  fontSize: 16,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton() {
    String remainTime = '（${max(widget.message.duration - timer.tick, 0)}s）';
    bool defaultRefuse = widget.message.defaultMode == 2;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            _vote(false);
          },
          child: Container(
            width: 134.dp,
            height: 48.dp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: const Color(0xFFF5F5F5),
            ),
            child: Center(
              child: Text(
                '${K.cross_pk_overtime_refuse}${defaultRefuse ? remainTime : ''}',
                style: const TextStyle(
                  color: Color(0xB3202020),
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            _vote(true);
          },
          child: Container(
            width: 134.dp,
            height: 48.dp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                colors: [Color(0xFFFE6790), Color(0xFF65A1FF)],
              ),
            ),
            child: Center(
              child: Text(
                '${K.cross_pk_overtime_agree}${!defaultRefuse ? remainTime : ''}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

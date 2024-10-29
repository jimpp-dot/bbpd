import 'package:chat_room/k.dart';
import 'package:shared/dart_extensions/extensions_common.dart';
import 'dart:async';
import 'dart:math';

import 'package:shared/shared.dart';
import 'package:chat_room/src/biz_plugin/crosspk/model/repo.dart';
import 'package:chat_room/src/protobuf/generated/room_cross_pk.pb.dart';
import 'package:flutter/material.dart';

/// 约战 - 加时 dialog
class CrossPKOvertimeDialog extends StatefulWidget {
  final int rid;
  final MessageOvertimePoll message;

  const CrossPKOvertimeDialog(
      {Key? key, required this.rid, required this.message})
      : super(key: key);

  @override
  _CrossPKOvertimeDialogState createState() {
    return _CrossPKOvertimeDialogState();
  }

  static Future<void> show(
      {required BuildContext context, required int rid, Object? data}) async {
    if (data is Map && data.containsKey('pb')) {
      MessageOvertimePoll message =
          MessageOvertimePoll.fromBuffer(List<int>.from(data['pb']));
      return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => CrossPKOvertimeDialog(rid: rid, message: message),
      );
    }
  }
}

class _CrossPKOvertimeDialogState extends State<CrossPKOvertimeDialog> {
  late Timer timer;

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
              SizedBox(
                width: 312.dp,
                height: 290.dp,
              ),

              // R.img(
              //   "crosspk/ic_cross_pk_overtime_dialog_bg.webp",
              //   width: 312.dp,
              //   height: 290.dp,
              //   package: ComponentManager.MANAGER_BASE_ROOM,
              // ),
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
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        _buildContent(),
                        CommonAvatar(
                          path: widget.message.sender.icon,
                          size: 52.dp,
                          shape: BoxShape.circle,
                        ),
                      ],
                    ),
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
    return Container(
      margin: const EdgeInsets.only(top: 46),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFEF4FF), Color(0xFFF0F8FF)],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding:
            EdgeInsets.only(left: 16.dp, right: 16.dp, top: 24.dp, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 4),
            Row(
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
    );
  }

  Widget _buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            CrossPKRepo.voteOvertime(widget.rid, 0, widget.message.duration);
            Navigator.of(context).pop();
          },
          child: Container(
            width: 134.dp,
            height: 48.dp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: const Color(0xFFE5E5E5),
            ),
            child: Center(
              child: Text(
                '${K.cross_pk_overtime_refuse}（${max(60 - timer.tick, 0)}s）',
                style: const TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            CrossPKRepo.voteOvertime(widget.rid, 1, widget.message.duration);
            Navigator.of(context).pop();
          },
          child: Container(
            width: 134.dp,
            height: 48.dp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF9EFF4E),
                  Color(0xFF60FFF5),
                ],
              ),
            ),
            child: Center(
              child: Text(
                K.cross_pk_overtime_agree,
                style: const TextStyle(
                    color: Colors.black,
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

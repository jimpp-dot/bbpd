import 'dart:typed_data';

import 'package:shared/shared.dart' hide RoomCrossPkSegmentItem;
import 'package:shared/util/qualifying_util.dart';
import 'package:shared/widget/qualifying_segment_start_widget.dart';
import 'package:chat_room/src/base/widget/room_vap_overlay.dart';
import 'package:chat_room/src/protobuf/generated/room_cross_pk.pb.dart';
import 'package:flutter/material.dart';

/// 段位结果通知
class CrossPKResultSegmentDialog extends StatefulWidget {
  final RoomCrossPkSegmentMessage data;

  const CrossPKResultSegmentDialog({Key? key, required this.data})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CrossPKResultSegmentDialogState();

  static Future<void> show(BuildContext context,
      {required Object? value}) async {
    if (value != null && value is Uint8List) {
      RoomCrossPkSegmentMessage message =
          RoomCrossPkSegmentMessage.fromBuffer(value);
      Log.d("CrossPKResultSegmentDialog message: $message");
      // 判断是否先播动画
      if (Util.validStr(message.vapUrl) && message.vapSize > 0) {
        RoomVapOverlay.show(
          context: context,
          vapUrl: message.vapUrl,
          vapSize: message.vapSize,
          onComplete: () {
            // 动画结束后展示段位信息
            _realShow(context, message);
          },
        );
      } else {
        // 平局没有动画
        _realShow(context, message);
      }
    }
  }

  static Future<void> _realShow(
      BuildContext context, RoomCrossPkSegmentMessage message) async {
    return showDialog(
      context: context,
      builder: (context) => CrossPKResultSegmentDialog(data: message),
      routeSettings: const RouteSettings(name: 'CrossPKResultSegmentDialog'),
    );
  }
}

class _CrossPKResultSegmentDialogState
    extends State<CrossPKResultSegmentDialog> {
  RoomCrossPkSegmentItem get segment => widget.data.curSegment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0x99000000),
        alignment: AlignmentDirectional.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CachedNetworkImage(
                imageUrl: segment.segmentUrl, width: 140, height: 140),
            const SizedBox(height: 6),
            Text(
              QualifyingUtil.getSegmentTitle(
                  segment.segmentName, segment.subSegment),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            QualifyingSegmentStarBigWidget(segment.star, segment.totalStar),
            const SizedBox(height: 12),
            Text(widget.data.tips,
                style: const TextStyle(color: Color(0x99FFFFFF), fontSize: 13)),
          ],
        ),
      ),
    );
  }
}

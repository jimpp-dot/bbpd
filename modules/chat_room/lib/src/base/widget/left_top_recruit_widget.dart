import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/material.dart';
import 'package:pulse_log/pulse_log.dart';

/// 剧本以外 在房间左上角的征召按钮
class LeftTopRecruitWidget extends StatefulWidget {
  final ChatRoomData room;
  final EdgeInsetsGeometry? margin;
  final dynamic state;

  const LeftTopRecruitWidget(
      {Key? key, required this.room, this.margin, this.state})
      : super(key: key);

  @override
  _LeftTopRecruitWidgetState createState() => _LeftTopRecruitWidgetState();
}

class _LeftTopRecruitWidgetState extends State<LeftTopRecruitWidget> {
  @override
  Widget build(BuildContext context) {

    return const SizedBox.shrink();
    String adminRole = '';
    if (widget.room.isEightOwner(Session.uid)) {
      // 在房主位的房主
      if (ClientRole.Broadcaster == widget.room.role) {
        adminRole = 'broadcaster';
      } else {
        adminRole = 'audience';
      }
    }

    String? wolfTypeLabel;
    String? wolfPublishLabel;
    if (widget.room.config?.game == Games.Wolf) {
      IWereWolfManager wereWolfManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_WERE_WOLF);

      wolfTypeLabel = wereWolfManager.getTypeLabel();
      wolfPublishLabel = wereWolfManager.getPublishDeal();
    }
    return Visibility(
      visible: ChatRoomUtil.showRecruitView(state: widget.state),
      child: RecruitWidget(
        widget.room.matchStatus,
        rid: widget.room.rid,
        typeLabel: wolfTypeLabel ?? widget.room.config?.type,
        adminRole: adminRole,
        onRecruit: _onRecruit,
        game: widget.room.config?.game,
        recruitTotalSeconds: widget.room.matchAllSeconds,
        recruitLeftSeconds: widget.room.matchLeftSeconds,
        publishDeal: wolfPublishLabel ?? '',
        margin: widget.margin,
      ),
    );
  }

  void _onRecruit() {
    String? roomType = widget.room.config?.type;

    Map<String, dynamic> properties = {
      'rid': widget.room.rid,
      'room_type': roomType ?? '',
    };

    if (widget.room.config?.game == Games.Wolf) {
      IWereWolfManager wereWolfManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_WERE_WOLF);
      properties['game_type'] = wereWolfManager.getGameType();
    } else if (widget.room.config?.game != Games.None) {
      properties['game_type'] =
          describeEnum(widget.room.config?.game).toLowerCase();
    }

    Tracker.instance.track(TrackEvent.room_invite, properties: properties);

    PulseLog.instance.event('click_event', properties: {
      'click_tag': 'room_left_top_recruit',
    });
  }
}

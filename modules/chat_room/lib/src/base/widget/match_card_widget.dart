import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../../k.dart';

class MatchCardWidget extends StatefulWidget {
  final Map map;

  const MatchCardWidget(this.map, {super.key});

  static void show(Map map) {
    TopSheet.show(
        context: System.context,
        child: MatchCardWidget(map),
        transparentBg: true,
        animationMilliseconds: 100,
        decoration: const BoxDecoration(),
        direction: TopSheetDirection.TOP);
  }

  @override
  _MatchCardWidgetState createState() => _MatchCardWidgetState();
}

class _MatchCardWidgetState extends State<MatchCardWidget> {
  int _leftTime = 5;
  double ratio = Util.ratio;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    Tracker.instance.track(TrackEvent.new_pop_show, properties: {
      'to_uid': Util.parseInt(widget.map['uid']),
      'rid': Util.parseInt(widget.map['rid']),
      if (widget.map['type_label'] != null)
        'type_label': Util.parseStr(widget.map['type_label']),
      if (widget.map['room_factory_type'] != null)
        'room_factory_type': Util.parseStr(widget.map['room_factory_type']),
      if (widget.map['settlement_channel'] != null)
        'settlement_channel': Util.parseStr(widget.map['settlement_channel']),
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _leftTime--;
      if (_leftTime <= 0) {
        _disMissWidget();
      } else {
        if (mounted) {
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String year = widget.map['year'] ?? '';
    if (year.length == 4) {
      year = '${year.substring(2, 3)}0后';
    }
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        IRoomManager roomManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager.openChatRoomScreenShow(context, widget.map['rid'],
            refer: 'new_pop');
      },
      child: Container(
        padding: EdgeInsetsDirectional.fromSTEB(20 * ratio, 0, 20 * ratio, 0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 268 * ratio,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                      colors: [Color(0xFFD670FF), Color(0xFF91ADFF)])),
            ),
            PositionedDirectional(
              top: 0,
              child: R.img('room_match_card_bg.webp',
                  width: 295 * ratio,
                  height: 208 * ratio,
                  package: ComponentManager.MANAGER_BASE_ROOM),
            ),
            PositionedDirectional(
                start: 12 * ratio,
                top: 12 * ratio,
                end: 17 * ratio,
                height: 24,
                child: Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: Util.getRemoteImgUrl(widget.map['t_icon']),
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                        child: Text(
                      widget.map['t_title'],
                      style:
                          R.textStyle.regular14.copyWith(color: Colors.white),
                      maxLines: 1,
                    )),
                    GestureDetector(
                      onTap: _disMissWidget,
                      child: R.img('close_icon.svg',
                          width: 14,
                          height: 14,
                          color: const Color(0xB3FFFFFF),
                          package: ComponentManager.MANAGER_BASE_CORE),
                    )
                  ],
                )),
            PositionedDirectional(
                top: 0,
                bottom: 0,
                start: 0,
                end: 0,
                child: Column(
                  children: [
                    SizedBox(
                      height: 48 * ratio,
                    ),
                    CommonAvatar(
                      path: widget.map['icon'],
                      size: 72 * ratio,
                      shape: BoxShape.circle,
                    ),
                    SizedBox(
                      height: 12 * ratio,
                    ),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 150),
                      child: Text(
                        widget.map['title'] ?? '',
                        style:
                            R.textStyle.medium16.copyWith(color: Colors.white),
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      height: 4 * ratio,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          year,
                          style: R.textStyle.regular14
                              .copyWith(color: const Color(0xB3FFFFFF)),
                        ),
                        Container(
                          margin:
                              const EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                          width: 2,
                          height: 2,
                          decoration: const ShapeDecoration(
                              shape: StadiumBorder(), color: Color(0xB3FFFFFF)),
                        ),
                        Text(
                          K.room_distance_to_you(
                              [Util.getDistanceStr(widget.map['distance'])]),
                          style: R.textStyle.regular14
                              .copyWith(color: const Color(0xB3FFFFFF)),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: EdgeInsetsDirectional.fromSTEB(
                          20 * ratio, 0, 20 * ratio, 20 * ratio),
                      height: 48 * ratio,
                      decoration: const ShapeDecoration(
                          shape: StadiumBorder(), color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          R.img('room_active_purple.webp',
                              width: 12,
                              height: 12,
                              package: ComponentManager.MANAGER_BASE_CORE),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                              '${K.room_go_to_she_party_chat([
                                    Util.getSexDesc(
                                        Util.parseInt(widget.map['sex']))
                                  ])}(${_leftTime}s)',
                              style: R.textStyle.medium16
                                  .copyWith(color: const Color(0xFFB38FFF))),
                        ],
                      ),
                    ),
                  ],
                )),
            if (Util.parseInt(widget.map['online_status']) > 0)
              PositionedDirectional(
                  top: 104 * ratio,
                  end: 136 * ratio,
                  child: Container(
                    width: 12 * ratio,
                    height: 12 * ratio,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(6 * ratio),
                        color: R.color.fiveBrightColor),
                  ))
          ],
        ),
      ),
    );
  }

  _disMissWidget() {
    if (mounted) {
      Navigator.of(context).maybePop();
    }
  }
}

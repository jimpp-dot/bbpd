import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

import '../../base/widget/package_at_mic_bottom.dart';
import '../../base/widget/user_icon_tap_handler.dart';
import '../model/heart_race_model.dart';
import '../model/heart_race_repo.dart';
import 'heart_race_counter.dart';
import 'heart_race_delay_dialog.dart';

class HeartRaceUserIcon extends StatelessWidget {
  final ChatRoomData room;
  final RoomPosition roomPosition;
  final String? frameUrl;
  final bool showPackage;
  final double iconSize;
  final bool showOffline;
  final bool showName;
  final bool showIcon;
  final bool showEmptyName;

  /// pk以后的环节，不展示虚位以待
  final bool cantJoinMic;

  /// pk以后的环节，不能点击空麦位上麦

  const HeartRaceUserIcon({
    super.key,
    required this.room,
    required this.roomPosition,
    this.frameUrl,
    this.showPackage = false,
    this.iconSize = 60,
    this.showOffline = false,
    this.showName = true,
    this.showIcon = true,
    this.showEmptyName = false,
    this.cantJoinMic = false,
  });

  @override
  Widget build(BuildContext context) {
    if (showPackage == true) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildIconAndName(),
          const SizedBox(
            height: 2,
          ),
          PackageAtMicBottom(
            package: roomPosition.package,
            display: true,
            width: 42,
          ),
        ],
      );
    }

    return buildIconAndName();
  }

  Widget buildIconAndName() {
    bool showNameWidget = showName &&
        !(!showEmptyName &&
            ((roomPosition.uid == 0 && roomPosition.originId == 0)));
    return SizedBox(
      width: iconSize,
      height: iconSize + 2,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          if (showIcon)
            PositionedDirectional(
              bottom: 2,
              child: UserIcon(
                position: roomPosition,
                room: room,
                size: iconSize,
                border:
                    BorderSide(color: Colors.white.withOpacity(0.2), width: 2),
                frameUrl: frameUrl ?? '',
                showOffline: showOffline,
                tapHandler: (cantJoinMic == true && roomPosition.uid <= 0)
                    ? HeartRaceUserIconTapHandler()
                    : null,
              ),
            ),
          if (showNameWidget)
            PositionedDirectional(
              bottom: 0,
              child: Container(
                width: 53,
                height: 16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(8),
                  border:
                      Border.all(color: const Color(0x80C988FF), width: 0.5),
                  color: const Color(0xCC472C5F),
                ),
                child: (roomPosition.uid > 0 || roomPosition.originId > 0)
                    ? Row(
                        children: [
                          const SizedBox(
                            width: 3,
                          ),
                          Container(
                            width: 10,
                            height: 10,
                            alignment: AlignmentDirectional.center,
                            decoration: ShapeDecoration(
                              shape: const CircleBorder(),
                              gradient: positionGradient,
                            ),
                            child: Text(
                              '${roomPosition.position}',
                              maxLines: 1,
                              style: const TextStyle(
                                  color: Color(0xFFFEFEFE),
                                  fontSize: 8,
                                  height: 1.1),
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Expanded(
                            child: Text(
                              roomPosition.name,
                              style: const TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  height: 1.2),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                        ],
                      )
                    : Center(
                        child: Text(
                          K.room_wait_for_seated,
                          style: const TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              height: 1.2),
                        ),
                      ),
              ),
            ),
        ],
      ),
    );
  }

  Gradient get positionGradient {
    List<Color> colors;
    if (roomPosition.sex == Sex.Female) {
      colors = [const Color(0xFFFF99B4), const Color(0xFFFF5F7D)];
    } else {
      colors = [const Color(0xFF75DFFF), const Color(0xFF2ECEFE)];
    }
    return LinearGradient(colors: colors);
  }
}

class HeartRaceBossUserIcon extends StatelessWidget {
  final ChatRoomData room;
  final RoomPosition roomPosition;

  const HeartRaceBossUserIcon(
      {required this.room, required this.roomPosition, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 52,
          height: 55,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              PositionedDirectional(
                bottom: 3,
                child: Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: const Color(0xFFBD78FF), width: 2),
                  ),
                  alignment: AlignmentDirectional.center,
                  child: UserIcon(
                    position: roomPosition,
                    room: room,
                    size: 48,
                  ),
                ),
              ),
              Container(
                width: 26,
                height: 14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(7),
                  gradient: const LinearGradient(
                      colors: [Color(0xFF6D5DFF), Color(0xFFC56AFF)]),
                ),
                alignment: AlignmentDirectional.center,
                child: Text(
                  K.room_cplink_user_label_boss,
                  style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      height: 1.1),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Container(
          width: 52,
          alignment: AlignmentDirectional.topCenter,
          child: Text(
            roomPosition.name,
            style: const TextStyle(fontSize: 11, color: Colors.white),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class HeartRaceReceptionUserIcon extends StatelessWidget {
  final ChatRoomData room;
  final RoomPosition roomPosition;
  final HeartRaceState? state;
  final int? stateDeadline;
  HeartRaceReceptionUserIcon(
      {super.key,
      required this.room,
      required this.roomPosition,
      this.state,
      this.stateDeadline});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 52,
              height: 55,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  PositionedDirectional(
                    bottom: 3,
                    child: Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: const Color(0xFFF863D3), width: 2),
                      ),
                      alignment: AlignmentDirectional.center,
                      child: UserIcon(
                        position: roomPosition,
                        room: room,
                        size: 48,
                      ),
                    ),
                  ),
                  Container(
                    width: 26,
                    height: 14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(7),
                      gradient: const LinearGradient(
                          colors: [Color(0xFFFE62A5), Color(0xFFF86AFF)]),
                    ),
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      K.room_reception,
                      style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          height: 1.1),
                    ),
                  ),
                ],
              ),
            ),
            ...buildOptions(),
          ],
        ),
        const SizedBox(
          height: 3,
        ),
        Container(
          width: 52,
          alignment: AlignmentDirectional.topCenter,
          child: Text(
            roomPosition.name,
            style: const TextStyle(fontSize: 11, color: Colors.white),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        if ((state == HeartRaceState.pk || state == HeartRaceState.pk_result) &&
            stateDeadline != null &&
            stateDeadline! > room.timestamp)
          HeartRaceCounter(
            counter: stateDeadline!,
          ),
      ],
    );
  }

  List<Widget> buildOptions() {
    List<Widget> widgets = [];
    if (Session.uid == roomPosition.uid && roomPosition.uid > 0) {
      if (state == HeartRaceState.wait) {
        /// 下一环节
        widgets.add(const SizedBox(
          width: 12,
        ));
        widgets.add(buildNextStep());
      } else if (state == HeartRaceState.pk ||
          state == HeartRaceState.pk_result) {
        /// 下一环节/加时
        widgets.add(const SizedBox(
          width: 12,
        ));
        widgets.add(buildNextStep());
        widgets.add(const SizedBox(
          width: 12,
        ));
        widgets.add(buildDelay());
      } else {
        /// 结束
        widgets.add(const SizedBox(
          width: 12,
        ));
        widgets.add(buildNextStep());
      }
    }

    return widgets;
  }

  Widget buildNextStep() {
    String text = K.room_next_step;
    if (state == HeartRaceState.choose_relation) {
      text = K.end;
    }
    return GestureDetector(
      onTap: () {
        setHeartRaceState(getNextState());
      },
      child: Container(
        width: 55,
        height: 18,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(9),
          color: Colors.black.withOpacity(0.48),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            height: 1.1,
          ),
        ),
      ),
    );
  }

  Widget buildDelay() {
    return GestureDetector(
      onTap: () async {
        int? second = await showDialog(
            barrierDismissible: false,
            context: System.context,
            builder: (BuildContext context) {
              return const HeartRaceDelayDialog();
            });
        if (second == null || second <= 0) {
          return;
        }
        delay(second);
      },
      child: Container(
        width: 55,
        height: 18,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(9),
          color: Colors.black.withOpacity(0.48),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          K.room_cplink_delay,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            height: 1.1,
          ),
        ),
      ),
    );
  }

  String getNextState() {
    if (state == HeartRaceState.wait) {
      return 'pk';
    } else if (state == HeartRaceState.pk) {
      return 'pk_result';
    } else if (state == HeartRaceState.pk_result) {
      return 'choose_relation';
    } else {
      return 'wait';
    }
  }

  bool isSetState = false;
  void setHeartRaceState(String state) async {
    if (isSetState) {
      return;
    }
    isSetState = true;

    String content = K.room_heart_race_next_step_dialog_content_1;
    if (state == 'wait') {
      content = K.room_heart_race_next_step_dialog_content_2;
    }
    bool? confirm = await showDialog(
        barrierDismissible: false,
        context: System.context,
        builder: (BuildContext context) {
          return ConfirmDialog(
            title: K.room_notice,
            content: content,
          );
        });
    if (confirm == null || !confirm) {
      isSetState = false;
      return;
    }

    NormalNull data = await HeartRaceRepo.setState(room.realRid, state);

    if (data.success == false && Util.validStr(data.msg)) {
      Fluttertoast.showCenter(msg: data.msg);
    }

    isSetState = false;
  }

  bool isDelay = false;
  void delay(int second) async {
    if (isDelay) {
      return;
    }
    isDelay = true;

    NormalNull data = await HeartRaceRepo.delay(room.realRid, second);

    if (data.success == false && Util.validStr(data.msg)) {
      Fluttertoast.showCenter(msg: data.msg);
    }

    isDelay = false;
  }
}

class HeartRaceUserIconTapHandler extends UserIconTapHandler {
  @override
  onIconTap() async {
    Fluttertoast.showCenter(msg: K.room_heart_race_cant_join_mic);
  }
}

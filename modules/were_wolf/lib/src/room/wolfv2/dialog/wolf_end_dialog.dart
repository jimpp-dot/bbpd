import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';

//import 'package:were_wolf/src/room/wolf/main/wolf_repository.dart';
//import 'package:were_wolf/src/room/wolfnew/model/wolf_beans.dart';
//import 'package:were_wolf/src/room/wolfnew/widget/wolf_common_widgets.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_base_button.dart';

enum EndType {
  GoodWin, //好人获胜
  WolfWin, //狼人获胜
  Draw //平局
}

class WolfEndDialog extends StatefulWidget {
  final RoomPosition? selfPosition;
  final List<RoomPosition> allPositions;
  final EndType? endType;
  final UserExpInfo? userExpInfo;
  final ChatRoomData? room;

  const WolfEndDialog(
      {super.key,
      this.selfPosition,
      required this.allPositions,
      this.userExpInfo,
      this.endType,
      this.room});

  @override
  _WolfEndDialogState createState() => _WolfEndDialogState();

  static show(BuildContext context, ChatRoomData? roomData) async {
    eventCenter.emit(EventConstant.EventWolfDialogClose);
    int result = 2;
    UserExpInfo? userExpInfo;
    WolfConfigData? wolfConfigData =
        roomData?.config?.configExpendData as WolfConfigData?;
    Map? endData = wolfConfigData?.currentResult;
    if (endData != null) {
      result = Util.parseInt(endData['win'], 2);
      Map? userExpList = endData['userExpList'];
      if (userExpList != null) {
        Map? expData = userExpList['${Session.uid}'];
        if (expData != null)
          userExpInfo = UserExpInfo.fromJson(expData as Map<String, dynamic>);
      }
    }
    EndType endType = EndType.WolfWin;
    if (result == 2) {
      endType = EndType.GoodWin;
    } else if (result == 3) {
      endType = EndType.WolfWin;
    } else if (result == 4) {
      endType = EndType.Draw;
    }

    List<RoomPosition> allPositions = [];
    for (var element in roomData!.positions) {
      allPositions.add(element);
    }

    RoomPosition? selfPosition = roomData.positionForCurrentUser;

    await showGeneralDialog(
        context: context,
        barrierDismissible: false,
        transitionDuration: const Duration(milliseconds: 300),
        transitionBuilder: _buildMaterialDialogTransitions,
        pageBuilder: (BuildContext buildContext, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return WolfEndDialog(
            selfPosition: selfPosition,
            allPositions: allPositions,
            userExpInfo: userExpInfo,
            endType: endType,
            room: roomData,
          );
        });
  }

  static Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }

  static dismiss(BuildContext context) {
    eventCenter.emit(EventConstant.EventWolfDialogClose);
  }
}

class _WolfEndDialogState extends State<WolfEndDialog> {
  @override
  void initState() {
    super.initState();
    eventCenter.addListener(EventConstant.EventWolfDialogClose, _close);
  }

  Widget _buildContent() {
    return _WoldEndRolesWidget(
      allPositions: widget.allPositions,
      endType: widget.endType,
      selfPosition: widget.selfPosition,
      room: widget.room,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width,
      height: Util.height,
      //574.0+12.0+15.0+5.0
//      alignment: AlignmentDirectional.centerStart,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            R.imagePath('wolfv2/end_dialog/end_dialog_bg.webp'),
            package: ComponentManager.MANAGER_WERE_WOLF,
          ),
          fit: BoxFit.fill,
        ),
      ),
      padding: const EdgeInsets.all(0.0),
      child: _buildContent(),
    );
  }

  @override
  void dispose() {
    eventCenter.removeListener(EventConstant.EventWolfDialogClose, _close);
    super.dispose();
  }

  _close(String type, dynamic data) async {
    if (ModalRoute.of(context)?.isCurrent == true) {
      Navigator.of(context).pop();
    }
  }
}

class _WoldEndRolesWidget extends StatelessWidget {
  final List<RoomPosition> allPositions;
  final EndType? endType;
  final RoomPosition? selfPosition;
  final ChatRoomData? room;

  const _WoldEndRolesWidget(
      {required this.allPositions, this.endType, this.selfPosition, this.room});

  String _getWinImagPath() {
    String imgPath = 'wolfv2/end_dialog/';
    if (endType == EndType.WolfWin) {
      imgPath += 'werewolf_win.webp';
    } else if (endType == EndType.GoodWin) {
      imgPath += 'good_win.webp';
    } else {
      imgPath += 'good_lose.webp';
    }

    return imgPath;
  }

  Widget _buildLossTitle() {
    String imgPath = 'wolfv2/end_dialog/';
    if (endType == EndType.WolfWin) {
      imgPath += 'good_lose.webp';
    } else if (endType == EndType.GoodWin) {
      imgPath += 'werewolf_lose.webp';
    } else {
      imgPath += 'werewolf_lose.webp';
    }
    return R.img(imgPath,
        package: ComponentManager.MANAGER_WERE_WOLF,
        width: Util.width,
        height: 93);
  }

  Widget _buildUsers(List<RoomPosition> positions) {
    double spacing = Util.width - ((168 + 14) * 2 * Util.ratio);
    return Wrap(
      spacing: spacing,
      runSpacing: 8,
      alignment: WrapAlignment.start,
      children: positions
          .map((_) => _WoldEndRoleItemWidget(
                roomPosition: _,
                endType: endType,
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<RoomPosition> winPositions = [];
    List<RoomPosition> losePositions = [];

    if (endType == EndType.WolfWin) {
      //狼人胜利
      for (var _ in allPositions) {
        WolfPositionData? wolfPositionData =
            _.positionExpendData as WolfPositionData?;
        if (wolfPositionData?.role == WolfRole.Werewolf) {
          winPositions.add(_);
        } else {
          losePositions.add(_);
        }
      }
    } else {
      //平民胜利
      for (var _ in allPositions) {
        WolfPositionData? wolfPositionData =
            _.positionExpendData as WolfPositionData?;
        if (wolfPositionData?.role == WolfRole.Werewolf) {
          losePositions.add(_);
        } else {
          winPositions.add(_);
        }
      }
    }

    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            padding: EdgeInsetsDirectional.only(
                top: MediaQuery.of(context).padding.top, start: 0, end: 0),
            children: <Widget>[
              Container(
                  width: Util.width,
                  padding:
                      const EdgeInsetsDirectional.only(top: 110, bottom: 0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image: AssetImage(
                        R.imagePath(_getWinImagPath()),
                        package: ComponentManager.MANAGER_WERE_WOLF,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 14 * Util.ratio, end: 14 * Util.ratio),
                    child: _buildUsers(winPositions),
                  )),
              const SizedBox(
                height: 11.0,
              ),
              _buildLossTitle(),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 14 * Util.ratio, end: 14 * Util.ratio),
                child: _buildUsers(losePositions),
              ),
              const SizedBox(
                height: 5.0,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        Container(
          alignment: Alignment.center,
          child: TimerCountDownWidget(
            onTimerFinishBlock: () {
              Navigator.of(context).pop();
//              WolfRepository.setReady(room.rid, selfPosition.uid);
            },
            onClickBlock: () {
              Navigator.of(context).pop();
//              WolfRepository.setReady(room.rid, selfPosition.uid);
            },
          ),
        ),
        const SizedBox(
          height: 47,
        ),
      ],
    );
  }
}

class _WoldEndRoleItemWidget extends StatelessWidget {
  final RoomPosition roomPosition;
  final EndType? endType;

  const _WoldEndRoleItemWidget({required this.roomPosition, this.endType});

  Widget _buildUserInfo() {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        PositionedDirectional(
          start: 26 * Util.ratio,
          bottom: 5 * Util.ratio,
          width: 120 * Util.ratio,
          height: 15 * Util.ratio,
          child: _buildUserInfoBackWidget(),
        ),
        PositionedDirectional(
          start: 53 * Util.ratio,
          bottom: 5 * Util.ratio,
          width: 90 * Util.ratio,
          child: _buildSexNameWidget(),
        ),
        PositionedDirectional(
          start: 9 * Util.ratio,
          bottom: 7 * Util.ratio,
          child: _buildHeaderWidget(),
        ),
        PositionedDirectional(
          start: 7 * Util.ratio,
          bottom: 5 * Util.ratio,
          child: _buildHeaderBorderWidget(),
        ),
        PositionedDirectional(
            start: 5 * Util.ratio,
            bottom: 4 * Util.ratio,
            width: 22 * Util.ratio,
            height: 22 * Util.ratio,
            child: _buildPositionWidget()),
      ],
    );
  }

  _buildUserInfoBackWidget() {
    return Container(
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        color: const Color(0xFF000000).withOpacity(0.5),
        border: Border.all(
            width: 0, color: const Color(0xFF000000).withOpacity(0.5)),
      ),
    );
  }

  _buildHeaderWidget() {
    return Container(
      decoration: ShapeDecoration(
          shape: CircleBorder(
              side: BorderSide(color: Colors.white.withOpacity(0), width: 0))),
      child: CommonAvatar(
        path: roomPosition.icon,
        size: 44 * Util.ratio,
        shape: BoxShape.circle,
      ),
    );
  }

  _buildHeaderBorderWidget() {
    return R.img(
      'wolfv2/end_dialog/header_border.webp',
      width: 48 * Util.ratio,
      height: 48 * Util.ratio,
      package: ComponentManager.MANAGER_WERE_WOLF,
    );
  }

  _buildSexNameWidget() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 0, end: 0),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 0),
            child: R.img(
              roomPosition.sex == Sex.Male
                  ? 'wolfv2/user_icon/icon_sex_male.webp'
                  : 'wolfv2/user_icon/icon_sex_female.webp',
              width: 13 * Util.ratio,
              height: 17 * Util.ratio,
              package: ComponentManager.MANAGER_WERE_WOLF,
            ),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
                child: Text(
                  roomPosition.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
          )
        ],
      ),
    );
  }

  _buildPositionWidget() {
    bool isSelf = (roomPosition.uidOrOrigin > 0 &&
        Session.uid == roomPosition.uidOrOrigin);
    return Stack(
      children: <Widget>[
        Container(
          child: R.img(
            isSelf
                ? 'wolfv2/user_icon/wolf_position_self_bg.webp'
                : 'wolfv2/user_icon/wolf_position_bg.webp',
            package: ComponentManager.MANAGER_WERE_WOLF,
          ),
        ),
        Center(
          child: Text(
            isSelf ? '你' : '${roomPosition.position + 1}',
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  String _getRoleImgPath(WolfPositionData wolfPositionData) {
    switch (wolfPositionData.role) {
      case WolfRole.Werewolf:
        return 'wolfv2/end_dialog/role_wolf.webp';
      case WolfRole.Seer:
        return 'wolfv2/end_dialog/role_seer.webp';
      case WolfRole.Witch:
        return 'wolfv2/end_dialog/role_witch.webp';
      case WolfRole.Guard:
        return 'wolfv2/end_dialog/role_guard.webp';
      case WolfRole.Hunter:
        return 'wolfv2/end_dialog/role_hunter.webp';
      case WolfRole.Popular:
        return 'wolfv2/end_dialog/role_popular.webp';
      default:
        return 'wolfv2/end_dialog/role_popular.webp';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.ratio * 168,
      height: Util.ratio * 56,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(R.imagePath(
                _getRoleImgPath(
                    roomPosition.positionExpendData as WolfPositionData),
                package: ComponentManager.MANAGER_WERE_WOLF))),
      ),
      child: _buildUserInfo(),
    );
  }
}

class TimerCountDownWidget extends StatefulWidget {
  final Function onTimerFinishBlock;
  final VoidCallback onClickBlock;

  const TimerCountDownWidget(
      {super.key,
      required this.onTimerFinishBlock,
      required this.onClickBlock});

  @override
  State<StatefulWidget> createState() => TimerCountDownWidgetState();
}

class TimerCountDownWidgetState extends State<TimerCountDownWidget> {
  Timer? _timer;
  int _countdownTime = 20;

  @override
  void initState() {
    super.initState();

    _startCountdownTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: WolfBaseButton(
        image: 'wolfv2/wolf_btn_enable.webp',
        width: 113,
        height: 37,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '${K.room_package_resume}(${_countdownTime}s)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: Util.fontFamily,
              ),
            ),
            Container(
              height: 5.0,
            ),
          ],
        ),
        onTap: () {
          widget.onClickBlock();
        },
      ),
    );
  }

  void _startCountdownTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_countdownTime < 1) {
          widget.onTimerFinishBlock();
          _timer?.cancel();
        } else {
          _countdownTime = _countdownTime - 1;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer?.cancel();
    }
  }
}

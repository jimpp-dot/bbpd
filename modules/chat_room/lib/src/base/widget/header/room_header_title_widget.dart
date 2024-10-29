import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/roomtask/widget/room_task_widget.dart';

class RoomHeaderTitleWidget extends StatelessWidget {
  final int? level;
  final ChatRoomData room;

  const RoomHeaderTitleWidget({Key? key, this.level, required this.room})
      : super(key: key);

  Widget _buildContent() {
    if (level != null && level! >= 1) {
      return RoomTitleLevelWidget(level: level!, room: room);
    } else if (room.config?.roomTaskType != null &&
        room.config!.roomTaskType!.isNotEmpty) {
      return RoomTitleBusinessWidget(room: room);
    } else {
      return RoomTitleNormalWidget(room: room);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: _buildContent(),
    );
  }
}

class RoomTitleNormalWidget extends StatelessWidget {
  final ChatRoomData room;

  const RoomTitleNormalWidget({Key? key, required this.room}) : super(key: key);

  bool get showReceptionTask {
    if (room.config?.property == null) return false;
    RoomPosition? roomPosition = room.positionForCurrentUser;
    return (room.config?.receptionTaskEnable ?? false) &&
        room.config?.property == RoomProperty.Business &&
        (room.config!.reception &&
            roomPosition != null &&
            roomPosition.position == 0);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (showReceptionTask) {
          IProfileManager profileManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_PROFILE);
          profileManager.openReceptionTask(context, room.rid);
        } else {
          Navigator.of(context).maybePop();
        }
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 0.0, end: 28.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                room.config?.name ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textScaleFactor: 1.0,
                style: const TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
            const SizedBox(width: 4),
            if (showReceptionTask)
              Container(
                width: 54,
                height: 22,
                alignment: AlignmentDirectional.center,
                decoration: ShapeDecoration(
                  gradient:
                      LinearGradient(colors: R.color.mainBrandGradientColors),
                  shape: const StadiumBorder(),
                ),
                child: Text(
                  K.room_reception_task,
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
              )
          ],
        ),
      ),
    );
  }
}

/// 商业房福利
class RoomTitleBusinessWidget extends StatelessWidget {
  final ChatRoomData room;

  const RoomTitleBusinessWidget({Key? key, required this.room})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String prefix = '[${K.room_reception}]';
    RoomTypes? roomTypes = room.config?.types;
    if (ChatRoomData.getInstance()?.config?.game != Games.None ||
        roomTypes == RoomTypes.Auto) {
      prefix = ' ';
    } else if (roomTypes == RoomTypes.RadioDefend || room.isLiveRoom) {
      prefix = ' [${K.room_anchor}]';
    } else if ((room.isKtvRoom || room.isKtvChorusRoom)) {
      prefix = ' [${K.room_rol_creator}]';
    } else {
      prefix = ' [${K.room_reception}]';
    }

    return GestureDetector(
      onTap: () {
        RoomTaskInfoWidget.show(context, room);
      },
      child: Container(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          height: 34,
          decoration: const ShapeDecoration(
            shape: StadiumBorder(),
            color: Color(0x33000000),
          ),
          padding: const EdgeInsetsDirectional.only(start: 6),
          margin: const EdgeInsetsDirectional.only(end: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(width: 4),
              Flexible(
                fit: FlexFit.loose,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      room.config?.name ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textScaleFactor: 1.0,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                    Text(
                      '$prefix${room.config?.receptionName ?? ''}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textScaleFactor: 1.0,
                      style: const TextStyle(
                          color: Color(0x99FFFFFF), fontSize: 10.0),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 6, end: 8, top: 5, bottom: 5),
                child: Container(
                  height: 22,
                  alignment: AlignmentDirectional.center,
                  padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
                  decoration: const ShapeDecoration(
                    shape: StadiumBorder(),
                    gradient: LinearGradient(
                        colors: [Color(0xFFFF67A8), Color(0xFFFFAB8F)]),
                  ),
                  child: Text(
                    K.room_welfare_pond,
                    maxLines: 1,
                    style: const TextStyle(color: Colors.white, fontSize: 11),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 房间等级
class RoomTitleLevelWidget extends StatefulWidget {
  final int level;
  final ChatRoomData room;

  const RoomTitleLevelWidget(
      {Key? key, required this.level, required this.room})
      : super(key: key);

  @override
  _RoomTitleLevelWidgetState createState() => _RoomTitleLevelWidgetState();
}

class _RoomTitleLevelWidgetState extends State<RoomTitleLevelWidget> {
  @override
  void initState() {
    super.initState();
    eventCenter.addListener(EventConstant.UserFollow, _onUserFollow);
  }

  @override
  void dispose() {
    super.dispose();
    eventCenter.removeListener(EventConstant.UserFollow, _onUserFollow);
  }

  @override
  Widget build(BuildContext context) {
    bool isBusRoom = widget.room.config?.roomTaskType == 'busi_room_task';
    bool isUnFollow = widget.room.createor?.uid != Session.uid &&
        widget.room.isFollowCreator != true;

    return GestureDetector(
      onTap: () {
        BaseWebviewScreen.show(context,
            url: Util.getWebUrl(RoomTaskInfoWidget.roomTaskWebPath,
                params: {'rid': '${widget.room.rid}'}));
        Tracker.instance.track(TrackEvent.view_room_rightpage, properties: {
          'rid': '${widget.room.rid}',
          'owner_uid': '${widget.room.createor?.uid}',
          'refer': 'room_title',
        });
      },
      child: Container(
        height: 34,
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          decoration: const ShapeDecoration(
            shape: StadiumBorder(),
            color: Color(0x33000000),
          ),
          padding: const EdgeInsetsDirectional.only(start: 6),
          margin: const EdgeInsetsDirectional.only(end: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 32,
                width: 32,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(R.imagePath('bg_room_level.webp',
                        package: ComponentManager.MANAGER_BASE_ROOM)),
                  ),
                ),
                child: NumText(
                  'Lv${widget.level}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(width: 4),
              Flexible(
                fit: FlexFit.loose,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.room.config?.name ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textScaleFactor: 1.0,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      '[${K.room_owner}]${widget.room.createor?.name}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textScaleFactor: 1.0,
                      style: const TextStyle(
                          color: Color(0x99FFFFFF), fontSize: 10.0),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  if (!isBusRoom && isUnFollow) {
                    await BaseRequestManager.onFollow(
                      widget.room.createor?.uid.toString() ?? '',
                      rid: widget.room.rid,
                      refer: 'room',
                      roomType: widget.room.config?.type ?? '',
                      settlementChannel:
                          widget.room.config?.settlementChannel ?? '',
                      typeLabel: widget.room.config?.typeName ?? '',
                      roomFactoryType: widget.room.config?.originalRFT ?? '',
                    );
                    return;
                  }
                  RoomTaskInfoWidget.show(context, widget.room);
                },
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 6, end: 8, top: 5, bottom: 5),
                  child: Container(
                    height: 22,
                    alignment: AlignmentDirectional.center,
                    padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
                    decoration: ShapeDecoration(
                      shape: const StadiumBorder(),
                      gradient: LinearGradient(
                          colors: isBusRoom
                              ? [
                                  const Color(0xFFFF67A8),
                                  const Color(0xFFFFAB8F)
                                ]
                              : R.color.mainBrandGradientColors),
                    ),
                    child: Text(
                      /// 商业房任务显示"福利"
                      /// 非商业房任务，未关注房主显示"关注"，关注过显示"任务"
                      isBusRoom
                          ? K.room_welfare_pond
                          : (isUnFollow ? K.follow : K.room_task),
                      maxLines: 1,
                      style: const TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onUserFollow(String type, dynamic value) {
    /// 关注房主状态改变刷新UI
    if (value is Map &&
        value.containsKey('follow') &&
        value.containsKey('uid')) {
      bool follow = value['follow'];
      String uid = value['uid'];
      if (Util.parseInt(uid) == widget.room.createor?.uid) {
        setState(() {
          widget.room.isFollowCreator = follow;
        });
      }
    }
  }
}

import 'dart:math';

import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/roomtask/model/room_task.dart';
import 'package:chat_room/src/roomtask/model/room_task_box.dart';
import 'package:chat_room/src/roomtask/room_task_repo.dart';
import 'package:chat_room/src/roomtask/widget/room_sign_in_list_widget.dart';

import 'room_business_task_widget.dart';
import 'room_task_box_dialog.dart';
import 'room_task_people_widget.dart';

/// 房间任务列表
class RoomTaskInfoWidget extends StatefulWidget {
  final ChatRoomData room;

  const RoomTaskInfoWidget({super.key, required this.room});

  @override
  _RoomTaskInfoWidgetState createState() => _RoomTaskInfoWidgetState();

  static Future show(BuildContext context, ChatRoomData room) {
    Tracker.instance.track(TrackEvent.view_room_mission, properties: {
      'rid': '${room.rid}',
      'owner_uid': '${room.createor?.uid}'
    });

    if (room.config?.roomTaskType == 'busi_room_task') {
      return RoomBusinessTaskWidget.show(context, room);
    }

    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 1,
      theme: Theme.of(System.context).copyWith(
        canvasColor: Colors.transparent,
        platform: Util.isAndroid ? TargetPlatform.android : TargetPlatform.iOS,
      ),
      builder: (context) {
        return GestureDetector(
          onTap: () {},
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(16),
                      topEnd: Radius.circular(16)),
                  color: R.color.mainBgColor),
              child: RoomTaskInfoWidget(room: room)),
        );
      },
    );
  }

  static const String roomTaskWebPath = 'banban-v140/#/room-level';
}

class _RoomTaskInfoWidgetState extends State<RoomTaskInfoWidget> {
  RoomTaskInfoRsp? _rsp;
  RoomTaskExpInfo? _taskExpInfo;

  bool get showQuestion {
    if (_taskExpInfo == null || _taskExpInfo!.link.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() {
    Future.wait([
      RoomTaskInfoRepo.getRoomTaskInfo(widget.room.rid),
      RoomTaskInfoRepo.getRoomTaskExpInfo(widget.room.rid, Session.uid)
    ]).then((value) {
      _rsp = value[0] as RoomTaskInfoRsp;
      if (value[1] != null) _taskExpInfo = value[1] as RoomTaskExpInfo;
      setState(() {});
    }).catchError((error) {
      Log.d('Load room task with error: $error');
    });
  }

  Widget _buildCreatorIcon() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);

        IPersonalDataManager personalDataManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        personalDataManager.openImageScreen(
            context, widget.room.createor?.uid ?? 0,
            refer: const PageRefer('RoomTaskPage'));
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        clipBehavior: Clip.none,
        children: <Widget>[
          Container(
            width: 58,
            height: 58,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.white.withOpacity(0.2), width: 2),
              borderRadius: BorderRadius.circular(29),
            ),
            child: CommonAvatar(
              path: widget.room.createor?.icon ?? '',
              shape: BoxShape.circle,
              size: 56,
            ),
          ),
          Positioned(
            bottom: -2,
            child: Container(
              width: 28,
              height: 16,
              alignment: AlignmentDirectional.center,
              decoration: const ShapeDecoration(
                shape: StadiumBorder(),
                color: Color(0xffF6F7F9),
              ),
              child: Text(
                K.room_owner,
                style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xff313131),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreatorInfo() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);

        BaseWebviewScreen.show(System.context,
            url: Util.getWebUrl(RoomTaskInfoWidget.roomTaskWebPath,
                params: {'rid': '${widget.room.rid}'}));

        Tracker.instance.track(TrackEvent.view_room_rightpage, properties: {
          'rid': '${widget.room.rid}',
          'owner_uid': '${widget.room.createor?.uid}',
          'refer': 'room_mission',
        });
      },
      child: Container(
        height: 88,
        padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(R.imagePath('bg_room_task_title.webp',
                  package: ComponentManager.MANAGER_BASE_ROOM))),
        ),
        child: Row(
          children: <Widget>[
            _buildCreatorIcon(),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.room.createor?.name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    '${K.room_task_today_exp}${_rsp!.taskInfo!.todayExp}',
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                  )
                ],
              ),
            ),
            Container(
              height: 56,
              width: 56,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(R.imagePath('bg_room_level_light.webp',
                    package: ComponentManager.MANAGER_BASE_ROOM)),
              )),
              child: Text(
                'Lv.${_rsp!.taskInfo!.level}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (_rsp != null) {
      if (_rsp!.success == true && _rsp!.taskInfo != null) {
        return Container(
          padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
          constraints: BoxConstraints(maxHeight: Util.height * 0.6),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildCreatorInfo(),
                const SizedBox(
                  height: 12,
                ),
                if (_rsp?.taskInfo?.tasks.isNotEmpty ?? false)
                  ..._rsp!.taskInfo!.tasks
                      .where((value) => value.type != TaskType.unKnow)
                      .map((_) => RoomTaskItemWidget(
                          _,
                          (_rsp?.taskInfo?.todaySigned ?? false),
                          _onTaskItemBtnTap)),
                if (_taskExpInfo != null) _buildFooter(),
              ],
            ),
          ),
        );
      } else if (_rsp!.msg != null) {
        return ErrorData(
          error: _rsp!.msg,
          onTap: () {
            _rsp = null;
            setState(() {});

            _load();
          },
        );
      }
    }

    return Container(
      height: Util.height * 0.4,
      alignment: AlignmentDirectional.center,
      child: const CupertinoActivityIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          BaseAppBar.custom(
            showBack: false,
            title: Text('${BaseK.K.room}${K.room_task}'),
            actions: _buildAction(),
            backgroundColor: Colors.transparent,
          ),
          _buildBody(),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Divider(
          height: 1.0,
          color: R.color.dividerColor,
        ),
        const SizedBox(
          height: 23,
        ),
        GestureDetector(
          onTap: _onShowTaskPeopleList,
          child: Row(
            children: [
              Text(
                K.room_light_task_box,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: R.color.mainTextColor),
              ),
              Expanded(child: Container()),
              Text(
                _taskExpInfo!.lightUpInfo,
                style: TextStyle(fontSize: 13, color: R.color.thirdTextColor),
              ),
              R.img("icon_next.svg",
                  width: 16,
                  height: 16,
                  color: R.color.thirdTextColor,
                  package: ComponentManager.MANAGER_BASE_CORE)
            ],
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Center(
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  padding: const EdgeInsetsDirectional.only(end: 48),
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(3.0)),
                    child: LinearProgressIndicator(
                      value: max(
                          0,
                          _taskExpInfo!.completePercent == 1
                              ? 1
                              : _taskExpInfo!.completePercent - 0.05),
                      valueColor: AlwaysStoppedAnimation<Color>([
                        const Color(0xFFFDA252),
                        const Color(0xFFFFCF8A)
                      ].first),
                      backgroundColor: R.color.secondBgColor,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsetsDirectional.only(
                    start: 16, end: 64, top: 12, bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: _taskExpInfo!.taskInfo
                      .map(
                        (_) => _buildTaskIcon(_.taskIsComplete, _.icon),
                      )
                      .toList(),
                ),
              ),
              Positioned.fill(
                child: GestureDetector(
                  onTap: _onBoxOpen,
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    // room_task_light_box_opened.png
                    child: Stack(children: [
                      R.img(
                          _taskExpInfo!.boxStatus == 1
                              ? 'room_task_light_box_opened.png'
                              : 'room_task_light_box.png',
                          // color: R.color.mainTextColor,
                          width: 64,
                          height: 64,
                          package: ComponentManager.MANAGER_BASE_ROOM),
                      Positioned.fill(
                        child: Container(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: Container(
                            width: 48,
                            height: 16,
                            alignment: AlignmentDirectional.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: _taskExpInfo!.boxStatus == 0
                                      ? [
                                          const Color(0xFFFF8000),
                                          const Color(0xFFFFC659)
                                        ]
                                      : [
                                          Colors.transparent,
                                          Colors.transparent
                                        ]),
                            ),
                            child: _taskExpInfo!.boxStatus == 0
                                ? Text(
                                    K.room_award_can_receive,
                                    style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  )
                                : Container(),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 14,
        ),
      ],
    );
  }

  Widget _buildTaskIcon(bool complete, String imageURL) {
    return Expanded(
      flex: 1,
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          height: 40,
          width: 40,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: complete
                    ? [const Color(0xFFFDA252), const Color(0xFFFFCF8A)]
                    : [R.color.secondBgColor, R.color.secondBgColor]),
            borderRadius: BorderRadius.circular(20),
          ),
          child: CachedNetworkImage(
            key: ValueKey(imageURL),
            width: 22,
            height: 22,
            imageUrl: imageURL,
            color: complete
                ? Colors.white
                : R.color.mainTextColor.withOpacity(0.4),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildAction() {
    List<Widget> actions = [];

    actions.add(GestureDetector(
      child: Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Padding(
          padding: const EdgeInsetsDirectional.only(end: 16),
          child: Text(K.room_sign_list,
              style: TextStyle(color: R.color.mainBrandColor, fontSize: 16)),
        ),
      ),
      onTap: () {
        RoomSignInWidget.show(context, widget.room);
      },
    ));

    if (_taskExpInfo?.link.isNotEmpty == true) {
      actions.add(GestureDetector(
        onTap: _onQuestion,
        child: Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: 16),
            child: R.img('mall/ic_question_mark.svg',
                color: R.color.mainTextColor,
                width: 24,
                height: 24,
                package: ComponentManager.MANAGER_VIP),
          ),
        ),
      ));
    }
    return actions;
  }

  void _onQuestion() {
    if (_taskExpInfo == null || _taskExpInfo!.link.isEmpty) return;

    Navigator.of(context).pop();
    BaseWebviewScreen.show(context, url: _taskExpInfo!.link);
  }

  void _onBoxOpen() {
    if (_taskExpInfo!.boxStatus == 1) {
      Fluttertoast.showToast(
          msg: K.room_box_opened_error, gravity: ToastGravity.CENTER);
      return;
    }

    Navigator.of(context).pop();

    RoomTaskBoxRepo.getPersonalBoxList(widget.room.rid, Session.uid)
        .then((value) {
      if (value is List<BoxGiftList>) {
        RoomTaskBoxDialog.show(System.context,
            giftList: value,
            title: K.room_open_box,
            subTitle: K.room_box_scan,
            openText: K.room_open_box,
            openBox: _boxOpenResult);
      } else if (value is String) {
        Fluttertoast.showToast(msg: value);
      }
    }).catchError((error) {
      Log.d('Load room task with error: $error');
    });
  }

  void _boxOpenResult() {
    RoomTaskBoxRepo.personalBoxOpen(widget.room.rid, Session.uid).then((value) {
      if (value is OpenBoxResult) {
        if (value.openSuccess == 0) {
          RoomTaskBoxDialog.show(System.context,
              giftList: value.result != null ? [value.result!] : [],
              title: K.room_congratulation,
              subTitle: K.room_box_get,
              openText: BaseK.K.gift_risk_dialog_button_sure,
              openBox: null);
        } else if (value.msg is String && value.msg!.isNotEmpty) {
          Fluttertoast.showToast(msg: value.msg);
        }
      } else if (value is String) {
        Fluttertoast.showToast(msg: value);
      }
    }).catchError((error) {
      Log.d('Load room task with error: $error');
    });
  }

  Future<void> _onShowTaskPeopleList() async {
    Navigator.of(context).pop();

    final popContext = await displayModalBottomSheet(
      context: System.context,
      maxHeightRatio: 1,
      theme: Theme.of(System.context).copyWith(
        canvasColor: Colors.transparent,
        platform: Util.isAndroid ? TargetPlatform.android : TargetPlatform.iOS,
      ),
      builder: (context) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: R.color.mainBgColor),
            child: RoomTaskPeopleWidget(widget.room.uid ?? 0, widget.room.rid),
          ),
        );
      },
    );
    if (popContext is BuildContext) {
      RoomTaskInfoWidget.show(popContext, widget.room);
    }
  }

  Future<void> _onTaskItemBtnTap(RoomTask taskItem) async {
    if (taskItem.type == TaskType.signIn) {
      if (_rsp?.taskInfo?.todaySigned ?? false) return;
      RoomTaskInfoRepo.roomTaskSignin(widget.room.rid).then((signInRsp) {
        if (signInRsp.success == true) {
          _load();
        } else if (signInRsp.msg != null) {
          Fluttertoast.showToast(msg: signInRsp.msg);
        }
      });
      Tracker.instance.track(TrackEvent.room_signin, properties: {
        'rid': '${widget.room.rid}',
        'owner_uid': '${widget.room.createor?.uid}'
      });
    } else if (taskItem.type == TaskType.online ||
        taskItem.type == TaskType.onMic ||
        taskItem.type == TaskType.onlineTime) {
      Navigator.pop(context);

      ISettingManager settingManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_SETTINGS);
      settingManager.share(System.context, widget.room.rid,
          tp: 1, needInApp: true, newShareInRoom: true, rid: widget.room.rid);
    } else if (taskItem.type == TaskType.sendGift) {
      Navigator.pop(context);

      IGiftManager giftManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
      if (!Session.isLogined) {
        Fluttertoast.showToast(msg: K.room_dropped_relogin);
        return;
      }
      List<RoomPosition> res =
          giftManager.getGiftUsers(widget.room) as List<RoomPosition>;
      if (res.isEmpty) {
        Fluttertoast.showToast(
            msg: K.room_no_one_to_reward, gravity: ToastGravity.CENTER);
        return;
      }
      await giftManager.showRoomGiftPanel(System.context, room: widget.room);
    } else {
      Log.d('Click room task btn with unkown type: ${taskItem.type}');
    }
  }
}

typedef OnItemBtnTap = void Function(RoomTask taskItem);

class RoomTaskItemWidget extends StatelessWidget {
  final RoomTask taskItem;
  final bool todaySigned;
  final OnItemBtnTap? onItemBtnTap;

  const RoomTaskItemWidget(this.taskItem, this.todaySigned, this.onItemBtnTap,
      {super.key});

  String get btnText {
    if (taskItem.type == TaskType.signIn) {
      return todaySigned ? K.room_task_signed : K.room_task_signin;
    } else if (taskItem.taskIsComplete == true) {
      return K.room_task_has_done;
    } else if (taskItem.type == TaskType.online ||
        taskItem.type == TaskType.onMic ||
        taskItem.type == TaskType.onlineTime) {
      return K.room_find_friends;
    } else if (taskItem.type == TaskType.sendGift) {
      return K.room_red_packet_gift_button;
    } else {
      return '';
    }
  }

  _onBtnTap() {
    if (onItemBtnTap != null) onItemBtnTap!(taskItem);
  }

  /// 任务完成进度
  Widget _renderProgress(int progress, int result) {
    return SizedBox(
      width: double.infinity,
      height: 4,
      child: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.centerStart,
        children: [
          Container(
            width: double.infinity,
            height: 4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: R.color.dividerColor),
          ),
          FractionallySizedBox(
            widthFactor: progress / result,
            heightFactor: 1,
            alignment: AlignmentDirectional.centerStart,
            child: Container(
              width: double.infinity,
              height: 4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: const Color(0xffFDA252)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 76),
      alignment: AlignmentDirectional.center,
      child: Row(
        children: <Widget>[
          CachedNetworkImage(
            width: 52,
            height: 52,
            imageUrl: Util.getRemoteImgUrl(taskItem.icon),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  taskItem.title,
                  style: TextStyle(color: R.color.mainTextColor, fontSize: 16),
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          taskItem.rule,
                          maxLines: 1,
                          style: TextStyle(
                              color: R.color.mainTextColor, fontSize: 13),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${taskItem.current}',
                            style: const TextStyle(
                              color: Color(0xFFFDA252),
                              fontSize: 11,
                            ),
                          ),
                          TextSpan(
                            text: taskItem.progressTextSuffix,
                            style: TextStyle(
                              color: R.color.mainTextColor,
                              fontSize: 11,
                            ),
                          )
                        ],
                      ),
                      softWrap: true,
                    )
                  ],
                ),
                const SizedBox(height: 6),
                _renderProgress(taskItem.current, taskItem.limit),
              ],
            ),
          ),
          const SizedBox(width: 16),
          InkWell(
            onTap: _onBtnTap,
            child: Container(
              height: 28,
              padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
              constraints: const BoxConstraints(
                minWidth: 63,
              ),
              alignment: AlignmentDirectional.center,
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                gradient: (taskItem.type == TaskType.signIn && todaySigned) ||
                        (taskItem.taskIsComplete == true)
                    ? LinearGradient(colors: R.color.darkGradientColors)
                    : LinearGradient(colors: R.color.mainBrandGradientColors),
              ),
              child: Text(
                btnText,
                style: const TextStyle(fontSize: 13, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/roomtask/model/room_business_task.dart';
import 'package:chat_room/src/roomtask/model/room_task.dart';
import 'package:chat_room/src/roomtask/model/room_task_box.dart';
import 'package:chat_room/src/roomtask/room_task_repo.dart';
import 'package:chat_room/src/roomtask/widget/room_task_item_widget.dart';

import 'room_task_box_dialog.dart';

/// 房间福利-任务列表
class RoomBusinessTaskWidget extends StatefulWidget {
  const RoomBusinessTaskWidget({super.key, required this.room});

  final ChatRoomData room;

  static Future show(BuildContext context, ChatRoomData room) {
    Tracker.instance.track(TrackEvent.view_room_mission, properties: {
      'rid': '${room.rid}',
      'owner_uid': '${room.createor?.uid}'
    });
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
                  borderRadius: BorderRadius.circular(16),
                  color: R.color.mainBgColor),
              child: RoomBusinessTaskWidget(room: room)),
        );
      },
    );
  }

  @override
  _RoomBusinessTaskWidgetState createState() => _RoomBusinessTaskWidgetState();
}

class _RoomBusinessTaskWidgetState extends State<RoomBusinessTaskWidget> {
  RoomBusinessTaskInfo? _taskInfo;
  String? _errMsg;

  @override
  void initState() {
    super.initState();
    _load();
  }

  bool get showQuestion {
    if (_taskInfo == null || _taskInfo!.link.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  _load() {
    RoomTaskInfoRepo.getBusinessRoomTaskInfo(widget.room.rid, Session.uid)
        .then((value) {
      if (value is RoomBusinessTaskInfo) {
        _taskInfo = value;
      } else if (value is String) {
        _errMsg = value;
      }
      setState(() {});
    }).catchError((error) {
      Log.d('Load room task with error: $error');
    });
  }

  void _onQuestion() {
    if (_taskInfo == null || _taskInfo!.link.isEmpty) return;

    Navigator.of(context).pop();
    BaseWebviewScreen.show(context, url: _taskInfo!.link);
  }

  void _onBoxOpen(int level) {
    Navigator.of(context).pop();

    RoomTaskBoxRepo.getBusinessBoxList(widget.room.rid, Session.uid, level)
        .then((value) {
      if (value is List<BoxGiftList>) {
        RoomTaskBoxDialog.show(System.context,
            giftList: value,
            title: K.room_open_box,
            subTitle: K.room_box_scan,
            openText: K.room_open_box, openBox: () {
          _boxOpenResult(level);
        });
      } else if (value is String) {
        Fluttertoast.showToast(msg: value);
      }
    }).catchError((error) {
      Log.d('Load room task with error: $error');
    });
  }

  void _boxOpenResult(int level) {
    RoomTaskBoxRepo.businessBoxOpen(widget.room.rid, Session.uid, level)
        .then((value) {
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

  Future<void> _onTaskItemBtnTap(RoomTaskItem taskItem) async {
    Navigator.pop(context);
    if (taskItem.taskIsComplete) return;

    if (taskItem.type == TaskType.signIn) {
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
    } else if (taskItem.type == TaskType.onMic) {
      _onJoinMic();
    } else if (taskItem.type == TaskType.sendGift) {
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
    }
  }

  _onJoinMic() async {
    ChatRoomData room = widget.room;
    bool isGranted = await room.checkAudioAuthorization();
    if (!isGranted) {
      return;
    }

    await RoomRepository.joinMic(
      widget.room.rid,
      -1,
      needCertify: true,
      type: room.needVerify,
      newType: room.needVerifyNew,
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
            title: Text(K.room_get_task_bonus),
            actions: showQuestion ? _buildAction() : null,
            backgroundColor: Colors.transparent,
          ),
          _buildBody(),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_taskInfo != null) {
      return Container(
        padding: EdgeInsetsDirectional.only(
            start: 16 * Util.ratio, end: 16 * Util.ratio),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeaderInfo(),
            Text(
              K.room_task_list,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: R.color.mainTextColor),
            ),
            const SizedBox(
              height: 6,
            ),
            if (_taskInfo?.taskInfo.isNotEmpty ?? false)
              ..._taskInfo!.taskInfo.map(
                  (_) => RoomTaskItemWidget(_, (false), _onTaskItemBtnTap)),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      );
    } else if (_errMsg != null) {
      return ErrorData(
        error: _errMsg,
        onTap: () {
          _taskInfo = null;
          setState(() {});
          _load();
        },
      );
    }

    return Container(
      height: Util.height * 0.4,
      alignment: AlignmentDirectional.center,
      child: const CupertinoActivityIndicator(),
    );
  }

  Widget _buildHeaderInfo() {
    final int boxCount = _taskInfo!.boxInfo.length;
    const double aspectRatio = 64.0 / 89.0;
    final int crossAxisCount = boxCount * 2 - 1;
    List boxList = [];
    for (int i = 0; i < boxCount; i++) {
      boxList.add(_taskInfo!.boxInfo[i]);
      if (boxCount > (i + 1)) {
        boxList.add(_taskInfo!.boxInfo[i + 1].showBoxArrow);
      }
    }

    final double crossAxisSpacing = 6 * Util.ratio;
    return Container(
      padding: const EdgeInsetsDirectional.only(bottom: 24, top: 3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            K.room_task_degree([_taskInfo!.currentPoint.toString()]),
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: R.color.mainTextColor),
          ),
          GridView(
            // physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsetsDirectional.only(top: 16, bottom: 24),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount, //横轴三个子widget
                mainAxisSpacing: crossAxisSpacing,
                crossAxisSpacing: crossAxisSpacing,
                childAspectRatio: aspectRatio //宽高比为1时，子widget
                ),
            children: boxList
                .asMap()
                .map(
                  (i, element) => MapEntry(
                      i,
                      element is RoomBusinessBoxInfo
                          ? _buildBoxItem(
                              element.iconURL,
                              element.pointText,
                              element.showBoxArrow,
                              element.level,
                              element.boxReadyOpen
                                  ? R.color.mainBrandColor
                                  : R.color.thirdTextColor,
                              element.boxReadyOpen)
                          : _buildLine(R.color.secondBgColor, 2)),
                )
                .values
                .toList(),
          ),
          Divider(
            color: R.color.dividerColor,
          ),
        ],
      ),
    );
  }

  Widget _buildLine(Color color, double height) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsetsDirectional.only(top: 31),
      child: Container(height: height, width: double.infinity, color: color),
    );
  }

  Widget _buildBoxItem(String imageURL, String title, bool hasFill, int level,
      textColor, bool boxReadyOpen) {
    final double iconSize = 48 * Util.ratio;
    final double boxWidth = 64 * Util.ratio;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(boxWidth / 2.0)),
              child: Container(
                width: boxWidth,
                height: boxWidth,
                color: R.color.secondBgColor,
                alignment: Alignment.center,
              ),
            ),
            Container(
              child: Stack(
                children: [
                  Container(
                    width: boxWidth,
                    height: boxWidth,
                    alignment: Alignment.center,
                    child: CachedNetworkImage(
                      imageUrl: imageURL,
                      width: iconSize,
                      height: iconSize,
                    ),
                  ),
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
                              colors: boxReadyOpen
                                  ? [
                                      const Color(0xFFFF8000),
                                      const Color(0xFFFFC659)
                                    ]
                                  : [Colors.transparent, Colors.transparent]),
                        ),
                        child: boxReadyOpen
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
                ],
              ),
            ),
            if (hasFill)
              PositionedDirectional(
                end: 4,
                bottom: 0,
                child: Container(
                  decoration: ShapeDecoration(
                    shape: const StadiumBorder(),
                    gradient:
                        LinearGradient(colors: R.color.mainBrandGradientColors),
                  ),
                  child: R.img(
                    'ic_checkbox_arrow.svg',
                    width: 16,
                    height: 16,
                    package: ComponentManager.MANAGER_BASE_ROOM,
                  ),
                ),
              ),
            Positioned.fill(child: GestureDetector(
              onTap: () {
                if (hasFill) {
                  Fluttertoast.showToast(
                      msg: K.room_box_opened_error,
                      gravity: ToastGravity.CENTER);
                  return;
                }
                _onBoxOpen(level);
              },
            )),
          ],
        ),
        Expanded(child: Container()),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: title,
                  style: TextStyle(fontSize: 13, color: textColor)),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _buildAction() {
    return <Widget>[
      GestureDetector(
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
      ),
    ];
  }
}

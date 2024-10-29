import 'dart:math';

import 'package:shared/assets.dart';
import 'package:shared/model/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/bonus/model/bonus_beans.dart';
import 'package:chat_room/src/bonus/model/bonus_model.dart';
import 'package:chat_room/src/bonus/model/bonus_msg_handler.dart';
import 'package:chat_room/src/bonus/model/bonus_repo.dart';
import 'package:chat_room/src/bonus/widget/bonus_result_widget.dart';
import 'package:cached_network_image/cached_network_image.dart'
    hide CachedNetworkImage;
import 'package:provider/provider.dart' hide Selector;

class BonusPreviewDialog extends StatelessWidget {
  final ChatRoomData room;
  final int bonusId;

  const BonusPreviewDialog(
      {Key? key, required this.room, required this.bonusId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    return Stack(
      children: [
        Container(
          width: 343.dp,
          height: 420.dp,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: CachedNetworkImageProvider(Util.getImgUrl(
                'bonus/bg_bouns_preview.webp',
                package: ComponentManager.MANAGER_BASE_ROOM)),
          )),
          child: LoadingWidget<BonusPreview>(
            futureBuilder: () => BonusRepo.getBonusPreview(bonusId, room.rid),
            builder: (context, detail) => BonusPreviewWidget(
              room: room,
              bonusPreview: detail,
              roomManager: roomManager,
            ),
          ),
        ),
        PositionedDirectional(
            top: 0,
            end: 0,
            child: IconButton(
                icon: R.img(BaseAssets.shared$box_ic_close_svg),
                onPressed: () => Navigator.pop(context))),
      ],
    );
  }

  static void show(BuildContext context, ChatRoomData room, int bonusId) {
    showDialog(
        context: context,
        builder: (context) => Material(
            color: Colors.transparent,
            child: Center(
                child: BonusPreviewDialog(
              room: room,
              bonusId: bonusId,
            ))));
  }
}

class BonusPreviewWidget extends StatefulWidget {
  final ChatRoomData room;
  final BonusPreview? bonusPreview;
  final IRoomManager roomManager;

  const BonusPreviewWidget(
      {Key? key,
      required this.room,
      required this.bonusPreview,
      required this.roomManager})
      : super(key: key);

  @override
  _BonusPreviewWidgetState createState() => _BonusPreviewWidgetState();
}

class _BonusPreviewWidgetState extends State<BonusPreviewWidget> {
  bool _grabbing = false; //正在抢红包

  Widget _buildAvatar() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0x33FFFFFF), width: 1.5),
      ),
      child: CommonAvatar(
        path: widget.bonusPreview?.creator?.icon,
        size: 64.dp,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 57),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              widget.bonusPreview?.creator?.name ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          Text(
            K.room_whoes_bonus,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildMatchDesc() {
    TextStyle matchDescStyle =
        const TextStyle(fontSize: 13, color: Color(0xE6FFFFFF));
    Widget childWidget = const SizedBox.shrink();
    if (widget.bonusPreview?.match ?? false) {
      childWidget = Text(
        K.room_bonus_match_desc,
        style: matchDescStyle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    } else {
      switch (widget.bonusPreview?.condition?.type) {
        case BonusConditionType.none:
          childWidget = Text(
            K.room_bonus_match_desc,
            style: matchDescStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          );

          break;
        case BonusConditionType.follow:
          childWidget = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                K.follow,
                style: matchDescStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Flexible(
                child: Text(
                  widget.bonusPreview?.creator?.name ?? '',
                  style:
                      const TextStyle(fontSize: 13, color: Color(0xFFFFE1A5)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                K.room_bonus_can_grab,
                style: matchDescStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
          break;
        case BonusConditionType.fans:
          childWidget = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                K.room_vehicle_join,
                style: matchDescStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Flexible(
                child: Text(
                  widget.bonusPreview?.creator?.name ?? '',
                  style:
                      const TextStyle(fontSize: 13, color: Color(0xFFFFE1A5)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${K.room_whoes_fans_group}${K.room_bonus_can_grab}',
                style: matchDescStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );

          break;
        case BonusConditionType.share:
          childWidget = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                K.share,
                style: matchDescStyle,
              ),
              Flexible(
                child: Text(
                  widget.bonusPreview?.creator?.name ?? '',
                  style:
                      const TextStyle(fontSize: 13, color: Color(0xFFFFE1A5)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${K.room_whoes_room}${K.room_bonus_can_grab}',
                style: matchDescStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );

          break;
        case BonusConditionType.sign:
          childWidget = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                    text: K.room_bonus_send_msg,
                    style: matchDescStyle,
                    children: [
                      TextSpan(
                          text: widget.bonusPreview?.condition?.content ?? '',
                          style: const TextStyle(
                              fontSize: 13, color: Color(0xFFFFE1A5))),
                      TextSpan(
                        text: K.room_bonus_can_grab,
                        style: matchDescStyle,
                      ),
                    ]),
              ),
            ],
          );

          break;

        default:
          break;
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 11),
      margin: const EdgeInsets.symmetric(horizontal: 57),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0x66FFFFFF), width: 1),
          borderRadius: BorderRadius.circular(8)),
      child: childWidget,
    );
  }

  String get matchAndGrabStr {
    switch (widget.bonusPreview?.condition?.type) {
      case BonusConditionType.none:
        return '';
      case BonusConditionType.follow:
        return R.array('room_bonus_type_grab_buttons')[0];
      case BonusConditionType.fans:
        return R.array('room_bonus_type_grab_buttons')[1];
      case BonusConditionType.sign:
        return R.array('room_bonus_type_grab_buttons')[2];
      case BonusConditionType.share:
        return R.array('room_bonus_type_grab_buttons')[3];
      default:
        return '';
    }
  }

  int get timer {
    if (widget.bonusPreview?.state == BonusState.grab) return 0;

    int seconds = (widget.bonusPreview?.grabTime ?? 0) -
        (widget.roomManager.getTimestamp());

    return max(seconds, 0);
  }

  String _getFormattedTimer(int duration) {
    twoDigits(int n) => n >= 10 ? '$n' : '0$n';

    int minutes = duration ~/ 60;
    int seconds = duration % 60;

    return '${twoDigits(minutes)}:${twoDigits(seconds)}';
  }

  Widget _buildTimer() {
    return TimerWidget(
      stop: Duration(seconds: timer + 1),
      onTick: () {
        if (timer <= 0) setState(() {});
      },
      builder: (context) {
        return FittedBox(
          fit: BoxFit.fitWidth,
          child: NumText(
            _getFormattedTimer(timer),
            style: const TextStyle(color: Color(0xFFC16340), fontSize: 26),
            maxLines: 1,
          ),
        );
      },
    );
  }

  Widget _buildButtonContent() {
    if (widget.bonusPreview?.desc?.isNotEmpty ?? false) {
      return Text(
        widget.bonusPreview?.desc ?? '',
        maxLines: 2,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 13, color: Color(0xFFC16340)),
      );
    } else if (widget.bonusPreview?.state == BonusState.pending && timer > 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTimer(),
          Text(
            K.room_bonus_later_grab,
            style: const TextStyle(fontSize: 13, color: Color(0xFFC16340)),
          )
        ],
      );
    } else if (!(widget.bonusPreview?.match ?? false)) {
      return Text(
        matchAndGrabStr,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 13, color: Color(0xFFC16340)),
      );
    } else if (_grabbing) {
      return const CupertinoActivityIndicator();
    } else {
      return R.img(RoomAssets.chat_room$bonus_ic_room_bonus_grab_webp,
          width: 44, height: 53);
    }
  }

  void _onGrabTap(BuildContext context) {
    if (widget.bonusPreview?.desc?.isNotEmpty ?? false) {
      //次数超过限制
    } else if (widget.bonusPreview?.state == BonusState.pending && timer > 0) {
      //未开始
    } else if (!(widget.bonusPreview?.match ?? false)) {
      //条件不满足
      switch (widget.bonusPreview?.condition?.type) {
        case BonusConditionType.none:
        case BonusConditionType.follow:
          //直接抢红包
          _grab();
          break;
        case BonusConditionType.fans:
          Navigator.pop(context);

          IGiftManager giftManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_GIFT);
          giftManager.showRoomGiftPanel(System.context,
              room: widget.room,
              uid: widget.room.positions.first.uid,
              defaultId: widget.bonusPreview!.giftId);
          break;
        case BonusConditionType.share:
          Navigator.pop(context);
          ISettingManager settingManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_SETTINGS);
          settingManager.share(System.context, widget.room.rid,
              tp: 1,
              needInApp: true,
              newShareInRoom: true,
              rid: widget.room.rid,
              title: K.room_invite_friend);
          break;
        case BonusConditionType.sign:
          Navigator.pop(context);
          eventCenter.emit(RoomConstant.Event_Room_Display_Input);
          break;

        default:
          break;
      }
    } else {
      //条件满足开始抢红包
      _grab();
    }
  }

  void _grab() {
    if (_grabbing) return;

    int bonusId = widget.bonusPreview?.id ?? 0;
    _grabbing = true;
    if (mounted) setState(() {});
    BonusRepo.grab(bonusId, widget.room.rid).then((rsp) {
      _grabbing = false;
      if (mounted) setState(() {});
      if (rsp.success) {
        Navigator.pop(context);
        BonusResultDialog.show(
            System.context, widget.bonusPreview!.id, widget.room.rid);

        //更新红包已抢状态
        BonusModel bonusModel = context.read<BonusModel>();
        if (bonusModel.value?.curBonus?.id == widget.bonusPreview!.id) {
          bonusModel.value?.curBonus?.grabbed = true;
          bonusModel.notify();
        }
      } else {
        BaseResponse.toast(rsp);
      }
    });
  }

  Widget _buildButton(BuildContext context) {
    return GestureDetector(
      onTap: () => _onGrabTap(context),
      child: Container(
        width: 120.dp,
        height: 120.dp,
        alignment: AlignmentDirectional.center,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image:
              AssetImage(RoomAssets.chat_room$bonus_bg_bonus_grab_button_webp),
        )),
        child: _buildButtonContent(),
      ),
    );
  }

  Widget _buildCountDesc() {
    return Text(
      widget.bonusPreview?.content ?? '',
      style: const TextStyle(fontSize: 12, color: Color(0xE6FFFFFF)),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 57.dp,
        ),
        _buildAvatar(),
        SizedBox(
          height: 6.5.dp,
        ),
        _buildName(),
        SizedBox(
          height: 12.dp,
        ),
        _buildMatchDesc(),
        SizedBox(
          height: 10.dp,
        ),
        _buildButton(context),
        SizedBox(
          height: 19.dp,
        ),
        _buildCountDesc(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    widget.room.addListener(BonusMsg.refresh, _onBonusRefresh);
    if (widget.bonusPreview?.state == BonusState.expire) {
      context.read<BonusModel>().loadData(widget.room.rid);
    }
  }

  void _onBonusRefresh(String type, dynamic data) {
    if (data is! Map) return;
    Log.d('BonusMsgHandler._handMsg, name: $type, data: $data');

    Map json = data;

    if (json.containsKey('packet')) {
      dynamic bonusJson = json['packet'];
      if (bonusJson is Map && bonusJson.isNotEmpty) {
        BonusInfo bonusInfo =
            BonusInfo.fromJson(bonusJson as Map<String, dynamic>);
        if (bonusInfo.id == widget.bonusPreview?.id) {
          widget.bonusPreview?.state = bonusInfo.state;

          if (mounted) setState(() {});
        }
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.room.removeListener(BonusMsg.refresh, _onBonusRefresh);
  }
}

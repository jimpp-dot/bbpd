import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/widget/user_icon_plugin.dart';
import '../gpk_constants.dart';
import '../gpk_helper.dart';
import '../model/gpk_model.dart';
import '../model/gpk_repo.dart';
import '../widget/gpk_user_icon.dart';
import 'package:chat_room/src/roomNavUtil.dart';

/// 分组pk进行中的麦位控件
class GPKPosWidget extends StatefulWidget {
  final ChatRoomData room;
  final int pos; // 实际麦位
  final GPKPosModel? model; // 为null时展示空麦位
  final int? rule;
  final GPKState? gpkState;

  const GPKPosWidget({
    super.key,
    required this.room,
    required this.pos,
    this.model,
    this.rule = RULE_GIF_VALUE,
    this.gpkState,
  });

  @override
  _GPKPosWidgetState createState() => _GPKPosWidgetState();
}

class _GPKPosWidgetState extends State<GPKPosWidget> {
  bool _isRequesting = false;

  RoomPosition? roomPosition;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  void didUpdateWidget(GPKPosWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _initData();
  }

  void _initData() {
    if (widget.room.positions.length > widget.pos) {
      roomPosition = widget.room.positions[widget.pos];
    }
  }

  @override
  Widget build(BuildContext context) {
    Log.d('GPKPosWidget.build, model: ${widget.model.toString()}');
    if (roomPosition == null) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      width: 42.dp,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              _buildAvatar(),
              if (widget.model?.gsIcon?.isNotEmpty ?? false)
                PositionedDirectional(
                  top: -8.dp,
                  bottom: -8.dp,
                  start: -8.dp,
                  end: -8.dp,
                  child: IgnorePointer(
                    child: CachedNetworkImage(
                      imageUrl:
                          Util.getRemoteImgUrl(widget.model!.gsIcon ?? ''),
                      width: 58.dp,
                      height: 58.dp,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              if (widget.model != null) _buildScore(),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 6.dp),
            child: _buildName(),
          ),
          if (widget.model != null)
            Padding(
              padding: EdgeInsetsDirectional.only(top: 8.dp),
              child: _buildBottomBtn(),
            ),
        ],
      ),
    );
  }

  /// 用户头像部分
  Widget _buildAvatar() {
    if (widget.model == null) {
      // 空麦位
      return UserIcon(
        room: widget.room,
        position: roomPosition!,
        size: 40.dp,
        plugins: [PunishPlugin(widget.model?.punish)],
      );
    } else if (widget.model!.status == 'offline') {
      // 显示离线状态
      return GestureDetector(
        onTap: () {
          RoomNavUtil.goToImageScreenDialog(context, null, widget.room,
              userId: widget.model?.uid);
        },
        child: GPKUserIcon(
          uid: widget.model?.uid ?? 0,
          isSpeaking: false,
          size: 40.dp,
          userPunish: widget.model?.punish,
          icon: widget.model?.icon,
          displayEmoteAtMic: false,
          isOffLine: true,
        ),
      );
    }
    return UserIcon(
      room: widget.room,
      position: roomPosition!,
      size: 40.dp,
      plugins: [PunishPlugin(widget.model?.getUserIconPunish())],
    );
  }

  /// 下方的得分
  Widget _buildScore() {
    if (widget.gpkState != GPKState.pk_ing) {
      return Container();
    }
    var score = GPKHelper.getScoreText(widget.rule, widget.model?.score ?? 0);
    return PositionedDirectional(
      bottom: -3.dp,
      child: IgnorePointer(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.dp, vertical: 1.dp),
          decoration: ShapeDecoration(
            color: Colors.black.withOpacity(0.6),
            shape: const StadiumBorder(),
          ),
          child: NumText(
            score,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 10.dp,
              color: Colors.white,
              height: 1,
            ),
          ),
        ),
      ),
    );
  }

  /// 用户的昵称
  Widget _buildName() {
    if (widget.model == null && roomPosition == null) {
      return Text(
        K.room_wait_for_seated,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
          color: Colors.white.withOpacity(0.4),
          fontSize: 10.dp,
          height: 1,
        ),
      );
    }
    return GestureDetector(
      // 扩大点击区域，同底部按钮
      onTap: () {
        _onClickBottomBtn();
      },
      child: Container(
        width: 50.dp,
        alignment: Alignment.center,
        child: Text(
          widget.model?.getNamePunish()?.content ??
              widget.model?.name ??
              roomPosition?.name ??
              '',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10.dp,
            height: 1,
          ),
        ),
      ),
    );
  }

  /// 底部功能按钮
  Widget _buildBottomBtn() {
    if (widget.gpkState != GPKState.pk_ing ||
        widget.model?.uid == Session.uid) {
      return Container();
    }
    return GestureDetector(
      onTap: () {
        _onClickBottomBtn();
      },
      child: Container(
        height: 20.dp,
        decoration: ShapeDecoration(
          gradient: LinearGradient(colors: _getBottomBtnColor()),
          shape: const StadiumBorder(),
        ),
        alignment: Alignment.center,
        child: Text(
          _getBottomBtnText(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            height: 1,
            fontSize: 10.dp,
          ),
          maxLines: 1,
        ),
      ),
    );
  }

  List<Color> _getBottomBtnColor() {
    if (widget.rule == RULE_GIF_VALUE) {
      return [const Color(0xFFF94187), const Color(0xFFF94187)];
    } else {
      return [const Color(0xFF489FFF), const Color(0xFF489FFF)];
    }
  }

  String _getBottomBtnText() {
    if (widget.rule == RULE_GIF_VALUE) {
      return K.room_gpk_reward;
    } else if (widget.rule == RULE_VOTE_NUM) {
      return K.room_gpk_vote;
    } else {
      return '';
    }
  }

  void _onClickBottomBtn() async {
    if (widget.model?.uid == Session.uid) {
      //如果点击的是自己，返回
      return;
    }
    if (widget.rule == RULE_GIF_VALUE) {
      IGiftManager giftManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
      giftManager.showRoomGiftPanel(context,
          room: widget.room, uid: widget.model?.uid ?? 0);
    } else if (widget.rule == RULE_VOTE_NUM) {
      if (_isRequesting) {
        return;
      }
      _isRequesting = true;
      var resp = await GPKRepo.vote(
          widget.room.rid, Session.uid, widget.model?.uid ?? 0);
      _isRequesting = false;
      if (resp.success == true) {
        Fluttertoast.showToast(msg: K.room_gpk_vote_success);
      } else {
        Fluttertoast.showToast(msg: resp.msg);
      }
    }
  }
}

import 'dart:async';

import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/punish/model/punish_beans.dart';
import 'package:chat_room/src/live/live_pk_config_v3.dart';
import 'package:chat_room/src/live/live_user_list_v3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pk/live_pk_agree_dialog_v3.dart';
import 'pk/live_pk_creator_v3.dart';
import 'pk/live_pk_launch_v3.dart';
import 'pk/live_pk_result_dialog_v3.dart';
import 'pk/live_pk_user_contribute_v3.dart';

///
/// 直播房，麦位部分（pk和未pk）
/// or 电台守护
///
class LiveMainV3 extends StatefulWidget {
  final ChatRoomData room;
  final bool displayEmoteAtMic;
  final VoidCallback? onOrderWeekTap;

  const LiveMainV3({
    Key? key,
    required this.room,
    this.displayEmoteAtMic = true,
    this.onOrderWeekTap,
  }) : super(key: key);

  @override
  State<LiveMainV3> createState() {
    return _LiveMainV3State();
  }
}

class _LiveMainV3State extends State<LiveMainV3> {
  int _winCount = 0; //主场连胜的次数
  int _toWinCount = 0; //客场连胜的次数
  LivePKConfigV3? _pkConfig;

  @override
  void initState() {
    super.initState();
    widget.room.addListener(RoomConstant.LIVE_PK_EVENT, _onPkEvent);

    _winCount = widget.room.config?.liveDataV3?.pkConfigV3?.pkBase?.main?.winCount ?? 0;
    _toWinCount = widget.room.config?.liveDataV3?.pkConfigV3?.pkBase?.compete?.winCount ?? 0;
    _pkConfig = widget.room.config?.liveDataV3?.pkConfigV3;

    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      await ChatRoomUtil.startLivePKV3(widget.room);

      /// 初始化声音惩罚
      UserPunish? voicePunish = _pkConfig?.pkPunish?.getVoicePunish(Session.uid);
      widget.room.emit(RoomConstant.Event_Local_Punish_Refresh, voicePunish);
    });
  }

  @override
  void dispose() {
    widget.room.removeListener(RoomConstant.LIVE_PK_EVENT, _onPkEvent);
    super.dispose();
  }

  ///socket事件分发处理
  Future<void> _onPkEvent(String type, Object? data) async {
    if (!mounted || data == null) return;
    Map map = data as Map;
    _pkConfig = widget.room.config?.liveDataV3?.pkConfigV3;

    /// 声音惩罚更新
    UserPunish? voicePunish = _pkConfig?.pkPunish?.getVoicePunish(Session.uid);
    widget.room.emit(RoomConstant.Event_Local_Punish_Refresh, voicePunish);
    switch (map['op']) {
      case 'live.pk.invite':
        LivePKState? state = widget.room.config?.liveDataV3?.pkConfigV3?.pkBase?.state;
        Log.d("live.pk.invite, state:$state");
        if (!ChatRoomUtil.isOnFirstPosition(Session.uid) || (state != null && state != LivePKState.Wait && state != LivePKState.Match)) {
          return;
        }
        Map res = map['data'] ?? {};
        LivePkAgreeDialogV3.show(
          System.context,
          name: '${res['name']}',
          headIcon: '${res['headIcon']}',
          sex: Util.parseInt(res['sex']),
          age: Util.parseInt(res['age']),
          fromUid: Util.parseInt(res['fromUid']),
          toUid: Util.parseInt(res['toUid']),
          fromRid: Util.parseInt(res['fromRid']),
          toRid: Util.parseInt(res['toRid']),
          pkId: Util.parseInt(res['pkId']),
          personCount: Util.parseInt(res['personCount']),
          pkTime: Util.parseInt(res['pkTime']),
          pkPunishContent: '${res['pkPunishContent']}',
          counter: Util.parseInt(res['counter']),
          timestamp: widget.room.timestamp,
          inviteSource: Util.parseInt(res['invite_source']),
        );
        break;
      case 'live.pk.ready':
        ChatRoomUtil.startLivePKV3(ChatRoomData.getInstance());
        Map? res = map['data'];
        if (res != null && res['main_con_win'] != null) {
          _winCount = Util.parseInt(res['main_con_win']);
        }
        if (res != null && res['compete_con_win'] != null) {
          _toWinCount = Util.parseInt(res['compete_con_win']);
        }
        if (_toWinCount > 4) setState(() {});
        break;
      case 'live.pk.wait':
        ChatRoomUtil.stopChannelMediaRelay(ChatRoomData.getInstance());
        break;
      case 'live.pk.punish':
        int? win = widget.room.config?.liveDataV3?.pkConfigV3?.pkBase?.win;
        String? resultType;
        if (win == 1) {
          if (widget.room.config?.liveDataV3?.pkConfigV3?.pkBase?.main?.rid == widget.room.rid) {
            //当前房间胜利
            resultType = 'live.pk.win';
          } else {
            resultType = 'live.pk.fail';
          }
        } else if (win == 2) {
          if (widget.room.config?.liveDataV3?.pkConfigV3?.pkBase?.compete?.rid == widget.room.rid) {
            //当前房间胜利
            resultType = 'live.pk.win';
          } else {
            resultType = 'live.pk.fail';
          }
        } else if (win == 3) {
          resultType = 'live.pk.pin';
        }

        /// 连胜王者标识在惩罚阶段立马显示
        Map? res = map['data'];
        if (res != null && res['main_con_win'] != null) {
          _winCount = Util.parseInt(res['main_con_win']);
        }
        if (res != null && res['compete_con_win'] != null) {
          _toWinCount = Util.parseInt(res['compete_con_win']);
        }
        if (_toWinCount > 4) setState(() {});
        if (resultType != null) {
          LivePkResultDialog.show(context: Constant.context, type: resultType);
        }
        break;
      case 'live.pk.match':
        Log.d('Live.pk.match ');
        Map? res = map['data'];
        if (res != null && res['main_con_win'] != null) {
          _winCount = Util.parseInt(res['main_con_win']);
        }
        break;
    }
  }

  Widget _buildBody() {
    //TODO  state callback
    LivePKState? state = widget.room.config?.liveDataV3?.pkConfigV3?.pkBase?.state;

    // LivePKState? state =
    //     LivePKState.Ready;

    //如果是等待状态
    if (state == null || state == LivePKState.Wait) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RoomCreatorWidget(
            room: widget.room,
            onOrderWeekTap: widget.onOrderWeekTap,
            liveMicFrame: widget.room.config?.liveDataV3?.challengeMicFrame,
          ),
          if (widget.room.isLiveRoom) LiveUserListV3(room: widget.room),
          if (widget.room.isBusinessRadio) UserListNormal(room: widget.room)
        ],
      );
    } else {
      bool hasPkUserContribute = true;
      PkRank? pkRank = widget.room.config?.liveDataV3?.pkConfigV3?.pkRank;
      if (pkRank == null ||
          ((pkRank.mainRank == null || pkRank.mainRank!.isEmpty) && (pkRank.competeRank == null || pkRank.competeRank!.isEmpty))) {
        hasPkUserContribute = false;
      }
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LivePKCreatorV3(
            room: widget.room,
            displayEmoteAtMic: widget.displayEmoteAtMic,
            // needBottomRadius: state == LivePKState.Match,
            needBottomRadius: true,
            winCount: _winCount,
            toWinCount: _toWinCount,
            pkConfig: widget.room.config?.liveDataV3?.pkConfigV3,
          ),
          if (state != LivePKState.Match) ...[
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 32.0,
              height: 20,
              child: ClipRRect(
                borderRadius: const BorderRadiusDirectional.only(
                  // bottomEnd: Radius.circular(hasPkUserContribute ? 0.0 : 12),
                  // bottomStart: Radius.circular(hasPkUserContribute ? 0.0 : 12),
                  topEnd: Radius.circular(12),
                  topStart: Radius.circular(12),
                  bottomEnd: Radius.circular(12),
                  bottomStart: Radius.circular(12),
                ).resolve(Directionality.of(context)),
                child: PkScoreWidget(
                  marginLR: 24,
                  showLeftAndRightIcon: true,
                  widget.room.config?.liveDataV3?.pkConfigV3?.pkBase?.main?.score.toDouble(),
                  widget.room.config?.liveDataV3?.pkConfigV3?.pkBase?.compete?.score.toDouble(),
                  height: 20.0,
                ),
              ),
            ),
            LivePkUserContribute(pkRank: widget.room.config?.liveDataV3?.pkConfigV3?.pkRank)
          ],
          LiveUserListV3(room: widget.room),
          const SizedBox(height: 16.0),
        ],
      );
    }
  }

  Widget _buildLeft() {
    List<Widget> res = [];
    // 直播间铭牌
    if (widget.room.config != null &&
        widget.room.config!.liveDataV3 != null &&
        widget.room.config!.liveDataV3?.fansLabel != null &&
        widget.room.config!.liveDataV3!.fansLabel.isNotEmpty) {
      /// 去掉旧入口后 添加对应的占位
      res.add(const SizedBox(width: 88, height: 20));
    } else {
      res.add(const SizedBox(height: 20));
    }

    if (res.isNotEmpty) {
      res.add(const SizedBox(height: 11.0));
    }

    LivePKState? state = widget.room.config?.liveDataV3?.pkConfigV3?.pkBase?.state;
    bool isPkClose = widget.room.config?.liveDataV3?.pkConfigV3?.isPkClose() ?? true;
    // Log.d('isPkClose:$isPkClose');
    //如果是房主&&等待状态
    if (!isPkClose &&
        ChatRoomUtil.isOnFirstPosition(Session.uid) &&
        (state == null || state == LivePKState.Wait) &&
        ChatRoomUtil.isUidOnPosition(Session.uid)) {
      res.add(
        GestureDetector(
          onTap: () {
            int uid = 0;
            if (widget.room.positions.isNotEmpty) {
              uid = widget.room.positions[0].uid;
            }
            LivePkLaunchWidgetV3.show(context, widget.room.rid, uid);
          },
          child: R.img(
            RoomAssets.chat_room$livev3_room_live_pk_entrace_webp,
            width: 129 / 2.3,
            height: 174 / 2.3,
          ),
        ),
      );
    }
    if (res.isNotEmpty) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: res,
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        _buildBody(),
        PositionedDirectional(
          start: 16.0,
          child: _buildLeft(),
        ),
      ],
    );
  }
}

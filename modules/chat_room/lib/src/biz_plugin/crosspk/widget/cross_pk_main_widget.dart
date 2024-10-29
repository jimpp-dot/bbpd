import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/src/base/channel_relay_user.dart';
import 'package:chat_room/src/base/punish/model/punish_beans.dart';
import 'package:chat_room/src/biz_plugin/crosspk/widget/cross_pk_user_icon.dart';
import 'package:chat_room/src/biz_plugin/crosspk/widget/setting/cross_pk_overtime_setting.dart';
import 'package:chat_room/src/protobuf/generated/punish.pb.dart'
    hide UserPunish;
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/biz_plugin/crosspk/model/repo.dart';
import 'package:chat_room/src/biz_plugin/crosspk/widget/cross_pk_result_dialog_v2.dart';
import 'package:chat_room/src/biz_plugin/crosspk/widget/cross_pk_ring.dart';
import 'package:chat_room/src/protobuf/generated/room_cross_pk.pb.dart';

import 'cross_pk_result_dialog.dart';

/// 主界面
class CrossPKMainWidget extends StatefulWidget {
  final ChatRoomData room;

  const CrossPKMainWidget({Key? key, required this.room}) : super(key: key);

  @override
  State<CrossPKMainWidget> createState() => _CrossPKMainWidgetState();
}

class _CrossPKMainWidgetState extends State<CrossPKMainWidget> {
  static String TAG = 'CrossPKMainWidget';
  RoomCrossPkMessage? _message;
  RoomCrossPKStatus? lastPkStatus;

  final IPersonalDataManager _personalDataManager = ComponentManager.instance
      .getManager(ComponentManager.MANAGER_PERSONALDATA);

  @override
  void initState() {
    super.initState();
    widget.room
        .addListener('${RoomConstant.Event_Prefix}cross.pk.sync', _onSyncEvent);
    widget.room.addListener(
        '${RoomConstant.Event_Prefix}cross.pk.result', _onResultEvent);
    widget.room.addListener(
        '${RoomConstant.Event_Prefix}cross.pk.result.v2', _onResultV2Event);
    _load();
  }

  @override
  void dispose() {
    widget.room.removeListener(
        '${RoomConstant.Event_Prefix}cross.pk.sync', _onSyncEvent);
    widget.room.removeListener(
        '${RoomConstant.Event_Prefix}cross.pk.result', _onResultEvent);
    widget.room.removeListener(
        '${RoomConstant.Event_Prefix}cross.pk.result.v2', _onResultV2Event);
    super.dispose();
  }

  _load() async {
    RespRoomCrossPkConfig rsp = await CrossPKRepo.loadInfo(widget.room.rid);
    if (rsp.success) {
      _message = rsp.data;
      _relay(true);
    } else {
      Toast.show(context, rsp.msg);
    }
    if (mounted) {
      setState(() {});
    }
  }

  _onSyncEvent(String type, Object? data) {
    if (data is Map && data.containsKey('pb')) {
      RoomCrossPkMessage message =
          RoomCrossPkMessage.fromBuffer(List<int>.from(data['pb']));
      Log.d(message.toProto3Json());
      if (mounted) {
        setState(() {
          _message = message;
          _relay(false);
        });
      }
    }
  }

  bool _isVoicePunish(SystemPunishType type) {
    return SystemPunishType.naughty == type ||
        SystemPunishType.special == type ||
        SystemPunishType.funny == type;
  }

  /// 跨房连麦处理
  void _relay(bool initState) {
    if (_message != null) {
      /// 声音惩罚更新
      UserPunishItem? voice =
          _message!.punish.punish.firstWhereOrNull((element) {
        SystemPunishType type = parseSystemPunishType(element.type);
        if ((element.uid == Session.uid) && _isVoicePunish(type)) {
          return true;
        }
        return false;
      });
      UserPunish? voicePunish;
      if (voice != null) {
        voicePunish = UserPunish(
          id: voice.punishId,
          uid: voice.uid,
          type: parseSystemPunishType(voice.type),
          content: voice.content,
          pageCount: voice.paperCount,
        );
      }

      widget.room.emit(RoomConstant.Event_Local_Punish_Refresh, voicePunish);

      if (lastPkStatus != _message!.pk.status) {
        /// PK状态变化，才处理
        Log.d(
            '$TAG lastPkStatus: $lastPkStatus, status: ${_message!.pk.status}');
        lastPkStatus = _message!.pk.status;
        if (_message!.pk.status !=
                RoomCrossPKStatus.ROOM_CROSS_PK_STATUS_PKING &&
            _message!.pk.status !=
                RoomCrossPKStatus.ROOM_CROSS_PK_STATUS_ENDING) {
          /// 非PK和惩罚阶段，停止跨房连麦
          Log.d('$TAG cross pk _relay, stopChannelMediaRelay');
          ChatRoomUtil.stopChannelMediaRelay(ChatRoomData.getInstance());
        } else if (_message!.pk.mode == RoomCrossPKMode.ROOM_CROSS_PK_MODE_2 ||
            _message!.pk.mode == RoomCrossPKMode.ROOM_CROSS_PK_MODE_TOWER) {
          /// 目前仅支持两个房间PK，跨房连麦
          bool needRelay = false;
          if (initState &&
              (_message!.pk.status ==
                      RoomCrossPKStatus.ROOM_CROSS_PK_STATUS_PKING ||
                  _message!.pk.status ==
                      RoomCrossPKStatus.ROOM_CROSS_PK_STATUS_ENDING)) {
            /// 初次进入，PK和惩罚阶段都要发起跨房连麦
            needRelay = true;
          } else if (!initState &&
              _message!.pk.status ==
                  RoomCrossPKStatus.ROOM_CROSS_PK_STATUS_PKING) {
            /// 在PK UI收到socket，只在PK阶段
            needRelay = true;
          }
          if (needRelay) {
            RoomCrossPkRoleInfo? selfInfo = _message!.roles
                .firstWhereOrNull((e) => e.rid == widget.room.rid);
            RoomCrossPkRoleInfo? targetInfo = _message!.roles
                .firstWhereOrNull((e) => e.rid != widget.room.rid);
            if (selfInfo != null && targetInfo != null) {
              Log.d('$TAG cross pk _relay, startChannelMediaRelay');
              ChannelRelayUser main =
                  ChannelRelayUser.fromRoomCrossPkRoleInfo(selfInfo);
              ChannelRelayUser compete =
                  ChannelRelayUser.fromRoomCrossPkRoleInfo(targetInfo);
              ChatRoomUtil.startChannelMediaRelay(
                  main, compete, ChatRoomData.getInstance());
            }
          }
        }
      }

      if (_message!.pk.status == RoomCrossPKStatus.ROOM_CROSS_PK_STATUS_PKING ||
          _message!.pk.status ==
              RoomCrossPKStatus.ROOM_CROSS_PK_STATUS_ENDING) {
        RoomCrossPkRoleInfo? selfInfo =
            _message?.roles.firstWhereOrNull((e) => e.rid == widget.room.rid);
        RoomCrossPkRoleInfo? targetInfo =
            _message?.roles.firstWhereOrNull((e) => e.rid != widget.room.rid);

        if (selfInfo != null && targetInfo != null) {
          ChannelRelayUser main =
              ChannelRelayUser.fromRoomCrossPkRoleInfo(selfInfo);
          ChannelRelayUser compete =
              ChannelRelayUser.fromRoomCrossPkRoleInfo(targetInfo);

          /// 移除在幽灵麦列表中，参与PK的主播,并恢复接收流
          Log.d('$TAG cross pk _relay, relayMuteRemoteAudioStream');
          ChatRoomData.getInstance()
              ?.relayMuteRemoteAudioStream([main, compete]);
        }
      }
    }
  }

  /// 用新的约战结果弹窗
  _onResultV2Event(String type, Object? data) {
    if (data is Map && data.containsKey('pb')) {
      /// 约战结果 显示V2 by app
      RoomCrossPkResultV2 result =
          RoomCrossPkResultV2.fromBuffer(List<int>.from(data['pb']));
      Log.d(result.toProto3Json());
      if (mounted) {
        CrossPKResultDialogV2.show(context, result);
      }
    }
  }

  _onResultEvent(String type, Object? data) {
    if (data is Map && data.containsKey('pb')) {
      RoomCrossPkResult result =
          RoomCrossPkResult.fromBuffer(List<int>.from(data['pb']));
      Log.d(result.toProto3Json());
      if (mounted) {
        CrossPKResultDialog.show(context, result);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.room.showCrossPK == 2) {
      return const SizedBox.shrink();
    }
    if (_message == null) {
      return const SizedBox.shrink();
    } else if (_message!.pk.mode == RoomCrossPKMode.ROOM_CROSS_PK_MODE_2 ||
        _message!.pk.mode == RoomCrossPKMode.ROOM_CROSS_PK_MODE_TOWER ||
        _message!.pk.mode == RoomCrossPKMode.ROOM_CROSS_PK_MODE_QUALIFY) {
      return _build2Rooms(_message!);
    } else if (_message!.pk.mode == RoomCrossPKMode.ROOM_CROSS_PK_MODE_3) {
      return _build3Rooms(_message!);
    }
    return const SizedBox.shrink();
  }

  Widget _build2Rooms(RoomCrossPkMessage message) {
    double w = Util.width;
    final double edge = 6.dp;
    double usersBgWidth = w - edge * 2;

    var punishText = '';
    final punishment = message.pk.setting.punishment;
    var punishContentBg = Container();
    if (punishment.isNotEmpty) {
      punishText =
          '${K.live_agree_pk_punish}: ${message.pk.setting.punishment}';
      punishContentBg = Container(
        width: 110,
        height: 20,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage(RoomAssets.chat_room$crosspk_punish_content_bg_webp),
            fit: BoxFit.fill,
          ),
        ),
        alignment: AlignmentDirectional.center,
        padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
        child: Text(
          punishText,
          style: const TextStyle(
              fontSize: 10, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsetsDirectional.all(10.dp),
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage(RoomAssets.chat_room$crosspk_2rooms_bg_webp),
          //     fit: BoxFit.fill,
          //   ),
          // ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 12.dp),
              _build2RoomsTopRow(message),
              SizedBox(height: 5.dp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: edge),
                child: _build2RoomsPK(message),
              ),
              Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Container(
                    width: usersBgWidth,
                    // height: usersBgHeight,
                    margin: EdgeInsetsDirectional.only(
                        top: 10.dp, start: edge, end: edge, bottom: edge),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(RoomAssets
                            .chat_room$crosspk_2rooms_users_bg_left_webp),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 17.dp),
                        _buildUserIconList(
                            widget.room.positions.skip(1).take(4).toList()),
                        SizedBox(height: 12.dp),
                        _buildUserIconList(
                            widget.room.positions.skip(5).take(4).toList()),
                        SizedBox(height: 8.dp),
                      ],
                    ),
                  ),
                  punishContentBg,
                ],
              )
            ],
          ),
        ),
        if (widget.room.isCreator || widget.room.isReception)
          _buildOptionButton(message),
      ],
    );
  }

  /// 主持、魅力、接待
  Widget _build2RoomsTopRow(RoomCrossPkMessage message) {
    RoomCrossPkRoleInfo? selfInfo =
        message.roles.firstWhereOrNull((e) => e.rid == widget.room.rid);

    if (selfInfo == null) return const SizedBox.shrink();

    RoomPosition pos0 = widget.room.positions[0];
    RoomCrossPkMember? bestReceiver = selfInfo.bestReceiver;
    RoomCrossPkMember? bestSender = selfInfo.bestSender;
    int pos0Score =
        selfInfo.members.firstWhereOrNull((e) => e.uid == pos0.uid)?.score ?? 0;
    return Row(
      children: [
        // 魅力榜首
        Container(
          width: 60,
          margin: const EdgeInsetsDirectional.only(start: 16),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: AlignmentDirectional.center,
                children: [
                  if (selfInfo.hasBestReceiver())
                    CommonAvatar(
                      path: bestReceiver.icon,
                      size: 42,
                      shape: BoxShape.circle,
                      onTap: () {
                        _personalDataManager
                            .openImageFloatScreenDisplayModalBottomSheet(
                                context, bestReceiver.uid, widget.room, 0);
                      },
                    )
                  else
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        border: GradientBoxBorder(
                          gradient: LinearGradient(
                              colors: [
                                Color(0xFF0E68FF),
                                Color(0xFFBD29FF),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                          width: 1,
                        ),
                      ),
                      child: R.img(
                        RoomAssets.chat_room$wait_svg,
                        width: 28,
                        fit: BoxFit.contain,
                        height: 28,
                      ),
                    ),
                  PositionedDirectional(
                    bottom: -1,
                    child: Container(
                      width: 28,
                      height: 13,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFBD29FF),
                            Color(0xFF0E68FF),
                          ],
                          begin: AlignmentDirectional.bottomStart,
                          end: AlignmentDirectional.topEnd,
                        ),
                        borderRadius: BorderRadius.circular(6.5),
                      ),
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        K.room_cross_pk_charm,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            height: 1),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 5, bottom: 4),
                child: Text(
                  selfInfo.hasBestReceiver()
                      ? bestReceiver.name
                      : K.room_wait_for_seated,
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              _buildScore(bestReceiver.score),
            ],
          ),
        ),
        const Spacer(),
        // 主持
        Container(
          width: 80,
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: AlignmentDirectional.center,
                children: [
                  UserIcon(
                      room: widget.room,
                      position: pos0,
                      size: 52,
                      border:
                          const BorderSide(color: Color(0xFFFF3939), width: 1)),
                  PositionedDirectional(
                    bottom: -2,
                    child: Container(
                      width: 36,
                      height: 13,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFFF3939),
                            Color(0xFFAE37FF),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(6.5),
                      ),
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        K.room_host,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 5, bottom: 4),
                child: Text(
                  pos0.uid > 0 ? pos0.name : K.room_wait_for_seated,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              _buildScore(pos0Score),
            ],
          ),
        ),
        const Spacer(),
        // 贡献榜首
        Container(
          width: 60,
          margin: const EdgeInsetsDirectional.only(end: 16),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: AlignmentDirectional.center,
                children: [
                  if (selfInfo.hasBestSender())
                    CommonAvatar(
                      path: bestSender.icon,
                      size: 42,
                      shape: BoxShape.circle,
                      onTap: () {
                        _personalDataManager
                            .openImageFloatScreenDisplayModalBottomSheet(
                                context, bestSender.uid, widget.room, 0);
                      },
                    )
                  else
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        border: GradientBoxBorder(
                          gradient: LinearGradient(
                              colors: [
                                Color(0xFFFFA137),
                                Color(0xFFFF3939),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                          width: 1,
                        ),
                      ),
                      child: R.img(
                        RoomAssets.chat_room$wait_svg,
                        width: 28,
                        fit: BoxFit.contain,
                        height: 28,
                      ),
                    ),
                  PositionedDirectional(
                    bottom: -1,
                    child: Container(
                      width: 28,
                      height: 13,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Color(0xFFF9D423), Color(0xFFFF4E50)]),
                        borderRadius: BorderRadius.circular(6.5),
                      ),
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        K.room_contribution,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 5, bottom: 4),
                child: Text(
                  selfInfo.hasBestSender()
                      ? bestSender.name
                      : K.room_wait_for_seated,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              _buildScore(bestSender.score),
            ],
          ),
        ),
      ],
    );
  }

  Widget _build2RoomsPK(RoomCrossPkMessage message) {
    RoomCrossPkRoleInfo? selfInfo =
        message.roles.firstWhereOrNull((e) => e.rid == widget.room.rid);
    RoomCrossPkRoleInfo? targetInfo =
        message.roles.firstWhereOrNull((e) => e.rid != widget.room.rid);

    /// 名字惩罚
    UserPunishItem? selfNamePunish;
    UserPunishItem? targetNamePunish;
    if (Util.validList(message.punish.punish)) {
      if (selfInfo?.uid != null && selfInfo!.uid > 0) {
        selfNamePunish = message.punish.punish.firstWhereOrNull(
          (element) =>
              (element.uid == selfInfo.uid) &&
              (parseSystemPunishType(element.type) ==
                  SystemPunishType.changeName),
        );
      }
      if (targetInfo != null && targetInfo.uid > 0) {
        targetNamePunish = message.punish.punish.firstWhereOrNull(
          (element) =>
              (element.uid == targetInfo.uid) &&
              (parseSystemPunishType(element.type) ==
                  SystemPunishType.changeName),
        );
      }
    }

    int diff = 0;
    if (message.pk.stageEndLine > 0) {
      diff = message.pk.stageEndLine - widget.room.timestamp;
    }

    var punishText = '';
    final punishment = message.pk.setting.punishment;
    var punishContentBg = Container();
    if (punishment.isNotEmpty) {
      punishText =
          '${K.live_agree_pk_punish}: ${message.pk.setting.punishment}';
      punishContentBg = Container(
        width: 110,
        height: 20,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage(RoomAssets.chat_room$crosspk_punish_content_bg_webp),
            fit: BoxFit.fill,
          ),
        ),
        alignment: AlignmentDirectional.center,
        padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
        child: Text(
          punishText,
          style: const TextStyle(
              fontSize: 10, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      );
    }

    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: 36.dp,
          width: Util.width,
        ),

        // R.img(
        //   RoomAssets.chat_room$crosspk_2rooms_pk_banner_webp,
        //   height: 61.dp,
        //   fit: BoxFit.fill,
        // ),
        // pk 条
        PositionedDirectional(
          start: 20.dp,
          end: 20.dp,
          bottom: 0,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              PkScoreWidget(
                (selfInfo?.totalScore ?? 0).toDouble(),
                (targetInfo?.totalScore ?? 0).toDouble(),
                height: 18.dp,
                roundCorner: true,
                displayScore: false,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 25.dp, end: 25.dp, bottom: 3.dp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${K.room_our_side} ${Util.numberToSizeString(selfInfo?.totalScore ?? 0)}',
                      style: TextStyle(
                        fontSize: 10.dp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                        height: 1,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${Util.numberToSizeString(targetInfo?.totalScore ?? 0)} ${K.room_opposite_side}',
                      style: TextStyle(
                        fontSize: 10.dp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // 主场用户
        PositionedDirectional(
          start: 6.dp,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CrossPkUserIcon(
                isAudience: Session.uid != selfInfo?.uid &&
                    Session.uid != targetInfo?.uid,
                punish: _message?.punish,
                item: selfInfo,
                room: widget.room,
                showMainIcon: true,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: Util.width / 4),
                margin: const EdgeInsetsDirectional.only(start: 4),
                child: Text(
                  selfNamePunish?.content ?? (selfInfo?.name ?? ''),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        // 客场用户
        PositionedDirectional(
          end: 6.dp,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: Util.width / 4),
                margin: const EdgeInsetsDirectional.only(end: 4),
                child: Text(
                  message.pk.status ==
                          RoomCrossPKStatus.ROOM_CROSS_PK_STATUS_MATCH
                      ? K.live_pk_matching
                      : (targetNamePunish?.content ?? (targetInfo?.name ?? '')),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (message.pk.status ==
                  RoomCrossPKStatus.ROOM_CROSS_PK_STATUS_MATCH)
                R.img(
                  RoomAssets.chat_room$crosspk_matching_icon_webp,
                  width: 36.dp,
                  height: 36.dp,
                )
              else
                CrossPkUserIcon(
                  isAudience: Session.uid != selfInfo?.uid &&
                      Session.uid != targetInfo?.uid,
                  punish: message.punish,
                  item: targetInfo,
                  room: widget.room,
                ),
            ],
          ),
        ),
        // if (diff > 0)
        // 倒计时
        PositionedDirectional(
          top: 2.dp,
          child: TimerWidget(
            stop: Duration(seconds: diff),
            onTick: () {
              if (diff > 0) diff--;
            },
            builder: (context) {
              return Text(
                Util.formatTimeToMinute(diff),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  /// 单行麦位列表，最多4个
  Widget _buildUserIconList(List<RoomPosition> positions) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: positions.isNotEmpty
              ? _buildUserIcon(positions[0])
              : const SizedBox.shrink(),
        ),
        Expanded(
          child: positions.length > 1
              ? _buildUserIcon(positions[1])
              : const SizedBox.shrink(),
        ),
        Expanded(
          child: positions.length > 2
              ? _buildUserIcon(positions[2])
              : const SizedBox.shrink(),
        ),
        Expanded(
          child: positions.length > 3
              ? _buildUserIcon(positions[3])
              : const SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget _buildUserIcon(RoomPosition pos) {
    RoomCrossPkRoleInfo? selfRole =
        _message!.roles.firstWhereOrNull((e) => e.rid == widget.room.rid);
    int score =
        selfRole?.members.firstWhereOrNull((e) => e.uid == pos.uid)?.score ?? 0;

    return LayoutBuilder(
      builder: (context, constraints) {
        double maxW = constraints.maxWidth;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            UserIcon(
                room: widget.room,
                size: 42.dp,
                position: pos,
                emptyMicBuilder: (context) {
                  return Container(
                    width: 42.dp,
                    height: 42.dp,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.white.withOpacity(0.6), width: 1.5),
                    ),
                    child: R.img(
                      RoomAssets.chat_room$empty_join_svg,
                      width: 24.dp,
                      fit: BoxFit.contain,
                      height: 24.dp,
                    ),
                  );
                }),
            Container(
              width: maxW * 0.8,
              margin: const EdgeInsetsDirectional.only(top: 4, bottom: 6),
              alignment: Alignment.center,
              child: Text(
                pos.uid > 0 ? pos.name : K.room_wait_for_seated,
                style: const TextStyle(
                    color: Color(0xFFFEFEFE), fontSize: 10, height: 1),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            _buildScore(score),
          ],
        );
      },
    );
  }

  Widget _build3Rooms(RoomCrossPkMessage message) {
    double w = Util.width;
    final double edge = 10.dp;
    double roadWidth = w - edge * 2;
    double roadHeight = 215 / 351 * roadWidth;
    double usersBgWidth = w - 10.dp;
    double usersBgHeight = 197 / 341 * usersBgWidth;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsetsDirectional.all(edge),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(RoomAssets.chat_room$crosspk_3rooms_bg_webp),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              MultiframeImage.network(
                Util.getImgUrl(_get3RoomsRoadImage(message)),
                'crosspk',
                loop: true,
                width: roadWidth,
                height: roadHeight,
                fit: BoxFit.contain,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 18.dp),
                  _build3RoomsTopRow(message),
                  SizedBox(height: 4.dp),
                  _buildRoomCreatorsRow(message),
                  Container(
                    width: usersBgWidth,
                    height: usersBgHeight,
                    margin: EdgeInsetsDirectional.only(
                        start: 5.dp, end: 5.dp, bottom: 5.dp),
                    padding:
                        EdgeInsetsDirectional.only(top: 4.dp, bottom: 11.dp),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(_get3RoomsUsersBg(message)),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // 房间分数
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _build3RoomsScore(message.roles.first.totalScore,
                                message.roles.first.rid == widget.room.rid),
                            _build3RoomsScore(
                              message.roles.length > 1
                                  ? message.roles[1].totalScore
                                  : 0,
                              message.roles.length > 1
                                  ? message.roles[1].rid == widget.room.rid
                                  : false,
                            ),
                            _build3RoomsScore(
                              message.roles.length > 2
                                  ? message.roles[2].totalScore
                                  : 0,
                              message.roles.length > 2
                                  ? message.roles[2].rid == widget.room.rid
                                  : false,
                            ),
                          ],
                        ),
                        _buildUserIconList(
                            widget.room.positions.skip(1).take(4).toList()),
                        // SizedBox(height: 12.dp),
                        _buildUserIconList(
                            widget.room.positions.skip(5).toList()),
                        // SizedBox(height: 12.dp),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        _buildOptionButton(message),
      ],
    );
  }

  /// 跑道图
  String _get3RoomsRoadImage(RoomCrossPkMessage message) {
    if (message.pk.status == RoomCrossPKStatus.ROOM_CROSS_PK_STATUS_MATCH) {
      if (message.roles.length == 1) {
        // 缺2个人
        return 'room/crosspk/3rooms_road_wait2.webp';
      } else if (message.roles.length == 2) {
        // 缺1个人
        return 'room/crosspk/3rooms_road_wait1.webp';
      }
    } else {
      int index = message.roles.indexWhere((e) => e.rid == widget.room.rid);
      if (index == 0) {
        return 'room/crosspk/3rooms_road_red.webp';
      } else if (index == 1) {
        return 'room/crosspk/3rooms_road_blue.webp';
      } else if (index == 2) {
        return 'room/crosspk/3rooms_road_yellow.webp';
      }
    }
    return 'room/crosspk/3rooms_road_wait2.webp';
  }

  /// 用户列表背景图
  String _get3RoomsUsersBg(RoomCrossPkMessage message) {
    int index = message.roles.indexWhere((e) => e.rid == widget.room.rid);
    if (index == 0) {
      return RoomAssets.chat_room$crosspk_3rooms_users_bg_red_webp;
    } else if (index == 1) {
      return RoomAssets.chat_room$crosspk_3rooms_users_bg_blue_webp;
    } else if (index == 2) {
      return RoomAssets.chat_room$crosspk_3rooms_users_bg_yellow_webp;
    } else {
      return RoomAssets.chat_room$crosspk_3rooms_users_bg_red_webp;
    }
  }

  /// 主持位、比分环、魅力位
  Widget _build3RoomsTopRow(RoomCrossPkMessage message) {
    RoomCrossPkRoleInfo? selfInfo =
        message.roles.firstWhereOrNull((e) => e.rid == widget.room.rid);
    RoomPosition pos0 = widget.room.positions[0];
    int score =
        selfInfo?.members.firstWhereOrNull((e) => e.uid == pos0.uid)?.score ??
            0;
    int diff = 0;
    if (message.pk.stageEndLine > 0) {
      diff = message.pk.stageEndLine - widget.room.timestamp;
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 110,
          alignment: AlignmentDirectional.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  UserIcon(
                    room: widget.room,
                    position: pos0,
                    size: 42,
                    border:
                        const BorderSide(color: Color(0x33FFFFFF), width: 1.5),
                  ),
                  PositionedDirectional(
                    bottom: -5,
                    child: Container(
                      width: 28,
                      height: 13,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFFE62A5),
                            Color(0xFFF86AFF),
                          ],
                        ),
                      ),
                      child: Text(
                        K.room_reception,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                constraints: const BoxConstraints(maxWidth: 80),
                margin: const EdgeInsetsDirectional.only(top: 6),
                child: Text(
                  pos0.name.isNotEmpty ? pos0.name : K.room_wait_for_seated,
                  style: const TextStyle(
                    color: Color(0xFFFEFEFE),
                    fontSize: 10,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (pos0.uid > 0) _buildScore(score),
            ],
          ),
        ),
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              PositionedDirectional(
                bottom: -2,
                child: R.img(
                  RoomAssets.chat_room$crosspk_3rooms_pk_banner_webp,
                  width: 190.dp,
                  height: 66.dp,
                  fit: BoxFit.contain,
                ),
              ),
              CrossPKRingWidget(
                values: [
                  message.roles.isNotEmpty ? message.roles[0].totalScore : 0,
                  message.roles.length > 1 ? message.roles[1].totalScore : 0,
                  message.roles.length > 2 ? message.roles[2].totalScore : 0,
                ],
                size: Size(78.dp, 78.dp),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  R.img(
                    RoomAssets.chat_room$crosspk_sword_webp,
                    width: 30.dp,
                    height: 24.dp,
                    fit: BoxFit.contain,
                  ),
                  if (diff > 0)
                    TimerWidget(
                      stop: Duration(seconds: diff),
                      onTick: () {
                        if (diff > 0) diff--;
                      },
                      builder: (context) {
                        return Text(
                          Util.formatTimeToMinute(diff),
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color(0xD9F6F7F9),
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      },
                    ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: 110,
          alignment: AlignmentDirectional.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  if (selfInfo?.hasBestReceiver() ?? false)
                    CommonAvatar(
                      path: selfInfo?.bestReceiver.icon,
                      size: 42,
                      shape: BoxShape.circle,
                      onTap: () {
                        _personalDataManager
                            .openImageFloatScreenDisplayModalBottomSheet(
                          context,
                          selfInfo?.bestReceiver.uid ?? 0,
                          widget.room,
                          0,
                        );
                      },
                    )
                  else
                    R.img(
                      RoomAssets.chat_room$wait_svg,
                      width: 42,
                      height: 42,
                    ),
                  PositionedDirectional(
                    bottom: -5,
                    child: Container(
                      width: 28,
                      height: 13,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF4CC3FF),
                            Color(0xFF7C64D5),
                            Color(0xFFFF057C),
                          ],
                        ),
                      ),
                      child: Text(
                        K.room_cross_pk_charm,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                constraints: const BoxConstraints(maxWidth: 80),
                margin: const EdgeInsetsDirectional.only(top: 6),
                child: Text(
                  (selfInfo?.hasBestReceiver() ?? false)
                      ? selfInfo!.bestReceiver.name
                      : K.room_wait_for_seated,
                  style: const TextStyle(
                    color: Color(0xFFFEFEFE),
                    fontSize: 10,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (pos0.uid > 0)
                _buildScore((selfInfo?.hasBestReceiver() ?? false)
                    ? selfInfo!.bestReceiver.score
                    : 0),
            ],
          ),
        ),
      ],
    );
  }

  /// 3个房主
  Widget _buildRoomCreatorsRow(RoomCrossPkMessage message) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildRoomCreator(
          message.roles.isNotEmpty ? message.roles[0] : null,
          [
            const Color(0xFFFF9DF0),
            const Color(0xFFFA42CC),
          ],
        ),
        _buildRoomCreator(
          message.roles.length > 1 ? message.roles[1] : null,
          [
            const Color(0xFF8CF7FF),
            const Color(0xFF00D4FB),
          ],
        ),
        _buildRoomCreator(
          message.roles.length > 2 ? message.roles[2] : null,
          [
            const Color(0xFFFADB00),
            const Color(0xFFD89102),
          ],
        ),
      ],
    );
  }

  Widget _buildRoomCreator(RoomCrossPkRoleInfo? role, List<Color> colors) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (role == null)
          R.img(
            RoomAssets.chat_room$crosspk_matching_icon_webp,
            width: 36,
            height: 36,
          )
        else
          GradientBorder(
            borderGradient: LinearGradient(
              colors: colors,
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            ),
            borderRadius: 20,
            child: Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              child: CommonAvatar(
                path: role.icon,
                size: 36,
                shape: BoxShape.circle,
                onTap: () {
                  _personalDataManager
                      .openImageFloatScreenDisplayModalBottomSheet(
                          context, role.uid, widget.room, 0,
                          toRid: role.rid == widget.room.rid ? 0 : role.rid);
                },
              ),
            ),
          ),
        Container(
          width: 52.dp,
          margin: EdgeInsetsDirectional.only(top: 4.dp),
          alignment: AlignmentDirectional.center,
          child: Text(
            role == null ? K.live_pk_matching : role.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              height: 1,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _build3RoomsScore(int score, bool self) {
    return Container(
      width: 60.dp,
      alignment: AlignmentDirectional.center,
      child: Text(
        '${self == true ? ('${K.room_our_side} ') : ''}${Util.numberToSizeString(score)}',
        style: TextStyle(
          color: self == true ? Colors.white : Colors.white70,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
        maxLines: 1,
      ),
    );
  }

  /// 操作按钮
  Widget _buildOptionButton(RoomCrossPkMessage message) {
    if (message.pk.status == RoomCrossPKStatus.ROOM_CROSS_PK_STATUS_PKING) {
      /// PK阶段，加时按钮
      return GestureDetector(
        onTap: _onOvertimeClick,
        behavior: HitTestBehavior.opaque,
        child: Container(
          height: 28,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white10, width: 0.5),
            color: Colors.black.withOpacity(0.3),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 20),
              Text(
                K.room_cplink_delay,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xCCFEFEFE),
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
      );
    } else if (message.pk.status ==
            RoomCrossPKStatus.ROOM_CROSS_PK_STATUS_MATCH ||
        message.pk.status == RoomCrossPKStatus.ROOM_CROSS_PK_STATUS_ENDING) {
      /// 匹配和惩罚阶段，结束按钮
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (message.pk.status ==
              RoomCrossPKStatus.ROOM_CROSS_PK_STATUS_MATCH) {
            CrossPKRepo.cancelMatch(widget.room.rid, message.pk.mode);
          } else {
            CrossPKRepo.end(widget.room.rid, message.pk.pkId);
          }
        },
        child: Container(
          height: 28,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white10, width: 0.5),
            color: Colors.black.withOpacity(0.3),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 20),
              Text(
                K.end,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xCCFEFEFE),
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  /// 加时按钮点击
  _onOvertimeClick() async {
    CrossPKOvertimeSetting.show(context, widget.room.rid);
  }

  /// 得分
  Widget _buildScore(int score) {
    return Container(
      padding:
          const EdgeInsetsDirectional.only(start: 8, end: 8, top: 1, bottom: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: const Color(0x1FFEFEFE),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          R.img(
            RoomAssets.chat_room$crosspk_ic_hot_svg,
            width: 8,
            height: 8,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 2),
            child: Text(
              Util.numberToSizeString(score),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

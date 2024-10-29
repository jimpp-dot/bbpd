import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/util/god_tag_util.dart';
import 'package:chat_room/src/base/widget/mic_follow_btn.dart';
import 'package:chat_room/src/base/widget/room_role_widget.dart';
import 'package:flutter/material.dart';

import 'user_list/mic_link_user_list_page.dart';
import 'widget/mic_link_anim.dart';
import 'widget/mic_link_offmic_user.dart';

/// 连线麦位 主界面
///
class MicLinkMainWidget extends StatelessWidget {
  final ChatRoomData room;

  const MicLinkMainWidget(this.room, {super.key});

  @override
  Widget build(BuildContext context) {
    RoomPosition? boss = room.positions
        .firstWhereOrNull((element) => element.uid > 0 && element.isLinkMic);
    bool showAni = room.positions
            .indexWhere((element) => element.uid > 0 && element.isLinkMic) !=
        -1;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20),
        Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            MicLinkAnim(showAni),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _MicWidget(
                  room,
                  room.positions[0],
                  size: 86,
                  big: true,
                  showFollow: room.positions[0].uid > 0,
                ),
                boss == null
                    ? _EmptySeatWidget(room)
                    : _MicWidget(room, boss, size: 86, big: true),
              ],
            ),
            PositionedDirectional(
              top: 0,
              child: RoomCounter(
                uid: room.positions[0].uid,
                micLink: true,
                counter: room.config!.counter,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildSecondRow(),
      ],
    );
  }

  Widget _buildSecondRow() {
    int maxCount = _godView ? 6 : 5;

    double width = (Util.width - (_godView ? 12 : 32)) / maxCount;

    List<RoomPosition> secondMics = [];

    /// 二排麦位 过滤连线麦位 && 开启房主位后显示房主位
    if (room.positions.isNotEmpty) {
      secondMics = room.positions
          .skip(1)
          .where((element) =>
              (element.uid > 0 && !element.isLinkMic) ||
              ChatRoomUtil.isCreatorSeat(room, element))
          .toList();
    }

    /// 接待管理员 显示一个虚位以待
    RoomPosition? pos = room.positions
        .skip(1)
        .firstWhereOrNull((element) => element.uid <= 0 && !element.isCreator);
    if (pos != null && _godView) {
      secondMics.add(pos);
    }

    int length = secondMics.length;
    if (!_godView && !ChatRoomUtil.isMic) length = length + 1;

    return Container(
      height: 100,
      width: Util.width,
      alignment: AlignmentDirectional.topStart,
      padding: EdgeInsets.symmetric(horizontal: _godView ? 6 : 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: width,
                  alignment: AlignmentDirectional.topCenter,
                  child:
                      (index == length - 1 && !_godView && !ChatRoomUtil.isMic)
                          ? MicLinkOffMicUser(room)
                          : _MicWidget(room, secondMics[index], size: 44),
                );
              },
              itemCount: length,
            ),
          ),
          if (_godView) _buildOnlineNum(width)
        ],
      ),
    );
  }

  Widget _buildOnlineNum(double width) {
    return Container(
      width: width,
      alignment: AlignmentDirectional.topCenter,
      child: GestureDetector(
        onTap: () => MicLinkUserListPage.show(System.context, room),
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.white.withOpacity(0.12)),
          alignment: Alignment.center,
          child: const Text(
            '连线\n列表',
            maxLines: 2,
            style: TextStyle(fontSize: 11, color: Colors.white70),
          ),
        ),
      ),
    );
  }

  /// gs or 房主 视角
  bool get _godView => room.isCreator || room.isReception;
}

class _MicWidget extends StatelessWidget {
  final ChatRoomData room;
  final RoomPosition position;
  final double size;
  final bool big;
  final bool showFollow;

  const _MicWidget(
    this.room,
    this.position, {
    Key? key,
    this.size = 44,
    this.big = false,
    this.showFollow = false,
  }) : super(key: key);

  bool get _showIndex => room.isCreator || room.isReception;

  bool get _isNotEmptyPos =>
      position.uid > 0 || ChatRoomUtil.isCreatorSeat(room, position);

  @override
  Widget build(BuildContext context) {
    String name = position.name;
    String label = '普通';

    /// 房主位
    if (ChatRoomUtil.isCreatorSeat(room, position)) {
      label = K.room_owner;
      if (!Util.validStr(position.name)) {
        name = room.createor?.name ?? '';
      }
    }

    if (Util.validStr(position.positionLabel)) {
      label = position.positionLabel!;
    }

    /// 空麦位
    if (!_isNotEmptyPos) {
      if (room.config?.mode != RoomMode.Lock && position.lock == true) {
        name = K.room_mic_locked;
      } else if (((room.config?.reception ?? false) &&
              position.position == 0) ||
          position.isReception) {
        name = K.room_reception;
      } else {
        name = K.room_empty_mic_prefix;
      }
    }

    return Container(
      width: big ? 134 : 86,
      alignment: AlignmentDirectional.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              UserIcon(room: room, position: position, size: size),
              if (_isNotEmptyPos)
                PositionedDirectional(
                  bottom: -5,
                  child: MicRoleLabel(label,
                      showIndex: _showIndex, index: position.position),
                ),
            ],
          ),
          const SizedBox(height: 8),
          _buildName(name, position),
          const SizedBox(height: 6),
          PackageAtMicFlame(position: position, room: room, shrink: false),
          // if (_isNotEmptyPos) PackageAtMicFlame(position: position, room: room) else const SizedBox(height: PackageAtMicFlame.widgetHeight),
        ],
      ),
    );
  }

  Widget _buildName(String name, RoomPosition item) {
    Color textColor = Colors.white;

    if (!_isNotEmptyPos) {
      textColor = Colors.white.withOpacity(0.4);
    }

    if (item.isLinkMic) {
      textColor = const Color(0xFFFFE735);
    }

    String godTagIcon = GodTagUtil.getGodTagByUid(item.uid);

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (!Util.isStringEmpty(godTagIcon))
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 3),
            child: CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl(godTagIcon),
              height: 12,
              fit: BoxFit.fitHeight,
            ),
          ),
        Flexible(
          child: Text(
            Util.getEllipsisStr(name),
            maxLines: 1,
            style: TextStyle(
                color: textColor, height: 1.2, fontSize: big ? 13 : 11),
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (showFollow) ...[
          const SizedBox(width: 4),
          MicFollowBtn(room, user: item),
        ],
      ],
    );
  }
}

/// 连线麦位 空状态
class _EmptySeatWidget extends StatelessWidget {
  final ChatRoomData room;

  const _EmptySeatWidget(this.room, {Key? key}) : super(key: key);

  bool get _showGiftBtn => !(room.isCreator || room.isReception);

  void _onTaped() {
    if (room.isCreator || room.isReception) {
      MicLinkUserListPage.show(System.context, room);
    } else {
      _sendGift();
    }
  }

  void _sendGift() {
    IGiftManager giftManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
    giftManager.showRoomGiftPanel(System.context, room: room);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTaped,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GradientBorder(
            borderGradient: const LinearGradient(
                colors: [Color(0xFFFFE46A), Color(0xFFFCC058)]),
            borderRadius: 42,
            borderWidth: 1,
            child: Container(
              width: 84,
              height: 84,
              alignment: AlignmentDirectional.center,
              child: R.img(
                RoomAssets.chat_room$debate_pk_ic_pk_mic_empty_join_webp,
                width: 36,
                color: const Color(0xFFFFE735),
              ),
            ),
          ),
          if (_showGiftBtn) ...[
            const SizedBox(height: 3.5),
            _buildSendGiftBtn()
          ] else ...[
            const SizedBox(width: 134, height: 9),
            Text(
              K.room_wait_for_seated,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 13, color: Color(0xFFFFE735)),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSendGiftBtn() {
    return GestureDetector(
      onTap: _sendGift,
      child: Container(
        width: 66,
        height: 24,
        alignment: AlignmentDirectional.center,
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          gradient:
              LinearGradient(colors: [Color(0xFFFF8E2B), Color(0xFFE6D030)]),
        ),
        child: const Text(
          '送礼连线',
          style: TextStyle(
              fontSize: 13, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

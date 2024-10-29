import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/src/heartrace/widget/heart_race_base_widget.dart';
import 'package:flutter/material.dart';
import '../../../chat_room.dart';
import '../../protobuf/generated/common_room_heartrace.pb.dart';
import '../model/heart_race_model.dart';
import 'heart_race_award_dialog.dart';
import 'heart_race_select_relation.dart';
import 'heart_race_user_icon.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HeartRacePk extends StatefulWidget {
  final ChatRoomData room;
  final HeartRaceState state;
  final HeartRaceModel model;

  const HeartRacePk(
      {super.key,
      required this.room,
      required this.state,
      required this.model});

  @override
  HeartRacePkState createState() {
    return HeartRacePkState();
  }
}

class HeartRacePkState extends State<HeartRacePk> {
  double bgWidth = 320;
  double bgMarginTop = 51;

  @override
  Widget build(BuildContext context) {
    RoomPosition reception;
    if (Util.validList(widget.room.positions)) {
      reception = widget.room.positions[0];
    } else {
      reception = RoomPosition(uid: 0);
    }

    RoomPosition? boss;
    if (Util.validList(widget.room.positions) &&
        widget.room.positions.length >= 8) {
      boss = widget.room.positions[7];
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        PositionedDirectional(
          top: 6,
          start: 20,
          child: HeartRaceReceptionUserIcon(
            room: widget.room,
            roomPosition: reception,
            state: widget.state,
            stateDeadline: widget.model.value.stateDeadline,
          ),
        ),
        if (boss != null)
          PositionedDirectional(
            top: 6,
            end: 20,
            child: HeartRaceBossUserIcon(
              room: widget.room,
              roomPosition: boss,
            ),
          ),
        PositionedDirectional(
          top: bgMarginTop,
          start: (Util.width - bgWidth) / 2,
          child: HeartRaceBaseWidget.buildBg(bgWidth),
        ),
        PositionedDirectional(
          start: (Util.width - 85) / 2 - 0.5,
          top: bgMarginTop + (bgWidth - 79) / 2 - 3,
          child: HeartRaceBaseWidget.buildIcon(),
        ),
        PositionedDirectional(
          start: (Util.width - 48) / 2,
          top: bgMarginTop + 183,
          child: buildState(),
        ),
        PositionedDirectional(
          top: bgMarginTop - 28,
          start: (Util.width - 270) / 2,
          child: buildTop(),
        ),
        PositionedDirectional(
          top: bgMarginTop + 190,
          start: (Util.width - bgWidth) / 2 - 7,
          child: buildOther(2),
        ),
        PositionedDirectional(
          top: bgMarginTop + 190,
          end: (Util.width - bgWidth) / 2 - 7,
          child: buildOther(3),
        ),
        PositionedDirectional(
          top: bgMarginTop + 120,
          start: Util.width / 2 + 20,
          child: HeartRaceBaseWidget.buildHelp(),
        ),
        buildLockAni(),
        // if (widget.state == HeartRaceState.pk && Util.validList(widget?.model?.value?.awardConfig?.awardIcons))
        //   PositionedDirectional(
        //     top: 6,
        //     end: 12,
        //     child: buildAward(),
        //   ),
      ],
    );
  }

  Widget buildState() {
    String text = 'PK';
    if (widget.state == HeartRaceState.pk_result) {
      text = K.room_heart_race_state_title_result;
    } else if (widget.state == HeartRaceState.choose_relation) {
      text = K.room_heart_race_state_relation;
    }
    return Container(
      width: 48,
      height: 14,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0x003C159B),
            Color(0x26FE2179),
            Color(0xFFFE2179),
            Color(0x26FE2179),
            Color(0x003C159B)
          ],
          stops: [0, 0.1, 0.5, 0.9, 1.0],
        ),
      ),
      alignment: AlignmentDirectional.center,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w500,
          color: Colors.white,
          height: 1.2,
        ),
      ),
    );
  }

  /// 第一组
  Widget buildTop() {
    MicPair? micPair;
    if (Util.validList(widget.model.value.micPair)) {
      micPair = widget.model.value.micPair[0];
    }

    /// 可以选关系还未选择，麦上接待/该关系的两个人，可以展示
    bool needShowSelect = (widget.state == HeartRaceState.choose_relation) &&
        (micPair?.relationState == 2) &&
        (ChatRoomUtil.isOnFirstPosition(Session.uid) ||
            Session.uid == micPair?.left.uid ||
            Session.uid == micPair?.right.uid);
    String tips = micPair?.relationTips ?? '';
    int score = micPair?.package ?? 0;
    bool showCrown = widget.state == HeartRaceState.pk_result ||
        widget.state == HeartRaceState.choose_relation;
    return SizedBox(
      width: 270,
      height: 140,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          PositionedDirectional(
            top: 17,
            child: buildWing(widget.model.value.level),
          ),
          PositionedDirectional(
            top: 33,
            child: buildTopSeat(),
          ),
          PositionedDirectional(
            top: 48,
            child: buildTopTeam(micPair),
          ),
          if (widget.state != HeartRaceState.pk && Util.validStr(tips))
            PositionedDirectional(
              top: 126,
              child: buildTips(tips),
            ),
          if (widget.state == HeartRaceState.pk &&
              (Util.validStr(tips) ||
                  Util.validStr(widget.model.value.awardConfig.diffNumTips)))
            PositionedDirectional(
              top: 126,
              child: buildTipsSwiper(tips,
                  '${widget.model.value.awardConfig.diffNumTips}${K.room_get}LV.${widget.model.value.awardConfig.awardLevel}${K.room_award}'),
            ),
          if (showCrown) buildScoreCrown(score),
          if (!showCrown)
            PositionedDirectional(
              top: 27,
              child: buildScore(index: 1, score: score),
            ),
          if (needShowSelect)
            PositionedDirectional(
              top: 61,
              child: buildSelectButton(index: 1, pair: micPair!),
            ),
        ],
      ),
    );
  }

  /// 第一组翅膀
  Widget buildWing(int level) {
    if (level <= 1) {
      return const SizedBox(
        width: 270,
        height: 108,
      );
    } else if (level == 2) {
      return CachedNetworkImage(
        imageUrl: Util.getRemoteImgUrl(
            'static/room/heart_race/heart_race_ring_2.webp'),
        width: 270,
        height: 108,
      );
    } else {
      return CachedNetworkImage(
        imageUrl: Util.getRemoteImgUrl(
            'static/room/heart_race/heart_race_ring_3.webp'),
        width: 270,
        height: 108,
      );
    }
  }

  /// 第一组沙发
  Widget buildTopSeat() {
    return CachedNetworkImage(
      imageUrl: Util.getRemoteImgUrl(
          'static/room/heart_race/heart_race_seat_top.webp'),
      width: 182,
      height: 90,
    );
  }

  Widget buildTopTeam(MicPair? micPair) {
    if (!Util.validList(widget.room.positions) || micPair == null) {
      return const SizedBox.shrink();
    }
    PositionAndOffline left = getPositionByMic(micPair.left);
    PositionAndOffline right = getPositionByMic(micPair.right);
    String leftFrame = widget.model.value.hasHat == true
        ? Util.getRemoteImgUrl(left.position.sex == Sex.Female
            ? 'static/room/heart_race/heart_rate_frame_female.webp'
            : 'static/room/heart_race/heart_rate_frame_male.webp')
        : '';
    String rightFrame = widget.model.value.hasHat == true
        ? Util.getRemoteImgUrl(right.position.sex == Sex.Female
            ? 'static/room/heart_race/heart_rate_frame_female.webp'
            : 'static/room/heart_race/heart_rate_frame_male.webp')
        : '';

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeartRaceUserIcon(
          room: widget.room,
          roomPosition: left.position,
          showOffline: left.showOffline,
          frameUrl: leftFrame,
          showPackage: true,
        ),
        const SizedBox(
          width: 6,
        ),
        HeartRaceUserIcon(
          room: widget.room,
          roomPosition: right.position,
          showOffline: right.showOffline,
          frameUrl: rightFrame,
          showPackage: true,
        ),
      ],
    );
  }

  Widget buildTipsSwiper(String? relationTips, String? levelTips) {
    List<String> tips = [];
    if (Util.validStr(levelTips)) {
      tips.add(levelTips!);
    }
    if (Util.validStr(relationTips)) {
      tips.add(relationTips!);
    }
    return Container(
      width: 130,
      height: 14,
      alignment: AlignmentDirectional.topCenter,
      child: Swiper(
        onTap: (int index) {
          showDialog(
            context: System.context,
            builder: (BuildContext context) {
              return HeartRaceAwardDialog(
                relationTips: relationTips ?? '',
                award: widget.model.value.awardConfig,
              );
            },
          );
        },
        itemCount: tips.length,
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return buildSwiperItem(tips[index]);
        },
      ),
    );
  }

  Widget buildSwiperItem(String item) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 14,
            constraints: const BoxConstraints(maxWidth: 130),
            padding: const EdgeInsetsDirectional.only(start: 6, end: 6, top: 1),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(7),
              gradient: const LinearGradient(
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
                colors: [Color(0xFF8D75EE), Color(0xFF3E22A9)],
              ),
              border: Border.all(color: const Color(0xFFAF5ECE), width: 0.5),
            ),
            child: Text(
              '$item >',
              style: TextStyle(
                fontSize: 9,
                color: Colors.white.withOpacity(0.8),
                height: 1.1,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTips(String tips) {
    return Container(
      height: 14,
      constraints: const BoxConstraints(maxWidth: 130),
      padding: const EdgeInsetsDirectional.only(start: 6, end: 6, top: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(7),
        color: const Color(0xCC472C5F),
        border: Border.all(color: const Color(0x33C988FF)),
      ),
      child: Text(
        tips,
        style: const TextStyle(
          fontSize: 9,
          color: Colors.white60,
          height: 1.1,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget buildScoreCrown(int score) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CachedNetworkImage(
          imageUrl: Util.getRemoteImgUrl(
              'static/room/heart_race/heart_race_crown.webp'),
          width: 102,
          height: 48,
        ),
        PositionedDirectional(
          bottom: 5,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CachedNetworkImage(
                imageUrl: Util.getRemoteImgUrl(
                    'static/room/heart_race/ic_heart_race_score_top_crown.webp'),
                width: 32,
                height: 8,
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                '$score',
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFCA42FF),
                  height: 1.1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildScore(
      {required int index, required int score, bool showInFail = false}) {
    String icon = 'static/room/heart_race/ic_heart_race_score_top.png';
    double width = 36;
    if (index == 2) {
      icon = 'static/room/heart_race/ic_heart_race_score_second.png';
      width = 38;
    } else if (index == 3) {
      icon = 'static/room/heart_race/ic_heart_race_score_third.png';
      width = 38;
    }

    return Container(
      width: 86,
      height: 16,
      decoration: BoxDecoration(
        gradient: showInFail == false
            ? const LinearGradient(
                colors: [
                  Color(0x003C159B),
                  Color(0x263C159B),
                  Color(0xFF3C159B),
                  Color(0x263C159B),
                  Color(0x003C159B)
                ],
                stops: [0.0, 0.1, 0.5, 0.9, 1.0],
              )
            : null,
      ),
      alignment: AlignmentDirectional.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 2.5),
            child: CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl(icon),
              width: width,
              height: 12,
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            '$score',
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLockAni() {
    if (widget.model.showLockAni == true) {
      double margin = (Util.width - bgWidth) / 2 - 7 - 22;
      bool isLockSec = widget.model.value.isLockSec == true;
      return PositionedDirectional(
        top: bgMarginTop + 124,
        start: isLockSec ? margin : null,
        end: isLockSec ? null : margin,
        child: MultiframeImage.network(
          Util.getRemoteImgUrl(
              'static/room/heart_race/heart_race_lock_vap.webp'),
          '',
          width: 200,
          height: 200,
          onComplete: () {
            if (mounted) {
              setState(() {
                widget.model.showLockAni = false;
              });
            }
          },
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Widget buildOther(int index) {
    MicPair? micPair;
    if (Util.validList(widget.model.value.micPair) &&
        widget.model.value.micPair.length >= index) {
      micPair = widget.model.value.micPair[index - 1];
    }

    /// 可以选关系还未选择，麦上接待/该关系的两个人，可以展示
    bool needShowSelect = (widget.state == HeartRaceState.choose_relation) &&
        (micPair?.relationState == 2) &&
        (ChatRoomUtil.isOnFirstPosition(Session.uid) ||
            Session.uid == micPair?.left.uid ||
            Session.uid == micPair?.right.uid);
    String tips = micPair?.relationTips ?? '';
    bool lock = (widget.model.value.isLockSec == true && index == 2) ||
        (widget.model.value.isLockSec != true && index == 3);
    bool isShowFail = lock == true &&
        (widget.state == HeartRaceState.pk_result ||
            widget.state == HeartRaceState.choose_relation);
    int score = micPair?.package ?? 0;
    return SizedBox(
      width: 160,
      height: 137,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          PositionedDirectional(
            top: 48,
            child: buildNormalSeat(),
          ),
          PositionedDirectional(
            top: 43,
            child: buildOtherTeam(micPair, lock),
          ),
          if (lock == true && widget.model.showLockAni != true)
            PositionedDirectional(
              top: 3,
              child: buildLock(),
            ),
          if (lock == true)
            PositionedDirectional(
              top: 43,
              child: buildOtherTeamWithoutIcon(micPair),
            ),
          if (isShowFail && widget.model.showLockAni != true) buildFail(),
          if (widget.model.showLockAni != true)
            PositionedDirectional(
              top: 23,
              child: buildScore(
                  index: index, score: score, showInFail: isShowFail),
            ),
          if (Util.validStr(tips))
            PositionedDirectional(
              top: 123,
              child: buildTips(tips),
            ),
          if (needShowSelect)
            PositionedDirectional(
              top: 56,
              child: buildSelectButton(index: index, pair: micPair!),
            ),
        ],
      ),
    );
  }

  Widget buildNormalSeat() {
    return CachedNetworkImage(
      imageUrl: Util.getRemoteImgUrl(
          'static/room/heart_race/heart_race_seat_normal.webp'),
      width: 142,
      height: 66,
    );
  }

  Widget buildOtherTeam(MicPair? micPair, bool lock) {
    if (!Util.validList(widget.room.positions) || micPair == null) {
      return const SizedBox.shrink();
    }
    PositionAndOffline left = getPositionByMic(micPair.left);
    PositionAndOffline right = getPositionByMic(micPair.right);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeartRaceUserIcon(
          room: widget.room,
          roomPosition: left.position,
          frameUrl: '',
          showOffline: left.showOffline,
          showPackage: !lock,
          showName: !lock,
          cantJoinMic: true,
        ),
        const SizedBox(
          width: 4,
        ),
        HeartRaceUserIcon(
          room: widget.room,
          roomPosition: right.position,
          frameUrl: '',
          showOffline: right.showOffline,
          showPackage: !lock,
          showName: !lock,
          cantJoinMic: true,
        ),
      ],
    );
  }

  Widget buildOtherTeamWithoutIcon(MicPair? micPair) {
    if (!Util.validList(widget.room.positions) || micPair == null) {
      return const SizedBox.shrink();
    }
    PositionAndOffline left = getPositionByMic(micPair.left);
    PositionAndOffline right = getPositionByMic(micPair.right);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeartRaceUserIcon(
          room: widget.room,
          roomPosition: left.position,
          frameUrl: '',
          showOffline: left.showOffline,
          showPackage: true,
          showName: true,
          showIcon: false,
        ),
        const SizedBox(
          width: 4,
        ),
        HeartRaceUserIcon(
          room: widget.room,
          roomPosition: right.position,
          frameUrl: '',
          showOffline: right.showOffline,
          showPackage: true,
          showName: true,
          showIcon: false,
        ),
      ],
    );
  }

  Widget buildLock() {
    return IgnorePointer(
      child: CachedNetworkImage(
        imageUrl:
            Util.getRemoteImgUrl('static/room/heart_race/heart_race_lock.webp'),
        width: 160,
        height: 122,
      ),
    );
  }

  Widget buildFail() {
    return IgnorePointer(
      child: CachedNetworkImage(
        imageUrl:
            Util.getRemoteImgUrl('static/room/heart_race/heart_race_fail.webp'),
        width: 160,
        height: 40,
      ),
    );
  }

  PositionAndOffline getPositionByMic(MicItem item) {
    RoomPosition? position = ChatRoomUtil.getPositionByUid(item.uid);
    bool showOffline = false;
    if (position != null) {
      position.package = item.package;
    } else {
      Map data = {
        'uid': item.uid,
        'name': item.name,
        'icon': item.icon,
        'sex': item.sex,
      };
      position = RoomPosition.fromJson(null, data, null);
      if (Util.parseInt(item.uid) > 0) {
        showOffline = true;
      }
    }
    return PositionAndOffline(position: position, showOffline: showOffline);
  }

  Widget buildSelectButton({required int index, required MicPair pair}) {
    return GestureDetector(
      onTap: () {
        /// 选择关系弹窗
        HeartRaceSelectRelation.show(
          context: context,
          isReception: ChatRoomUtil.isOnFirstPosition(Session.uid),
          index: index,
          rid: widget.room.realRid,
          pair: pair,
        );
      },
      child: Container(
        width: 68,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(16),
          gradient: const LinearGradient(
              colors: [Color(0xB24553FF), Color(0xB29572FF)]),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          K.room_cplink_choose_relation,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            height: 1.1,
          ),
        ),
      ),
    );
  }

  Widget buildAward() {
    return GradientBorderBox(
      width: 80,
      height: 72,
      borderRadius: 12,
      borderWidth: 1,
      gradientColors: const [
        Color(0xCC8C7EFD),
        Color(0xCC63ACCD),
        Color(0xCCAF5ECE),
        Color(0xCC682AB3)
      ],
      begin: AlignmentDirectional.topCenter,
      end: AlignmentDirectional.bottomCenter,
      child: Container(
        width: 78,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(12),
          gradient: const LinearGradient(
            colors: [Color(0xCC8D75EE), Color(0xCC3E22A9)],
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: 14,
              decoration: BoxDecoration(
                borderRadius: const BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(8),
                    bottomEnd: Radius.circular(8)),
                border: Border.all(color: Colors.white.withOpacity(0.3)),
                gradient: const LinearGradient(
                  colors: [Color(0xB25B5FED), Color(0xB2FF79E7)],
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                ),
              ),
              alignment: AlignmentDirectional.center,
              child: Text(
                'LV.${widget.model.value.awardConfig.awardLevel}${K.room_award}',
                style: const TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  height: 1.1,
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            SizedBox(
              width: 78,
              height: 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widget.model.value.awardConfig.awardIcons.map((icon) {
                  return CachedNetworkImage(
                    imageUrl: Util.getRemoteImgUrl(icon),
                    width: 32,
                    height: 32,
                    cachedWidth: 32,
                    cachedHeight: 32,
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              width: 72,
              height: 2,
              child: Stack(
                children: [
                  Container(
                    width: 72,
                    height: 2,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadiusDirectional.circular(2),
                    ),
                  ),
                  Container(
                    width: 72.0 * widget.model.value.awardConfig.progress / 100,
                    height: 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(2),
                      gradient: const LinearGradient(
                          colors: [Color(0xFFD960FF), Color(0xFF5BE9FF)]),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              widget.model.value.awardConfig.diffNumTips,
              style: const TextStyle(
                fontSize: 9,
                color: Colors.white,
                height: 1.2,
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class PositionAndOffline {
  bool showOffline;
  RoomPosition position;

  PositionAndOffline({required this.position, required this.showOffline});
}

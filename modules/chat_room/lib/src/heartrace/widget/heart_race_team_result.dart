import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../assets.dart';
import '../../../k.dart';
import '../../protobuf/generated/common_room_heartrace.pb.dart';

/// 心跳竞速：组队成功弹窗
class HeartRaceTeamResult extends StatefulWidget {
  final List<MicPair> micPair;

  const HeartRaceTeamResult({super.key, required this.micPair});

  static void show(List<MicPair> micPair) {
    showDialog(
      context: System.context,
      builder: (BuildContext context) {
        return HeartRaceTeamResult(
          micPair: micPair,
        );
      },
    );
  }

  @override
  HeartRaceTeamResultState createState() {
    return HeartRaceTeamResultState();
  }
}

class HeartRaceTeamResultState extends State<HeartRaceTeamResult> {
  double width = 335;

  @override
  void initState() {
    super.initState();
    if (Util.width < 335 + 40) {
      width = Util.width - 40;
    }

    Future.delayed(const Duration(seconds: 5), () {
      if (mounted && ModalRoute.of(context)?.isActive == true) {
        Navigator.of(context).maybePop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: 332,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(18),
          gradient: const LinearGradient(
              colors: [Color(0xFF4553FF), Color(0xFF9572FF)]),
        ),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl(
                  'static/room/heart_race/heart_race_dialog_bg.webp'),
              width: width,
              height: width * 330 / 335,
            ),
            CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl(
                  'static/room/heart_race/ic_heart_race_team_result_title.webp'),
              width: 176,
              height: 76,
            ),
            PositionedDirectional(
              top: 84,
              child: buildTeam(widget.micPair[0], K.room_first_group),
            ),
            PositionedDirectional(
              top: 196,
              start: 28,
              child: buildTeam(widget.micPair[1], K.room_second_group),
            ),
            PositionedDirectional(
              top: 196,
              end: 28,
              child: buildTeam(widget.micPair[2], K.room_third_group),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTeam(MicPair pair, String group) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(10),
            color: const Color(0xFF763AEC),
          ),
          alignment: AlignmentDirectional.center,
          child: Text(
            group,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              height: 1.1,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        buildTeamIcon(pair),
        const SizedBox(
          height: 2,
        ),
        buildTeamName(pair),
      ],
    );
  }

  Widget buildTeamIcon(MicPair pair) {
    return SizedBox(
      width: 107,
      height: 60,
      child: Stack(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border:
                  Border.all(width: 2, color: Colors.white.withOpacity(0.2)),
            ),
            alignment: AlignmentDirectional.center,
            child: Util.parseInt(pair.left.uid) > 0
                ? CommonAvatar(
                    path: pair.left.icon,
                    shape: BoxShape.circle,
                    size: 56,
                  )
                : Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.2),
                    ),
                    alignment: AlignmentDirectional.center,
                    child: R.img(RoomAssets.chat_room$wait_svg,
                        width: 24,
                        height: 24,
                        package: ComponentManager.MANAGER_BASE_ROOM),
                  ),
          ),
          PositionedDirectional(
            start: 47,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:
                    Border.all(width: 2, color: Colors.white.withOpacity(0.2)),
              ),
              alignment: AlignmentDirectional.center,
              child: Util.parseInt(pair.right.uid) > 0
                  ? CommonAvatar(
                      path: pair.right.icon,
                      shape: BoxShape.circle,
                      size: 56,
                    )
                  : Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.2),
                      ),
                      alignment: AlignmentDirectional.center,
                      child: R.img(RoomAssets.chat_room$wait_svg,
                          width: 24,
                          height: 24,
                          package: ComponentManager.MANAGER_BASE_ROOM),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTeamName(MicPair pair) {
    return SizedBox(
      width: 107,
      child: Row(
        children: [
          Expanded(
            child: Text(
              pair.left.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                height: 1.2,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              pair.right.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                height: 1.2,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

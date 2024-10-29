import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/page/package_settings.dart';
import 'package:chat_room/src/base/widget/package_rank.dart';
import 'package:flutter/material.dart';

String _getValue(int package) {
  if (package < 1000 * 100) {
    return (package / 100).toStringAsFixed(1).toString();
  } else if (package < 10000 * 100) {
    return (package ~/ 100).toString();
  } else {
    return '${(package ~/ (100 * 1000)).toStringAsFixed(1)}k';
  }
}

/// 约会吧麦上打赏统计
///
class DatingSponsorAtMic extends StatelessWidget {
  final RoomPosition position;
  final ChatRoomData room;

  const DatingSponsorAtMic({
    super.key,
    required this.position,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    int package = room.config?.package ?? 0;
    if (package <= 0) {
      return const SizedBox(height: 12);
    }

    bool showRank = (package == PackageConfig.startUserWithMoney ||
            package == PackageConfig.startUserWithUserCount) &&
        (position.uid > 0);

    return showRank ? _buildEnableTap(context) : _buildNormal();
  }

  Widget _buildEnableTap(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (position.uid > 0) {
          PackageRankScreen.show(context, position.uid, room);
        }
      },
      child: _buildSponsorSis(),
    );
  }

  Widget _buildNormal() {
    return IgnorePointer(
      child: _buildSponsorSis(),
    );
  }

  Widget _buildSponsorSis() {
    return Container(
      height: 19,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: const BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(10), bottomStart: Radius.circular(10)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          R.img(RoomAssets.chat_room$base_ic_heart_pink_30_webp,
              width: 11.5, height: 11.5),
          const SizedBox(width: 2),
          NumText(
            _getValue(position.package),
            style: TextStyle(
                color: R.color.secondBgColor,
                fontSize: 10,
                fontWeight: FontWeight.w600,
                height: 1.0),
          ),
        ],
      ),
    );
  }
}

/// 麦上打赏统计
///
class PackageAtMic extends StatelessWidget {
  final RoomPosition position;
  final ChatRoomData? room;
  final double endNum;
  final double topNum;

  const PackageAtMic(
      {Key? key,
      required this.position,
      this.room,
      this.endNum = 3.0,
      this.topNum = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int package = room?.config?.package ?? 0;
    if (package <= 0) {
      return const SizedBox.shrink();
    }

    bool showRank = (package == PackageConfig.startUserWithMoney ||
            package == PackageConfig.startUserWithUserCount) &&
        ((position.uid) > 0);

    return PositionedDirectional(
      end: endNum,
      top: topNum,
      child: showRank ? _buildEnableTap(context) : _buildNormal(),
    );
  }

  Widget _buildEnableTap(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if ((position.uid) > 0) {
          PackageRankScreen.show(context, position.uid, room!);
        }
      },
      child: _buildPackage(),
    );
  }

  Widget _buildNormal() {
    return IgnorePointer(
      child: _buildPackage(),
    );
  }

  Widget _buildPackage() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsetsDirectional.only(
        start: 6.0,
        end: 6.0,
        top: 0.0,
        bottom: 0.0,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFFF527A5),
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
      ),
      child: NumText(
        _getValue(position.package),
        style: const TextStyle(color: Colors.white, fontSize: 10.0),
      ),
    );
  }
}

/// 麦上打赏统计 火焰样式
///
class PackageAtMicFlame extends StatelessWidget {
  static const double widgetHeight = 13;

  final RoomPosition? position;
  final ChatRoomData room;
  final bool shrink;

  const PackageAtMicFlame(
      {super.key,
      required this.position,
      required this.room,
      this.shrink = true});

  @override
  Widget build(BuildContext context) {
    int package = room.config?.package ?? 0;
    if (package <= 0) {
      return shrink
          ? const SizedBox.shrink()
          : const SizedBox(height: widgetHeight);
    }

    bool showRank = (package == PackageConfig.startUserWithMoney ||
            package == PackageConfig.startUserWithUserCount) &&
        ((position?.uid ?? 0) > 0);

    return showRank ? _buildEnableTap(context) : _buildNormal();
  }

  Widget _buildEnableTap(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if ((position?.uid ?? 0) > 0) {
          PackageRankScreen.show(context, position?.uid, room);
        }
      },
      child: _buildPackage(),
    );
  }

  Widget _buildNormal() {
    return IgnorePointer(
      child: _buildPackage(),
    );
  }

  Widget _buildPackage() {
    return Container(
      height: widgetHeight,
      decoration:
          const ShapeDecoration(color: Colors.white12, shape: StadiumBorder()),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 5),
          R.img(RoomAssets.chat_room$ic_flame_webp, width: 8),
          const SizedBox(width: 2),
          NumText(
            _getValue(position?.package ?? 0),
            style: const TextStyle(color: Colors.white, fontSize: 9.0),
          ),
          const SizedBox(width: 4),
        ],
      ),
    );
  }
}

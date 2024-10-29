import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';

import '../../../assets.dart';
import '../live_pk_config_v3.dart';

///
class LivePkUserContribute extends StatelessWidget {
  final PkRank? pkRank;

  const LivePkUserContribute({Key? key, this.pkRank}) : super(key: key);

  Widget _buildPkRankItem(RankItem item, {double itemWidth = 24.0}) {
    List<Widget> res = [];
    res.add(
      SizedBox(
        width: itemWidth,
        child: InkWell(
          child: (item.icon.isNotEmpty)
              ? CommonAvatar(
                  path: item.icon,
                  shape: BoxShape.circle,
                  size: itemWidth,
                )
              : Container(
                  width: itemWidth,
                  height: itemWidth,
                  decoration: BoxDecoration(
                    color: const Color(0xff000000).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(itemWidth / 2),
                  ),
                ),
          onTap: () async {},
        ),
      ),
    );

    //增加边框
    Color borderColor;
    Color positionBgColor;
    if (item.index == 0) {
      borderColor = const Color(0xffF7B01C);
      positionBgColor = const Color(0xffF7B01C);
    } else if (item.index == 1) {
      borderColor = const Color(0xffC9C9C9);
      positionBgColor = const Color(0xffC9C9C9);
    } else {
      borderColor = const Color(0xffFFC08F);
      positionBgColor = const Color(0xffFFC08F);
    }
    double overflow = -1.0;
    res.add(
      PositionedDirectional(
        start: overflow,
        end: overflow,
        top: overflow,
        bottom: overflow,
        child: IgnorePointer(
          child: Container(
            width: itemWidth - 2 * overflow,
            height: itemWidth - 2 * overflow,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(
                  Radius.circular((itemWidth - 2 * overflow) / 2)),
              border: Border.all(
                width: -overflow,
                color: borderColor,
              ),
            ),
          ),
        ),
      ),
    );

    //序号或者mvp或者首杀   优先级是 mvp > 首杀 > 序号
    if (!item.isMvp) {
      if (item.isFirstScore == 1) {
        res.add(
          /// 首杀
          PositionedDirectional(
            end: -1.0,
            bottom: -1.0,
            child: _getFirstKillWidget(),
          ),
        );
      } else {
        res.add(
          /// 序号
          PositionedDirectional(
            end: -1.0,
            bottom: -1.0,
            child: _getSerialNum(positionBgColor, item),
          ),
        );
      }
    } else {
      res.add(
        /// mvp
        Positioned(
          bottom: -1.0,
          child: R.img(
            'livev3/room_live_pk_mvp.webp',
            width: 24.0,
            height: 10.0,
            package: ComponentManager.MANAGER_BASE_ROOM,
          ),
        ),
      );
    }

    Widget contentWidget = Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: res,
    );

    return SizedBox(
      width: itemWidth,
      height: itemWidth,
      child: contentWidget,
    );
  }

  /// 序号widget
  Widget _getSerialNum(Color positionBgColor, RankItem item) {
    return Container(
      width: 11.0,
      height: 11.0,
      padding: const EdgeInsetsDirectional.only(top: 0.5, start: 0.5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: positionBgColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(5.5),
        ),
      ),
      child: Text(
        '${item.index + 1}',
        style: const TextStyle(
          inherit: false,
          fontSize: 9.0,
          color: Colors.white,
        ),
      ),
    );
  }

  /// 首杀标识
  Widget _getFirstKillWidget() {
    return Container(
      height: 10,
      width: 24,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        gradient: LinearGradient(
          begin: AlignmentDirectional.centerStart,
          end: AlignmentDirectional.centerEnd,
          colors: [Color(0xFFFD7755), Color(0xFFFC4E2E)],
        ),
      ),
      alignment: Alignment.center,
      child: Text(K.room_first_kill,
          style: const TextStyle(color: Colors.white, fontSize: 8)),
    );
  }

  Widget _buildBody(BuildContext context, PkRank pkRank) {
    List<Widget> res = [];

    if ((pkRank.mainRank == null || pkRank.mainRank!.isEmpty) &&
        (pkRank.competeRank == null || pkRank.competeRank!.isEmpty)) {
      res.add(
        ClipOval(
          child: R.img(
            BaseAssets.shared$pk_l_shafa_icon,
            width: 32,
            height: 32,
            fit: BoxFit.contain,
          ),
        ),
      );
      res.add(
        const Spacer(),
      );

      res.add(
        ClipOval(
          child: R.img(
            BaseAssets.shared$pk_r_shafa_icon,
            width: 32,
            height: 32,
            fit: BoxFit.contain,
          ),
        ),
      );
      return Container(
        width: MediaQuery.of(context).size.width - 32.0,
        height: 48.0,
        alignment: Alignment.center,
        // decoration: BoxDecoration(
        //   borderRadius: const BorderRadiusDirectional.only(
        //     bottomStart: Radius.circular(12.0),
        //     bottomEnd: Radius.circular(12.0),
        //   ),
        //   gradient: LinearGradient(
        //     colors: [
        //       const Color(0xFF3B0C29).withOpacity(0.5),
        //       const Color(0xFF071348).withOpacity(0.5),
        //     ],
        //     begin: AlignmentDirectional.topCenter,
        //     end: AlignmentDirectional.bottomCenter,
        //   ),
        // ),
        child: Row(
          children: res,
        ),
      );
    }

    if (pkRank.mainRank != null && pkRank.mainRank!.isNotEmpty) {
      for (int i = 0; i < pkRank.mainRank!.length; i++) {
        RankItem rankItem = pkRank.mainRank![i];
        res.add(
          const SizedBox(width: 12.0),
        );
        res.add(
          _buildPkRankItem(rankItem, itemWidth: 32),
        );
      }
    } else {
      res.add(
        ClipOval(
          child: R.img(
            BaseAssets.shared$pk_l_shafa_icon,
            width: 32,
            height: 32,
            fit: BoxFit.contain,
          ),
        ),
      );
    }
    res.add(
      const Spacer(),
    );
    if (pkRank.competeRank != null && pkRank.competeRank!.isNotEmpty) {
      for (int i = 0; i < pkRank.competeRank!.length; i++) {
        RankItem rankItem = pkRank.competeRank![i];
        res.add(
          _buildPkRankItem(rankItem, itemWidth: 32),
        );
        res.add(
          const SizedBox(width: 12.0),
        );
      }
    } else {
      res.add(
        ClipOval(
          child: R.img(
            BaseAssets.shared$pk_r_shafa_icon,
            width: 32,
            height: 32,
            fit: BoxFit.contain,
          ),
        ),
      );
    }

    return Container(
      width: MediaQuery.of(context).size.width - 32.0,
      height: 48.0,
      alignment: Alignment.center,
      // decoration: BoxDecoration(
      //   borderRadius: const BorderRadiusDirectional.only(
      //     bottomStart: Radius.circular(12.0),
      //     bottomEnd: Radius.circular(12.0),
      //   ),
      //   gradient: LinearGradient(
      //     colors: [
      //       const Color(0xFF3B0C29).withOpacity(0.5),
      //       const Color(0xFF071348).withOpacity(0.5),
      //     ],
      //     begin: AlignmentDirectional.topCenter,
      //     end: AlignmentDirectional.bottomCenter,
      //   ),
      // ),
      child: Row(
        children: res,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (pkRank == null) {
      return const SizedBox.shrink();
    }

    return _buildBody(context, pkRank!);
  }
}

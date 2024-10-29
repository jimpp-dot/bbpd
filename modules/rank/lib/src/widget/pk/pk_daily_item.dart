import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';
import 'package:rank/src/model/entity/pk_rank_beans.dart';

import 'pk_win_streak_widget.dart';

class PkDailyRankItemWidget extends StatelessWidget {
  final int index;
  final PkDailyRankItem? item;
  final HeaderFrame? headerFrame;
  final PageRefer? refer;

  const PkDailyRankItemWidget(
      {super.key,
      required this.index,
      this.item,
      this.headerFrame,
      this.refer});

  static double get widgetHeight {
    return 72;
  }

  Widget _buildIndex() {
    if (index <= 2) {
      return Container(
        height: 23,
        width: 28,
        alignment: Alignment.center,
        child: R.img(Assets.rank_rank_x_png(index + 1),
            width: 20, height: 23, package: ComponentManager.MANAGER_RANK),
      );
    } else {
      return Container(
        height: 23,
        width: 28,
        alignment: Alignment.center,
        child: Text(
          '${index + 1}',
          maxLines: 1,
          style: const TextStyle(fontSize: 13, color: Color(0x99313131)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (item == null) return Container();
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          top: 5, bottom: 5, start: 14, end: 18),
      child: InkWell(
        onTap: () {
          IPersonalDataManager personalDataManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_PERSONALDATA);
          personalDataManager.openImageScreen(context, item!.uid, refer: refer);
        },
        child: Row(
          children: <Widget>[
            if (showRankByKey(matchPkKey)) _buildIndex(),
            PkDailyRankItemIconWidget(item!, 62.0, _getFrameUrl(index), refer),
            const SizedBox(
              width: 4,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LimitedBox(
                  maxWidth: 180,
                  child: Text(
                    item!.name,
                    maxLines: 1,
                    style:
                        const TextStyle(fontSize: 16, color: Color(0xFF313131)),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                PkWinStreakWidget(number: item!.winStreak),
              ],
            ),
            const Spacer(),
            if (showRankScoreByKey(matchPkKey))
              R.img(Assets.rank_ic_arrowup_svg,
                  color: const Color(0xFFFD7B08),
                  width: 16,
                  height: 16,
                  package: ComponentManager.MANAGER_RANK),
            if (showRankScoreByKey(matchPkKey))
              NumText(
                '${item!.score}',
                style: const TextStyle(fontSize: 14, color: Color(0xFFFF0065)),
              ),
          ],
        ),
      ),
    );
  }

  String? _getFrameUrl(int index) {
    if (index == 0) {
      return headerFrame?.firstFrame;
    } else if (index == 1) {
      return headerFrame?.secondFrame;
    } else if (index == 2) {
      return headerFrame?.thirdFrame;
    } else {
      return null;
    }
  }
}

class PkDailyRankItemIconWidget extends StatelessWidget {
  final double size;
  final PkDailyRankItem rankItem;
  final String? frameUrl;
  final PageRefer? refer;

  const PkDailyRankItemIconWidget(
      this.rankItem, this.size, this.frameUrl, this.refer,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        IPersonalDataManager personalDataManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        personalDataManager.openImageScreen(context, rankItem.uid,
            refer: refer);
      },
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            CommonAvatar(
              path: rankItem.icon,
              shape: BoxShape.circle,
              size: 52,
            ),
            if (frameUrl != null)
              CachedNetworkImage(
                imageUrl: frameUrl,
                width: size,
                height: size,
              ),
          ],
        ),
      ),
    );
  }
}

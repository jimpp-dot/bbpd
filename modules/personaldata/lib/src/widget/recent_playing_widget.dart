import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/page/game_info_page.dart';

import '../../k.dart';

/// 最近在玩
class RecentPlayingGames extends StatelessWidget {
  final List<HomeProfileGameItem>? recentPlayingGames;
  final int uid;

  const RecentPlayingGames({Key? key, this.uid = 0, this.recentPlayingGames})
      : super(key: key);

  static Widget buildIcon(HomeProfileGameItem game, {double iconSize = 48.0}) {
    if (game.icon.isNotEmpty) {
      return ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(3.0),
        ),
        child: CachedNetworkImage(
          width: iconSize,
          height: iconSize,
          imageUrl: game.icon,
          fit: BoxFit.cover,
          fadeInDuration: const Duration(microseconds: 0),
          fadeOutDuration: const Duration(microseconds: 0),
        ),
      );
    } else {
      String iconPath = '';
      if (game.key == 'under') {
        iconPath = 'game_under.png';
      } else if (game.key == 'guess') {
        iconPath = 'game_guess.png';
      } else if (game.key == 'wolf') {
        iconPath = 'game_wolf.png';
      } else if (game.key == 'rpg') {
        iconPath = 'game_rpg.png';
      } else if (game.key == 'puzzle') {
        iconPath = 'game_puzzle.webp';
      }

      return R.img(
        iconPath,
        width: iconSize,
        height: iconSize,
        fit: BoxFit.contain,
        package: ComponentManager.MANAGER_PERSONALDATA,
      );
    }
  }

  Widget _buildItem(HomeProfileGameItem game) {
    int total = Util.parseInt(game.total);
    if (total > 0) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(end: 16),
        child: Column(
          children: <Widget>[
            RecentPlayingGames.buildIcon(game),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 2),
              child: Text(
                game.name,
                style: TextStyle(color: R.colors.mainTextColor, fontSize: 13),
              ),
            ),
            Text(
              '$total${K.game_frequency}',
              style: TextStyle(color: R.colors.secondTextColor, fontSize: 13),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (recentPlayingGames == null || recentPlayingGames!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 24.0),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              GameInfoPage.show(context, uid: uid);
            },
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    K.playing_recently,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: R.colors.mainTextColor),
                  ),
                ),
                R.img(
                  'ic_next.svg',
                  width: 16,
                  height: 16,
                  color: R.colors.thirdTextColor,
                  package: ComponentManager.MANAGER_PROFILE,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: LimitedBox(
              maxHeight: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: recentPlayingGames!
                    .map((element) => _buildItem(element))
                    .toList(),
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          Container(
            color: R.color.dividerColor,
            height: 0.5,
          )
        ],
      ),
    );
  }
}

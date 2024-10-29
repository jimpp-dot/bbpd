/*
 *
 *  Created by yao.qi on 2022/7/14 下午6:03
 *  Copyright (c) 2019 - 2022 . All rights reserved.
 *  Last modified 2022/7/14 下午6:03
 *
 */

import 'package:shared/shared.dart';
import 'package:pulse_log/pulse_log.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/k.dart';
import 'package:personaldata/src/achievement_wall/model/skin_config.dart';

import '../../../assets.dart';
import '../page/achievement_wall_screen.dart';

/// 成就墙入口
class AchievementWallDisplayWidget extends StatefulWidget {
  /// 是否显示个人主页动态上的成就墙入口，默认显示
  final bool showEntry;

  /// 被查看用户id
  final int uid;

  final List<HomeProfileAchieveBadge>? achieveBadge;

  const AchievementWallDisplayWidget({
    Key? key,
    required this.uid,
    this.achieveBadge,
    this.showEntry = true,
  }) : super(key: key);

  @override
  State<AchievementWallDisplayWidget> createState() =>
      _AchievementWallDisplayWidgetState();
}

class _AchievementWallDisplayWidgetState
    extends State<AchievementWallDisplayWidget> {
  @override
  void initState() {
    super.initState();

    List<String> cIds = [];
    for (var element in widget.achieveBadge!) {
      cIds.add(element.badgeId.toString());
    }
    Tracker.instance
        .track(TrackEvent.achievement_view_personal_entrance, properties: {
      'chapter_ids': cIds.join(','),
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.showEntry ||
        widget.achieveBadge == null ||
        widget.achieveBadge?.isEmpty == true) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: InkWell(
        onTap: () {
          PulseLog.instance.event('click_event', properties: {
            'click_tag': 'personal_achievement_entrance_${widget.uid}',
          });
          Tracker.instance.track(TrackEvent.achievement_click_personal_entrance,
              properties: {
                'uid': Session.uid,
              });

          AchievementWallScreen.show(context, uid: widget.uid);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 42,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    K.personaldata_achievement_wall,
                    style: TextStyle(
                      color: R.colors.mainTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
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
            Container(
              height: 91,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  gradient: SkinConfig
                      .configs[widget.achieveBadge![0].skinId].entranceGradient,
                  borderRadius: BorderRadiusDirectional.circular(16),
                  border: Border.all(
                      width: 0.5.dp, color: Colors.white.withOpacity(0.2))),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  R.img(
                      SkinConfig
                          .configs[widget.achieveBadge![0].skinId].entranceLogo,
                      width: 200,
                      height: 91,
                      fit: BoxFit.fitWidth),
                  R.img(
                      Assets
                          .personaldata$achievement_wall_achieve_entrance_star_webp,
                      height: 91),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [for (int i = 0; i < 4; i++) _buildItem(i)],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(int index) {
    HomeProfileAchieveBadge? data =
        (widget.achieveBadge == null || index >= widget.achieveBadge!.length)
            ? null
            : widget.achieveBadge?[index];

    return SizedBox(
      width: 74,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 64,
            child: (data != null && data.level > 0)
                ? CachedNetworkImage(
                    imageUrl: Util.getRemoteImgUrl(data.image),
                    width: 64,
                    height: 64,
                    cachedWidth: 64.px,
                    cachedHeight: 64.px,
                    fit: BoxFit.cover,
                  )
                : Image(
                    image: AssetImage(
                      R.imagePath(
                        'achievement_wall/achievement_wall_medal_lock.webp',
                        package: ComponentManager.MANAGER_PERSONALDATA,
                      ),
                    ),
                  ),
          ),
          Text(
            data != null
                ? "${data.name}${Util.getRomanNum(data.level)}"
                : K.personaldata_achievement_locked,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 10,
            ),
            strutStyle: const StrutStyle(
              fontSize: 10,
              forceStrutHeight: true,
            ),
          ),
        ],
      ),
    );
  }
}

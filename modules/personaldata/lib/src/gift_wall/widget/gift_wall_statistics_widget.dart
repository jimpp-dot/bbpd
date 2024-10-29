/*
 *
 *  Created by yao.qi on 2022/9/7 上午11:31
 *  Copyright (c) 2019 - 2022 . All rights reserved.
 *  Last modified 2022/9/7 上午11:28
 *
 */

import 'package:flutter/material.dart';
import 'package:shared/dart_extensions/extensions_common.dart';
// import 'package:moment/assets.dart';
import 'package:shared/shared.dart';

import '../../../assets.dart';
import '../../../k.dart';

/// 礼物墙页礼顶部统计模块
class GiftWallStatisticsWidget extends StatefulWidget {
  final GiftWallStatics? data;
  int flag; // 礼物活动 标签tag
  final bool? hideUser;

  GiftWallStatisticsWidget({
    Key? key,
    this.data,
    this.flag = 0,
    this.hideUser,
  }) : super(key: key);

  @override
  State<GiftWallStatisticsWidget> createState() => _GiftWallStatisticsWidgetState(data);
}

class _GiftWallStatisticsWidgetState extends State<GiftWallStatisticsWidget> {
  GiftWallStatics? data;

  _GiftWallStatisticsWidgetState(this.data);

  @override
  void didUpdateWidget(covariant GiftWallStatisticsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    data = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // if (!(widget.hideUser ?? false)) ...[
          //   const SizedBox(height: 3),
          //   Stack(
          //     children: [
          //       Container(
          //         margin: const EdgeInsetsDirectional.only(top: 10),
          //         child: Row(
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: [
          //             CommonAvatar(
          //               path: icon,
          //               shape: BoxShape.circle,
          //               size: 40,
          //               onTap: () {
          //                 IPersonalDataManager manager = ComponentManager.instance.getManager(
          //                   ComponentManager.MANAGER_PERSONALDATA,
          //                 );
          //                 manager.openImageScreen(
          //                   context,
          //                   uid,
          //                   refer: const PageRefer('gift_wall_statistics'),
          //                 );
          //               },
          //             ),
          //             const SizedBox(width: 8),
          //             Expanded(
          //               child: Text(
          //                 name,
          //                 style: TextStyle(fontSize: 15, color: R.color.mainTextColor, fontWeight: FontWeight.w500),
          //                 maxLines: 1,
          //                 overflow: TextOverflow.ellipsis,
          //               ),
          //             ),
          //             const SizedBox(width: 8),
          //             // GestureDetector(
          //             //   onTap: () {
          //             //     widget.flag = 0;
          //             //     refresh();
          //             //     Tracker.instance.track(TrackEvent.click, properties: {'click_page': 'click_gift_active'});
          //             //     Navigator.of(context)
          //             //         .push(MaterialPageRoute(builder: (context) => GiftWallLimitPage(targetUid: uid)));
          //             //   },
          //             //   child: Container(
          //             //     height: 34,
          //             //     decoration: const ShapeDecoration(
          //             //       shape: StadiumBorder(),
          //             //       gradient: LinearGradient(colors: [Color(0xFFD670FF), Color(0xFF91ADFF)]),
          //             //     ),
          //             //     alignment: AlignmentDirectional.center,
          //             //     padding: const EdgeInsets.symmetric(horizontal: 12),
          //             //     child: Row(
          //             //       crossAxisAlignment: CrossAxisAlignment.center,
          //             //       mainAxisSize: MainAxisSize.min,
          //             //       children: [
          //             //         R.img('mate/gift_wall/ic_gift_wall_event_icon.webp',
          //             //             width: 20, height: 20, package: ComponentManager.MANAGER_PERSONALDATA),
          //             //         const SizedBox(width: 4),
          //             //         Text(
          //             //           K.personal_gift_wall_activity,
          //             //           style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
          //             //         ),
          //             //       ],
          //             //     ),
          //             //   ),
          //             // ),
          //           ],
          //         ),
          //       ),
          //       // PositionedDirectional(
          //       //   end: 0,
          //       //   top: 0,
          //       //   child: _buildGiftEventTag(),
          //       // ),
          //     ],
          //   ),
          //   const SizedBox(height: 3),
          // ],
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildGiftEventTag() {
    String tag;
    Color tagBgColor;
    if (widget.flag == 1) {
      // 新
      tag = K.personal_gift_wall_activity_tag_new;
      tagBgColor = const Color(0xFFFF5F7D);
    } else if (widget.flag == 2) {
      // 返
      tag = K.personal_gift_wall_activity_tag_back;
      tagBgColor = const Color(0xFFFFA45E);
    } else {
      return const SizedBox.shrink();
    }
    return Container(
      height: 20,
      decoration: ShapeDecoration(
        shape: const StadiumBorder(side: BorderSide(color: Colors.white, width: 2)),
        color: tagBgColor,
      ),
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(tag ?? '', style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500)),
    );
  }

  Widget _buildContent() {
    int level = data?.level ?? 0;
    double bgImageW = 1005 / 3;
    double bgImageH = 612 / 3;
    double rate = bgImageH / bgImageW;
    double cW = Util.width - 40;
    Widget? bgImage = R.img(Assets.personaldata$liwu_level_one_png, height: bgImageH, width: bgImageW, fit: BoxFit.fill);
    if (level == 1) {
      bgImage = R.img(Assets.personaldata$liwu_level_one_png, package: Assets.package, height: bgImageH, width: bgImageW);
    } else if (level == 2) {
      bgImage = R.img(Assets.personaldata$liwu_level_two_png, package: Assets.package, height: bgImageH, width: bgImageW);
    } else if (level == 3) {
      bgImage = R.img(Assets.personaldata$liwu_level_three_png, package: Assets.package, height: bgImageH, width: bgImageW);
    } else if (level == 4) {
      bgImage = R.img(Assets.personaldata$liwu_level_four_png, package: Assets.package, height: bgImageH, width: bgImageW);
    } else if (level == 5) {
      bgImage = R.img(Assets.personaldata$liwu_level_five_png, package: Assets.package, height: bgImageH, width: bgImageW);
    } else {
      bgImage = R.img(Assets.personaldata$liwu_level_six_png, package: Assets.package, height: bgImageH, width: bgImageW);
    }
    return Container(
      width: cW,
      height: cW * rate,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: (bgImage as Image).image,
        fit: BoxFit.fitWidth,
      )),
      child: _buildStatistics(cW * rate),
    );
  }

  Widget _buildStatistics(double height) {
    int uid = data?.uid ?? 0;
    String icon = data?.userIcon ?? '';
    String name = data?.name ?? '';

    int total = data?.total ?? 0;
    int exp = data?.exp ?? 0, nextExp = data?.nextLevelExp ?? 0;
    int expGap = nextExp - exp;
    if (expGap < 0) {
      expGap = 0;
    }
    String currLevel = data?.levelName ?? '';
    String nextLevel = data?.nextLevelName ?? '';
    return Container(
      height: height,
      padding: const EdgeInsetsDirectional.only(start: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonAvatar(
                path: icon,
                shape: BoxShape.circle,
                size: 50,
                onTap: () {
                  IPersonalDataManager manager = ComponentManager.instance.getManager(
                    ComponentManager.MANAGER_PERSONALDATA,
                  );
                  manager.openImageScreen(
                    context,
                    uid,
                    refer: const PageRefer('gift_wall_statistics'),
                  );
                },
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text(
                        '$total',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontFamily: Util.numFontFamily,
                          package: ComponentManager.MANAGER_BASE_CORE,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top: 4),
                        child: Text(
                          K.personal_illume_gift,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          _buildMedalRow(),
          const SizedBox(
            height: 28,
          ),
          _buildIndicator(exp, nextExp),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  expGap == 0 ? K.personal_has_gain_max_level : K.personal_distance_next_level,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 4),
                child: Text(
                  expGap == 0 ? currLevel : nextLevel,
                  style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              if (expGap != 0)
                Text(
                  K.personal_need_some_points(['$expGap']),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        '$exp',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: Util.numFontFamily,
                          package: ComponentManager.MANAGER_BASE_CORE,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        '/',
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: Util.numFontFamily,
                          package: ComponentManager.MANAGER_BASE_CORE,
                          color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        '$nextExp',
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: Util.numFontFamily,
                          package: ComponentManager.MANAGER_BASE_CORE,
                          color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
              ).toExpanded(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMedalRow() {
    int goldNum = data?.gold ?? 0;
    int silverNum = data?.silver ?? 0;
    int bronzeNum = data?.copper ?? 0;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          _buildMedalItem('mate/gift_wall/ic_medal_gold.webp', ' 黄金 ', goldNum),
          const SizedBox(
            width: 4,
          ),
          _buildMedalItem('mate/gift_wall/ic_medal_silver.webp', ' 白银 ', silverNum),
          const SizedBox(
            width: 4,
          ),
          _buildMedalItem('mate/gift_wall/ic_medal_bronze.webp', ' 青铜 ', bronzeNum),
        ],
      ),
    );
  }

  Widget _buildMedalItem(String path, String medal, int num) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        R.img(path, width: 22, height: 22, package: ComponentManager.MANAGER_PERSONALDATA),
        Text(
          medal ?? '',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 2),
        Text(
          '$num',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildIndicator(int exp, int nextExp) {
    int level = data?.level ?? 0;
    double width = Util.width - 80;
    double percent = exp / nextExp;
    if (percent < 0 || percent > 1) {
      percent = 1;
    }
    Color bg;
    List<Color> frontColor;
    if (level == 1) {
      bg = const Color(0xFF00FFCC);
      frontColor = [const Color(0xFF115954), const Color(0xFF115954)];
    } else if (level == 2) {
      bg = const Color(0xFFC1DEFF);
      frontColor = [const Color(0xFF475A63), const Color(0xFF475A63)];
    } else if (level == 3) {
      bg = const Color(0xFFFFD358);
      frontColor = [const Color(0xFF674914), const Color(0xFF674914)];
    } else if (level == 4) {
      bg = const Color(0xFF605CFF);
      frontColor = [const Color(0xFFFFF056), const Color(0xFFFFF056)];
    } else if (level == 5) {
      bg = const Color(0xFF8CCBFF);
      frontColor = [const Color(0xFF0F5085), const Color(0xFF0F5085)];
    } else if (level == 6) {
      bg = const Color(0xFF383578);
      frontColor = [const Color(0xFFCC4AFF), const Color(0xFF564AFF), const Color(0xFF10DBFF)];
    } else {
      bg = const Color(0xFF956630);
      frontColor = [const Color(0xFFFFFF99), const Color(0xFFFFCC41), const Color(0xFFEF86FF)];
    }
    return Stack(
      children: [
        Container(
          height: 8,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: frontColor,
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.topEnd,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        Container(
          height: 8,
          width: width * percent,
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }

  Widget _buildCurrLogo() {
    String icon = data?.levelIcon ?? '';
    String currLevel = data?.levelName ?? '';
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CachedNetworkImage(
          imageUrl: Util.parseIcon(icon),
          width: 104,
          height: 162,
          fit: BoxFit.fill,
        ),
        PositionedDirectional(
          bottom: 40,
          child: Row(
            children: [
              R.img('mate/gift_wall/ic_star.svg', width: 6, height: 6, package: ComponentManager.MANAGER_PERSONALDATA),
              const SizedBox(
                width: 4,
              ),
              Text(
                currLevel,
                style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 4,
              ),
              R.img('mate/gift_wall/ic_star.svg', width: 6, height: 6, package: ComponentManager.MANAGER_PERSONALDATA),
            ],
          ),
        )
      ],
    );
  }
}

/*
 *
 *  Created by yao.qi on 2022/4/26 下午4:53
 *  Copyright (c) 2019 - 2022 . All rights reserved.
 *  Last modified 2022/4/26 下午4:53
 *
 */

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import '../model/pb/generated/slp_weekstar.pb.dart';

class RankingCelebrityItemWidget extends StatefulWidget {
  final WeekStarFameHallData? data;

  const RankingCelebrityItemWidget({super.key, this.data});

  @override
  State<RankingCelebrityItemWidget> createState() =>
      _RankingCelebrityItemWidgetState();
}

class _RankingCelebrityItemWidgetState extends State<RankingCelebrityItemWidget>
    with SingleTickerProviderStateMixin {
  late SwiperController _swipeController;

  // int weekStarLength = 0;

  @override
  void initState() {
    super.initState();
    _swipeController = SwiperController();
  }

  @override
  void dispose() {
    _swipeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 202,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsetsDirectional.only(
                start: 16, end: 16, top: 10, bottom: 12),
            child: Row(
              children: [
                R.img(
                  Assets.rank_rank_clock_webp,
                  width: 18,
                  height: 18,
                  package: ComponentManager.MANAGER_RANK,
                ),
                const SizedBox(width: 8),
                Text(
                  '${widget.data?.startDate ?? ''}-${widget.data?.endDate ?? ''}',
                  style: TextStyle(
                    color: const Color(0xFF313131).withOpacity(0.6),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFFF4F7A), Color(0xFFFF54B6)],
                ),
              ),
              child: Stack(
                children: [
                  PositionedDirectional(
                    start: -17,
                    top: -50,
                    bottom: 0,
                    end: -17,
                    child: R.img(
                      Assets.rank_rank_celebrity_item_bg_webp,
                      package: ComponentManager.MANAGER_RANK,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Swiper(
                    controller: _swipeController,
                    // autoplay: (widget.data?.item?.length ?? 0) > 1,
                    loop: (widget.data?.list.length ?? 0) > 1,
                    // autoplayDelay: 5000,
                    duration: 500,
                    autoplayDisableOnInteraction: true,
                    itemCount: (widget.data?.list.length ?? 0),
                    pagination: (widget.data?.list.length ?? 0) > 1
                        ? SwiperPagination(
                            builder: RectSwiperPaginationBuilder(
                              space: 3,
                              size: const Size(6, 6),
                              activeSize: const Size(6, 6),
                              activeColor: Colors.white,
                              color: Colors.white.withOpacity(0.4),
                              radius: 3,
                            ),
                          )
                        : null,
                    itemBuilder: (BuildContext context, int index) {
                      WeekStarFameHallList? list = widget.data?.list[index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: list?.item.map(
                              (e) {
                                return Column(
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Stack(
                                      clipBehavior: Clip.none,
                                      alignment: AlignmentDirectional.topCenter,
                                      children: [
                                        GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () {
                                            IPersonalDataManager
                                                personalDataManager =
                                                ComponentManager.instance
                                                    .getManager(ComponentManager
                                                        .MANAGER_PERSONALDATA);
                                            personalDataManager.openImageScreen(
                                                context, e.uid);
                                          },
                                          child: GradientBorder(
                                            borderGradient:
                                                const LinearGradient(
                                              colors: [
                                                Color(0xFFFBD762),
                                                Color(0xFFF7266E),
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            ),
                                            borderRadius: 37.dp,
                                            borderWidth: 2.dp,
                                            child: Padding(
                                              padding: EdgeInsets.all(2.dp),
                                              child: CommonAvatar(
                                                path: e.icon,
                                                size: 72.0,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ),
                                        ),
                                        PositionedDirectional(
                                          top: 65,
                                          child: Container(
                                            alignment:
                                                AlignmentDirectional.center,
                                            width: 50,
                                            height: 16,
                                            decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                colors: [
                                                  Color(0XFFF71C6F),
                                                  Color(0XFFFA9E61)
                                                ],
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Text(
                                              e.type == 'income'
                                                  ? K.rank_week_star_king
                                                  : K.rank_week_star_rich,
                                              style: const TextStyle(
                                                  fontSize: 9,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        PositionedDirectional(
                                          start: 60,
                                          child: Container(
                                            width: 37,
                                            height: 37,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      const Color(0XFFFA9E61),
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(18.5),
                                            ),
                                            child: CommonAvatar(
                                              path:
                                                  '${System.imageDomain}static/$giftSubDir/${e.giftId}.png',
                                              size: 36,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Container(
                                      constraints:
                                          const BoxConstraints(maxWidth: 100),
                                      alignment: AlignmentDirectional.center,
                                      child: Text(
                                        e.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ).toList() ??
                            [],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}

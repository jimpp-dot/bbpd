/*
 *
 *  Created by yao.qi on 2022/7/22 下午6:08
 *  Copyright (c) 2019 - 2022 . All rights reserved.
 *  Last modified 2022/7/22 下午6:08
 *
 */

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/assets.dart';
import 'package:personaldata/k.dart';

import '../../theme/personaldata_themes.dart';
import 'accompany_remember_oneself_list_screen.dart';

/// 查看个人主页信息资料卡陪伴记入口----访客显示的页面

class AccompanyRememberIndividualCardCallerWidget extends StatefulWidget {
  final int uid;
  final HomeProfileImprintOur our;

  const AccompanyRememberIndividualCardCallerWidget(this.uid, this.our,
      {Key? key})
      : super(key: key);

  @override
  State<AccompanyRememberIndividualCardCallerWidget> createState() =>
      _AccompanyRememberIndividualCardCallerWidgetState();
}

class _AccompanyRememberIndividualCardCallerWidgetState
    extends State<AccompanyRememberIndividualCardCallerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              // 跳转到陪伴记页面
              Tracker.instance.track(
                  TrackEvent.accompany_click_personal_page_entrance,
                  properties: {'uid': widget.uid, 'to_id': Session.uid});

              AccompanyRememberOneselfListScreen.show(context, widget.uid);
            },
            child: SizedBox(
              height: 42,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    K.personaldata_accompany_remember,
                    style: TextStyle(
                      color: R.colors.mainTextColor,
                      fontSize: 15,
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
          ),
          Rext.themeCardContainer(
            height: 70,
            cornerRadius: 16,
            child: InkWell(
              onTap: () {
                AccompanyRememberOneselfListScreen.show(context, widget.uid);
              },
              child: Row(
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  R.img(
                      Assets
                          .personaldata$accompany_remember_ic_our_footprints_webp,
                      width: 50,
                      height: 50,
                      package: ComponentManager.MANAGER_PERSONALDATA,
                      fit: BoxFit.fill),
                  const SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 18),
                        Text(
                          K.personaldata_our_footprints,
                          style: TextStyle(
                              fontSize: 11,
                              color: R.colors.mainTextColor,
                              fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  PositionedDirectional(
                                    start: 0,
                                    end: 0,
                                    child: LayoutBuilder(
                                      builder: (BuildContext context,
                                          BoxConstraints constraints) {
                                        return Container(
                                          height: 6,
                                          decoration: BoxDecoration(
                                            color: PersonaldataR
                                                .colors.progressBgColor,
                                            borderRadius:
                                                BorderRadius.circular(3),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  PositionedDirectional(
                                    child: LayoutBuilder(
                                      builder: (BuildContext context,
                                          BoxConstraints constraints) {
                                        return Container(
                                          width: widget.our.totalNum == 0
                                              ? 0
                                              : constraints.maxWidth /
                                                  widget.our.totalNum *
                                                  widget.our.lightenNum,
                                          height: 6,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors:
                                                  R.color.companyGradientColors,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(3),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            SizedBox(
                              width: 42,
                              child: Text(
                                '${widget.our.lightenNum}/${widget.our.totalNum}',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: R.colors.mainTextColor,
                                    fontWeight: FontWeight.w400),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

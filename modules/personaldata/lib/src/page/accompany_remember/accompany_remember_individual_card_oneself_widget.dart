/*
 *
 *  Created by yao.qi on 2022/7/22 下午5:08
 *  Copyright (c) 2019 - 2022 . All rights reserved.
 *  Last modified 2022/7/22 下午5:08
 *
 */

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/k.dart';

import '../../theme/personaldata_themes.dart';
import 'accompany_remember_friends_list_screen.dart';
import 'accompany_remember_oneself_list_screen.dart';

/// 查看个人主页信息资料卡陪伴记入口----自己显示的页面

class AccompanyRememberIndividualCardOneselfWidget extends StatefulWidget {
  final int uid;
  final List<HomeProfileImprintUser> users;

  const AccompanyRememberIndividualCardOneselfWidget(this.uid, this.users,
      {Key? key})
      : super(key: key);

  @override
  State<AccompanyRememberIndividualCardOneselfWidget> createState() =>
      _AccompanyRememberIndividualCardOneselfWidgetState();
}

class _AccompanyRememberIndividualCardOneselfWidgetState
    extends State<AccompanyRememberIndividualCardOneselfWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              AccompanyRememberFriendsListScreen.show(context, widget.uid);
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
          Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFF1D60DD).withOpacity(0.06),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      if (widget.users.isNotEmpty) {
                        AccompanyRememberOneselfListScreen.show(
                            context, widget.users[0].uid);
                      }
                    },
                    child: Container(
                      child: widget.users.isNotEmpty
                          ? Row(
                              children: [
                                const SizedBox(width: 2),
                                CommonAvatar(
                                  path: widget.users[0].icon,
                                  size: 46,
                                  shape: BoxShape.circle,
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 12),
                                      Text(
                                        widget.users[0].name,
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: R.colors.mainTextColor,
                                            fontWeight: FontWeight.w500),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 8),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Stack(
                                                children: [
                                                  PositionedDirectional(
                                                    start: 0,
                                                    end: 0,
                                                    child: LayoutBuilder(
                                                      builder:
                                                          (BuildContext context,
                                                              BoxConstraints
                                                                  constraints) {
                                                        return Container(
                                                          height: 4,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: PersonaldataR
                                                                .colors
                                                                .progressBgColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  PositionedDirectional(
                                                    child: LayoutBuilder(
                                                      builder:
                                                          (BuildContext context,
                                                              BoxConstraints
                                                                  constraints) {
                                                        return Container(
                                                          width: widget.users[0]
                                                                      .totalNum ==
                                                                  0
                                                              ? 0
                                                              : constraints
                                                                      .maxWidth /
                                                                  widget
                                                                      .users[0]
                                                                      .totalNum *
                                                                  widget
                                                                      .users[0]
                                                                      .lightenNum,
                                                          height: 4,
                                                          decoration:
                                                              BoxDecoration(
                                                            gradient:
                                                                LinearGradient(
                                                              colors: R.color
                                                                  .companyGradientColors,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 3),
                                            SizedBox(
                                              width: 40,
                                              child: Text(
                                                '${widget.users[0].lightenNum}/${widget.users[0].totalNum}',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: R
                                                        .colors.secondTextColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                ),
                if (widget.users.length > 1) ...[
                  Container(
                    width: 0.5,
                    height: 50,
                    color: R.colors.dividerColor,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if (widget.users.length >= 2) {
                          AccompanyRememberOneselfListScreen.show(
                              context, widget.users[1].uid);
                        }
                      },
                      child: Container(
                        child: widget.users.length >= 2
                            ? Row(
                                children: [
                                  const SizedBox(width: 2),
                                  CommonAvatar(
                                    path: widget.users[1].icon,
                                    size: 46,
                                    shape: BoxShape.circle,
                                  ),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 12),
                                        Text(
                                          widget.users[1].name,
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: R.colors.mainTextColor,
                                              fontWeight: FontWeight.w500),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 8),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Stack(
                                                  children: [
                                                    PositionedDirectional(
                                                      start: 0,
                                                      end: 0,
                                                      child: LayoutBuilder(
                                                        builder: (BuildContext
                                                                context,
                                                            BoxConstraints
                                                                constraints) {
                                                          return Container(
                                                            height: 4,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.06),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    PositionedDirectional(
                                                      child: LayoutBuilder(
                                                        builder: (BuildContext
                                                                context,
                                                            BoxConstraints
                                                                constraints) {
                                                          return Container(
                                                            width: widget
                                                                        .users[
                                                                            1]
                                                                        .totalNum ==
                                                                    0
                                                                ? 0
                                                                : constraints
                                                                        .maxWidth /
                                                                    widget
                                                                        .users[
                                                                            1]
                                                                        .totalNum *
                                                                    widget
                                                                        .users[
                                                                            1]
                                                                        .lightenNum,
                                                            height: 4,
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient:
                                                                  const LinearGradient(
                                                                      colors: [
                                                                    Color(
                                                                        0xFFF89EE7),
                                                                    Color(
                                                                        0xFF5BE9FF)
                                                                  ]),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 3),
                                              SizedBox(
                                                width: 40,
                                                child: Text(
                                                  '${widget.users[1].lightenNum}/${widget.users[1].totalNum}',
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: R.colors
                                                          .secondTextColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            : const SizedBox.shrink(),
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

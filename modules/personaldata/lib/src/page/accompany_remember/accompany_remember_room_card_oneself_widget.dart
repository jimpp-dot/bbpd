/*
 *
 *  Created by yao.qi on 2022/7/22 下午5:11
 *  Copyright (c) 2019 - 2022 . All rights reserved.
 *  Last modified 2022/7/22 下午5:11
 *
 */

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import 'accompany_remember_friends_list_screen.dart';
import 'accompany_remember_oneself_list_screen.dart';

/// 查看直播间信息资料卡陪伴记入口----自己显示的页面

class AccompanyRememberRoomCardOneselfWidget extends StatefulWidget {
  final int uid;
  final List<HomeProfileImprintUser> users;

  const AccompanyRememberRoomCardOneselfWidget(this.uid, this.users, {Key? key})
      : super(key: key);

  @override
  State<AccompanyRememberRoomCardOneselfWidget> createState() =>
      _AccompanyRememberRoomCardOneselfWidgetState();
}

class _AccompanyRememberRoomCardOneselfWidgetState
    extends State<AccompanyRememberRoomCardOneselfWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 68,
      child: GestureDetector(
        onTap: () {
          // 跳转到陪伴记页面
          AccompanyRememberFriendsListScreen.show(context, widget.uid);
        },
        child: Container(
          height: 68,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xFF1D60DD).withOpacity(0.06),
          ),
          child: Container(
            height: 68,
            padding: const EdgeInsetsDirectional.only(
                start: 6, end: 12, top: 6, bottom: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withOpacity(0.08)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                  size: 36,
                                  shape: BoxShape.circle,
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.users[0].name,
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: R.color.mainTextColor,
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
                                                          height: 8,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.06),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
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
                                                          height: 8,
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
                                                                        4),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            SizedBox(
                                              width: 40,
                                              child: Text(
                                                '${widget.users[0].lightenNum}/${widget.users[0].totalNum}',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color:
                                                        R.color.secondTextColor,
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
                    color: R.color.dividerColor,
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
                                    size: 36,
                                    shape: BoxShape.circle,
                                  ),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.users[1].name,
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: R.color.mainTextColor,
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
                                                            height: 8,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.06),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
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
                                                            height: 8,
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
                                                                          4),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              SizedBox(
                                                width: 40,
                                                child: Text(
                                                  '${widget.users[1].lightenNum}/${widget.users[1].totalNum}',
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: R.color
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
                ],
                R.img(
                  'ic_next.svg',
                  width: 16,
                  height: 16,
                  color: R.color.mainTextColor.withOpacity(0.3),
                  package: ComponentManager.MANAGER_PROFILE,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

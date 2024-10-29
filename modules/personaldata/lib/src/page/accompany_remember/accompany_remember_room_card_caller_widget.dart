/*
 *
 *  Created by yao.qi on 2022/7/22 下午12:18
 *  Copyright (c) 2019 - 2022 . All rights reserved.
 *  Last modified 2022/7/22 下午12:18
 *
 */

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/assets.dart';
import 'package:personaldata/k.dart';

import 'accompany_remember_oneself_list_screen.dart';

/// 查看直播间信息资料卡陪伴记入口----访客显示的页面

class AccompanyRememberRoomCardCallerWidget extends StatefulWidget {
  final int uid;
  final HomeProfileImprintOur our;

  const AccompanyRememberRoomCardCallerWidget(this.uid, this.our, {Key? key})
      : super(key: key);

  @override
  State<AccompanyRememberRoomCardCallerWidget> createState() =>
      _AccompanyRememberRoomCardCallerWidgetState();
}

class _AccompanyRememberRoomCardCallerWidgetState
    extends State<AccompanyRememberRoomCardCallerWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 38,
      child: GestureDetector(
        onTap: () {
          // 跳转到陪伴记页面
          Tracker.instance.track(TrackEvent.accompany_click_room_card_entrance,
              properties: {'uid': widget.uid, 'to_id': Session.uid});

          AccompanyRememberOneselfListScreen.show(context, widget.uid);
        },
        child: Container(
          height: 38,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xFF1D60DD).withOpacity(0.06),
          ),
          child: Container(
            height: 38,
            padding: const EdgeInsetsDirectional.only(
                start: 6, end: 12, top: 6, bottom: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withOpacity(0.08)),
            ),
            child: Row(
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: const Color(0xFF1D60DD).withOpacity(0.1),
                      ),
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                              color: const Color(0xFF2ECEFE).withOpacity(0.16),
                              width: 0.5),
                        ),
                      ),
                    ),
                    // R.img(Assets.personaldata$accompany_remember_ic_our_footprints_webp,
                    //     width: 64, height: 64, package: ComponentManager.MANAGER_PERSONALDATA, fit: BoxFit.contain)
                  ],
                ),
                // const SizedBox(
                //   width: 2,
                // ),
                // Expanded(
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text(
                //         K.personaldata_our_footprints,
                //         style: TextStyle(fontSize: 13, color: R.color.mainTextColor, fontWeight: FontWeight.w500),
                //         maxLines: 1,
                //         overflow: TextOverflow.ellipsis,
                //       ),
                //       const SizedBox(
                //         height: 10,
                //       ),
                //       Row(
                //         children: [
                //           Expanded(
                //             child: Stack(
                //               children: [
                //                 PositionedDirectional(
                //                   start: 0,
                //                   end: 0,
                //                   child: LayoutBuilder(
                //                     builder: (BuildContext context, BoxConstraints constraints) {
                //                       return Container(
                //                         height: 8,
                //                         decoration: BoxDecoration(
                //                           color: Colors.black.withOpacity(0.06),
                //                           borderRadius: BorderRadius.circular(4),
                //                         ),
                //                       );
                //                     },
                //                   ),
                //                 ),
                //                 PositionedDirectional(
                //                   child: LayoutBuilder(
                //                     builder: (BuildContext context, BoxConstraints constraints) {
                //                       return Container(
                //                         width: widget.our.totalNum == 0
                //                             ? 0
                //                             : constraints.maxWidth / widget.our.totalNum * widget.our.lightenNum,
                //                         height: 8,
                //                         decoration: BoxDecoration(
                //                           gradient:
                //                               const LinearGradient(colors: [Color(0xFFF89EE7), Color(0xFF5BE9FF)]),
                //                           borderRadius: BorderRadius.circular(4),
                //                         ),
                //                       );
                //                     },
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ),
                //           const SizedBox(width: 8),
                //           SizedBox(
                //             width: 42,
                //             child: Text(
                //               '${widget.our.lightenNum}/${widget.our.totalNum}',
                //               style:
                //                   TextStyle(fontSize: 13, color: R.color.secondTextColor, fontWeight: FontWeight.bold),
                //               maxLines: 1,
                //               overflow: TextOverflow.ellipsis,
                //             ),
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // ),
                // R.img(
                //   'ic_next.svg',
                //   width: 16,
                //   height: 16,
                //   color: R.color.mainTextColor.withOpacity(0.3),
                //   package: ComponentManager.MANAGER_PROFILE,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:moment/src/circle/model/circle_page_resp.dart';
import 'package:moment/src/circle/page/circle_activity_screen.dart';
import 'package:moment/src/circle/page/circle_friends_playing_screen.dart';

import '../../../k.dart';
import 'circle_friend_avatar_widget.dart';

/// 圈子活动 and 圈友在玩
class CircleActivityWidget extends StatelessWidget {
  final List<CircleActivity>? activityList;
  final List<CircleFriendsActivity>? friendsActivityList;

  const CircleActivityWidget(this.activityList, this.friendsActivityList,
      {super.key});

  @override
  Widget build(BuildContext context) {
    Widget result;
    if (activityList == null || activityList!.isEmpty) {
      result = Container();
    } else {
      result = SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 16, 20, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildCircleActivity(context),
              if (friendsActivityList != null &&
                  friendsActivityList!.length >= 0)
                const SizedBox(
                  width: 10,
                ),
              if (friendsActivityList != null &&
                  friendsActivityList!.length >= 0)
                _buildCircleFriendsPlaying(context)
            ],
          ),
        ),
      );
    }
    return result;
  }

  Widget _buildCircleActivity(BuildContext context) {
    if (activityList == null || activityList!.isEmpty) {
      return Container();
    }
    List<Widget> widgetList = [];
    widgetList.add(GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Tracker.instance
            .track(TrackEvent.net_event_card, properties: {'click': 'more'});
        CircleActivityScreen.openCircleActivityScreen(context);
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              K.moment_circle_activity,
              style: TextStyle(
                  fontSize: 16,
                  color: R.color.mainTextColor,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Opacity(
              opacity: 0.4,
              child: R.img('circle/ic_rush_circle_next.svg',
                  width: 16,
                  height: 16,
                  package: ComponentManager.MANAGER_MOMENT),
            ),
          ],
        ),
      ),
    ));
    widgetList.add(Padding(
      padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
      child: Divider(
        height: 1,
        color: R.color.dividerColor,
      ),
    ));
    //只需要展示3个
    int length = min(activityList!.length, 3);
    for (int i = 0; i < length; i++) {
      widgetList.add(InkWell(
        onTap: () {
          Tracker.instance.track(TrackEvent.net_event_card,
              properties: {'click': activityList![i].name});
          IMomentManager manager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_MOMENT);
          manager.openTagListScreenScreen(
            context,
            tagId: activityList![i].id,
            title: activityList![i].name ?? '',
          );
        },
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
              top: 12, bottom: 8, start: 12, end: 12),
          child: SizedBox(
            height: 39,
            child: (activityList![i].circleName != null &&
                    activityList![i].circleName?.isNotEmpty == true)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildTagLine(i),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              K.moment_from_circle(
                                  [activityList![i].circleName ?? '']),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 11,
                                  color: R.color.thirdTextColor,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                : Center(child: _buildTagLine(i)),
          ),
        ),
      ));
    }

    return Container(
      width: 248,
      height: 228,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(11)),
          border: Border.all(
            color: R.color.dividerColor,
            width: 1,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgetList,
      ),
    );
  }

  Widget _buildTagLine(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        R.img('circle/ic_rush_circle_tag.svg',
            width: 16, height: 16, package: ComponentManager.MANAGER_MOMENT),
        const SizedBox(
          width: 4,
        ),
        Expanded(
          child: Text(
            activityList![index].name ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 13,
                color: R.color.mainTextColor,
                fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }

  Widget _buildCircleFriendsPlaying(BuildContext context) {
    if (friendsActivityList == null || friendsActivityList!.isEmpty) {
      return Container();
    }
    List<Widget> widgetList = [];
    widgetList.add(GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Tracker.instance
            .track(TrackEvent.net_play_card, properties: {'click': 'more'});
        CircleFriendsPlayingScreen.openCircleFriendsPlayingScreen(context);
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              K.moment_circle_friends_playing,
              style: TextStyle(
                  fontSize: 16,
                  color: R.color.mainTextColor,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Opacity(
              opacity: 0.4,
              child: R.img('circle/ic_rush_circle_next.svg',
                  width: 16,
                  height: 16,
                  package: ComponentManager.MANAGER_MOMENT),
            )
          ],
        ),
      ),
    ));
    widgetList.add(Padding(
      padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
      child: Divider(
        height: 1,
        color: R.color.dividerColor,
      ),
    ));
    //只需要展示3个
    int length = min(friendsActivityList!.length, 3);
    for (int i = 0; i < length; i++) {
      widgetList.add(InkWell(
        onTap: () {
          Tracker.instance.track(TrackEvent.net_play_card, properties: {
            'click':
                (friendsActivityList![i].isInRoom == 1 ? 'room' : 'no_room'),
            'target_uid': friendsActivityList![i].uid
          });
          if (friendsActivityList![i].isInRoom == 1) {
            IRoomManager roomManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_BASE_ROOM);
            roomManager.openChatRoomScreenShow(
                context, friendsActivityList![i].rid);
            //跳房间
          } else {
            //跳个人主页
            IPersonalDataManager manager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_PERSONALDATA);
            manager.openImageScreen(context, friendsActivityList![i].uid,
                refer: const PageRefer('CircleActivity'));
          }
        },
        child: Padding(
            padding: const EdgeInsetsDirectional.only(
                top: 12, bottom: 8, start: 12, end: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleFriendAvatarWidget(
                  friendsActivityList![i],
                  40,
                  onlineIndicatorSize: 8,
                  onlineIndicatorBorderWidth: 1,
                  onlineIndicatorBottomMargin: 0,
                  onlineIndicatorEndMargin: 3,
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    LimitedBox(
                      maxWidth: 158,
                      child: Text(
                        friendsActivityList![i].name ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: R.color.mainTextColor),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    LimitedBox(
                      maxWidth: 158,
                      child: Text(
                        friendsActivityList![i].roomTag == '有待发掘'
                            ? (friendsActivityList![i].roomTag ?? '')
                            : (friendsActivityList![i].isInRoom == 1
                                ? K.moment_he_is_playing(
                                    [friendsActivityList![i].roomTag ?? ''])
                                : K.moment_he_played(
                                    [friendsActivityList![i].roomTag ?? ''])),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: R.color.thirdTextColor),
                      ),
                    )
                  ],
                )
              ],
            )),
      ));
    }
    return Container(
      width: 248,
      height: 228,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(11)),
          border: Border.all(
            color: R.color.dividerColor,
            width: 1,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgetList,
      ),
    );
  }
}

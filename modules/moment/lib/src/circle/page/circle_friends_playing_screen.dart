import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:moment/src/circle/model/circle_page_resp.dart';
import 'package:moment/src/circle/repository/circle_friend_playing_page_repository.dart';
import 'package:moment/src/circle/widget/circle_friend_avatar_widget.dart';

import '../../../k.dart';

/// 圈友在玩
class CircleFriendsPlayingScreen extends StatefulWidget {
  static const String CIRCLE_FRIENDS_PLAYING_ROUTE =
      '/circle_friends_playing_route';

  final int circleId;
  final bool fromDetail;

  const CircleFriendsPlayingScreen(
      {super.key, required this.circleId, this.fromDetail = false});

  static Future openCircleFriendsPlayingScreen(BuildContext context,
      {Key? key, int circleId = 0, bool fromDetail = false}) {
    return Navigator.of(context).push(MaterialPageRoute(
        settings: const RouteSettings(name: CIRCLE_FRIENDS_PLAYING_ROUTE),
        builder: (context) {
          return CircleFriendsPlayingScreen(
            key: key,
            circleId: circleId,
            fromDetail: fromDetail,
          );
        }));
  }

  @override
  State<StatefulWidget> createState() {
    return CircleFriendsPlayingState();
  }
}

class CircleFriendsPlayingState extends State<CircleFriendsPlayingScreen> {
  late CircleFriendPlayingPageRepository repository;
  final String _errorMsg = K.moment_something_went_wrong;
  late double ratio;

  @override
  void initState() {
    super.initState();
    Tracker.instance
        .track(TrackEvent.net_view, properties: {'page': 'net_play_list'});
    ratio = (Util.width - 38) / (375 - 38);
    repository = (widget.circleId > 0)
        ? CircleFriendPlayingPageRepository(circleId: widget.circleId)
        : CircleFriendPlayingPageRepository();
  }

  @override
  void dispose() {
    repository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.moment_circle_friends_playing),
      body: RefreshIndicatorFactory.of(
        onRefresh: () async {
          repository.refresh();
        },
        child: LoadingMoreList(
          ListConfig<CircleFriendsActivity>(
              itemBuilder: _buildItem,
              sourceList: repository,
              indicatorBuilder: _indicatorBuilder,
              padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 12),
              extendedListDelegate:
                  SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8 * ratio,
                mainAxisSpacing: 8 * ratio,
              ),
              lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent),
        ),
      ),
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const LoadingFooter(hasMore: false);
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: _errorMsg,
        onTap: () {
          repository.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: _errorMsg, loadMore: repository.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: K.moment_no_more_info,
        onTap: () {
          repository.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }

  Widget _buildItem(
      BuildContext context, CircleFriendsActivity item, int index) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Tracker.instance.track(
            widget.fromDetail
                ? TrackEvent.net_detail_page
                : TrackEvent.net_play_list,
            properties: {
              widget.fromDetail ? 'playlist' : 'click':
                  (item.isInRoom == 1 ? 'room' : 'no_room')
            });
        if (item.isInRoom == 1) {
          IRoomManager roomManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_BASE_ROOM);
          roomManager.openChatRoomScreenShow(context, item.rid);
          //跳房间
        } else {
          //跳个人主页
          IPersonalDataManager manager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_PERSONALDATA);
          manager.openImageScreen(context, item.uid,
              refer: const PageRefer(
                  CircleFriendsPlayingScreen.CIRCLE_FRIENDS_PLAYING_ROUTE));
        }
      },
      child: Container(
        height: 152 * ratio,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
            color: R.color.dividerColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8 * ratio),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 12 * ratio,
            ),
            CircleFriendAvatarWidget(
              item,
              72 * ratio,
              roomIndicatorEndMargin: 8,
              onlineIndicatorSize: 12,
              onlineIndicatorEndMargin: 8,
              onlineIndicatorBorderWidth: 2,
            ),
            SizedBox(
              height: 7 * ratio,
            ),
            Container(
              height: 24 * ratio,
              constraints: BoxConstraints(maxWidth: 99 * ratio),
              alignment: Alignment.center,
              child: Text(
                item.name ?? '',
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    height: 1.0,
                    fontSize: 16 * ratio,
                    color: R.color.mainTextColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 2 * ratio),
            Container(
              width: 72 * ratio,
              height: 21 * ratio,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(11 * ratio),
                  color: R.color.dividerColor),
              alignment: Alignment.center,
              child: Text(
                item.roomTag ?? '',
                style: TextStyle(
                    fontSize: 12 * ratio,
                    color: R.color.thirdTextColor,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rank/k.dart';
import 'package:rank/src/page/tabs/follow_up/home_follow_up_party_list_widget.dart';
import 'package:rank/src/widget/home_friend_palying_item.dart';

import 'home_follow_up_friend_playing_widget.dart';
import 'home_follow_up_sub_page_controller.dart';

class HomeFollowUpSubPage extends StatefulWidget {
  const HomeFollowUpSubPage({super.key});

  @override
  State<HomeFollowUpSubPage> createState() => _HomeFollowUpSubPageState();
}

class _HomeFollowUpSubPageState extends State<HomeFollowUpSubPage>
    with AutomaticKeepAliveClientMixin, ReloadStateMixin {
  final HomeFollowUpSubPageController _controller =
      Get.put(HomeFollowUpSubPageController());
  final ScrollController _scrollController = ScrollController();

  int _lastReloadTime = 0;
  final _maxReloadDurationInMilliSecs = 60 * 1000;

  @override
  void initState() {
    super.initState();
    _lastReloadTime = nowMilliSecs();
  }

  @override
  void dispose() {
    Get.delete<HomeFollowUpSubPageController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<HomeFollowUpSubPageController>(
      id: dataReady,
      builder: (_) {
        switch (_controller.status) {
          case ScreenStatus.Loading:
            return const Loading();
          case ScreenStatus.Error:
            return ErrorData(
              fontColor: R.colors.mainTextColor,
              error: _controller.errorMsg,
              onTap: _controller.loadData,
            );
          case ScreenStatus.Empty:
            return EmptyWidget(textColor: R.colors.mainTextColor);
          case ScreenStatus.Ready:
            return _buildBody();
        }
      },
    );
  }

  Widget _buildBody() {
    return RefreshIndicatorFactory.of(
      onRefresh: _controller.loadData,
      child: CustomScrollView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
              child: HomeFollowUpPartyListWidget(context: context)),
          SliverList(
              delegate:
                  _buildPlayingFriendDelegate(_controller.friendPlayingList)),
        ],
      ),
    );
  }

  SliverChildDelegate _buildPlayingFriendDelegate(
      List<HomeFriendItem> playingFriendList) {
    return SliverChildBuilderDelegate(
      (_, index) {
        if (index == 0) {
          // 好友在玩标题
          return Padding(
            padding:
                const EdgeInsetsDirectional.only(start: 16, end: 10, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      K.rank_my_follow,
                      style: TextStyle(
                        color: R.colors.mainTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    _buildAddFriend(),
                  ],
                ),
                if (!_controller.hasFriendPlaying)
                  Container(
                    height: 300,
                    padding: const EdgeInsetsDirectional.only(top: 50),
                    child: EmptyWidget(
                      desc: K.rank_playing_friend_no_data,
                      textSize: 16,
                      size: 150,
                      paddingBottom: 60,
                      textColor: R.colors.mainTextColor,
                    ),
                  ),
              ],
            ),
          );
        }
        return HomeFollowUpFriendPlayingItemWidget(
          context: context,
          position: index - 1,
          itemData: playingFriendList[index - 1],
        );
      },
      childCount: playingFriendList.length + 1,
    );
  }

  /// 添加好友
  Widget _buildAddFriend() {
    return GestureDetector(
      onTap: () {
        IMessageManager messageManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_MESSAGE);
        messageManager.openFriendAddPage(context, refer: 'friends_playing');
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            K.rank_add_friend,
            style: TextStyle(color: R.colors.secondTextColor, fontSize: 12),
          ),
          const SizedBox(width: 6),
          R.img(
            BaseAssets.icon_next_fq_svg,
            width: 16,
            height: 16,
            package: ComponentManager.MANAGER_BASE_CORE,
            color: R.colors.secondTextColor,
          ),
        ],
      ),
    );
  }

  @override
  void reload({bool force = true, animated = true}) {
    int now = nowMilliSecs();
    if (now - _lastReloadTime > _maxReloadDurationInMilliSecs || force) {
      _lastReloadTime = now;
      scrollToTop(animated: animated);
      if (_controller.status != ScreenStatus.Loading) {
        _controller.loadData();
      }
    }
  }

  @override
  void scrollToTop({bool animated = true}) {
    if (_scrollController.hasClients) {
      if (animated) {
        _scrollController.animateTo(0.0,
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      } else {
        _scrollController.jumpTo(0.0);
      }
    }
  }

  @override
  bool get wantKeepAlive => true;
}

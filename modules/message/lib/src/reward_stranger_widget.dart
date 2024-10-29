import 'package:shared/k.dart' as BaseK;
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;
import 'package:message/src/api/message_repo.dart';
import 'package:message/src/model/pb/generated/slp_reward_stranger.pb.dart';
import 'package:message/k.dart';
import 'package:shared/widget/base_select_pop_dialog.dart';

/// 打赏消息（陌生人）
class RewardStrangerWidget extends StatefulWidget {
  static const String routeName = '/SingerFriendClubInfoPage';

  const RewardStrangerWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RewardStrangerWidget();

  static Future show(BuildContext context) {
    IMainManager mainManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MAIN);
    int index = mainManager.appNavigatorObserverGetIndex(routeName);

    /// 判断此时栈中是否已经存在此页面
    if (index > -1) {
      // 已存在 则pop此页面上面的所有页面
      Navigator.of(context).popUntil(ModalRoute.withName(routeName));
      return Future.value();
    } else {
      // 不存在 则push
      return Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const RewardStrangerWidget(),
          settings: const RouteSettings(name: routeName),
        ),
      );
    }
  }
}

class _RewardStrangerWidget extends State<RewardStrangerWidget> {
  late _RewardStrangerLoadingSource _source;

  final List<PopBean> _sortPopList = [
    PopBean(1, BaseK.K.sort_recent_time_tab),
    PopBean(0, BaseK.K.sort_reward_value_tab)
  ];
  late PopBean _sortPop;

  final GlobalKey _sortKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(Im.EventMessageContentChanged, _onImEvent);
    _sortPop = _sortPopList[0];
    _source = _RewardStrangerLoadingSource(_sortPop.id);
  }

  @override
  void dispose() {
    eventCenter.removeListener(Im.EventMessageContentChanged, _onImEvent);
    _source.dispose();
    super.dispose();
  }

  void _onImEvent(String eventType, dynamic data) async {
    if (data == null) return;
    Map res = data;
    if (res.containsKey('message')) {
      //消息体
      String targetId = res['message']['targetId'];
      if (ChatUtil.isRewardNotice(Util.parseInt(targetId))) {
        // 收到打赏消息，刷新页面
        _source.refresh();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.homeBgColor,
      appBar: BaseAppBar.custom(
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backColor: R.colors.mainTextColor,
        backgroundColor: R.colors.homeBgColor,
        title: Text(K.message_reward_title,
            style: TextStyle(
                color: R.colors.mainTextColor,
                fontSize: 17,
                fontWeight: FontWeight.w500)),
        actions: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () async {
              PopBean? result = await BaseSelectPopDialog.show(
                  context, _sortPopList, _sortPop.id, _sortKey,
                  width: 140, direction: 1);
              if (result != null && _sortPop.id != result.id) {
                _sortPop = result;
                _source.setSort(_sortPop.id);
              }
            },
            child: Container(
              margin: const EdgeInsetsDirectional.only(end: 12),
              padding: const EdgeInsetsDirectional.all(4),
              child: R.img('ic_action_sort_icon.webp',
                  key: _sortKey,
                  width: 24,
                  height: 24,
                  color: R.colors.mainTextColor,
                  package: ComponentManager.MANAGER_MESSAGE),
            ),
          ),
        ],
      ),
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: RefreshIndicatorFactory.of(
        onRefresh: () => _source.refresh(),
        child: LoadingMoreList<RankRewardStrangerItem>(
          ListConfig<RankRewardStrangerItem>(
            itemBuilder: (context, item, index) {
              return _buildRewardStrangerItem(item);
            },
            lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
            sourceList: _source,
            indicatorBuilder: _indicatorBuilder,
          ),
        ),
      ),
    );
  }

  Widget _buildRewardStrangerItem(RankRewardStrangerItem item) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        IChatManager chatManager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
        chatManager.openUserChatScreen(
          context,
          type: 'private',
          targetId: item.uid,
          title: item.name,
          refer: 'RewardStranger',
        );

        /// 清空未读数
        item.unread = 0;
        refresh();

        /// 同步服务端
        await MessageRepo.resetRewardStrangerItem(item.uid);
        Tracker.instance.track(TrackEvent.click,
            properties: {'click_page': 'click_giver_column', 'uid': item.uid});
      },
      child: Container(
        width: double.infinity,
        height: 122,
        alignment: AlignmentDirectional.topCenter,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    IPersonalDataManager personalDataManager = ComponentManager
                        .instance
                        .getManager(ComponentManager.MANAGER_PERSONALDATA);
                    personalDataManager.openImageScreen(context, item.uid,
                        refer: const PageRefer('RankRewardRefer'));
                    Tracker.instance.track(TrackEvent.click, properties: {
                      'click_page': 'click_giver_tx',
                      'uid': item.uid
                    });
                  },
                  child: CommonAvatar(
                      path: item.icon, size: 48, shape: BoxShape.circle),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              item.name,
                              style: TextStyle(
                                  color: R.color.mainTextColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 4),
                          UserSexAndAgeWidget(sex: item.sex, age: item.age),
                        ],
                      ),
                      if (item.roomName.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          K.message_reward_item_sub_desc([(item.roomName)]),
                          style: TextStyle(
                              color: R.color.secondTextColor, fontSize: 13),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                _buildPrice(item.value),
              ],
            ),
            const SizedBox(height: 16),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 34,
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color(0xFFF6F7F9),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        Utility.getDateDiff(item.time),
                        style: const TextStyle(
                            color: Color(0x66202020), fontSize: 11),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          K.message_reward_item_gift_desc(
                              [(item.giftName), '${item.giftNum}']),
                          style: TextStyle(
                              color: R.color.secondTextColor, fontSize: 13),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                if (item.unread > 0)
                  PositionedDirectional(
                    end: 6,
                    top: 6,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const ShapeDecoration(
                        shape: StadiumBorder(),
                        color: Color(0xFFFF5F7D),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrice(int price) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(MoneyConfig.moneyIcon, width: 16, height: 16),
        const SizedBox(width: 2),
        Text(Util.numberToWStringByFloor(price),
            style: TextStyle(color: R.color.mainTextColor, fontSize: 14)),
      ],
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
      return LoadingFooter(
        hasMore: false,
        loadMore: () => {},
      );
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: _source.errorMsg,
        onTap: () {
          _source.refresh();
        },
        fontColor: R.colors.secondTextColor,
      );
    }
    if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: BaseK.K.no_data,
        onTap: () {
          _source.refresh();
        },
        fontColor: R.colors.secondTextColor,
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
        errorMessage: _source.errorMsg,
        loadMore: _source.loadMore,
        textColor: R.colors.secondTextColor,
      );
    } else {
      return LoadingFooter(
        hasMore: _source.hasMore,
        loadMore: _source.loadMore,
        textColor: R.colors.secondTextColor,
      );
    }
  }
}

class _RewardStrangerLoadingSource
    extends LoadingMoreBase<RankRewardStrangerItem> {
  _RewardStrangerLoadingSource(this._sort);

  int _sort = 0;

  void setSort(int sort) {
    _sort = sort;
    refresh();
  }

  int _pageIndex = 1;
  bool _hasMore = true;
  String errorMsg = '';

  @override
  bool get hasMore => (_hasMore);

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _hasMore = true;
    _pageIndex = 1;
    clear();
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool loadSuccess = false;

    int page = isloadMoreAction ? _pageIndex + 1 : _pageIndex;

    ApiRankRewardStrangerResponse resp =
        await MessageRepo.getRewardStrangerList(page, _sort);
    if (resp.success) {
      if (resp.data.list.isNotEmpty) {
        addAll(resp.data.list);
        _hasMore = resp.data.more;
        _pageIndex = page;
      } else {
        _hasMore = false;
      }
      loadSuccess = true;
    } else {
      errorMsg = resp.message;
      loadSuccess = false;
    }
    return loadSuccess;
  }
}

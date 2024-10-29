import 'package:get/get.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:rank/src/model/home_recommend_repository.dart';
import 'package:rank/src/model/rankRequestManager.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;
import 'package:rank/src/page/tabs/room_glory_headline_widget.dart';
import 'package:rank/src/widget/home_room_banner_widget.dart';
import 'package:rank/src/widget/home_room_item_widget.dart';
import 'package:rank/src/widget/home_room_item_widget_v2.dart';
import '../main_page_controller.dart';
import 'package:rank/src/page/tabs/room_recommend_widget.dart';

///主页热门标签
class HomeFriendSubPage extends StatefulWidget {
  final String? tabName;
  final Color? tipTextColor;
  final bool hideFastMatch;
  final bool hideActiveFriends;
  final bool newType;

  const HomeFriendSubPage({
    this.tabName,
    this.tipTextColor,
    this.hideFastMatch = false,
    this.hideActiveFriends = false,
    this.newType = false,
    super.key,
  });

  @override
  HomeFriendSubState createState() {
    return HomeFriendSubState();
  }
}

class HomeFriendSubState extends State<HomeFriendSubPage>
    with AutomaticKeepAliveClientMixin, ReloadStateMixin {
  bool _loading = true;
  bool _loadingByApi = true; // 限制API反复请求
  String? _errorMsg;

  // 房间banner
  List<HomeRoomBannerData>? roomBanners;

  // 为你推荐
  late HomeRecommendRepository _recommendRepository;

  // 房间推荐
  ResTopRoomList? recommendData;

  // 荣耀头条
  AwakeFrontPageRsp_Data? gloryHeadlineData;

  static String showTodayTime = 'show_boot_today_time';
  static String hasShowFate = 'has_show_fate_in_boot';

  late int _lastReloadTime;
  final _maxReloadDurationInMilliSecs = 60 * 1000;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _lastReloadTime = nowMilliSecs();
    _recommendRepository = HomeRecommendRepository();
    _load(isFirst: true);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _throttle.dispose();
    super.dispose();
  }

  void _load({bool isFirst = false}) async {
    if (!Session.isLogined) {
      return;
    }
    _loadingByApi = true;
    try {
      /// 获取快乐星球榜单配置
      CommonRankStrategyConfig.getRankStrategy();

      ResHomeTabHot res = await RankRequestManager.getHomeHot();

      if (res.msg.isNotEmpty) {
        _errorMsg = res.msg;
      } else if (res.success == true) {
        roomBanners = res.data.roomBannerList
            .map((e) => HomeRoomBannerData.fromPb(e))
            .toList();
        _errorMsg = null;
        gloryHeadlineData = res.data.awakeFrontPage;
      } else {
        _errorMsg = XhrError(XhrErrorCode.Json, '').toString();
      }

      RankRequestManager.getHotRoomRecommend().then((value) {
        recommendData = value;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            setState(() {});
          }
        });
      });
    } catch (e) {
      Log.d(e.toString());
      if (e is XhrError) {
        _errorMsg = e.toString();
      } else {
        _errorMsg = XhrError(XhrErrorCode.Unknown, e.toString()).toString();
      }
    }
    _loadingByApi = false;
    if (mounted) {
      setState(() {
        _loading = false;
      });
    }

    // if (isFirst == true && _errorMsg == null && Util.isSLPAll() && Util.is30DayNew) {
    //   /// 今日缘分30日内注册的男女用户, 每日第二次打开app（距离上次打开1小时后）在首页一级页面主动弹出
    //   int today = DateTime.now().day; /// 30日内注册,用day即可
    //   bool hasShow = Config.getBool('$hasShowFate-$today', false);
    //   if (hasShow) {
    //     return;
    //   }
    //   int showTime = Config.getInt('$showTodayTime-$today', 0);
    //   if (showTime == 0) {
    //     Config.set('$showTodayTime-$today',  '${DateTime.now().secondsSinceEpoch}');
    //   } else if (DateTime.now().secondsSinceEpoch - showTime > 60 * 60) {
    //     /// 今日缘分
    //     Log.d('show FateDialog in boot');
    //     IMessageManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MESSAGE);
    //     manager?.openFateDialog(context);
    //     Config.setBool('$hasShowFate-$today', true);
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_loading) {
      return const Loading();
    } else if (_errorMsg != null) {
      return Center(
        child: ErrorData(
          fontColor: widget.tipTextColor ?? R.colors.mainTextColor,
          error: _errorMsg,
          onTap: () {
            _loading = true;
            _load();
          },
        ),
      );
    }

    return buildNormalBody();
  }

  Widget buildNormalBody() {
    bool isShowRecommend = (recommendData != null &&
        recommendData!.success &&
        recommendData!.data.list.isNotEmpty);
    return RefreshIndicatorFactory.of(
      onRefresh: () async {
        _load();
        _recommendRepository.refresh();
      },
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          if (gloryHeadlineData != null && gloryHeadlineData!.list.isNotEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 16, end: 16, top: 12),
                child: RoomGloryHeadlineWidget(
                  gloryHeadlineData: gloryHeadlineData,
                ),
              ),
            ),
          SliverToBoxAdapter(
            // 房间banner
            child: HomeRoomBannerWidget(roomBanners,
                const RoomFrom('tabFriend', RoomFrom.home), 'home_banner'),
          ),
          // if (isShowRecommend)
          //   SliverToBoxAdapter(
          //     child: Padding(
          //       // 房间推荐
          //       padding: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 12),
          //       child: RoomRecommendWidget(roomListData: recommendData!.data),
          //     ),
          //   ),
          SliverToBoxAdapter(
            child: Padding(
              // 房间推荐标题
              padding: EdgeInsetsDirectional.only(
                  start: 16, end: 13, top: isShowRecommend ? 20 : 6),
              child: _buildRecommendTitle(),
            ),
          ),
          GetBuilder<MainPageController>(
            id: 'listStyle',
            builder: (logic) {
              // 对固定位进行排序
              _recommendRepository.sortDatas();
              return (logic.listStyle)
                  ? LoadingMoreSliverList(
                      SliverListConfig<RoomListItem>(
                        padding: EdgeInsetsDirectional.only(
                            start: 11.dp, end: 11.dp, top: 3.dp),
                        itemBuilder: _itemBuilder,
                        sourceList: _recommendRepository,
                        indicatorBuilder: _indicatorBuilder,
                        lastChildLayoutType:
                            LastChildLayoutType.fullCrossAxisExtent,
                        extendedListDelegate: ExtendedListDelegate(
                            viewportBuilder: _handleExposureReport),
                      ),
                    )
                  : LoadingMoreSliverList(
                      SliverListConfig<RoomListItem>(
                        padding: EdgeInsetsDirectional.only(
                            start: 12.dp, end: 12.dp, top: 5.dp),
                        itemBuilder: _itemBuilder,
                        sourceList: _recommendRepository,
                        indicatorBuilder: _indicatorBuilder,
                        lastChildLayoutType:
                            LastChildLayoutType.fullCrossAxisExtent,
                        extendedListDelegate:
                            SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 0,
                          viewportBuilder: _handleExposureReport,
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  void _handleItemExposureReport(RoomListItem item, int position) {
    Tracker.instance.track(TrackEvent.flow_exposure, properties: {
      'tab': 'recommend',
      'rid': item.rid,
      'to_uid': item.uid,
      'position': position,
      'room_property': item.property,
      'is_biz': item.isBiz,
      if (!Util.isNullOrEmpty(item.labelType)) 'type_label': item.labelType,
      if (!Util.isNullOrEmpty(item.roomFactoryType))
        'room_factory_type': item.roomFactoryType,
      if (!Util.isNullOrEmpty(item.settlementChannel))
        'settlement_channel': item.settlementChannel,
      'fix_position': item.fixPosition,
    });
  }

  void _handleClickItemReport(RoomListItem item, int position, bool listStyle) {
    Tracker.instance.track(TrackEvent.flow_click, properties: {
      'tab': 'recommend',
      'rid': item.rid,
      'to_uid': item.uid,
      'position': position,
      'is_biz': item.isBiz,
      if (!Util.isNullOrEmpty(item.labelType)) 'type_label': item.labelType,
      if (!Util.isNullOrEmpty(item.roomFactoryType))
        'room_factory_type': item.roomFactoryType,
      if (!Util.isNullOrEmpty(item.settlementChannel))
        'settlement_channel': item.settlementChannel,
      'list_style': listStyle ? 1 : 2,
      'fix_position': item.fixPosition,
    });
  }

  void _handleExposureReport(int firstIndex, int lastIndex) async {
    // 推荐曝光上报
    if (_recommendRepository.isLoading && _recommendRepository.isEmpty) return;

    int maxNum = _recommendRepository.length;

    /// 只要在屏幕上显示一点点 就算曝光
    for (int i = firstIndex; i <= lastIndex && i < maxNum; i++) {
      if (i >= maxNum || i < 0) continue; // 防止数组越界
      RoomListItem item = _recommendRepository.elementAt(i);

      if (!_recommendRepository.getExposureIndex(i)) {
        _handleItemExposureReport(item, i);
        _recommendRepository.setExposureIndex(i, true);
      }
    }
  }

  final Throttle _throttle = Throttle(); //显示切换的节留器

  Widget _buildRecommendTitle() {
    return Row(
      children: [
        Text(
          K.rank_hot_party,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: R.colors.second2TextColor,
          ),
        ),
        const Spacer(),
        GetBuilder<MainPageController>(
          id: 'listStyle',
          builder: (logic) {
            String switchStyleIcon = logic.listStyle
                ? Assets.ic_home_list_style_2_webp
                : Assets.ic_home_list_style_1_webp;
            return Visibility(
              visible: false,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  _throttle.call(() => logic.changeListStyle());
                },
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: R.img(
                    switchStyleIcon,
                    width: 24,
                    height: 24,
                    color: R.colors.mainTextColor,
                    package: ComponentManager.MANAGER_RANK,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _itemBuilder(BuildContext context, RoomListItem item, int index) {
    return GetBuilder<MainPageController>(
      id: 'listStyle',
      builder: (logic) {
        return (logic.listStyle)
            ? HomeRoomItemWidget(
                item: item,
                roomFrom: const RoomFrom('tabFriend', RoomFrom.home),
                refer: 'flow_recommend',
                onItemClick: () =>
                    _handleClickItemReport(item, index, logic.listStyle),
              )
            : HomeRoomItemWidgetV2(
                item: item,
                roomFrom: const RoomFrom('tabFriend', RoomFrom.home),
                refer: 'flow_recommend',
                onItemClick: () =>
                    _handleClickItemReport(item, index, logic.listStyle),
              );
      },
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return LoadingFooter(hasMore: true, textColor: R.colors.secondTextColor);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const SliverFillRemaining(
        child: Center(
          child: CupertinoActivityIndicator(),
        ),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return LoadingFooter(hasMore: false, textColor: R.colors.secondTextColor);
    } else if (status == IndicatorStatus.fullScreenError) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: ErrorData(
          error: R.string('data_error'),
          fontColor: R.colors.mainTextColor,
          onTap: () => _recommendRepository.refresh(),
        ),
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
        errorMessage: R.string('data_error'),
        textColor: R.colors.secondTextColor,
        loadMore: _recommendRepository.loadMore,
      );
    } else if (status == IndicatorStatus.empty) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: EmptyWidget(
          textColor: R.colors.mainTextColor,
          onTap: () => _recommendRepository.refresh(),
        ),
      );
    }
    return LoadingFooter(hasMore: true, textColor: R.colors.secondTextColor);
  }

  @override
  void reload({bool force = true, animated = true}) {
    int now = nowMilliSecs();
    if (now - _lastReloadTime > _maxReloadDurationInMilliSecs || force) {
      _lastReloadTime = now;
      scrollToTop(animated: animated);
      // 刷新
      if (!_loadingByApi) {
        _load();
      }
      _recommendRepository.refresh();
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
}

import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:rank/assets.dart';
import 'package:rank/src/model/home_room_respository.dart';
import 'package:shared/src/pbModel/generated/banban_home.pb.dart';
import 'package:rank/src/widget/home_room_item_widget.dart';
import 'package:rank/src/widget/home_room_item_widget_v2.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;
import 'package:rank/src/model/rankRequestManager.dart';
import '../GameCategoryPage.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:pulse_log/pulse_log.dart';
import '../main_page_controller.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart' hide Selector;

///为了支持嗨歌定制默认的item样式，目前先通过这种拦截注入的方式实现
typedef DefaultItemBuilder = Function(
  BuildContext context,
  RoomListItem item,
  int index,
  RoomFrom roomFrom,
  String refer,
  VoidCallback itemClick,
);

class RoomSubPage extends StatefulWidget {
  final String? type;
  final String? tabName;
  final List<GameItem>? gameCategory;
  final int? tabId;
  final String? firstTabName; // 一级tabName，用户上报，区分不同的一级Tab里有相同的二级tab名称
  final String? firstType; //一级tab的type
  final int? style; // 房间样式，0：默认样式（长条垂直list），1：新样式（大海报gridview），3：直播封面 竖版显示
  final bool sliver;
  final DefaultItemBuilder? defaultItemBuilder; //支持自定义默认样式的构造器

  const RoomSubPage({
    this.type,
    super.key,
    this.tabName,
    this.gameCategory,
    this.tabId,
    this.firstTabName,
    this.firstType,
    this.style,
    this.sliver = true,
    this.defaultItemBuilder,
  });

  @override
  _RoomSubPageState createState() => _RoomSubPageState();
}

class _RoomSubPageState extends State<RoomSubPage>
    with AutomaticKeepAliveClientMixin, ReloadStateMixin {
  late HomeRoomRepository _repository;

  String? _errorMessage;

  final ScrollController _scrollController = ScrollController();

  late int _lastReloadTime;
  final _maxReloadDurationInMilliSecs = 60 * 1000;

  late BonusMapModel bonusMapModel;

  @override
  void initState() {
    super.initState();
    _lastReloadTime = nowMilliSecs();
    _repository = HomeRoomRepository(widget.type ?? '');
    bonusMapModel = BonusMapModel();
  }

  Widget _buildBody() {
    return RefreshIndicatorFactory.of(
      onRefresh: () async {
        _repository.refresh();
      },
      child: NotificationListener<ScrollEndNotification>(
        child:
            widget.sliver == false ? _buildNoSliverBody() : _buildSliverBody(),
      ),
    );
  }

  Widget _buildSliverBody() {
    return CustomScrollView(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: <Widget>[
        if (widget.gameCategory != null && widget.gameCategory!.isNotEmpty)
          SliverToBoxAdapter(
            child: _buildGameCategory(),
          )
        else
          const SliverToBoxAdapter(),
        _buildSliverRoomList(),
      ],
    );
  }

  Widget _buildNoSliverBody() {
    return Column(
      children: [
        if (!Util.isCollectionEmpty(widget.gameCategory)) _buildGameCategory(),
        Expanded(child: _buildNoSliverRoomList()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider.value(
      value: bonusMapModel,
      child: _buildBody(),
    );
  }

  Widget _buildSliverRoomList() {
    if (widget.style == 3) {
      /// 直播封面 竖版
      return LoadingMoreSliverList(
        SliverListConfig<RoomListItem>(
          padding: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 5),
          itemBuilder: (c, item, index) {
            PartyRoomGridItem gridItem = item.changeToPartGridItem();
            return PartyRoomGridItemNewWidget(
              item: gridItem,
              key: ValueKey('${item.rid}_${gridItem.name}'),
              onItemClick: () => _onItemClick(item, index, false),
              roomFrom: RoomFrom(widget.type ?? '', RoomFrom.home),
              refer: '${widget.firstType}_${widget.type}',
            );
          },
          indicatorBuilder: _indicatorBuilder,
          sourceList: _repository,
          lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
          extendedListDelegate:
              SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            viewportBuilder: _handleExposureReport,
          ),
        ),
      );
    } else {
      return GetBuilder<MainPageController>(
        id: 'listStyle',
        builder: (logic) {
          // 对固定位进行排序
          _repository.sortDatas();
          return (logic.listStyle)
              ? LoadingMoreSliverList(
                  SliverListConfig<RoomListItem>(
                    padding: EdgeInsetsDirectional.only(
                        start: 11.dp, end: 11.dp, top: 0),
                    itemBuilder: _itemBuilder,
                    sourceList: _repository,
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
                        start: 12.dp, end: 12.dp, top: 2.dp),
                    itemBuilder: _itemBuilder,
                    sourceList: _repository,
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
      );
    }
  }

  Widget _buildNoSliverRoomList() {
    if (widget.style == 3) {
      /// 直播封面 竖版
      return LoadingMoreList(
        ListConfig<RoomListItem>(
          padding: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 5),
          itemBuilder: (c, item, index) {
            PartyRoomGridItem gridItem = item.changeToPartGridItem();
            return PartyRoomGridItemNewWidget(
              item: gridItem,
              key: ValueKey('${item.rid}_${gridItem.name}'),
              onItemClick: () => _onItemClick(item, index, false),
              roomFrom: RoomFrom(widget.type ?? '', RoomFrom.home),
              refer: '${widget.firstType}_${widget.type}',
            );
          },
          indicatorBuilder: _indicatorBuilder,
          sourceList: _repository,
          lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
          extendedListDelegate:
              SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            viewportBuilder: _handleExposureReport,
          ),
        ),
      );
    } else {
      return GetBuilder<MainPageController>(
        id: 'listStyle',
        builder: (logic) {
          _repository.sortDatas();
          return (logic.listStyle)
              ? LoadingMoreList(
                  ListConfig<RoomListItem>(
                    padding: const EdgeInsetsDirectional.only(
                        start: 11, end: 11, top: 0),
                    itemBuilder: _itemBuilder,
                    sourceList: _repository,
                    indicatorBuilder: _indicatorBuilder,
                    lastChildLayoutType:
                        LastChildLayoutType.fullCrossAxisExtent,
                    extendedListDelegate: ExtendedListDelegate(
                        viewportBuilder: _handleExposureReport),
                  ),
                )
              : LoadingMoreList(
                  ListConfig<RoomListItem>(
                    padding: const EdgeInsetsDirectional.only(
                        start: 12, end: 12, top: 4),
                    itemBuilder: _itemBuilder,
                    sourceList: _repository,
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
      );
    }
  }

  Widget _buildGameCategory() {
    if (widget.gameCategory!.length <= 5) {
      return Container(
        margin: const EdgeInsetsDirectional.only(
            start: 16, end: 16, top: 4, bottom: 12),
        width: Util.width - 32,
        height: 73,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildGameCategoryList(),
        ),
      );
    }

    return Container(
      width: Util.width,
      height: 73,
      margin: const EdgeInsetsDirectional.only(top: 4, bottom: 12),
      child: ListView.separated(
        itemCount: widget.gameCategory!.length,
        padding: const EdgeInsetsDirectional.only(
          start: 16,
        ),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(width: 16),
        itemBuilder: (context, index) {
          return _buildGameCategoryItem(widget.gameCategory![index]);
        },
      ),
    );
  }

  List<Widget> _buildGameCategoryList() {
    List<Widget> list = [];
    for (var element in widget.gameCategory!) {
      list.add(_buildGameCategoryItem(element));
    }
    return list;
  }

  Widget _buildGameCategoryItem(GameItem item) {
    return GestureDetector(
      onTap: () async {
        GameCategoryPage.show(context);
      },
      child: SizedBox(
        width: 56,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (item.cid == 0)
              R.img(
                Assets.ic_more_webp,
                width: 48,
                height: 48,
                package: ComponentManager.MANAGER_RANK,
              ),
            if (item.cid != 0)
              CommonAvatar(
                path: item.icon,
                size: 48,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
            const SizedBox(height: 6),
            Text(
              item.name,
              style: TextStyle(
                fontSize: 13,
                color: R.colors.secondTextColor,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant RoomSubPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.type != oldWidget.type) {
      _repository.clear();
      _repository = HomeRoomRepository(widget.type ?? '');
    }
  }

  @override
  bool get wantKeepAlive => true;

  Widget _itemBuilder(BuildContext context, RoomListItem item, int index) {
    var roomFrom = RoomFrom(widget.type ?? '', RoomFrom.home);
    var refer = '${widget.firstType}_${widget.type}';

    ///支持上层定制widget
    if (widget.defaultItemBuilder != null) {
      Widget result = widget.defaultItemBuilder!
          .call(context, item, index, roomFrom, refer, () {
        _onItemClick(item, index, true);
      });
      return result;
    }
    return GetBuilder<MainPageController>(
      id: 'listStyle',
      builder: (logic) {
        return (logic.listStyle)
            ? HomeRoomItemWidget(
                item: item,
                roomFrom: roomFrom,
                refer: refer,
                onItemClick: () => _onItemClick(item, index, logic.listStyle),
              )
            : HomeRoomItemWidgetV2(
                item: item,
                roomFrom: roomFrom,
                refer: refer,
                onItemClick: () => _onItemClick(item, index, logic.listStyle),
              );
      },
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return LoadingFooter(hasMore: true, textColor: R.colors.secondTextColor);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      Widget child = const CupertinoActivityIndicator();
      if (widget.sliver == false) {
        return Center(
          child: child,
        );
      } else {
        return SliverFillRemaining(
          hasScrollBody: false,
          child: child,
        );
      }
    } else if (status == IndicatorStatus.noMoreLoad) {
      return LoadingFooter(hasMore: false, textColor: R.colors.secondTextColor);
    } else if (status == IndicatorStatus.fullScreenError) {
      Widget child = ErrorData(
        error: _errorMessage,
        fontColor: R.colors.mainTextColor,
        onTap: () {
          _repository.refresh();
        },
      );
      if (widget.sliver == false) {
        return child;
      } else {
        return SliverFillRemaining(
          hasScrollBody: false,
          child: child,
        );
      }
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
        errorMessage: BaseK.K.data_error,
        textColor: R.colors.secondTextColor,
        loadMore: _repository.loadMore,
      );
    } else if (status == IndicatorStatus.empty) {
      Widget child = EmptyWidget(
        textColor: R.colors.mainTextColor,
        onTap: () {
          _repository.refresh();
        },
      );

      if (widget.sliver == false) {
        return child;
      } else {
        return SliverFillRemaining(
          hasScrollBody: false,
          child: child,
        );
      }
    }
    return const LoadingFooter(hasMore: true);
  }

  void _handleExposureReport(int firstIndex, int lastIndex) async {
    if (_repository.isLoading && _repository.isEmpty) return;

    int maxNum = _repository.length;

    /// 只要在屏幕上显示一点点 就算曝光
    for (int i = firstIndex; i <= lastIndex && i < maxNum; i++) {
      if (i >= maxNum || i < 0) continue; // 防止数组越界
      RoomListItem? item =
          _repository.length > i ? _repository.elementAt(i) : null;
      if (item != null && !_repository.getExposureIndex(i)) {
        _repository.setExposureIndex(i, true);

        // 首页列表项曝光
        Tracker.instance.track(TrackEvent.flow_exposure, properties: {
          'tab': '${widget.firstType}_${widget.type}',
          'rid': item.rid,
          'to_uid': item.uid,
          'position': i,
          'room_property': item.property,
          if (!Util.isNullOrEmpty(item.labelType)) 'type_label': item.labelType,
          if (!Util.isNullOrEmpty(item.roomFactoryType))
            'room_factory_type': item.roomFactoryType,
          if (!Util.isNullOrEmpty(item.settlementChannel))
            'settlement_channel': item.settlementChannel,
          'fix_position': item.fixPosition,
        });
      }
    }
  }

  void _handleClickItemReport(RoomListItem item, int position, bool listStyle) {
    Tracker.instance.track(TrackEvent.flow_click, properties: {
      if (widget.type != null &&
          widget.type!.isNotEmpty &&
          widget.firstType != null &&
          widget.firstType!.isNotEmpty)
        'tab': '${widget.firstType}_${widget.type}',
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

  @override
  void reload({bool force = true, animated = true}) {
    int now = nowMilliSecs();
    if (now - _lastReloadTime > _maxReloadDurationInMilliSecs || force) {
      _lastReloadTime = now;
      scrollToTop(animated: animated);
      _repository.refresh();
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

  void _onItemClick(RoomListItem item, int position, bool listStyle) {
    _handleClickItemReport(item, position, listStyle);
    RankRequestManager.reportTabClick(
        type: 'room', filter: widget.type, tabId: widget.tabId ?? 0);
    RankRequestManager.postCommonRoomlistEnter(widget.type ?? '');
    PulseLog.instance.event('click_event', properties: {
      'click_tag':
          'home_${widget.firstTabName}_${widget.tabName}_room_${item.rid}',
    });
  }

  @override
  void dispose() {
    bonusMapModel.dispose();
    super.dispose();
  }
}

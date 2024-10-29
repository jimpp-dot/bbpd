import 'package:shared/shared.dart';
import 'package:shared/model/liveListRsp.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:rank/src/widget/home_group_fans_widget.dart';
import 'package:rank/src/widget/room_item_widget.dart';

import '../../../k.dart';

// 首页粉丝团TAB
class GroupFansSubPage extends StatefulWidget {
  final int groupId;

  const GroupFansSubPage({required this.groupId, super.key});

  @override
  GroupFansSubState createState() {
    return GroupFansSubState();
  }
}

class GroupFansSubState extends State<GroupFansSubPage>
    with AutomaticKeepAliveClientMixin, ReloadStateMixin {
  late GroupPageRepository _repository;

  String? _errorMessage;

  final ScrollController _scrollController = ScrollController();

  late int _lastReloadTime;
  final _maxReloadDurationInMilliSecs = 60 * 1000;

  @override
  void initState() {
    super.initState();

    _lastReloadTime = nowMilliSecs();

    _repository = GroupPageRepository(
      widget.groupId,
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void didUpdateWidget(covariant GroupFansSubPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.groupId != oldWidget.groupId) {
      _repository.clear();
      _repository = GroupPageRepository(
        widget.groupId,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicatorFactory.of(
      onRefresh: () async {
        _repository.refresh();
      },
      child: CustomScrollView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: HomeGroupFansWidget(widget.groupId),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 20, bottom: 7),
              child: Text(
                K.rank_home_group_title,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: R.color.mainTextColor,
                ),
              ),
            ),
          ),
          _buildRoomList(),
        ],
      ),
    );
  }

  Widget _buildRoomList() {
    return LoadingMoreSliverList(
      SliverListConfig<RoomItemModel>(
        itemBuilder: _itemBuilder,
        sourceList: _repository,
        indicatorBuilder: _indicatorBuilder,
        extendedListDelegate:
            ExtendedListDelegate(viewportBuilder: _handleExposureReport),
        //isLastOne: false
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, RoomItemModel item, int index) {
    return RoomItemWidget(
      item: item,
      roomFrom: const RoomFrom('kol', RoomFrom.home),
      refer: 'kol',
      onItemClick: () => _handleClickItemReport,
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(
        hasMore: true,
      );
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const SliverFillRemaining(
        child: Center(
          child: CupertinoActivityIndicator(),
        ),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const LoadingFooter(
        hasMore: false,
      );
    } else if (status == IndicatorStatus.fullScreenError) {
      return SliverFillRemaining(
        child: ErrorData(
          error: _errorMessage,
          onTap: () {
            _repository.refresh();
          },
        ),
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: R.string('data_error'), loadMore: _repository.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return SliverFillRemaining(
        child: ErrorData(
          error: R.string('no_data'),
          onTap: () {
            _repository.refresh();
          },
        ),
      );
    }
    return const LoadingFooter(hasMore: true);
  }

  void _handleExposureReport(int firstIndex, int lastIndex) async {
    if (_repository.isLoading && _repository.isEmpty) return;

    int maxNum = _repository.length;

    for (int i = firstIndex; i < lastIndex && i < maxNum; i++) {
      if (i >= maxNum) continue;
      RoomItemModel? item =
          _repository.length > i ? _repository.elementAt(i) : null;
      if (item != null && !item.exposured) {
        item.exposured = true;

        // 首页列表项曝光
        Tracker.instance.track(TrackEvent.flow_exposure, properties: {
          'tab': 'kol',
          'kid': widget.groupId,
          'rid': item.rid,
          'to_uid': item.uid,
          'position': i,
          'room_property': item.roomProperty,
          if (!Util.isNullOrEmpty(item.typeName)) 'type_label': item.typeName,
          if (!Util.isNullOrEmpty(item.roomFactoryType))
            'room_factory_type': item.roomFactoryType,
          if (!Util.isNullOrEmpty(item.settlementChannel))
            'settlement_channel': item.settlementChannel,
        });
      }
    }
  }

  void _handleClickItemReport(RoomItemModel item, int position) {
    Tracker.instance.track(TrackEvent.flow_click, properties: {
      'tab': 'kol',
      'kid': widget.groupId,
      'rid': item.rid,
      'to_uid': item.uid,
      'position': position,
      'is_biz': item.isBiz,
      if (!Util.isNullOrEmpty(item.typeName)) 'type_label': item.typeName,
      if (!Util.isNullOrEmpty(item.roomFactoryType))
        'room_factory_type': item.roomFactoryType,
      if (!Util.isNullOrEmpty(item.settlementChannel))
        'settlement_channel': item.settlementChannel,
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
}

class GroupPageRepository extends LoadingMoreBase<RoomItemModel> {
  int groupId;
  int _page = 1;
  bool _hasMore = true;

  String? source;

  GroupPageRepository(this.groupId);

  @override
  bool get hasMore => _hasMore;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _hasMore = true;
    _page = 1;
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;
    try {
      LiveListRsp? resp =
          await BaseRequestManager.getGroupFansList(_page, groupId);
      Log.d('GroupPageRepository.loadData');
      if (resp?.data != null) {
        if (_page == 1) {
          clear();
        }
        addAll(resp!.data!.items);
        _hasMore = resp.data!.hasMore;
        _page++;
        isSuccess = true;
      }
    } catch (e) {
      Log.d(e);
      isSuccess = false;
    }
    return isSuccess;
  }
}

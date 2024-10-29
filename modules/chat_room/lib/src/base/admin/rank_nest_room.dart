import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/src/base/admin/nest_room_admin_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;

import '../../../chat_room.dart';
import '../../protobuf/generated/nest.pb.dart';
import 'refresh_mixin.dart';

/// 私密房（子房间的榜单数据入口）
class RankNestRoom extends StatefulWidget {
  final int rid;
  const RankNestRoom({required this.rid, Key? key}) : super(key: key);

  @override
  RankNestRoomState createState() {
    return RankNestRoomState();
  }
}

class RankNestRoomState extends State<RankNestRoom>
    with RefreshMixin<RankNestRoom> {
  late RoomDataTransferRepository _repository;

  @override
  void initState() {
    super.initState();
    _repository = RoomDataTransferRepository(widget.rid);
    _loadData();
  }

  Future _loadData() async {
    await _repository.refresh();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    return Container(
      color: R.color.mainBgColor,
      child: RefreshIndicatorFactory.of(
        onRefresh: _loadData,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: <Widget>[
            const SliverToBoxAdapter(),
            LoadingMoreSliverList(
              SliverListConfig<NestChildrenItem>(
                  itemBuilder: _buildItem,
                  sourceList: _repository,
                  indicatorBuilder: _indicatorBuilder,
                  autoRefresh: false),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, NestChildrenItem item, int index) {
    return Container(
      height: 72,
      color: R.color.mainBgColor,
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          CommonAvatar(
            path: item.icon,
            size: 52,
            shape: BoxShape.circle,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${K.room_nest_room}${item.rid}',
                style: TextStyle(
                  fontSize: 16,
                  color: R.color.mainTextColor,
                ),
                maxLines: 1,
              ),
              if (Util.parseInt(item.total) > 0) ...[
                const SizedBox(
                  height: 4,
                ),
                Text(
                  '${item.total}',
                  style: TextStyle(
                    fontSize: 13,
                    color: R.color.secondTextColor,
                  ),
                ),
              ],
            ],
          )),
          const SizedBox(
            width: 12,
          ),
          GestureDetector(
            onTap: () {
              /// 展示该私密房的榜单
              NestRoomAdminScreen.show(context, item.rid);
            },
            child: Container(
              width: 63,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(16),
                gradient: LinearGradient(
                  colors: R.color.mainBrandGradientColors,
                ),
              ),
              alignment: AlignmentDirectional.center,
              child: Text(
                K.room_go_to,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    Log.d('status:$status');
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
      return SizedBox(
        height: 16 + Util.iphoneXBottom,
      );
    } else if (status == IndicatorStatus.fullScreenError) {
      return SliverFillRemaining(
        child: ErrorData(
            onTap: _loadData, fontColor: Colors.white.withOpacity(0.4)),
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
        errorMessage: R.string('data_error'),
        loadMore: _repository.loadMore,
        textColor: Colors.white.withOpacity(0.4),
      );
    } else if (status == IndicatorStatus.empty) {
      return SliverFillRemaining(
        child: EmptyWidget(
            onTap: _loadData, textColor: Colors.white.withOpacity(0.4)),
      );
    }
    return const LoadingFooter(hasMore: true);
  }

  @override
  refresh() {
    _repository.refresh();
  }
}

class RoomDataTransferRepository extends LoadingMoreBase<NestChildrenItem> {
  final int rid;
  bool _hasMore = true;
  RoomDataTransferRepository(this.rid);
  int _page = 1;
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
      ApiNestChildrenResponse res = await RoomApi.getNestRoomList(rid);
      if (res.success) {
        if (_page == 1) {
          clear();
        }
        addAll(res.list);
        _page++;
        _hasMore = false;
        isSuccess = true;
      }
    } catch (e) {
      Log.d(e);
    }
    return isSuccess;
  }
}

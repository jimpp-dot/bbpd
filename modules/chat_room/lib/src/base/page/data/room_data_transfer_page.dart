import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;
import 'package:chat_room/src/base/repo/room_api.dart';
import 'package:chat_room/src/protobuf/generated/room_data.pb.dart';

class RoomDataTransferRepository extends LoadingMoreBase<PackageItem> {
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
      ResRoomDataReceptionTransferList receptionTransferList =
          await RoomApi.getRoomDataReceptionTransferList(rid, _page);
      if (receptionTransferList.success) {
        if (_page == 1) {
          clear();
        }
        addAll(receptionTransferList.data.receptionTransferList);
        _page++;
        _hasMore = receptionTransferList.data.more;
        isSuccess = true;
      }
    } catch (e) {
      Log.d(e);
    }
    return isSuccess;
  }
}

class RoomDataTransferPage extends StatefulWidget {
  final int rid;
  const RoomDataTransferPage(this.rid, {super.key});
  @override
  _RoomDataTransferPageState createState() => _RoomDataTransferPageState();
}

class _RoomDataTransferPageState extends State<RoomDataTransferPage> {
  late final RoomDataTransferRepository _repository;
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
              SliverListConfig<PackageItem>(
                itemBuilder: _buildItem,
                sourceList: _repository,
                indicatorBuilder: _indicatorBuilder,
                autoRefresh: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rankItemWidget(int rank) {
    if (rank < 3) {
      return R.img(
        'fans/fan_rank_${rank + 1}.webp',
        width: 30,
        height: 27,
        package: ComponentManager.MANAGER_BASE_ROOM,
      );
    }

    String numStr = '';

    if (rank < 9) {
      numStr = '0${rank + 1}';
    } else if (rank < 99) {
      numStr = '${rank + 1}';
    } else {
      numStr = '99+';
    }
    return NumText(
      numStr,
      style: const TextStyle(
          fontSize: 17,
          color: Color(0XFFFFD04B),
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic),
    );
  }

  Widget _buildItem(BuildContext context, PackageItem item, int index) {
    return Container(
      height: 65,
      color: R.color.mainBgColor,
      child: Row(
        children: [
          Container(
            width: 56,
            alignment: AlignmentDirectional.center,
            child: rankItemWidget(index),
          ),
          CommonAvatar(
            path: item.senderIcon,
            size: 48,
            shape: BoxShape.circle,
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  child: Text(
                item.senderName,
                style: R.textStyle.medium14,
                maxLines: 1,
              )),
              Container(
                decoration: ShapeDecoration(
                  shape: const StadiumBorder(),
                  color: R.color.mainBrandColor.withOpacity(0.08),
                ),
                padding: const EdgeInsetsDirectional.fromSTEB(8, 2, 8, 2),
                child: Text(
                  item.tag,
                  style: R.textStyle.medium12
                      .copyWith(color: R.color.mainBrandColor),
                ),
              )
            ],
          )),
          const SizedBox(
            width: 12,
          ),
          Text(
            '${item.money}',
            style: R.textStyle.medium14.copyWith(
                fontSize: 15,
                fontFamily: Util.numFontFamily,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w800,
                color: R.color.secondTextColor),
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
      return const LoadingFooter(
        hasMore: false,
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
}

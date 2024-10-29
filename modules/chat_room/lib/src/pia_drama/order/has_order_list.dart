import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import '../../../k.dart';
import '../../protobuf/generated/piadrama.pb.dart';
import '../pia_drama_repo.dart';

/// pia戏：房间已点
class HasOrderList extends StatefulWidget {
  final int rid;

  const HasOrderList({Key? key, required this.rid}) : super(key: key);

  @override
  HasOrderListState createState() {
    return HasOrderListState();
  }
}

class HasOrderListState extends State<HasOrderList> {
  late OrderedDramaRepository _repo;

  @override
  void initState() {
    super.initState();
    _repo = OrderedDramaRepository(rid: widget.rid);

    Tracker.instance.track(TrackEvent.click,
        properties: {'click_page': 'click_orderedbook'});
  }

  @override
  Widget build(BuildContext context) {
    return LoadingMoreList(
      ListConfig<PiaOrder>(
        padding:
            EdgeInsetsDirectional.only(top: 12, bottom: Util.iphoneXBottom),
        indicatorBuilder: _indicatorBuilder,
        itemBuilder: _itemBuilder,
        sourceList: _repo,
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, PiaOrder item, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 16),
          child: Text(
            '${K.room_order_drama_title}${index + 1}',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
        ),
        Container(
          width: Util.width - 32,
          height: 80,
          margin: const EdgeInsetsDirectional.only(
              start: 16, end: 16, top: 12, bottom: 16),
          padding:
              const EdgeInsetsDirectional.only(top: 14, start: 16, end: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(8),
            color: Colors.white10,
            border: Border.all(width: 0.5, color: const Color(0x33F6F7F9)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: Util.width -
                          120 -
                          (28 + 24 * (item.players.length - 1)),
                    ),
                    child: Text(
                      item.juben.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    K.room_drama_performer,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  _buildGsList(item.players),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                K.room_drama_order_person([item.orderUser.name]),
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.5),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGsList(List<PiaOrderUser> gs) {
    double width = 28 + 24 * (gs.length - 1);
    return SizedBox(
      width: width,
      height: 28,
      child: Stack(
        children: _buildListWidget(gs),
      ),
    );
  }

  List<Widget> _buildListWidget(List<PiaOrderUser> gs) {
    List<Widget> list = [];
    for (int index = 0; index < gs.length; index++) {
      list.add(
        PositionedDirectional(
          start: index * 24,
          child: _buildGsIcon(gs[index].icon),
        ),
      );
    }
    return list;
  }

  Widget _buildGsIcon(String icon) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.8), width: 1),
      ),
      alignment: AlignmentDirectional.center,
      child: CommonAvatar(
        path: Util.getRemoteImgUrl(icon),
        size: 26,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(
        hasMore: true,
      );
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const SizedBox.shrink();
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: R.string('data_error'),
        onTap: () {
          _repo.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: R.string('data_error'), loadMore: _repo.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: R.string('no_data'),
        onTap: () {
          _repo.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }
}

class OrderedDramaRepository extends LoadingMoreBase<PiaOrder> {
  final int rid;
  int _page = 1;
  bool _hasMore = true;

  OrderedDramaRepository({
    required this.rid,
  });

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
      ResPiaOrderList res = await PiaDramaRepo.getordered(rid: rid);
      if (res.success && _page == 1) {
        clear();
      }

      /// 服务端未做分页
      _hasMore = false;

      addAll(res.data.orders);
      _page++;
      isSuccess = true;
    } catch (e) {
      Log.d(e);
      isSuccess = false;
    }
    return isSuccess;
  }
}

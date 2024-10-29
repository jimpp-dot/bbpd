import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import '../../../k.dart';
import '../../protobuf/generated/piadrama.pb.dart';
import '../edit/edit_drama_repo.dart';
import 'order_drama_item.dart';

typedef OnItemOrder = void Function(PiaJuBen juben);

/// pia戏点本列表：单人的单人本+房间多人本
class OrderDramaListWidget extends StatefulWidget {
  final int rid;
  final int uid;
  final int type;
  final OnItemOrder onItemOrder;

  const OrderDramaListWidget(
      {Key? key,
      required this.rid,
      required this.uid,
      required this.type,
      required this.onItemOrder})
      : super(key: key);

  @override
  OrderDramaListState createState() {
    return OrderDramaListState();
  }
}

class OrderDramaListState extends State<OrderDramaListWidget> {
  late EditDramaRepository _repo;

  @override
  void initState() {
    super.initState();
    _repo = EditDramaRepository(
        rid: widget.rid, uid: widget.uid, type: widget.type);

    Tracker.instance.track(TrackEvent.click, properties: {
      'click_page': widget.type == 1 ? 'click_solo' : 'click_multiplepeople'
    });
  }

  @override
  void didUpdateWidget(covariant OrderDramaListWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.uid != widget.uid) {
      /// 切换GS，重新拉取数据
      _repo.clear();
      _repo = EditDramaRepository(
          rid: widget.rid, uid: widget.uid, type: widget.type);
      _repo.refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsetsDirectional.only(top: 20, bottom: 10, start: 20),
          child: Text(
            K.room_drama_list,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
        ),
        Expanded(
          child: LoadingMoreList(
            ListConfig<PiaJuBen>(
              padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
              indicatorBuilder: _indicatorBuilder,
              itemBuilder: _itemBuilder,
              sourceList: _repo,
            ),
          ),
        ),
      ],
    );
  }

  Widget _itemBuilder(BuildContext context, PiaJuBen item, int index) {
    return OrderDramaItem(
      juben: item,
      index: index,
      onItemOrder: onItemOrder,
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

  void onItemOrder(int index) {
    widget.onItemOrder(_repo.elementAt(index));
  }
}

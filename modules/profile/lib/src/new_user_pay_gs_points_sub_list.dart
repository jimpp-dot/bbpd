import 'package:shared/shared.dart';
import 'package:shared/k.dart' as base_k;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/src/NewUserPayRepo.dart';
import 'package:profile/src/model/pb/generated/new_user_pay_gs.pb.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;

class NewUserPayGsPointsSubList extends StatefulWidget {
  final int dateTab; // 1-今天，2-昨天，3-本周，4-上周
  final int scene; // 0-全部，1-礼物打赏，2-VIP升级，3-互相关注

  const NewUserPayGsPointsSubList(
      {super.key, required this.dateTab, required this.scene});

  @override
  State<StatefulWidget> createState() => NewUserPayGsPointsSubListState();
}

class NewUserPayGsPointsSubListState extends State<NewUserPayGsPointsSubList>
    with AutomaticKeepAliveClientMixin {
  late _NewUserPayPointsLoadingSource _source;

  @override
  void initState() {
    super.initState();
    _source = _NewUserPayPointsLoadingSource(widget.dateTab, widget.scene);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return LoadingMoreList<GsTransferPointsDetail>(
        ListConfig<GsTransferPointsDetail>(
      itemBuilder: (context, item, index) {
        return _buildItem(item, index == 0);
      },
      lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
      sourceList: _source,
      indicatorBuilder: _indicatorBuilder,
    ));
  }

  Widget _buildItem(GsTransferPointsDetail item, bool first) {
    return Container(
      width: double.infinity,
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(blurRadius: 18, spreadRadius: 5, color: Color(0x0D000000))
        ],
      ),
      margin: EdgeInsetsDirectional.only(
          start: 16, end: 16, top: first ? 16 : 8, bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: AlignmentDirectional.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.subject,
                  style:
                      const TextStyle(color: Color(0xFF202020), fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Text(
                  item.time,
                  style:
                      const TextStyle(color: Color(0x66202020), fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          _buildPointsValue(item),
        ],
      ),
    );
  }

  Widget _buildPointsValue(GsTransferPointsDetail item) {
    String value = '';
    bool increase = true;
    if (item.opType == 1) {
      /// 支出
      increase = false;
      value = '-${item.points}';
    } else if (item.opType == 2) {
      /// 收入
      increase = true;
      value = '+${item.points}';
    }
    return Text(
      value,
      style: TextStyle(
          color: increase ? const Color(0xFF60C8FF) : const Color(0xFFFF5F7D),
          fontSize: 20,
          fontWeight: FontWeight.w500),
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
      );
    }
    if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: base_k.K.no_data,
        onTap: () {
          _source.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: _source.errorMsg, loadMore: _source.loadMore);
    } else {
      return LoadingFooter(
          hasMore: _source.hasMore, loadMore: _source.loadMore);
    }
  }

  @override
  bool get wantKeepAlive => true;
}

class _NewUserPayPointsLoadingSource
    extends LoadingMoreBase<GsTransferPointsDetail> {
  final int dateTab;
  final int scene;

  int _pageIndex = 1;

  bool _hasMore = true;
  String errorMsg = '';

  _NewUserPayPointsLoadingSource(this.dateTab, this.scene);

  @override
  bool get hasMore => (_hasMore);

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _hasMore = true;
    _pageIndex = 1;
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool loadSuccess = false;
    int page = isloadMoreAction ? _pageIndex + 1 : _pageIndex;
    ResGsTransferPointsDetail resp =
        await NewUserPayRepo.getTransferPointsDetail(dateTab, scene, page);
    if (resp.success) {
      if (page == 1) {
        clear();
      }
      _pageIndex = page;
      addAll(resp.data.list);
      _hasMore = resp.data.hasMore;
      loadSuccess = true;
    } else {
      errorMsg = resp.msg;
      loadSuccess = false;
    }
    return loadSuccess;
  }
}

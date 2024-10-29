import 'package:personaldata/k.dart';
import 'package:shared/shared.dart';
import 'package:shared/k.dart' as base_k;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:personaldata/src/star_exchange/pb/generated/relation_conver.pb.dart';
import 'package:personaldata/src/star_exchange/star_exchange_repo.dart';

/// 集星兑换-兑换记录页
class CpLinkStarExchangeRecordPage extends StatefulWidget {
  const CpLinkStarExchangeRecordPage({super.key});

  static Future show(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const CpLinkStarExchangeRecordPage(),
      settings: const RouteSettings(name: '/CpLinkStarExchangeRecordPage'),
    ));
  }

  @override
  State<CpLinkStarExchangeRecordPage> createState() =>
      _CpLinkStarExchangeRecordPageState();
}

class _CpLinkStarExchangeRecordPageState
    extends State<CpLinkStarExchangeRecordPage> {
  final _ListRepository _repository = _ListRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.personal_exchange_record),
      body: RefreshIndicatorFactory.of(
        onRefresh: () async {
          _repository.refresh();
        },
        child: SafeArea(
          child: LoadingMoreList(
            ListConfig<RelConvertLog>(
              itemBuilder: _itemBuilder,
              sourceList: _repository,
              indicatorBuilder: _indicatorBuilder,
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, RelConvertLog item, int index) {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
      padding: const EdgeInsetsDirectional.only(top: 12, bottom: 12),
      decoration: BoxDecoration(
        border: Border(
            bottom:
                BorderSide(width: 0.5, color: Colors.black.withOpacity(0.06))),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.fmtConvert,
                    style:
                        TextStyle(fontSize: 16, color: R.color.mainTextColor)),
                const SizedBox(height: 4),
                Text(item.fmtTime,
                    style: TextStyle(
                        fontSize: 12, color: Colors.black.withOpacity(0.5))),
              ],
            ),
          ),
          Container(
            width: 100,
            alignment: AlignmentDirectional.centerEnd,
            child: NumText(item.fmtStar,
                style: TextStyle(
                    fontSize: 16,
                    color: R.color.mainTextColor,
                    fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(child: CupertinoActivityIndicator());
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const LoadingFooter(hasMore: false);
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: _repository._errorMsg,
        fontColor: R.color.thirdTextColor,
        onTap: () {
          _repository.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: base_k.K.data_error, loadMore: _repository.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: base_k.K.no_data,
        fontColor: R.color.thirdTextColor,
        onTap: () {
          _repository.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }
}

class _ListRepository extends LoadingMoreBase<RelConvertLog> {
  String _errorMsg = '';
  int _page = 1;
  bool _hasMore = true;

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
    if (!isloadMoreAction) {
      _page = 1;
      _hasMore = true;
    }
    int page = isloadMoreAction ? _page + 1 : _page;
    final res = await StarExchangeRepo.exchangeRecord(page);
    if (res.success) {
      if (page == 1) {
        clear();
      }
      _hasMore = res.isMore;
      _page = page;
      addAll(res.list);

      isSuccess = true;
    } else {
      _errorMsg = res.msg;
    }
    return isSuccess;
  }
}

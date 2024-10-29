import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:shared/k.dart' as BaseK;
import '../../k.dart';
import '../model/pb/generated/slp_anchor.pb.dart';

/// 主播任务：历史记录
class AnchorTaskHistoryPage extends StatefulWidget {
  const AnchorTaskHistoryPage({super.key});

  @override
  AnchorTaskHistoryState createState() => AnchorTaskHistoryState();

  static Future show(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const AnchorTaskHistoryPage(),
      settings: const RouteSettings(name: '/AnchorTaskHistoryPage'),
    ));
  }
}

class AnchorTaskHistoryState extends State<AnchorTaskHistoryPage> {
  late AnchorTaskHistoryRepository _repository;

  @override
  void initState() {
    super.initState();
    _repository = AnchorTaskHistoryRepository();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.profile_anchor_task_history),
      body: LoadingMoreList(
        ListConfig<HistoryAnchorInfoItem>(
          itemBuilder: _itemBuilder,
          sourceList: _repository,
          indicatorBuilder: _indicatorBuilder,
          //isLastOne: false
        ),
      ),
    );
  }

  Widget _itemBuilder(
      BuildContext context, HistoryAnchorInfoItem item, int index) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.only(
          top: 6, bottom: 6, start: 16, end: 16),
      padding: const EdgeInsetsDirectional.only(
          start: 16, end: 16, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [getHomeBoxShadow()],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonAvatar(
                      size: 40,
                      shape: BoxShape.circle,
                      path: item.icon,
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        item.name * 5,
                        style: TextStyle(
                          fontSize: 16,
                          color: R.color.mainTextColor,
                          height: 1.2,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 4),
                    UserVipWidget(vip: item.vip),
                  ],
                ),
              ),
              const SizedBox(width: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!item.isFinished)
                    Container(
                      width: 39,
                      height: 20,
                      margin: const EdgeInsetsDirectional.only(end: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(6),
                        gradient: LinearGradient(
                            colors: R.color.mainBrandGradientColors),
                      ),
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        K.profile_anchor_task_history_count,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          height: 1.1,
                        ),
                      ),
                    ),
                  Text(
                    item.timeDesc,
                    style: TextStyle(
                      fontSize: 11,
                      color: R.color.secondTextColor,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 6),
          _buildCreditItem(K.profile_anchor_task_score_live_duration,
              '${item.liveDurationCredit}'),
          const SizedBox(height: 6),
          _buildCreditItem(
              K.profile_anchor_task_score_behavior, '${item.behaviorCredit}'),
          const SizedBox(height: 6),
          _buildCreditItem(
              K.profile_anchor_task_score_week_flow, '${item.weekFlowCredit}'),
        ],
      ),
    );
  }

  Widget _buildCreditItem(String text, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 48),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: R.color.secondTextColor,
            height: 1.2,
          ),
        ),
        const SizedBox(width: 4),
        NumText(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: R.color.mainTextColor,
            height: 1.2,
          ),
        ),
      ],
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
        error: _repository.errorMsg,
        fontColor: R.color.thirdTextColor,
        onTap: () {
          _repository.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: BaseK.K.data_error, loadMore: _repository.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: BaseK.K.no_data,
        fontColor: R.color.thirdTextColor,
        onTap: () {
          _repository.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }
}

class AnchorTaskHistoryRepository
    extends LoadingMoreBase<HistoryAnchorInfoItem> {
  AnchorTaskHistoryRepository();

  String errorMsg = '';
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
    int page = isloadMoreAction ? _page + 1 : _page;

    ResHistoryAnchorInfo res;
    try {
      String url = 'go/yy/anchor/history?page=$page';
      XhrResponse response =
          await Xhr.get('${System.domain}$url', throwOnError: true, pb: true);
      res = ResHistoryAnchorInfo.fromBuffer(response.bodyBytes);
    } catch (e) {
      res = ResHistoryAnchorInfo(success: false, msg: e.toString());
    }
    if (res.success) {
      if (page == 1) clear();
      if (res.data.hisory.isNotEmpty) {
        addAll(res.data.hisory);
        _hasMore = false; // 服务端确认只有一页数据
        _page = page;
      } else {
        _hasMore = false;
      }
      isSuccess = true;
    } else {
      errorMsg = res.msg;
      isSuccess = false;
    }
    return isSuccess;
  }
}

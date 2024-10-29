import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:shared/k.dart' as BaseK;
import '../../k.dart';
import '../model/pb/generated/slp_anchor.pb.dart';
import 'anchor_task_detail_list_page.dart';

/// 任务详情子TAB
class AnchorTaskDetailSubPage extends StatefulWidget {
  final String filter;

  const AnchorTaskDetailSubPage({super.key, required this.filter});

  @override
  AnchorTaskDetailSubState createState() => AnchorTaskDetailSubState();
}

class AnchorTaskDetailSubState extends State<AnchorTaskDetailSubPage>
    with AutomaticKeepAliveClientMixin {
  List<int> selectType = []; // 任务类型: 1 行为分  2结果分

  late AnchorTaskDetailSubRepository _repository;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _repository = AnchorTaskDetailSubRepository(widget.filter);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: LoadingMoreList(
            ListConfig<AnchorMissionItem>(
              itemBuilder: _itemBuilder,
              sourceList: _repository,
              indicatorBuilder: _indicatorBuilder,
            ),
          ),
        ),
      ],
    );
  }

  Widget _itemBuilder(BuildContext context, AnchorMissionItem item, int index) {
    int divideNum = item.limitCredit > 0 ? 3 : 2;
    return Container(
      width: Util.width - 32,
      margin: const EdgeInsetsDirectional.only(top: 12, start: 16, end: 16),
      padding: const EdgeInsetsDirectional.only(
          start: 16, end: 12, top: 12, bottom: 22),
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          getHomeBoxShadow(),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 8),
                child: R.img(
                  'ic_anchor_task_detail.webp',
                  width: 16,
                  height: 16,
                  package: ComponentManager.MANAGER_PROFILE,
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 7),
                  child: Text(
                    item.name,
                    style: TextStyle(
                      fontSize: 15,
                      color: R.color.mainTextColor,
                      height: 1.2,
                    ),
                    maxLines: 3,
                  ),
                ),
              ),
              const SizedBox(width: 5),
              if (item.hasDetail > 0) ...[
                GestureDetector(
                  onTap: () {
                    /// 具体任务的人员列表页
                    AnchorTaskDetailListPage.show(context,
                        filter: widget.filter, detailId: item.id);
                  },
                  child: Container(
                    width: 52,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(15),
                      gradient: LinearGradient(
                          colors: R.color.mainBrandGradientColors),
                    ),
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      K.profile_anchor_task_detail_button,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        height: 1.1,
                      ),
                    ),
                  ),
                ),
              ] else ...[
                const SizedBox(width: 52, height: 30),
              ],
            ],
          ),
          const SizedBox(height: 17),
          Row(
            children: [
              SizedBox(
                width: (Util.width - 1 - 32 - 28) / divideNum,
                child: Text(
                  item.desc,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: R.color.mainTextColor,
                    height: 1.2,
                  ),
                  maxLines: 1,
                ),
              ),
              Container(
                width: 0.5,
                height: 12,
                color: R.color.thirdTextColor,
              ),
              Container(
                width: (Util.width - 1 - 32 - 28) / divideNum,
                alignment: AlignmentDirectional.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      K.profile_anchor_task_detail_get,
                      style: TextStyle(
                        fontSize: 12,
                        color: R.color.mainTextColor.withOpacity(0.5),
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '+${item.addCredit}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: R.color.mainTextColor,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              if (item.limitCredit > 0) ...[
                Container(
                  width: 0.5,
                  height: 12,
                  color: R.color.thirdTextColor,
                ),
                Container(
                  width: (Util.width - 1 - 32 - 28) / 3,
                  alignment: AlignmentDirectional.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        K.profile_anchor_task_detail_limit,
                        style: TextStyle(
                          fontSize: 12,
                          color: R.color.mainTextColor.withOpacity(0.5),
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${item.limitCredit}${K.profile_nl_friend_score}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: R.color.mainTextColor,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
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

class AnchorTaskDetailSubRepository extends LoadingMoreBase<AnchorMissionItem> {
  final String filter;

  AnchorTaskDetailSubRepository(this.filter);

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

    ResAnchorMissionList res;
    try {
      String url = 'go/yy/anchor/mission?type=$filter&page=$page';
      XhrResponse response =
          await Xhr.get('${System.domain}$url', throwOnError: true, pb: true);
      res = ResAnchorMissionList.fromBuffer(response.bodyBytes);
    } catch (e) {
      res = ResAnchorMissionList(success: false, msg: e.toString());
    }
    if (res.success) {
      if (page == 1) clear();
      if (res.data.mission.isNotEmpty) {
        addAll(res.data.mission);
        _hasMore = false; // 服务端确定不翻页
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

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:shared/k.dart' as BaseK;
import '../../k.dart';
import '../model/pb/generated/slp_anchor.pb.dart';
import 'package:intl/intl.dart';

class AnchorTaskDetailListPage extends StatefulWidget {
  final String filter;
  final int detailId;

  const AnchorTaskDetailListPage(
      {super.key, required this.filter, required this.detailId});

  @override
  AnchorTaskDetailListState createState() => AnchorTaskDetailListState();

  static Future show(BuildContext context,
      {required String filter, required int detailId}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => AnchorTaskDetailListPage(
        filter: filter,
        detailId: detailId,
      ),
      settings: const RouteSettings(name: '/AnchorTaskDetailListPage'),
    ));
  }
}

class AnchorTaskDetailListState extends State<AnchorTaskDetailListPage> {
  late AnchorTaskDetailListRepository _repository;

  @override
  void initState() {
    super.initState();
    _repository =
        AnchorTaskDetailListRepository(widget.filter, widget.detailId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.profile_anchor_task_detail),
      body: LoadingMoreList(
        ListConfig<AnchorMissionDetail>(
          itemBuilder: _itemBuilder,
          sourceList: _repository,
          indicatorBuilder: _indicatorBuilder,
        ),
      ),
    );
  }

  Widget _itemBuilder(
      BuildContext context, AnchorMissionDetail item, int index) {
    return GestureDetector(
      onTap: () {
        IPersonalDataManager manager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        manager.openImageScreen(context, item.uid);
      },
      child: Container(
        height: 102,
        width: Util.width - 32,
        margin: const EdgeInsetsDirectional.only(
            top: 8, bottom: 4, start: 16, end: 16),
        padding: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 16),
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
              children: [
                CommonAvatar(
                  size: 40,
                  shape: BoxShape.circle,
                  path: item.icon,
                ),
                const SizedBox(width: 8),
                Container(
                  constraints: BoxConstraints(maxWidth: Util.width - 230),
                  child: Text(
                    item.name,
                    style: TextStyle(
                      fontSize: 15,
                      color: R.color.mainTextColor,
                      height: 1.2,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 5),
                UserVipWidget(vip: item.vip),
                const SizedBox(width: 7),
                if (Util.validStr(item.datelineDiff)) ...[
                  Container(
                    height: 20,
                    padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(6),
                      color: R.color.mainTextColor.withOpacity(0.1),
                    ),
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      item.datelineDiff,
                      style: TextStyle(
                        fontSize: 10,
                        color: R.color.mainTextColor,
                        height: 1.1,
                      ),
                    ),
                  ),
                ] else ...[
                  const SizedBox(height: 20),
                ]
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                SizedBox(
                  width: (Util.width - 65) / 2,
                  child: Row(
                    children: [
                      Text(
                        '${item.addText}：',
                        style: TextStyle(
                          fontSize: 12,
                          color: R.color.mainTextColor.withOpacity(0.5),
                          height: 1.2,
                        ),
                      ),
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
                Container(
                  width: 0.5,
                  height: 12,
                  color: R.color.thirdTextColor,
                ),
                SizedBox(
                  width: (Util.width - 65) / 2,
                  child: Row(
                    children: [
                      const Spacer(),
                      Text(
                        K.profile_transfer_time,
                        style: TextStyle(
                          fontSize: 12,
                          color: R.color.mainTextColor.withOpacity(0.5),
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(width: 1),
                      Text(
                        getTransferTime(item.addTime),
                        style: TextStyle(
                          fontSize: 12,
                          color: R.color.mainTextColor.withOpacity(0.5),
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String getTransferTime(int time) {
    DateFormat format = DateFormat('yyyy.MM.dd HH:mm');
    return format.format(DateTime.fromMillisecondsSinceEpoch(time * 1000));
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

class AnchorTaskDetailListRepository
    extends LoadingMoreBase<AnchorMissionDetail> {
  final String filter;
  final int id;

  AnchorTaskDetailListRepository(this.filter, this.id);

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

    ResAnchorMissionDetailList res;
    try {
      String url = 'go/yy/anchor/missionDetail?id=$id&type=$filter&page=$page';
      XhrResponse response =
          await Xhr.get('${System.domain}$url', throwOnError: true, pb: true);
      res = ResAnchorMissionDetailList.fromBuffer(response.bodyBytes);
    } catch (e) {
      res = ResAnchorMissionDetailList(success: false, msg: e.toString());
    }
    if (res.success) {
      if (page == 1) clear();
      if (res.data.detail.isNotEmpty) {
        addAll(res.data.detail);
        _hasMore = res.hasMore; // 服务端确定不翻页
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

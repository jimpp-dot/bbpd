import 'package:rank/k.dart';
import 'package:shared/shared.dart';
import 'package:shared/src/pbModel/generated/banban_rank_common.pb.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:shared/k.dart' as BaseK;

/// 陪伴榜榜单恢复页
class CompanionRankRestorePage extends StatefulWidget {
  final VoidCallback onRefresh;

  const CompanionRankRestorePage({super.key, required this.onRefresh});

  @override
  State createState() => _CompanionRankRestorePageState();

  static Future show(BuildContext context, VoidCallback onRefresh) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CompanionRankRestorePage(onRefresh: onRefresh),
      settings: const RouteSettings(name: '/CompanionRankRestorePage'),
    ));
  }
}

class _CompanionRankRestorePageState extends State<CompanionRankRestorePage> {
  final _ListRepository _repository = _ListRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.rank_board_recover),
      body: RefreshIndicatorFactory.of(
        onRefresh: () async {
          _repository.refresh();
        },
        child: SafeArea(
          child: LoadingMoreList(
            ListConfig<RecoverListItem>(
              itemBuilder: _itemBuilder,
              sourceList: _repository,
              indicatorBuilder: _indicatorBuilder,
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, RecoverListItem item, int index) {
    return InkWell(
      onTap: () {
        IPersonalDataManager personalDataManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        personalDataManager.openImageScreen(context, Util.parseInt(item.uid),
            refer: const PageRefer('CompanionRankRestorePage'));
      },
      child: Container(
        height: 81,
        padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
        child: Row(
          children: <Widget>[
            CommonAvatar(path: item.icon, size: 44, shape: BoxShape.circle),
            const SizedBox(width: 9),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          item.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: R.textStyle.medium16,
                        ),
                      ),
                      const SizedBox(width: 6),
                      UserSexAndAgeWidget(
                        sex: item.sex,
                        age: item.age,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: <Widget>[
                      Text(
                        K.rank_intimacy + Util.numberToWString(item.intimacy),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 11, color: Color(0xFFFD7B08)),
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          K.rank_companion_time_minute([
                            Util.numberToWString(item.accompanyTime ~/ 60)
                          ]).replaceAll(RegExp(r'\s'), ''),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 11, color: R.color.mainTextColor),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    K.rank_remove_time_desc([
                      DateFormat('yyyy.MM.dd HH:mm:ss').format(
                          DateTime.fromMillisecondsSinceEpoch(
                              item.recoverTime * 1000))
                    ]),
                    style:
                        TextStyle(fontSize: 11, color: R.color.thirdTextColor),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            _buildRestoreBtn(index),
          ],
        ),
      ),
    );
  }

  Widget _buildRestoreBtn(int index) {
    return GradientButton(
      K.rank_recover,
      width: 63,
      height: 28,
      textStyle: const TextStyle(
          color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
      onTap: () async {
        bool? result = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return ConfirmDialog(
                title: K.rank_recover_board,
                content: K.rank_recover_price_tip(
                    [_repository._recoverMoney.toString()]));
          },
        );
        if (result == true) {
          _payForRestore(index);
        }
      },
    );
  }

  Future _payForRestore(int index) async {
    int price = _repository._recoverMoney;

    /// 先判断是否余额不足
    IPayManager payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    SheetCallback? result =
        await payManager.showRechargeSheet(System.context, price);
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }

    payManager.pay(
      System.context,
      key: 'companion_rank_restore',
      type: result.value?.key ?? '',
      refer: 'companion_rank_restore',
      args: {
        'money': price,
        'type': 'slp-consume',
        'params': {
          'consume_type': 'accompany_recover',
          'to_uid': _repository[index].uid,
        },
      },
      showLoading: true,
      onPayed: () {
        _repository.removeAt(index);
        if (_repository.isEmpty) {
          _repository.indicatorStatus = IndicatorStatus.empty;
        }
        refresh();
        widget.onRefresh();
      },
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(child: CupertinoActivityIndicator());
    } else if (status == IndicatorStatus.noMoreLoad) {
      return Container(
        height: 50,
        width: Util.width,
        alignment: Alignment.center,
        child: Text(K.rank_restore_board_user_time_intro,
            style: TextStyle(color: R.color.thirdTextColor)),
      );
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

class _ListRepository extends LoadingMoreBase<RecoverListItem> {
  String _errorMsg = '';
  int _page = 1;
  bool _hasMore = true;
  int _recoverMoney = 52000; //恢复榜单价格

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
    RecoverListRsp res;
    try {
      String url =
          '${System.domain}go/yy/rank/recoverList?recover_type=accompany&last_id=${page == 1 ? 0 : last.id}';
      final response = await Xhr.get(url, pb: true, throwOnError: true);
      res = RecoverListRsp.fromBuffer(response.bodyBytes);
    } catch (e) {
      res = RecoverListRsp(success: false, msg: e.toString());
    }
    if (res.success) {
      if (page == 1) {
        clear();
      }
      _hasMore = res.data.more;
      _page = page;
      if (res.data.recoverMoney > 0) {
        _recoverMoney = res.data.recoverMoney;
      }
      addAll(res.data.rankList);

      isSuccess = true;
    } else {
      _errorMsg = res.msg;
    }
    return isSuccess;
  }
}

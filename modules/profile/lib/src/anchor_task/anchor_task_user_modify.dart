import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import '../../k.dart';
import '../model/pb/generated/slp_anchor.pb.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:intl/intl.dart';

/// 人员变更
class AnchorTaskUserModify extends StatefulWidget {
  const AnchorTaskUserModify({super.key});

  @override
  State<StatefulWidget> createState() {
    return AnchorTaskUserModifyState();
  }

  static Future show(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const AnchorTaskUserModify(),
      settings: const RouteSettings(name: '/AnchorTaskUserModify'),
    ));
  }
}

class AnchorTaskUserModifyState extends State<AnchorTaskUserModify> {
  late AnchorTaskUserModifyRepository _repository;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _repository = AnchorTaskUserModifyRepository(setErrorMsg);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.profile_user_modify),
      body: LoadingMoreList(
        ListConfig<AnchorUserChangeItem>(
          itemBuilder: _itemBuilder, sourceList: _repository,
          indicatorBuilder: _indicatorBuilder, //isLastOne: false
        ),
      ),
    );
  }

  setErrorMsg(String error) {
    _errorMessage = error;
  }

  Widget _itemBuilder(
      BuildContext context, AnchorUserChangeItem item, int index) {
    return GestureDetector(
      onTap: () {
        IPersonalDataManager manager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        manager.openImageScreen(context, item.uid);
      },
      child: Container(
        height: 142,
        width: Util.width - 32,
        margin: const EdgeInsetsDirectional.only(
            top: 8, bottom: 4, start: 16, end: 16),
        padding: const EdgeInsetsDirectional.only(start: 16, top: 16, end: 18),
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
            /// 基础信息
            Row(
              children: [
                CommonAvatar(
                  size: 40,
                  shape: BoxShape.circle,
                  path: item.icon,
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: Util.width - 175),
                  child: Text(
                    item.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: R.color.mainTextColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                UserVipWidget(
                  vip: item.vip,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),

            /// 原因
            Row(
              children: [
                Text(
                  K.profile_user_modify_reason,
                  style: TextStyle(
                    fontSize: 12,
                    color: R.color.mainTextColor.withOpacity(0.5),
                    height: 1.2,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    item.reason,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: R.color.mainTextColor,
                      height: 1.2,
                    ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),

            /// 时间
            Row(
              children: [
                const SizedBox(
                  width: 4,
                ),
                SizedBox(
                  width: (Util.width - 72) / 2,
                  child: Text(
                    item.opText,
                    style: TextStyle(
                      fontSize: 12,
                      color: R.color.mainTextColor.withOpacity(0.5),
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
                const Spacer(),
                Text(
                  K.profile_transfer_time,
                  style: TextStyle(
                    fontSize: 12,
                    color: R.color.mainTextColor.withOpacity(0.5),
                    height: 1.2,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  getTransferTime(item.opTime),
                  style: TextStyle(
                    fontSize: 12,
                    color: R.color.mainTextColor.withOpacity(0.5),
                    height: 1.2,
                  ),
                  maxLines: 1,
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
      return const LoadingFooter(
        hasMore: true,
      );
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const LoadingFooter(hasMore: false);
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: _errorMessage,
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

typedef ErrorCallback = Function(String url);

class AnchorTaskUserModifyRepository
    extends LoadingMoreBase<AnchorUserChangeItem> {
  ErrorCallback onError;
  int _page = 1;
  bool _hasMore = true;

  AnchorTaskUserModifyRepository(this.onError);

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
    ResAnchorUserChangeList res;
    onError('');
    try {
      String url = 'go/yy/anchor/changeList?page=$_page';
      try {
        XhrResponse response =
            await Xhr.get('${System.domain}$url', throwOnError: true, pb: true);
        res = ResAnchorUserChangeList.fromBuffer(response.bodyBytes);
      } catch (e) {
        res = ResAnchorUserChangeList(success: false, msg: e.toString());
      }
      if (res.success == false && Util.validStr(res.msg)) {
        onError(res.msg);
      }
      if (Util.validList(res.data.user) && _page == 1) {
        clear();
      }
      bool hasData = Util.validList(res.data.user);
      _hasMore = hasData && res.hasMore;
      if (hasData) {
        addAll(res.data.user);
        _page++;
      }
      isSuccess = true;
    } catch (e) {
      Log.d(e);
      isSuccess = false;
    }
    return isSuccess;
  }
}

import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:intl/intl.dart';
import '../../k.dart';
import '../model/pb/generated/slp_anchor.pb.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';

/// 主播任务平台：用户子Tab页
class AnchorTaskUserSubPage extends StatefulWidget {
  final String filter;
  final List<AnchorSubTab> anchorSubFilter;
  final bool showDateFilter;

  const AnchorTaskUserSubPage({
    super.key,
    required this.filter,
    required this.anchorSubFilter,
    required this.showDateFilter,
  });

  @override
  State<StatefulWidget> createState() {
    return AnchorTaskUserSubState();
  }
}

class AnchorTaskUserSubState extends State<AnchorTaskUserSubPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late AnchorTaskUserSubRepository _repository;
  Map<String, int> selectFilter = {};
  int beginTime = 0;
  int endTime = 0;
  late AnimationController timeFilterAniController;
  String? _errorMessage;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    timeFilterAniController = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);
    bool hasSelectFirst = false;

    /// 默认选择第一个
    for (AnchorSubTab filter in widget.anchorSubFilter) {
      selectFilter[filter.filter] = hasSelectFirst ? 0 : 1;
      hasSelectFirst = true;
    }
    if (widget.showDateFilter) {
      DateTime today = DateTime.now();

      /// 当天的23：59：59，
      endTime = DateTime(today.year, today.month, today.day, 23, 59, 59)
              .millisecondsSinceEpoch ~/
          1000;

      /// 6天前的00：00：00，恰好一周的时间
      DateTime lastWeek = today.subtract(const Duration(days: 6));
      beginTime = DateTime(lastWeek.year, lastWeek.month, lastWeek.day, 0, 0, 0)
              .millisecondsSinceEpoch ~/
          1000;
    }
    _repository = AnchorTaskUserSubRepository(
      filter: widget.filter,
      onError: setErrorMsg,
      showDateFilter: widget.showDateFilter,
    );
    _repository.selectFilter = selectFilter;
    _repository.beginTime = beginTime;
    _repository.endTime = endTime;
  }

  @override
  void dispose() {
    timeFilterAniController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 44,
          width: Util.width,
          child: renderTab(),
        ),
        Expanded(
          child: Stack(
            children: [
              LoadingMoreList(
                ListConfig<AnchorUserItem>(
                  itemBuilder: _itemBuilder, sourceList: _repository,
                  indicatorBuilder: _indicatorBuilder, //isLastOne: false
                ),
              ),
              if (widget.showDateFilter)
                SizeTransition(
                  sizeFactor: timeFilterAniController,
                  axis: Axis.vertical,
                  axisAlignment: -1,
                  child: renderTimeFilter(),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget renderTab() {
    if (!widget.showDateFilter) {
      return renderFilters();
    }
    return Row(
      children: [
        Expanded(child: renderFilters()),
        GestureDetector(
          onTap: onTimeFilterTap,
          behavior: HitTestBehavior.opaque,
          child: SizedBox(
            width: 65,
            height: 44,
            child: Row(
              children: [
                const Spacer(),
                Text(
                  K.profile_filter,
                  style: TextStyle(
                    fontSize: 12,
                    color: R.color.secondTextColor,
                    height: 1.1,
                  ),
                ),
                const SizedBox(width: 2),
                SizedBox(
                  width: 6,
                  height: 4,
                  child: CustomPaint(
                    painter: TrianglePainter(R.color.secondTextColor),
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }

  bool hasShowTimeFilter = false;
  int lastTapTime = 0;

  void onTimeFilterTap() {
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now - lastTapTime < 300) {
      return;
    }
    lastTapTime = now;
    if (hasShowTimeFilter) {
      timeFilterAniController.reverse();
    } else {
      timeFilterAniController.forward();
    }
    hasShowTimeFilter = !hasShowTimeFilter;
  }

  Widget renderTimeFilter() {
    return GestureDetector(
      onTap: onTimeFilterTap,
      child: Container(
        width: Util.width,
        height: 120,
        decoration: BoxDecoration(
          color: R.color.mainBgColor,
          borderRadius: const BorderRadiusDirectional.only(
            bottomStart: Radius.circular(16),
            bottomEnd: Radius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                const SizedBox(width: 20),
                SizedBox(
                  width: 71,
                  child: Text(
                    K.profile_expose_date,
                    style: TextStyle(
                      fontSize: 13,
                      color: R.color.secondTextColor,
                      height: 1.1,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onBeginTimeTap,
                  child: Container(
                    width: 180,
                    height: 36,
                    padding:
                        const EdgeInsetsDirectional.only(top: 7, start: 12),
                    decoration: BoxDecoration(
                      color: R.color.secondBgColor,
                      borderRadius: BorderRadiusDirectional.circular(8),
                    ),
                    child: Text(
                      formatDate(beginTime),
                      style: TextStyle(
                        fontSize: 16,
                        color: R.color.secondTextColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const SizedBox(
                  width: 91,
                ),
                GestureDetector(
                  onTap: onEndTimeTap,
                  child: Container(
                    width: 180,
                    height: 36,
                    padding:
                        const EdgeInsetsDirectional.only(top: 7, start: 12),
                    decoration: BoxDecoration(
                      color: R.color.secondBgColor,
                      borderRadius: BorderRadiusDirectional.circular(8),
                    ),
                    child: Text(
                      formatDate(endTime),
                      style: TextStyle(
                        fontSize: 16,
                        color: R.color.secondTextColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String formatDate(int second) {
    var formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(DateTime.fromMillisecondsSinceEpoch(second * 1000));
  }

  void onBeginTimeTap() {
    selectTime(isBegin: true);
  }

  void onEndTimeTap() {
    selectTime(isBegin: false);
  }

  void selectTime({bool isBegin = true}) {
    DateTime min;
    DateTime max;
    DateTime today = DateTime.now();
    DateTime initDate;
    if (isBegin) {
      min = today.subtract(const Duration(days: 60));
      max = DateTime.fromMillisecondsSinceEpoch(endTime * 1000);
      initDate = DateTime.fromMillisecondsSinceEpoch(beginTime * 1000);
    } else {
      min = DateTime.fromMillisecondsSinceEpoch(beginTime * 1000);
      max = today;
      initDate = DateTime.fromMillisecondsSinceEpoch(endTime * 1000);
    }
    DatePicker.showDatePicker(
      context,
      pickerTheme: DateTimePickerTheme(
        backgroundColor: R.color.secondBgColor,
        cancel: Text(
          BaseK.K.cancel,
          style: TextStyle(
            color: R.color.secondTextColor,
            fontSize: 17,
            fontFamily: Util.fontFamily,
            fontWeight: FontWeight.normal,
          ),
        ),
        confirm: Text(
          BaseK.K.sure,
          style: TextStyle(
            color: R.color.mainBrandColor,
            fontSize: 17,
            fontFamily: Util.fontFamily,
            fontWeight: FontWeight.normal,
          ),
        ),
        itemTextStyle: TextStyle(color: R.color.mainTextColor, fontSize: 15),
        itemHeight: 40,
      ),
      minDateTime: min,
      maxDateTime: max,
      initialDateTime: initDate,
      onConfirm: (DateTime dateTime, List<int> selectedIndex) async {
        if (isBegin) {
          beginTime =
              DateTime(dateTime.year, dateTime.month, dateTime.day, 0, 0, 0)
                      .millisecondsSinceEpoch ~/
                  1000;
          _repository.setBeginTime(beginTime);
        } else {
          endTime =
              DateTime(dateTime.year, dateTime.month, dateTime.day, 23, 59, 59)
                      .millisecondsSinceEpoch ~/
                  1000;
          _repository.setEndTime(endTime);
        }
        if (mounted) {
          setState(() {});
        }
      },
    );
  }

  Widget renderFilters() {
    return ListView.builder(
      itemCount: widget.anchorSubFilter.length,
      itemBuilder: (BuildContext context, int index) {
        return renderFilter(index);
      },
      itemExtent: 74,
      padding: const EdgeInsetsDirectional.only(top: 8, bottom: 8, start: 20),
      scrollDirection: Axis.horizontal,
    );
  }

  Widget renderFilter(int index) {
    AnchorSubTab item = widget.anchorSubFilter[index];
    return GestureDetector(
      onTap: () {
        onFilterTap(item.filter);
      },
      child: Container(
        width: 68,
        height: 28,
        margin: const EdgeInsetsDirectional.only(end: 6),
        decoration: BoxDecoration(
          color: R.color.secondBgColor,
          borderRadius: BorderRadiusDirectional.circular(14),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          item.name,
          style: TextStyle(
            fontSize: 13,
            fontWeight: selectFilter[item.filter] == 1
                ? FontWeight.w500
                : FontWeight.w400,
            color: selectFilter[item.filter] == 1
                ? R.color.mainBrandColor
                : R.color.secondTextColor,
          ),
        ),
      ),
    );
  }

  int lastClickTime = 0;

  void onFilterTap(String filter) {
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now - lastClickTime < 500) {
      return;
    }
    lastClickTime = now;
    selectFilter[filter] = selectFilter[filter] == 1 ? 0 : 1;
    _repository.setSelectFilter(selectFilter);
    if (mounted) {
      setState(() {});
    }
  }

  setErrorMsg(String error) {
    _errorMessage = error;
  }

  Widget _itemBuilder(BuildContext context, AnchorUserItem item, int index) {
    bool inRoom = item.rid > 0;

    /// 房间曝光/转化
    return GestureDetector(
      onTap: () {
        IPersonalDataManager manager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        manager.openImageScreen(context, item.uid,
            refer: const PageRefer('gsPlatform'));
        Tracker.instance.track(TrackEvent.click,
            properties: {'click_page': 'gsPlatformUserCard'});
      },
      child: Container(
        height: inRoom ? 134 : 120,
        width: Util.width - 32,
        margin: const EdgeInsetsDirectional.only(
            top: 5, bottom: 5, start: 16, end: 16),
        padding: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 10),
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
                const SizedBox(width: 8),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          constraints:
                              BoxConstraints(maxWidth: Util.width - 232),
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
                        const SizedBox(width: 5),
                        UserVipWidget(
                          vip: item.vip,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          getOnlineStr(item),
                          style: TextStyle(
                              fontSize: 11,
                              color: R.color.fourthBrightColor,
                              height: 1.1),
                        ),
                      ],
                    ),
                    const SizedBox(height: 1),
                    buildTags(item),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 9),

            /// 得分
            Row(
              children: [
                SizedBox(
                  width: (Util.width - 64) / 2,
                  child: Row(
                    children: [
                      Text(
                        K.profile_anchor_task_score_behavior,
                        style: TextStyle(
                          fontSize: 12,
                          color: R.color.mainTextColor.withOpacity(0.5),
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '+${item.addBehaviorCredit}',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: R.color.mainBrandColor,
                              height: 1.2),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                /*Container(
                  width: 0.5,
                  height: 12,
                  color: R.color.thirdTextColor,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  K.profile_anchor_task_score_result,
                  style: TextStyle(
                    fontSize: 12,
                    color: R.color.mainTextColor.withOpacity(0.5),
                    height: 1.2,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    '+${item.addResultCredit}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: R.color.mainBrandColor,
                      height: 1.2,
                    ),
                    maxLines: 1,
                  ),
                ),*/
              ],
            ),
            const SizedBox(height: 11),

            /// 房间信息 if (inRoom)
            Row(
              children: [
                SizedBox(
                  width: (Util.width - 64) / 2,
                  child: Row(
                    children: [
                      Text(
                        K.profile_transfer_room_id,
                        style: TextStyle(
                          fontSize: 12,
                          color: R.color.mainTextColor.withOpacity(0.5),
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          '${item.rid}',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: R.color.mainTextColor,
                            height: 1.2,
                          ),
                          maxLines: 1,
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
                const SizedBox(
                  width: 16,
                ),
                Text(
                  K.profile_transfer_time,
                  style: TextStyle(
                    fontSize: 12,
                    color: R.color.mainTextColor.withOpacity(0.5),
                    height: 1.2,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    getTransferTime(item.ridAddTime),
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: R.color.mainTextColor,
                      height: 1.2,
                    ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTags(AnchorUserItem item) {
    if (!Util.validStr(item.datelineDiff) && !Util.validList(item.tags)) {
      return const SizedBox(
        height: 20,
      );
    }
    List<String> tags = [];
    if (Util.validStr(item.datelineDiff)) {
      tags.add(item.datelineDiff);
    }
    if (Util.validList(item.tags)) {
      tags.addAll(item.tags);
    }
    return SizedBox(
      width: Util.width - 112,
      height: 20,
      child: ListView.builder(
        itemCount: tags.length,
        itemBuilder: (BuildContext context, int index) {
          String tag = tags[index];
          return renderTag(tag);
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget renderTag(String tag) {
    return Container(
      height: 20,
      margin: const EdgeInsetsDirectional.only(end: 5),
      padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(6),
        color: const Color(0x192ECEFE),
      ),
      alignment: AlignmentDirectional.center,
      child: Text(
        tag,
        style: const TextStyle(
          fontSize: 10,
          color: Color(0xFF2ECEFE),
          height: 1.1,
        ),
      ),
    );
  }

  String getOnlineStr(AnchorUserItem item) {
    if (item.onlineStatus > 0) {
      return BaseK.K.base_current_online;
    }
    return Utility.getDateDiff(item.onlineDatelineDiff);
  }

  String getTransferTime(int time) {
    DateFormat format = DateFormat('yyyy.MM.dd');
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

typedef ErrorCallback = Function(String error);

class AnchorTaskUserSubRepository extends LoadingMoreBase<AnchorUserItem> {
  final String filter;
  final bool showDateFilter;
  final ErrorCallback onError;
  int _page = 1;
  bool _hasMore = true;
  Map<String, int> selectFilter = {};
  int beginTime = 0;
  int endTime = 0;

  AnchorTaskUserSubRepository(
      {required this.filter,
      required this.onError,
      required this.showDateFilter});

  void setBeginTime(int time) {
    beginTime = time;
    refresh(true);
  }

  void setEndTime(int time) {
    endTime = time;
    refresh(true);
  }

  void setSelectFilter(Map<String, int> select) {
    selectFilter = select;
    refresh(true);
  }

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
    ResAnchorUserList res;
    onError('');
    try {
      String url = 'go/yy/anchor/user?type=$filter&page=$_page';
      try {
        selectFilter.forEach((key, value) {
          url = '$url&$key=$value';
        });
        if (showDateFilter) {
          url = '$url&tss=$beginTime&tse=$endTime';
        }
        XhrResponse response =
            await Xhr.get('${System.domain}$url', throwOnError: true, pb: true);
        res = ResAnchorUserList.fromBuffer(response.bodyBytes);
      } catch (e) {
        res = ResAnchorUserList(success: false, msg: e.toString());
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

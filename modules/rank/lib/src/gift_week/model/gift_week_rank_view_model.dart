import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:rank/src/gift_week/gift_week_api.dart';
import 'package:rank/src/model/pb/generated/gift_week.pb.dart';

class GiftWeekRankViewModelState {
  /// 房间id
  int? rid;

  /// 请求的当前的礼物排行榜配置
  GiftRankConfigRes? requestRankConfigRes;

  /// 礼物排行配置
  Map<String, GiftRankConfig> giftRankConfigMap = <String, GiftRankConfig>{};

  /// 当前排行榜类型
  int currRankType = 1;

  /// 当前选择的是本周还是上周，1 - 本周 2 - 上周
  int currWeek = 1;

  /// 当前选择礼物id
  int selectedGiftId = 0;

  /// 当前礼物的排行榜数据
  GiftRankList? currGiftRankList;

  /// 请求礼物下的排行榜数据返回结果
  GiftRankListRes? requestGiftRankListRes;

  /// 选择的礼物排行榜缓存数据
  Map<String, GiftRankList> giftRankListMap = <String, GiftRankList>{};
}

/// 礼物周星榜ViewModel
class GiftWeekRankViewModel extends ChangeNotifier {
  late GiftWeekRankViewModelState state;

  ///页面加载状态
  bool isPageLoading = true;

  /// 排行榜配置加载
  bool isRankConfigLoading = true;

  /// 礼物下的排行列表加载
  bool isGiftRankListLoading = true;

  GiftWeekRankViewModel({int? rid}) {
    state = GiftWeekRankViewModelState()..rid = rid;

    _setIsPageLoading(true);
    _loadData();
  }

  _loadData() async {
    int rankType = state.currRankType;
    actionForChangeRankType(newType: rankType);

    if (isPageLoading) {
      _setIsPageLoading(false);
    }
  }

  refreshPage() {
    _loadData();
  }

  _setIsPageLoading(bool value) {
    isPageLoading = value;
    notifyListeners();
  }

  _setConfigDataRes(int rankType, GiftRankConfigRes value) {
    state.requestRankConfigRes = value;
    if (value.success) {
      /// 缓存配置
      state.giftRankConfigMap['$rankType'] = value.data;
    }
    notifyListeners();
  }

  _setCurrentRankType(int value) {
    state.currRankType = value;
    notifyListeners();
  }

  _setCurrentWeek(int value) {
    state.currWeek = value;
    notifyListeners();
  }

  _setSelectedGiftId(int value) {
    state.selectedGiftId = value;
    notifyListeners();
  }

  _setIsRankConfigLoading(bool value) {
    isRankConfigLoading = value;
    notifyListeners();
  }

  _setShowGiftRankListLoading(bool value) {
    isGiftRankListLoading = value;
    notifyListeners();
  }

  _setGiftRankListRes(int giftId, GiftRankListRes value) {
    state.requestGiftRankListRes = value;
    if (value.success) {
      /// 将数据缓存
      state.giftRankListMap['$giftId'] = value.data;
    }
    notifyListeners();
  }

  actionForShowRuleWebPage() {
    Log.d('打开规则说明页面');

    if (state.requestRankConfigRes != null &&
        state.requestRankConfigRes!.success) {
      if (!Util.isNullOrEmpty(state.requestRankConfigRes?.data.ruleUrl)) {
        String url = state.requestRankConfigRes!.data.ruleUrl;
        url =
            '$url?package=${Constant.packageName}&lan=${Translations.getLan()}&ch=${Uri.encodeComponent(DeviceInfo.channel)}';
        BaseWebviewScreen.show(System.context, url: url);
      }
    }
  }

  int currRankType() {
    return state.currRankType;
  }

  /// 切换显示排行榜配置
  actionForChangeRankType({int? newType}) async {
    var rankType = newType;
    if (rankType != null) {
      _setCurrentRankType(rankType);
    } else {
      rankType = state.currRankType;
    }

    /// 先看本地是否有缓存
    final cachedData = state.giftRankConfigMap['$rankType'];
    if (cachedData == null) {
      _setIsRankConfigLoading(true);
    }

    /// 请求数据
    final pbRes = await GiftWeekApi.requestGiftWeekConfig(
        rid: state.rid, rankType: rankType);
    _setConfigDataRes(rankType, pbRes);

    if (pbRes.success) {
      /// 再获取本周第一个礼物的排行列表
      /// 默认展示本周
      // _setCurrentWeek(1);
      await actionForChangeWeek(1);
      // /// 默认显示第一个礼物
      // if (pbRes.data.thisWeekGifts.isNotEmpty) {
      //   await actionForChangeSelectedGiftId(giftId:pbRes.data.thisWeekGifts.first.giftId);
      // }
    }

    _setIsRankConfigLoading(false);
  }

  /// 切换本周或上周
  Future actionForChangeWeek(int? week) async {
    var week0 = week;
    if (week0 != null) {
      _setCurrentWeek(week0);
    } else {
      week0 = state.currWeek;
    }

    /// 请求当前周下的第一个礼物的数据
    List<GiftObj> weekData;
    if (week0 == 1) {
      weekData = state.requestRankConfigRes?.data.thisWeekGifts ?? [];
    } else {
      weekData = state.requestRankConfigRes?.data.lastWeekGifts ?? [];
    }

    if (weekData.isNotEmpty) {
      await actionForChangeSelectedGiftId(giftId: weekData.first.giftId);
    }
  }

  /// 切换显示礼物排行榜数据
  Future actionForChangeSelectedGiftId({int? giftId}) async {
    var giftId0 = giftId;
    if (giftId0 != null) {
      _setSelectedGiftId(giftId0);
    } else {
      giftId0 = state.selectedGiftId;
    }

    /// TODO: 请求不同礼物下的排行榜数据
    /// 先检查是否已缓存数据，若缓存了数据，则先展示缓存数据，再将请求的结果刷新
    final cacheData = state.giftRankListMap['$giftId0'];
    if (cacheData == null && Util.isCollectionEmpty(cacheData?.rankList)) {
      /// 需要展示礼物列表Loading Widget
      _setShowGiftRankListLoading(true);
    } else {
      _setShowGiftRankListLoading(false);
    }

    /// 请求网络数据
    final pbRes = await GiftWeekApi.requestGiftRankData(
        rid: state.rid,
        giftId: giftId0,
        duration: state.currWeek,
        rankType: state.currRankType);
    _setGiftRankListRes(giftId0, pbRes);

    /// 刷新UI
    _setShowGiftRankListLoading(false);
  }
}

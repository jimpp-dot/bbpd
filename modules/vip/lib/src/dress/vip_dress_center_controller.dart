import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:vip/src/dress/model/vip_dress_model_ext.dart';

import 'model/vip_dress_repo.dart';

export 'package:get/get.dart';
export 'package:vip/src/dress/model/vip_dress_model_ext.dart';

class VipDressCateData {
  final int cateId;
  ScrollController? scrollController;
  LoadMoreListSource? source;

  /// 装扮详情区，当前选中的装扮
  PretendGroupDetail? _currentDress;

  /// 当前选中的装扮形态（星级、性别）
  PretendInfo? currentDressState;

  // 当前选中的性别switch
  bool _currentMale = true;

  VipDressCateData(this.cateId);

  /// 已解锁
  bool get currentLocked {
    return !(currentDress?.groupInfo.isHas ?? false);
  }

  /// 永久的
  bool get currentPermanent {
    return (currentDress?.groupInfo.periodEnd ?? 0) == 0;
  }

  /// 已过期
  bool get currentExpired {
    if (currentDress?.groupInfo == null) {
      return false;
    }
    return currentDress!.isExpired;
  }

  /// 使用中
  bool get currentUsing {
    if (currentExpired) {
      return false;
    }
    return (currentDress?.groupInfo.isUse ?? false) && currentDress?.groupInfo.useStarNum == currentDressState?.starNum;
  }

  /// 可升级
  bool get nextCanLevelUp {
    // 当前选中的已拥有的装扮的下一级是可升级，视为可升级
    if (currentDress == null || currentDressState == null || currentDress!.groupInfo.isHas == false) {
      return false;
    }

    if (currentDressState!.starNum == 3) {
      // 当前选中的三星，没有下个等级，不显示升级
      return false;
    }

    int nextLevel = currentDressState!.starNum + 1;
    PretendInfo? nextState = currentDress!.itemFor(nextLevel, currentMale);
    if (nextState == null) {
      return false;
    }
    return nextState.isLock;
  }

  PretendGroupDetail? get currentDress {
    return _currentDress;
  }

  set currentDress(PretendGroupDetail? dress) {
    if (_currentDress != dress) {
      _currentDress = dress;
      refreshCurrentDressState();
    }
  }

  bool get currentMale {
    return _currentMale;
  }

  set currentMale(bool male) {
    if (_currentMale != male) {
      _currentMale = male;
      refreshCurrentDressState();
    }
  }

  void refreshCurrentDressState() {
    PretendInfo? usingState = currentDress!.usingState;
    if (usingState != null && (currentDress!.groupInfo.sexState == 0 || usingState.sex == (currentMale ? 1 : 2))) {
      // 选中正在使用的装扮
      currentDressState = usingState;
    } else {
      currentDressState = currentDress?.itemFoUnlockedTopStar(currentMale);
    }
  }

  Future<bool> refresh([bool notifyStateChanged = false]) async {
    bool b = await source!.refresh(notifyStateChanged);
    if (source!.isNotEmpty && currentDress == null) {
      currentDress = source!.first;
    }
    return b;
  }
}

class LoadMoreListSource extends LoadingMoreBase<PretendGroupDetail> {
  final VipDressCenterController controller;
  String? errorMsg;

  LoadMoreListSource(this.controller);

  int _pageIndex = -1;
  bool _hasMore = true;

  PretendGroupDetail? get firstItem {
    if (isNotEmpty) {
      return first;
    }
    return null;
  }

  @override
  bool get hasMore {
    return _hasMore;
  }

  @override
  void clear() {
    _hasMore = true;
    _pageIndex = -1;
    isLoading = false;
    super.clear();

    controller.refreshListHeader();
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool success;
    if (isloadMoreAction) {
      // 加载更多
      success = await _loadMore();
    } else {
      // 新加载
      _hasMore = true;
      _pageIndex = -1;
      success = await _loadMore();
    }
    return success;
  }

  Future<bool> _loadMore() async {
    return _load(_pageIndex + 1);
  }

  Future<bool> _load(int page) async {
    ResGroupList res = await VipDressRepo.getDressList(controller.currentCate?.id ?? 0, page);
    if (res.success) {
      errorMsg = null;
      // 数据充足时，一定是3的倍数，数组不足时为了显示效果补足3的倍数
      if (res.data.isNotEmpty && res.data.length % 3 != 0) {
        int addCount = 3 - res.data.length % 3;
        for (var i = 0; i < addCount; i++) {
          res.data.add(PretendGroupDetail());
        }
      }
      addAll(res.data);
      if (res.data.isNotEmpty) {
        _pageIndex = page;
      }
      _hasMore = res.data.length >= VipDressRepo.dressPageSize;
      return true;
    } else {
      errorMsg = res.msg;
      if (page == 0) {
        clear();
      }
      return false;
    }
  }
}

class VipDressCenterController extends GetxController with GetTickerProviderStateMixin {
  final int? initCateId;
  final int? initDressId;

  VipDressCenterController(this.initCateId, this.initDressId);

  static const String updateId = 'updateId';
  static const String dressUpdateId = 'dressUpdateId';
  static const String dressListUpdateId = 'dressListUpdateId';
  static const String userInfoUpdateId = 'userInfoUpdateId';

  static const String routeName = '/dress_center';

  ExtendedTabController? tabController;

  // 点击了获取跳转了，需要做标记
  bool didJumpToget = false;

  /// 我的装扮统计信息
  ResPretendMy? myRes;

  /// 分类列表
  ResPretendCateList? cateRes;

  /// 分类列表，key为分类id
  Map<int, VipDressCateData> cateDataMap = {};

  PretendCategory? get currentCate {
    return cateRes?.data[tabController?.index ?? 0];
  }

  VipDressCateData? get currentCateData {
    return cateDataMap[currentCate?.id];
  }

  double get levelUpProgress {
    if (myRes == null) {
      return 0;
    }
    PretendMyInfo my = myRes!.data.my;
    if (my.nextLevelScore == 0) {
      return my.starScore == 0 ? 0 : 1;
    }
    return min(1, my.starScore / my.nextLevelScore);
  }

  LoadMoreListSource? get currentSource {
    if (cateRes == null || tabController == null) {
      return null;
    }

    final currentCategoryId = cateRes!.data[tabController!.index].id;
    final cateData = cateDataMap[currentCategoryId];

    return cateData?.source;
  }

  @override
  void onInit() {
    super.onInit();
    eventCenter.addListener(EventConstant.EventPageChanged, onPageChanged);
  }

  @override
  void onClose() {
    tabController?.removeListener(onTabChanged);
    eventCenter.removeListener(EventConstant.EventPageChanged, onPageChanged);
    super.onClose();
  }

  @override
  onReady() {
    super.onReady();

    loadPageData();
  }

  @override
  void update([List<Object>? ids, bool condition = true]) {
    // 更新对应分类下的模块
    if (ids == null) {
      super.update(ids, condition);
      return;
    }

    List<Object>? newIds = [];
    for (var element in ids) {
      if ([updateId, userInfoUpdateId].contains(element)) {
        // 个人信息、主页面，更新所有
        newIds.add(element);
      } else {
        newIds.add('${element}_${currentCate?.id}');
      }
    }
    super.update(newIds, condition);
  }

  /// 首次加载页面整体数据
  Future loadPageData() async {
    Future(() async {
      myRes = await VipDressRepo.getMyInfo();
      update([userInfoUpdateId]);
    });

    cateRes = await VipDressRepo.getCateList();
    if (cateRes!.success) {
      if (cateRes!.data.isNotEmpty) {
        tabController = ExtendedTabController(initialIndex: 0, length: cateRes!.data.length, vsync: this);
        for (var element in cateRes!.data) {
          VipDressCateData data = VipDressCateData(element.id);
          data.scrollController = ScrollController();
          data.source = LoadMoreListSource(this);
          cateDataMap.addAll({element.id: data});
        }

        await currentCateData!.refresh(true);

        //首次加载完毕，跳转到初始化的cate，选中初始化的dress
        if (initCateId != null) {
          if (cateDataMap.containsKey(initCateId)) {
            tabController?.index = cateRes!.data.indexWhere((element) => element.id == initCateId);
            await onTabChanged();
          }
        }
        if (initDressId != null) {
          PretendGroupDetail? matchDress = currentCateData?.source?.firstWhereOrNull((element) => element.groupInfo.id == initDressId);
          if (matchDress != null) {
            currentCateData!.currentDress = matchDress;
          }
        }

        // 处理完初始tabIndex后再监听tab切换，否则会干扰加载逻辑
        tabController!.addListener(onTabChanged);
      }
    }

    update([updateId]);
  }

  void refreshListHeader() async {
    //刷新列表顶部圆角部分
    update([dressListUpdateId]);
  }

  Future onTabChanged() async {
    if (cateRes == null || cateRes!.data.isEmpty || currentCate == null) {
      return;
    }

    if (currentCateData?.source?.isEmpty ?? false) {
      await currentCateData?.refresh();

      update([dressUpdateId, dressListUpdateId]);
    }
  }

  void onPageChanged(String type, dynamic data) async {
    // 切换到当前页面时，刷新当前分类数据，获取后刷新碎片和获取状态
    String curName = appNavigatorObserver.getLast();
    if (curName == routeName && didJumpToget) {
      await Future.wait([currentCateData!.refresh(true), refreshUserInfo(false)]);
      update([updateId]);
      didJumpToget = false;
    }
  }

  void selectMale(bool male) {
    if (currentCateData?.currentMale != male) {
      currentCateData?.currentMale = male;
      update([dressUpdateId]);
    }
  }

  void selectDress(PretendGroupDetail value) {
    if (value != currentCateData?.currentDress) {
      currentCateData?.currentDress = value;
      update([dressUpdateId, dressListUpdateId]);
    }
  }

  void selectDressState(PretendInfo value) {
    if (value != currentCateData?.currentDressState) {
      currentCateData?.currentDressState = value;
      update([dressUpdateId]);
    }
  }

  /// 使用装扮
  void useOrCancelDress(bool use, LoadMoreListSource? preSource) async {
    EasyLoading.show(dismissOnTap: true);
    assert(currentCateData?.currentDressState != null);
    assert(currentCateData?.currentDress != null);

    ResPretend newResult;
    if (use) {
      LoadingMoreBase<PretendGroupDetail> source = preSource as LoadingMoreBase<PretendGroupDetail>;

      for (PretendGroupDetail item in source) {
        if (item.groupInfo.isUse) {
          await VipDressRepo.cancelDress(currentCate!.id, item.groupInfo.id);
        }
      }

      newResult = await VipDressRepo.useDress(currentCate!.id, currentCateData!.currentDress!.groupInfo.id,
          currentCateData!.currentDressState!.sex, currentCateData!.currentDressState!.starNum);
    } else {
      newResult = await VipDressRepo.cancelDress(currentCate!.id, currentCateData!.currentDress!.groupInfo.id);
    }
    if (newResult.success) {
      PretendGroupDetail newDetail = newResult.data;
      refreshDressItem(newDetail);
      loadPageData();
    } else {
      Fluttertoast.showToast(msg: newResult.msg);
    }

    update([dressUpdateId, dressListUpdateId]);
    EasyLoading.dismiss();
  }

  Future levelUpDress() async {
    EasyLoading.show(dismissOnTap: true);
    ResPretend newResult = await VipDressRepo.levelUpDress(currentCate!.id, currentCateData!.currentDress!.groupInfo.id);
    if (newResult.success) {
      PretendGroupDetail newDetail = newResult.data;
      //刷新余额
      await refreshUserInfo(false);
      refreshDressItem(newDetail);
    } else {
      Fluttertoast.showToast(msg: newResult.msg);
    }
    EasyLoading.dismiss();
  }

  /// 续费
  Future renewalDress() async {
    EasyLoading.show(dismissOnTap: true);
    ResPretend newResult = await VipDressRepo.renewalDress(
        currentCate!.id, currentCateData!.currentDress!.groupInfo.id, currentCateData!.currentDress!.groupInfo.rechargeDays);
    if (newResult.success) {
      PretendGroupDetail newDetail = newResult.data;
      //刷新余额
      await refreshUserInfo(false);
      refreshDressItem(newDetail);
    } else {
      Fluttertoast.showToast(msg: newResult.msg);
    }
    EasyLoading.dismiss();
  }

  Future refreshUserInfo(bool refresh) async {
    myRes = await VipDressRepo.getMyInfo();
    if (refresh) {
      update([userInfoUpdateId]);
    }
  }

  void refreshDressItem(PretendGroupDetail newDetail) {
    if (newDetail.hasGroupInfo()) {
      int oldIndex = currentCateData!.source!.indexWhere((element) => element.groupInfo.id == newDetail.groupInfo.id);
      if (oldIndex >= 0) {
        currentCateData!.source![oldIndex] = newDetail;
        currentCateData!.currentDress = newDetail;
      }
    }
    update([dressUpdateId, userInfoUpdateId, dressListUpdateId]);
  }
}

// |  1 | 头像框       |    1 |  1693555703 |  1693555703 |
// |  2 | 气泡框       |    2 |  1693555703 |  1693555703 |
// |  3 | 入场横幅     |    3 |  1693555703 |  1693555703 |
// |  4 | 主页装扮     |    4 |  1693555703 |  1693555703 |
// |  5 | 麦上光圈     |    5 |  1693555703 |  1693555703 |
// |  6 | 资料卡       |    6 |  1693555703 |  1693555703 |

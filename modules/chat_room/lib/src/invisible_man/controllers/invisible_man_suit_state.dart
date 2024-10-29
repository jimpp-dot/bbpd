import 'package:flutter/material.dart';
import '../models/InvisiblePckWrapper.dart';
import '../models/generated/common_invisible.pb.dart';
import '../models/left_tab_model.dart';

/// 隐形侠套装状态
class InvisibleManSuitState {
  /// 隐形侠落地页数据
  InvisibleData? data;

  /// 推荐套餐数据
  InvisiblePckWrapper? recommendData;

  /// 是否选择了切换购买权益，默认为false
  bool isSelectedSwitchBuyAuthority = false;

  /// 切换购买权益包数据
  InvisibleItem? selectBuyAuthorityItem;

  /// 是否选中了底部"已选"按钮，默认为false
  bool isSelectedBottomBuyButton = false;

  /// 开启身份开关
  ValueNotifier<bool> switchController = ValueNotifier<bool>(true);

  /// 套餐+权益包 数据
  List<InvisiblePckWrapper> invisibleList = [];

  /// 套餐+权益包 GlobalKeys
  List<GlobalKey> invisibleItemKeys = [];

  /// 选中的套餐的总价格
  int totalPrice = 0;

  /// 选中的套餐的数量
  int totalNum = 0;

  /// 将要购买的套餐包数据
  List<InvisiblePckWrapper> willBuyInvisibleList = [];

  /// tab切换数据
  List<LeftTabModel> tabs = [];

  /// 第一个权益包的位置y
  double onePackageDy = 0.0;

  /// 最后一次选中tab的索引
  int lastSelectTabIndex = 0;

  /// 切换购买权益banner视图Key，用于定位视图的位置
  GlobalKey switchBuyAuthorityContainerKey = GlobalKey();

  InvisibleManSuitState() {
    ///Initialize variables
  }
}

import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:get/get.dart';

import '../../../k.dart';
import '../entity/invisible_open_request_entity.dart';
import '../models/InvisiblePckWrapper.dart';
import '../models/generated/common_invisible.pb.dart';
import '../providers/invisible_man_suit_repository.dart';
import 'invisible_man_suit_state.dart';
import '../models/left_tab_model.dart';

/// 隐形侠套控制器
class InvisibleManSuitController extends GetxController {
  final InvisibleManSuitRepository repository;

  InvisibleManSuitController({required this.repository});

  final state = InvisibleManSuitState();

  final IPayManager _payManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
  final Debounce submitDebounce =
      Debounce(duration: const Duration(milliseconds: 1000));

  ScrollController listScrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    loadData();
    state.tabs.add(LeftTabModel(tab: K.room_set_menu, selected: true));
    state.tabs.add(LeftTabModel(tab: K.room_interest_package, selected: false));
    addSwitchControllerListener();
  }

  @override
  void onClose() {
    state.switchController.dispose();
    listScrollController.dispose();
    submitDebounce.dispose();
    super.onClose();
  }

  /// 点击空白区域关闭弹框
  void onBackgroundTapped() {
    state.isSelectedSwitchBuyAuthority = false;
    state.isSelectedBottomBuyButton = false;
    update();
  }

  void onShopCartContainerTapped() {
    state.isSelectedBottomBuyButton = !state.isSelectedBottomBuyButton;
    update();
  }

  /// 数据请求
  void loadData() async {
    ResInvisible resp = await repository.sendInvisibleIndexRequest();
    if (resp.success == true && resp.hasData()) {
      // 落地页数据
      state.data = resp.data;

      // 组装推荐套餐数据：如果没有我的权益包就会走推荐购买套餐；如果有了我的权益包，重置推荐购买套餐数据
      if (!Util.validList(resp.data.myInvisibleList) &&
          Util.validList(resp.data.invisibleList)) {
        for (InvisiblePck item in resp.data.invisibleList) {
          if (item.id == resp.data.defaultPackId) {
            state.recommendData = InvisiblePckWrapper(pck: item, num: 1);
            break;
          }
        }
      } else {
        state.recommendData = null;
      }

      // 组装切换购买权益包数据
      if (Util.validList(resp.data.myInvisibleList)) {
        InvisibleItem? item = state.data?.myInvisibleList[0];
        state.selectBuyAuthorityItem = item;
        state.switchController.value = item?.isOpen ?? false;
      }

      // 组装套餐+权益包数据
      state.invisibleList.clear();
      state.invisibleItemKeys.clear();
      if (Util.validList(resp.data.invisibleList)) {
        for (InvisiblePck item in resp.data.invisibleList) {
          state.invisibleList.add(InvisiblePckWrapper(pck: item, num: 0));
          state.invisibleItemKeys.add(GlobalKey());
        }
      }

      // 重置数据
      state.totalPrice = 0;
      state.totalNum = 0;

      // 如果有推荐购买套餐，则默认选中推荐购买套餐
      if (state.recommendData != null && Util.validList(state.invisibleList)) {
        for (int i = 0; i < state.invisibleList.length; i++) {
          InvisiblePckWrapper item = state.invisibleList[i];
          if (state.recommendData?.pck.id == item.pck.id) {
            onAddTapped(i);
            break;
          }
        }
      }

      update();
    } else if (Util.validStr(resp.msg)) {
      Fluttertoast.showCenter(msg: resp.msg);
    }
  }

  /// 选择切换购买权益事件
  void onSelectSwitchBuyAuthorityTapped() {
    state.isSelectedSwitchBuyAuthority = !state.isSelectedSwitchBuyAuthority;
    update();
  }

  /// 选择切换购买权益事件
  void onSelectBuyAuthorityItem(int index) {
    InvisibleItem? item = state.data?.myInvisibleList[index];
    state.selectBuyAuthorityItem = item;
    state.switchController.value = item?.isOpen ?? false;
    onSelectSwitchBuyAuthorityTapped();
  }

  /// 选择底部已选按钮
  void onBottomBuyButtonTapped() {
    if (state.totalNum <= 0) return;
    state.isSelectedBottomBuyButton = !state.isSelectedBottomBuyButton;
    update();
  }

  /// 购买逻辑
  void onBuy(List<InvisiblePckWrapper> items) {
    int totalPrice = 0;
    List<Map<String, int>> pcks = [];
    for (InvisiblePckWrapper item in items) {
      totalPrice += (item.pck.price * item.num);
      pcks.add({'pck_id': item.pck.id, 'num': item.num});
    }
    _payManager.pay(
      System.context,
      key: 'gift',
      type: 'available',
      refer: 'gift',
      args: {
        'money': totalPrice,
        'type': 'slp-consume',
        'params': {
          'consume_type': 'buy-invisible',
          'pck': pcks,
        }
      },
      onPayed: () => _onPayed(),
      onError: (isErrorCatch) => _onPayError(isErrorCatch),
    );
  }

  void _onPayed() async {
    if (state.isSelectedBottomBuyButton) {
      state.isSelectedBottomBuyButton = false;
      update();
    }
    Fluttertoast.showCenter(msg: K.room_buy_success);
    loadData();
  }

  void _onPayError(bool isErrorCatch) {}

  /// 开启身份开关
  void addSwitchControllerListener() {
    state.switchController.addListener(() {
      bool value = state.switchController.value;
      if (state.selectBuyAuthorityItem == null) return;
      Future.delayed(const Duration(milliseconds: 200), () async {
        InvisibleOpenRequestEntity entity = InvisibleOpenRequestEntity();
        entity.invisibleId = state.selectBuyAuthorityItem?.id;
        entity.isOpen = value ? 1 : 0;
        NormalNull resp = await repository.sendInvisibleOpenRequest(entity);
        if (resp.success) {
          if (Util.validList(state.data?.myInvisibleList)) {
            for (int i = 0;
                i < (state.data?.myInvisibleList.length ?? 0);
                i++) {
              InvisibleItem? item = state.data?.myInvisibleList[i];
              if (state.selectBuyAuthorityItem?.id == item?.id) {
                item?.isOpen = value;
              }
            }
          }
          // Fluttertoast.showCenter(msg: K.room_set_success);
        } else if (Util.validStr(resp.msg)) {
          Fluttertoast.showCenter(msg: resp.msg);
        }
      });
    });
  }

  /// 添加
  void onAddTapped(int index) {
    InvisiblePckWrapper item = state.invisibleList[index];
    item.num += 1;
    if (Util.validList(state.invisibleList)) {
      int price = 0;
      int num = 0;
      state.willBuyInvisibleList.clear();
      for (InvisiblePckWrapper item in state.invisibleList) {
        if (item.num > 0) {
          price += item.pck.price * item.num;
          num += item.num;
          state.willBuyInvisibleList.add(item);
        }
      }
      state.totalPrice = price;
      state.totalNum = num;
    }
    update();
  }

  /// 删除
  void onDeleteTapped(int index) {
    InvisiblePckWrapper item = state.invisibleList[index];
    item.num -= 1;
    if (item.num < 0) {
      item.num = 0;
    }
    if (Util.validList(state.invisibleList)) {
      int price = 0;
      int num = 0;
      state.willBuyInvisibleList.clear();
      for (InvisiblePckWrapper item in state.invisibleList) {
        if (item.num > 0) {
          price += item.pck.price * item.num;
          num += item.num;
          state.willBuyInvisibleList.add(item);
        }
      }
      state.totalPrice = price;
      state.totalNum = num;
    }
    update();
  }

  /// 已选添加
  void onShopCartAddTapped(int index) {
    InvisiblePckWrapper willBuyItem = state.willBuyInvisibleList[index];
    willBuyItem.num += 1;
    if (Util.validList(state.invisibleList)) {
      int price = 0;
      int num = 0;
      for (InvisiblePckWrapper item in state.invisibleList) {
        if (item.pck.id == willBuyItem.pck.id) {
          item.num = willBuyItem.num;
        }
        if (item.num > 0) {
          price += item.pck.price * item.num;
          num += item.num;
        }
      }
      state.totalPrice = price;
      state.totalNum = num;
    }
    update();
  }

  /// 已选删除
  void onShopCartDeleteTapped(int index) {
    InvisiblePckWrapper willBuyItem = state.willBuyInvisibleList[index];
    willBuyItem.num -= 1;

    if (Util.validList(state.invisibleList)) {
      int price = 0;
      int num = 0;
      for (InvisiblePckWrapper item in state.invisibleList) {
        if (item.pck.id == willBuyItem.pck.id) {
          item.num = willBuyItem.num;
        }
        if (item.num > 0) {
          price += item.pck.price * item.num;
          num += item.num;
        }
      }
      state.totalPrice = price;
      state.totalNum = num;
    }

    if (willBuyItem.num <= 0) {
      state.willBuyInvisibleList.removeAt(index);
    }

    if (!Util.validList(state.willBuyInvisibleList) &&
        state.isSelectedBottomBuyButton) {
      state.isSelectedBottomBuyButton = false;
    }

    state.willBuyInvisibleList.sort((a, b) => a.pck.id.compareTo(b.pck.id));

    update();
  }

  /// 底部购买
  void onPay() {
    if (state.totalNum <= 0) {
      return;
    }
    List<InvisiblePckWrapper> buyList = [];
    buyList.addAll(state.invisibleList);
    buyList.retainWhere((element) => element.num > 0);
    onBuy(buyList);
  }

  String getInvisibleNames(InvisiblePckWrapper item) {
    String names = '';
    if (Util.validList(item.pck.invisibleList)) {
      for (int i = 0; i < item.pck.invisibleList.length; i++) {
        InvisibleItem element = item.pck.invisibleList[i];
        names += element.name;
        if (i < item.pck.invisibleList.length - 1) {
          names += '、';
        }
      }
    }
    return names;
  }

  /// 点击切换左边tab
  void onSwitchTab(int index) {
    if (state.lastSelectTabIndex == index) return;
    state.lastSelectTabIndex = index;
    state.tabs.clear();
    state.tabs.add(LeftTabModel(
        tab: K.room_set_menu, selected: index == 0 ? true : false));
    state.tabs.add(LeftTabModel(
        tab: K.room_interest_package, selected: index == 1 ? true : false));
    state.onePackageDy = 0.0;
    for (int i = 0; i < state.invisibleList.length; i++) {
      InvisiblePckWrapper item = state.invisibleList[i];
      if (item.pck.pckType == 2) {
        GlobalKey key = state.invisibleItemKeys[i];
        if (key.currentContext != null) {
          RenderBox renderBox =
              key.currentContext?.findRenderObject() as RenderBox;
          state.onePackageDy += renderBox.size.height;
        }
      }
    }
    if (listScrollController.hasClients) {
      listScrollController.animateTo(index == 0 ? 0.0 : state.onePackageDy,
          duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
    }
    update();
  }

  double getSwitchBuyAuthorityContainerDx() {
    if (state.switchBuyAuthorityContainerKey.currentContext == null) return 0.0;
    RenderBox renderBox = state.switchBuyAuthorityContainerKey.currentContext
        ?.findRenderObject() as RenderBox;
    Offset localToGlobal = renderBox.localToGlobal(Offset.zero);
    return localToGlobal.dx;
  }

  double getSwitchBuyAuthorityContainerDy() {
    if (state.switchBuyAuthorityContainerKey.currentContext == null) return 0.0;
    RenderBox renderBox = state.switchBuyAuthorityContainerKey.currentContext
        ?.findRenderObject() as RenderBox;
    Offset localToGlobal = renderBox.localToGlobal(Offset.zero);
    return localToGlobal.dy;
  }
}

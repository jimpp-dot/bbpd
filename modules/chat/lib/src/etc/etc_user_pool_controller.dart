import 'package:chat/k.dart';
import 'package:chat/src/model/pbModel/generated/ka_touch.pb.dart';
import 'package:chat/src/etc/quick_reply_etc_panel.dart';
import 'package:chat/src/quick_reply/model/quick_reply_model.dart';
import 'package:chat/src/repo/etc_repo.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'etc_controller_key.dart';

class ETCUserPoolController extends GetxController
    with GetSingleTickerProviderStateMixin {
  /// 所有用户数据
  final Map<int, List<KaTouchPoolUser>> _userData = {};

  /// 已选中的用户
  final List<int> _selectedUid = [];

  /// 建联用户池子列表
  List<KaTouchTab>? _tabList;

  List<KaTouchTab> get tabs => _tabList ?? [];

  /// 空数据提示
  String _emptyTip = '';

  String get emptyTip => _emptyTip;

  ScreenStatus _screenStatus = ScreenStatus.Loading;

  ScreenStatus get screenStatus => _screenStatus;

  TabController? _tabController;

  List<QuickReply>? _cacheTagList;

  TabController get tabController {
    if (_tabController == null) {
      _tabController = TabController(length: tabs.length, vsync: this);
      _tabController!.addListener(() {
        if (_tabController!.indexIsChanging) {
          return;
        }
        int tabId = tabs[_tabController!.index].id; // 当前选中tabId
        if (!_userData.containsKey(tabId)) {
          loadData(tabId: tabId, showLoading: false);
        }
        if (_selectable) {
          changeSelectable();
        }
      });
    }
    return _tabController!;
  }

  @override
  void onInit() {
    super.onInit();
    loadData(showLoading: false);
  }

  /// 请求建联用户池数据
  void loadData({int? tabId, bool showLoading = true}) async {
    if (showLoading) {
      // 错误页面重新刷新时,需要显示加载中
      _screenStatus = ScreenStatus.Loading;
      update([pageKey]);
    }
    ResKaTouchList resp = await ETCRepo.getETCUserPoolData(tabId);
    if (resp.success && resp.data.tabList.isNotEmpty) {
      _tabList = resp.data.tabList;
      _emptyTip = resp.data.emptyText;
      _userData[tabId ?? _tabList![0].id] = resp.data.list;
      _screenStatus = ScreenStatus.Ready;
    } else {
      _screenStatus = ScreenStatus.Error;
    }
    update([pageKey]);
  }

  bool _selectable = false;

  bool get selectable => _selectable;

  /// 设置是否可选状态
  void changeSelectable({bool toastEmpty = false}) async {
    if (_selectedUid.isNotEmpty) {
      await sendHiMessage(tabs[_tabController!.index].id, _selectedUid);
    } else {
      if (toastEmpty) {
        Toast.show(System.context, K.chat_no_select_user);
      }
    }
    _selectable = !_selectable;
    _selectedUid.clear();
    update([selectableKey]);
  }

  /// 取消选择状态
  void cancelSelect() {
    _selectable = !_selectable;
    _selectedUid.clear();
    update([selectableKey]);
  }

  /// 获取对应tab的用户列表
  List<KaTouchPoolUser>? getUserList(int tabId) => _userData[tabId];

  /// 改变某个用户的选中状态
  void changeUserSelectedStatus(int uid) {
    if (_selectedUid.contains(uid)) {
      _selectedUid.remove(uid);
    } else {
      _selectedUid.add(uid);
    }
    update([selectableKey]);
  }

  /// 获取用户是否被选中
  bool getUserSelectedStatus(int uid) => _selectedUid.contains(uid);

  /// 发送招呼消息
  Future sendHiMessage(int tabId, List<int> userIds) async {
    // 1. 弹出快捷回复消息列表
    // 2. 调用接口发送消息
    // 3. 刷新列表
    var result =
        await QuickReplyEtcPanel.show(System.context, _cacheTagList, (list) {
      _cacheTagList = list;
    });
    int id = Util.parseInt(result);
    if (id > 0) {
      final res =
          await ETCRepo.sendMessageToETCUser(userIds.join(','), id, tabId);
      if (res.success) {
        Toast.show(System.context, K.chat_sent_target_ok);
        loadData(tabId: tabId, showLoading: false);
        return true;
      } else {
        Toast.show(System.context, res.msg);
      }
    }
    return false;
  }
}

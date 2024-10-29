import 'dart:async';

import 'package:shared/shared.dart';
import 'package:shared/model/friend_bean.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/cupertino.dart';

const int dataTypeFriend = 1;
const int dataTypeSearch = 2;

/// 添加主播UI&搜索页面
mixin TalentAddSearchDataNewMixin<T extends StatefulWidget> on State<T> {
  static const int _pageSize = 20;

  int _pageIndex = 0;
  bool _loading = true;
  bool more = true;
  final List<TalentAddUserItem> _friendData = [];
  List<TalentAddUserItem> _searchData = [];

  int _firstIndex = -1; //当前屏幕内可见的第一个条目索引
  int _lastIndex = -1; //当前屏幕内可见的最后一个条目索引
  final Map<int, UserConfig> _configMap = {}; //列表中用户状态信息
  late ScrollController controller;
  Timer? _loadOnlineTimer;

  int dataType = dataTypeFriend;

  void onLoadError(int page, String msg);

  void closeInput();

  void refreshUI() {
    if (mounted) setState(() {});
  }

  List<TalentAddUserItem> get data {
    if (dataType == dataTypeFriend) {
      return _friendData;
    } else if (dataType == dataTypeSearch) {
      return _searchData;
    } else {
      return const [];
    }
  }

  bool get isLoading => _loading;

  late ISearchManager searchManager;

  @override
  void initState() {
    super.initState();
    searchManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_SEARCH);
    controller = ScrollController();
    controller.addListener(_onScroll);
    searchFriends(1);
    _restartLoadOnlineTimer();
  }

  @override
  void dispose() {
    controller.removeListener(_onScroll);
    controller.dispose();
    _loadOnlineTimer?.cancel();
    closeInput();
    super.dispose();
  }

  _restartLoadOnlineTimer() {
    _loadOnlineTimer?.cancel();
    _loadOnlineTimer = Timer.periodic(const Duration(seconds: 3), _loadOnline);
  }

  // 加载更多
  _onScroll() {
    if (!controller.hasClients) return;
    closeInput();
    if (more == true &&
        _loading == false &&
        controller.position.maxScrollExtent == controller.offset) {
      searchFriends(_pageIndex + 1);
    }
  }

  void handlePositionChanged(int firstIndex, int lastIndex) {
    Log.d(
        tag: 'talent',
        'PageState._handlePositionChanged firstIndex = $firstIndex, lastIndex = $lastIndex');
    _firstIndex = firstIndex;
    _lastIndex = lastIndex;
    if (firstIndex == 0 && lastIndex == 0 && data.length == 1) {
      _lastIndex = 1;
    }
  }

  searchFriends(int page) async {
    _loading = true;

    String url = '${System.domain}go/yy/friend/data';
    Map<String, String> params = {
      "type": 'friend',
      "page": '$page',
      "pageSize": '$_pageSize',
    };
    XhrResponse res = await Xhr.postJson(url, params, formatJson: true);

    DataRsp<List<FriendItem>> listResp =
        DataRsp<List<FriendItem>>.fromXhrResponse(
            res, (json) => Util.parseList(json, (e) => FriendItem.fromJson(e)));
    _loading = false;

    if (listResp.success == true) {
      if (page == 1) {
        _friendData.clear();
        _configMap.clear();
      }

      if (listResp.data?.isNotEmpty == true) {
        var list = listResp.data!
            .where((e) => (e.uid) > 0)
            .map((e) => convertFriendData(e)..refreshStatus(_configMap))
            .toList();
        _friendData.addAll(list);
        if (list.length < _pageSize) {
          more = false;
        } else {
          more = true;
        }
      } else {
        more = false;
      }

      _pageIndex = page;

      onLoadSuccess(page);
    } else {
      if (listResp.msg != null) {
        onLoadError(page, listResp.msg!);
      }
      return;
    }
  }

  bool noMore() {
    return !more && data.length < _pageSize;
  }

  /// 获取对应数据的用户或者群组的状态信息
  _loadOnline(Timer timer) async {
    if (_firstIndex == -1 ||
        _lastIndex == -1 ||
        (_firstIndex == 0 && _lastIndex == 0)) {
      return;
    }

    final int first = _firstIndex;
    final int last = _lastIndex;

    List<String> uids = [];
    for (int i = first; i <= last; i++) {
      if (i < 0 || i >= data.length) continue;
      var item = data[i];
      String id = item.uid.toString();

      uids.add(id);
      if (_configMap.containsKey(item.uid)) {
        _configMap.remove(item.uid);
      }
    }

    if (uids.isNotEmpty) {
      try {
        await BaseRequestManager.cloudAll(uids, roomConfig: _configMap);

        for (int i = first; i <= last; i++) {
          if (i < 0 || i >= data.length) continue;
          var item = data[i];
          item.refreshStatus(_configMap, forceUseConfigData: true);
        }

        refreshUI();
      } catch (e) {
        Log.d(e.toString());
      }
    }
  }

  void onLoadSuccess(int page);

  void search(String query) async {
    if (query.isEmpty) {
      dataType = dataTypeFriend;
      refreshUI();
      return;
    }

    _loading = true;
    dataType = dataTypeSearch;
    refreshUI();

    List<Map<String, dynamic>> result =
        await searchManager.apiSearchUser(query);
    if (result.isNotEmpty) {
      var list = result
          .map((e) => convertSearchData(e)
            ..refreshStatus(_configMap, forceUseConfigData: true))
          .toList();
      _searchData = list;
    }

    _loading = false;
    refreshUI();
  }
}

TalentAddUserItem convertFriendData(FriendItem friend) {
  return TalentAddUserItem(
    uid: friend.uid,
    icon: friend.icon ?? '',
    name: friend.name ?? '',
    room: friend.room,
    online: friend.online == 1,
    onlineDiffStr: friend.onlineDiffStr,
    dataType: dataTypeFriend,
  );
}

TalentAddUserItem convertSearchData(Map<String, dynamic> data) {
  return TalentAddUserItem(
    uid: Util.parseInt(data["uid"]),
    name: Util.notNullStr(data["name"]),
    icon: Util.notNullStr(data["icon"]),
    dataType: dataTypeSearch,
  );
}

class TalentAddUserItem {
  int uid;
  String icon;
  String name;
  int? room;
  bool? online;
  int dataType;

  String? statusStr;
  String? onlineDiffStr;

  TalentAddUserItem({
    required this.uid,
    required this.icon,
    required this.name,
    required this.dataType,
    this.room,
    this.online,
    this.onlineDiffStr,
  });

  refreshStatus(Map<int, UserConfig> configMap,
      {bool forceUseConfigData = false}) {
    int rid = room ?? 0;
    bool aonline = online ?? false;
    if (configMap.containsKey(uid)) {
      UserConfig config = configMap[uid]!;
      rid = config.room ?? 0;
      aonline = config.online == 1;
    } else if (forceUseConfigData == true) {
      rid = 0;
      aonline = false;
    }
    if (rid > 0) {
      statusStr = K.room_talent_partying;
    } else if (aonline) {
      statusStr = K.room_talent_online_text;
    } else {
      statusStr = onlineDiffStr;
    }
  }
}

import 'dart:async';

import 'package:shared/shared.dart';
import 'package:shared/src/pbModel/generated/api_im_data.pb.dart';
import 'package:message/src/controller/conversation_extra_info.dart';

mixin ConversationUserInfoMixin on ConversationExtraInfo {
  /// 用户在线状态刷新
  static const String msgOnlineUpdate = 'update.user.cloud.info';

  /// 用户房间信息刷新
  static const String msgRoomUpdate = 'update.room.cloud.info';

  /// 用户群组信息刷新
  static const String msgGroupUpdate = 'update.group.cloud.info';

  /// 两次接口请求的最短时间，1分钟
  static const int minLoadDuration = 60 * 1000;

  static const int _loadDuration = 5 * 60 * 1000;

  int _rid = 0; //当前用户所在房间rid
  final Map<int, ImUserData> _userData = {}; //列表中用户状态信息
  final Map<int, ImGroupData> _groupData = {}; //列表中Group状态信息
  final Map<int, ImUserRoomData> _userRoomData = {}; //列表用户房间信息
  KaTouchData? kaTouchData;

  int _lastLoadTime = 0;
  Set<int>? _lastLoadUids;
  Set<int>? _lastLoadGroupIds;

  Timer? _loadTimer;

  @override
  void initExtra() {
    super.initExtra();
    eventCenter.addListener(EventConstant.WebsocketEventMessage, _onRefresh);
    eventCenter.addListener(Im.EventConnSuccess, _onReconnect);
  }

  @override
  void disposeExtra() {
    super.disposeExtra();

    // clear timer
    if (_loadTimer != null) {
      _loadTimer!.cancel();
      _loadTimer = null;
    }

    // clear listener
    eventCenter.removeListener(EventConstant.WebsocketEventMessage, _onRefresh);
    eventCenter.removeListener(Im.EventConnSuccess, _onReconnect);
  }

  UserConfig? getUserConfig(Conversation conv) {
    UserConfig? config;
    int uid = Util.parseInt(conv.targetId);
    if (conv.type == ConversationType.Private) {
      ImUserData? userInfo = _userData[uid];
      ImUserRoomData? userRoomInfo = _userRoomData[uid];
      config = UserConfig.fromImUserData(userInfo, userRoomInfo);
    } else if (conv.type == ConversationType.Group) {
      ImGroupData? groupInfo = _groupData[uid];
      config = UserConfig.fromImGroupData(groupInfo);
    }
    return config;
  }

  int get rid => _rid;

  ImUserData? getUserData(int uid) => _userData[uid];

  ImUserRoomData? getUserRoomData(int uid) => _userRoomData[uid];

  ImGroupData? getGroupData(int uid) => _groupData[uid];

  void _onRefresh(String name, Object? data) {
    // Log.d('Receive socket message in ConversationUserInfoMixin, name: $name, data: $data');
    if (!Session.isLogined || data == null) return;

    Map<String, dynamic> dataMap = data as Map<String, dynamic>;

    if (dataMap['name'] == msgOnlineUpdate) {
      // online数据刷新
      ImUserOnlineMsg userOnlineMsg =
          ImUserOnlineMsg.fromBuffer(List<int>.from(dataMap['data']));
      Log.d('ConversationUserInfoMixin, userOnlineMsg: $userOnlineMsg');
      if (userOnlineMsg.onlineData.isEmpty) return;

      List<ImUserData> updatedUsers = [];
      for (var _ in userOnlineMsg.onlineData) {
        if ((_.uid) > 0 &&
            _userData[_.uid] != null &&
            (_.time > (_userData[_.uid]?.onlineData.time ?? 0))) {
          _userData[_.uid]?.onlineData = _;
          updatedUsers.add(_userData[_.uid]!);
        }
      }

      if (updatedUsers.isNotEmpty)
        onUserInfoUpdate(ImCloudAllData(users: updatedUsers));
    } else if (dataMap['name'] == msgRoomUpdate) {
      // room数据刷新
      ImUserRoomMsg userRoomMsg =
          ImUserRoomMsg.fromBuffer(List<int>.from(dataMap['data']));
      Log.d('ConversationUserInfoMixin, userRoomMsg: $userRoomMsg');
      if (userRoomMsg.roomData.isEmpty) return;

      List<ImUserRoomData> updatedRooms = [];
      for (var _ in userRoomMsg.roomData) {
        if ((_.uid) > 0 && (_.time > (_userRoomData[_.uid]?.time ?? 0))) {
          _userRoomData[_.uid] = _;
          updatedRooms.add(_);
        }
      }

      if (updatedRooms.isNotEmpty)
        onUserInfoUpdate(ImCloudAllData(roomData: updatedRooms));
    } else if (dataMap['name'] == msgGroupUpdate) {
      // group数据刷新
      ImGroupMsg groupMsg =
          ImGroupMsg.fromBuffer(List<int>.from(dataMap['data']));
      Log.d('ConversationUserInfoMixin, groupMsg: $groupMsg');
      if (groupMsg.groupData.isEmpty) return;

      List<ImGroupData> updatedGroups = [];
      for (var _ in groupMsg.groupData) {
        if ((_.uid) > 0 && (_.time > (_groupData[_.uid]?.time ?? 0))) {
          _groupData[_.uid] = _;
          updatedGroups.add(_groupData[_.uid]!);
        }
      }

      if (updatedGroups.isNotEmpty)
        onUserInfoUpdate(ImCloudAllData(groupData: updatedGroups));
    }
  }

  void _onReconnect(String name, dynamic data) {
    if (DateTime.now().millisecondsSinceEpoch - _lastLoadTime < minLoadDuration)
      return;
    scheduleLoadUserInfo(_lastLoadUids, _lastLoadGroupIds, useCache: false);
  }

  Future<void> scheduleLoadUserInfo(Set<int>? uids, Set<int>? groupIds,
      {bool useCache = true}) async {
    if (_loadTimer != null) {
      _loadTimer!.cancel();
      _loadTimer = null;
    }

    _loadUserInfo(uids, groupIds, useCache: useCache);
    _loadTimer = Timer.periodic(const Duration(milliseconds: _loadDuration),
        (timer) => _loadUserInfo(uids, groupIds, useCache: useCache));
  }

  Future<void> _loadUserInfo(Set<int>? uids, Set<int>? groupIds,
      {bool useCache = true}) async {
    if ((uids?.isEmpty ?? true) && (groupIds?.isEmpty ?? true)) return;

    _lastLoadUids = uids;
    _lastLoadGroupIds = groupIds;

    Map<int, int> loadUsers = {};
    Map<int, int> loadGroups = {};

    int timeNow = DateTime.now().millisecondsSinceEpoch;

    // useCache为true时，只请求不在缓存的数据
    if (uids?.isNotEmpty ?? false) {
      uids?.forEach((_) {
        bool needLoad =
            timeNow - (_userData[_]?.onlineData.time ?? 0) >= _loadDuration;
        if (!useCache) {
          needLoad = true;
        }
        if (needLoad) loadUsers[_] = (_userData[_]?.onlineData.time ?? 0);
      });
    }

    if (groupIds?.isNotEmpty ?? false) {
      groupIds?.forEach((_) {
        bool needLoad = timeNow - (_groupData[_]?.time ?? 0) >= _loadDuration;
        if (!useCache) {
          needLoad = true;
        }
        if (needLoad) loadGroups[_] = (_groupData[_]?.time ?? 0);
      });
    }

    if (loadUsers.isNotEmpty || loadGroups.isNotEmpty) {
      _lastLoadTime = DateTime.now().millisecondsSinceEpoch;
      ResImCloudAll resCloudAll = await ConversationUserInfoApi.loadAll(
          users: loadUsers, groups: loadGroups);

      if (!(resCloudAll.success)) return;

      _rid = resCloudAll.data.rid;
      kaTouchData = resCloudAll.data.hasKaTouch() == true
          ? resCloudAll.data.kaTouch
          : null;

      for (var _ in resCloudAll.data.roomData) {
        _userRoomData[_.uid] = _;
      }

      for (var _ in resCloudAll.data.users) {
        _userData[_.uid] = _;
        await CachedNames.instance().set(UserInfo.fromImUserData(_), false);
      }

      for (var _ in resCloudAll.data.groupData) {
        _groupData[_.uid] = _;
        await CachedNames.instance()
            .set(UserInfo.fromImGroupData(_), false, true);
      }

      onUserInfoUpdate(resCloudAll.data);
    }
  }

  void onUserInfoUpdate(ImCloudAllData? cloudAllData);

  void clearUserData() {
    _userData.clear();
    _userRoomData.clear();
    _groupData.clear();
  }
}

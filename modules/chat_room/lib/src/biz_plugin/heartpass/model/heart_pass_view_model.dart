import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/base/model/roomConstant.dart';
import 'package:chat_room/src/biz_plugin/heartpass/model/heart_pass_beans.dart';
import 'package:chat_room/src/biz_plugin/heartpass/model/heart_pass_repos.dart';
import 'package:chat_room/src/biz_plugin/heartpass/widget/heart_pass_success_dialog.dart';
import 'package:chat_room/src/chatRoomData.dart';
import 'package:chat_room/src/protobuf/generated/plugin_lucky.pb.dart';

/// 心动闯关viewModel
class HeartPassViewModel extends ChangeNotifier {
  final ChatRoomData room;

  ResLuckyBaseData? model;
  bool _loading = false;

  /// 是否需要更新占位key
  /// 1. 当关卡数量变化时需要
  /// 2. 当关卡用户人数变化
  bool needUpdateLocationKey = false;

  bool _edit = false; // true: 房主或接待编辑中
  bool _isDispose = false;

  HeartPassViewModel(this.room) {
    init();
  }

  void init() {
    _isDispose = false;
    room.addListener(RoomConstant.Event_Heart_Pass_Refresh, _onSocketRefresh);
    room.addListener(RoomConstant.Event_Heart_Pass_Close, _onSocketClose);
    room.addListener(RoomConstant.Event_Heart_Pass_Success, _onSocketSuccess);
    // model = HeartPassDataMock.test();
    tryLoadData();
  }

  @override
  void dispose() {
    _isDispose = true;
    room.removeListener(
        RoomConstant.Event_Heart_Pass_Refresh, _onSocketRefresh);
    room.removeListener(RoomConstant.Event_Heart_Pass_Close, _onSocketClose);
    room.removeListener(
        RoomConstant.Event_Heart_Pass_Success, _onSocketSuccess);
    super.dispose();
  }

  /// 通过接口加载数据，接口没有加载成功不显示
  void tryLoadData() async {
    if (needLoad && !_loading) {
      _loading = true;
      ResLuckyBaseData? data = await HeartPassRepos.baseInfo(room.rid);
      if (_isDispose) return;
      model = data;
      _loading = false;
      notifyListeners();
    }
  }

  set edit(bool newEdit) {
    _edit = newEdit;
    notifyListeners();
  }

  bool get edit {
    return _edit;
  }

  bool get needLoad {
    /// 如果开启了插件第一次load数据
    return model?.locationList == null && room.heartPassEntrance?.showUI == 1;
  }

  bool get isPlaying {
    return state == HeartPassState.Play;
  }

  HeartPassState get state {
    return parseState(model?.state);
  }

  bool get show {
    return model?.locationList != null && model!.locationList.isNotEmpty;
  }

  /// 老板未上位
  bool get noBoss {
    return state == HeartPassState.Wait &&
        model?.locationList.isNotEmpty == true &&
        (model!.locationList[0].user.isEmpty);
  }

  /// 房主和接待可以编辑
  bool get hasPermission {
    return room.isCreator || room.isReception;
  }

  /// 发送移动记录
  void postRecord() async {
    notifyListeners();
  }

  /// socket刷新消息
  _onSocketRefresh(String name, dynamic data) async {
    if (data is! Map) return;
    Map content = data;
    ResLuckyBaseData? socketData;
    try {
      socketData = ResLuckyBaseData.fromBuffer(content['pb'].cast<int>());
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
    if (model == null) {
      needUpdateLocationKey = true;
    } else {
      int levelCount = 0;
      int userCount = 0;
      if (model?.locationList != null) {
        levelCount = model!.locationList.length;
        for (ResLuckyBaseLocationList level in model!.locationList) {
          userCount += level.user.length;
        }
      }
      int newLevelCount = 0;
      int newUserCount = 0;
      if (socketData?.locationList != null) {
        newLevelCount = socketData!.locationList.length;
        for (ResLuckyBaseLocationList level in socketData.locationList) {
          newUserCount += level.user.length;
        }
      }
      if (newLevelCount != levelCount || newUserCount != userCount) {
        needUpdateLocationKey = true;
      }
    }
    model = socketData;
    notifyListeners();
  }

  /// socket关闭消息
  _onSocketClose(String name, dynamic data) {
    Log.d('heartPass _onSocketClose name=$name data=$data');
    close();
  }

  /// 关闭插件
  void close() {
    model = null;
    notifyListeners();
  }

  /// 闯关成功
  _onSocketSuccess(String name, dynamic data) {
    Log.d('heartPass _onSocketSuccess name=$name data=$data');
    if (data is! Map) return;
    Map content = data;
    ResLuckyBreakSuccess successData =
        ResLuckyBreakSuccess.fromBuffer(content['pb'].cast<int>());
    HeartPassSuccessDialog.show(data: successData);
  }
}

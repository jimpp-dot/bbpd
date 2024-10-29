import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:were_wolf/src/room/wolfv2/main/wolf_repository.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';

class WolfModel with ChangeNotifier {
  int? _actionUid;
  ChatRoomData room;
  final Map<int, WolfRole> _roleMarks = <int, WolfRole>{};
  double messageHight = 0;

  final Map<int, int> _seerMarks = <int, int>{}; //预言家查杀标志 //1狼人2好人

  int? _awaitAni;

  WolfModel(this.room);

  RoomPosition? get targetPosition {
    RoomPosition? selfPosition = room.positionForCurrentUser;
    if (selfPosition == null) return null;

    WolfPositionData? selfWolfPositionData =
        selfPosition.positionExpendData as WolfPositionData?;
    int? targetUid = _actionUid;
    if ((selfWolfPositionData?.actionUid ?? 0) > 0)
      targetUid = selfWolfPositionData!.actionUid;

    for (var _ in room.positions) {
      if (_.uidOrOrigin == targetUid) {
        return _;
      }
    }
    return null;
  }

  set actionUid(int value) {
    if (_actionUid == value) {
      _actionUid = 0;
    } else {
      _actionUid = value;
    }
    notifyListeners();
  }

  int get actionUid {
    return _actionUid ?? 0;
  }

  set awaitAni(int hasAni) {
    if (hasAni != 0) {
      _awaitAni = 1;
    } else {
      _awaitAni = 0;
    }
  }

  int get awaitAni {
    return _awaitAni ?? 1;
  }

  set middleMessageHight(double hight) {
    messageHight = hight;
    notifyListeners();
  }

  WolfRole? getMarkedRole(int uid) {
    return _roleMarks[uid];
  }

  void notifyRefresh() {
    notifyListeners();
  }

  WolfState? get wolfState {
    WolfConfigData? wolfConfigData =
        room.config?.configExpendData as WolfConfigData?;
    return wolfConfigData?.state;
  }

  void _confirmAction() {
    RoomPosition? selfPosition = room.positionForCurrentUser;
    if (selfPosition == null) return;

    WolfPositionData selfWolfPositionData =
        selfPosition.positionExpendData as WolfPositionData;
    selfWolfPositionData.actionStatus = WolfActionStatus.finish;
    notifyListeners();
  }

  //操作失败
  void _failAction() {
    RoomPosition? selfPosition = room.positionForCurrentUser;
    if (selfPosition == null) return;

    WolfPositionData selfWolfPositionData =
        selfPosition.positionExpendData as WolfPositionData;
    selfWolfPositionData.actionStatus = WolfActionStatus.enable;
    notifyListeners();
  }

  void setRoleMark(int? uid, WolfRole role) {
    if (uid == null || uid <= 0) return;
    _roleMarks[uid] = role;
    notifyListeners();
  }

  void clearRoleMark({int? uid}) {
    if (uid == null) {
      _roleMarks.clear();
    } else {
      _roleMarks.remove(uid);
    }
    notifyListeners();
  }

  void clearAllMark() {
    if (_roleMarks.isNotEmpty) {
      _roleMarks.clear();
      notifyListeners();
    }
  }

  int getSeerMark(int uid) {
    return _seerMarks[uid] ?? 0;
  }

  void setSeerMark(int? uid, int flag) {
    if (uid == null || uid <= 0) return;
    _seerMarks[uid] = flag;
    notifyListeners();
  }

  void clearAllSeerMar() {
    if (_seerMarks.isNotEmpty) {
      _seerMarks.clear();
      notifyListeners();
    }
  }

  /// 开始游戏，[rid] 房间ID
  Future<bool> startGame(int rid) async {
    return WolfRepository.startGame(rid);
  }

  /// 开始游戏，[rid] 房间ID
  Future<bool> robRole(BuildContext context, int rid, RoleItem roleItem) async {
    IPayManager payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    payManager.pay(context,
        key: 'wolf_get_role',
        type: 'available',
        refer: 'snap',
        args: {
          'money': roleItem.price * 100,
          'type': 'wolf-role',
          'params': {
            'rid': rid,
            'role': roleItem.roleKey,
          },
        },
        onPayed: _confirmAction);

    return true;
  }

  /// 预言家验人
  /// [rid] 房间id，[cuid] 要验的人的uid
  /// [isConfirm] 是否确定对象，点击确定按钮是传true，发起网络请求，点击麦位操作是传false，仅更新UI
  Future<Object?> seerRole(int rid, int cuid, [bool isConfirm = false]) async {
    if (isConfirm) {
      _confirmAction();
      return WolfRepository.seerRole(rid, '$cuid');
    }
    actionUid = cuid;
    return null;
  }

  /// 狼人击杀，服务端通过socket更新房间数据
  /// [rid] 房间id，[cuid] 要验的人的uid
  /// [iskill] 1:杀 0取消，[count] 第几轮
  /// [isConfirm] 是否确定对象，点击确定按钮是传true，发起网络请求，点击麦位操作是传false，仅更新UI
  Future<bool> wolfKill(int rid, int cuid, int isKill, int count,
      {bool isConfirm = false}) async {
    if (isConfirm) _confirmAction();

    bool opFlag = await WolfRepository.wolfKill(rid, '$cuid', isKill, count,
        isConfirm: isConfirm);
    if (!opFlag) {
      //操作失败
      _failAction();
    }

    return opFlag;
  }

  /// 守卫守护目标
  /// [rid] 房间id，[cuid] 要验的人的uid，[count] 第几轮
  /// [isConfirm] 是否确定对象，点击确定按钮是传true，发起网络请求，点击麦位操作是传false，仅更新UI
  Future<bool> guardRole(int rid, int cuid, int count,
      [bool isConfirm = false]) async {
    if (isConfirm) {
      _confirmAction();
      bool opFlag = await WolfRepository.guardRole(rid, '$cuid', count);
      if (!opFlag) {
        //操作失败
        _failAction();
      }
      return opFlag;
    }
    actionUid = cuid;
    return true;
  }

  /// 女巫救人
  /// [rid] 房间id，[cuid] 要验的人的uid
  /// [isConfirm] 是否确定对象，点击确定按钮是传true，发起网络请求，点击麦位操作是传false，仅更新UI
  Future<Object?> antidote(int rid, int cuid, [bool isConfirm = false]) async {
    if (isConfirm) {
      _confirmAction();
      return WolfRepository.antidote(rid, '$cuid');
    }
    actionUid = cuid;
    return true;
  }

  /// 女巫毒人
  /// [rid] 房间id，[cuid] 要验的人的uid
  /// [isConfirm] 是否确定对象，点击确定按钮是传true，发起网络请求，点击麦位操作是传false，仅更新UI
  Future<Object?> poison(int rid, int cuid, [bool isConfirm = false]) async {
    if (isConfirm) {
      _confirmAction();
      return WolfRepository.poison(rid, '$cuid');
    }
    actionUid = cuid;
    return true;
  }

  /// 猎人自爆
  /// [rid] 房间id
  Future<Object?> explode(int rid) async {
    return WolfRepository.explode(rid);
  }

  /// 猎人开枪带走
  /// [rid] 房间id，[cuid] 要验的人的uid
  /// [isConfirm] 是否确定对象，点击确定按钮是传true，发起网络请求，点击麦位操作是传false，仅更新UI
  Future<bool> gun(int rid, int cuid, [bool isConfirm = false]) async {
    if (isConfirm) {
      _confirmAction();
      return WolfRepository.gun(rid, '$cuid');
    }
    actionUid = cuid;
    return true;
  }

  /// 投票
  /// [rid] 房间id，[cuid] 要验的人的uid，[isVote] 1投 2取消，[count]  轮数
  /// [isConfirm] 是否确定对象，点击确定按钮是传true，发起网络请求，点击麦位操作是传false，仅更新UI
  Future<bool> vote(int rid, int cuid, int isVote, int count,
      [bool isConfirm = false]) async {
    if (isConfirm) {
      int? actionUid = _actionUid;
      if (actionUid == null || actionUid <= 0) return false;

      bool result = await WolfRepository.vote(rid, '$actionUid', 1, count);
      if (result) {
        _confirmAction();
        Fluttertoast.showToast(
            msg: R.string('wolf_vote_success'), gravity: ToastGravity.CENTER);
      }

      return result;
    }
    actionUid = cuid;
    return true;
  }

  /// 12人局-参与警长投票
  /// [rid] 房间id，[cuid] 要验的人的uid，[isVote] 1投 2取消，[count]  轮数
  /// [isConfirm] 是否确定对象，点击确定按钮是传true，发起网络请求，点击麦位操作是传false，仅更新UI
  Future<bool> policeVote(int rid, int cuid, int isVote, int count,
      [bool isConfirm = false]) async {
    if (isConfirm) {
      int? actionUid = _actionUid;
      if (actionUid == null || actionUid <= 0) return false;

      bool result =
          await WolfRepository.policeVote(rid, '$actionUid', 1, count);
      if (result) {
        _confirmAction();
        Fluttertoast.showToast(
            msg: R.string('wolf_vote_success'), gravity: ToastGravity.CENTER);
      }

      return result;
    }
    actionUid = cuid;
    return true;
  }

  /// 过麦-跳过自己当前发言
  /// [rid] 房间id
  Future<bool> pass(int rid) async {
    _confirmAction();
    return WolfRepository.pass(rid);
  }

  /// 结束游戏
  /// [rid] 房间id，[aid] 数据库ID
  ///
  Future<Object?> end(int rid, int aid) async {
    return WolfRepository.end(rid, aid);
  }

  /// 游戏准备
  /// [rid] 房间id，[uid] 用户ID
  Future<bool> setReady(int rid, int uid) async {
    return WolfRepository.setReady(rid, uid);
  }

  /// 上警
  /// [joinFlag] 1-竞选，2-放弃竞选，3-退水
  Future<bool> joinPolice(int rid, PoliceJoinFlag joinFlag) async {
    _confirmAction();
    return WolfRepository.joinPolice(rid, joinFlag);
  }

  /// 上警
  /// [isJoin] true 上警，false 退水
  Future<bool> setDescOrder(int rid, bool isUp) async {
    _confirmAction();
    return WolfRepository.setDescOrder(rid, isUp);
  }

  /// 上警
  /// [isJoin] true 上警，false 退水
  Future<bool> policeChange(int rid, int cuid, [bool isConfirm = false]) async {
    if (isConfirm) {
      _confirmAction();
      return WolfRepository.policeChange(rid, cuid);
    }
    actionUid = cuid;
    return true;
  }
}

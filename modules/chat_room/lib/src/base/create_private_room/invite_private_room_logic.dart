import 'dart:async';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chat_room/src/protobuf/generated/online_list.pb.dart';
import '../../../k.dart';
import '../../protobuf/generated/drainage.pb.dart';
import '../widget/common_message_list/multi_tab_msg_repo.dart';

class InvitePrivateRoomLogic extends GetxController {
  /// 当前大房rid
  final int rid;

  /// 小房rid
  final int targetRid;
  InvitePrivateRoomLogic({required this.rid, required this.targetRid});

  /// 延时搜索
  Timer? _cancelTimer;

  /// 邀请用户id
  List<int> inviteUids = [];

  List<ListData> users = [];
  List<ListData> noPermissionUsers = [];

  bool isMultiTab = true;
  bool hasGift = true;

  bool isLoading = true;

  /// 该logic已经close，异步操作回来后需要判断
  bool _isClose = false;

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  @override
  void onClose() {
    super.onClose();
    _isClose = true;
    _cancelTimer?.cancel();
  }

  _load({String word = ''}) async {
    ResDrainageRoomOnlineList res =
        await MultiTabMsgRepo.getRoomOnlineList(rid, targetRid, word);
    if (_isClose) {
      return;
    }

    if (res.success) {
      users = res.data.list;
      noPermissionUsers = res.data.noPermissionList;
      isMultiTab =
          (res.data.showNoPermission && res.data.giftId > 0) ? true : false;
      hasGift = res.data.giftId > 0;
    }
    isLoading = false;
    update();
  }

  /// 延时搜索
  void onQueryChanged(String text) {
    if (!isLoading) {
      isLoading = true;
      update();
    }
    _cancelTimer?.cancel();
    _cancelTimer = Timer(Duration(milliseconds: text.isEmpty ? 0 : 800),
        () => _load(word: text));
  }

  void addInviteUid(int uid) {
    if (!inviteUids.contains(uid)) {
      inviteUids.add(uid);
      update();
    }
  }

  void removeInviteUid(int uid) {
    if (inviteUids.contains(uid)) {
      inviteUids.remove(uid);
      update();
    }
  }

  void selectAll(bool hasPermission, bool select) {
    late List<ListData> userList;
    if (hasPermission) {
      userList = users;
    } else {
      userList = noPermissionUsers;
    }

    for (ListData data in userList) {
      int uid = data.uid;

      if (select) {
        if (!inviteUids.contains(uid)) {
          inviteUids.add(uid);
        }
      } else {
        if (inviteUids.contains(uid)) {
          inviteUids.remove(uid);
        }
      }
    }

    update();
  }

  bool isSelectAll(bool hasPermission) {
    late List<ListData> userList;
    if (hasPermission) {
      userList = users;
    } else {
      userList = noPermissionUsers;
    }

    for (ListData data in userList) {
      if (!inviteUids.contains(data.uid)) {
        return false;
      }
    }

    return true;
  }

  /// 邀请进房
  bool isInvite = false;
  void invitePrivateRoom() async {
    if (!Util.validList(inviteUids)) {
      Fluttertoast.showCenter(msg: K.room_choose_less_user_to_invite);
      return;
    }

    if (isInvite) {
      return;
    }
    isInvite = true;

    ResDrainageOperate data = await MultiTabMsgRepo.relateRoomOption(
        rid, targetRid, 3,
        uids: inviteUids);

    if (_isClose) {
      return;
    }

    if (data.success) {
      /// 邀请成功pop本页面
      Navigator.pop(System.context);
    } else if (Util.validStr(data.message)) {
      Fluttertoast.showCenter(msg: data.message);
    }

    isInvite = false;
  }
}

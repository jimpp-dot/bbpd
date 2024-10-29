import 'dart:async';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/confess_v2/model/confess_v2_data.dart';
import 'package:chat_room/src/confess_v2/confess_v2_util.dart';
import 'package:chat_room/src/confess_v2/pb/generated/confess_v2.pb.dart';
import 'package:chat_room/src/confess_v2/widgets/components/confess_v2_gift_animate_box.dart';
import 'package:chat_room/src/confess_v2/widgets/components/confess_v2_gift_fly_widget.dart';
import 'package:chat_room/src/confess_v2/widgets/confess_v2_gift_send_tip_dialog.dart';
import 'package:chat_room/src/confess_v2/widgets/confess_v2_gift_unlock_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 想对你说ViewModel
class ConfessV2SendGiftViewModel extends ChangeNotifier {
  final ChatRoomData room;

  /// 当前选中的被打赏用户,默认不选中
  ConfessV2RoomPosition? selectedUser;

  /// 当前麦上的用户列表
  List<ConfessV2RoomPosition>? micUsers;

  /// 当前选择的麦上用户的礼物解锁状态
  List<ConfessStage>? currentUserGifts;

  final Map<String, List<ConfessStage>> _cachedUserGiftsMap = {};

  /// 当前礼物的描述
  String currentShowGiftDescription = '';

  /// 当前礼物描述需要闪烁
  ValueKey? currentShowGiftDescriptionKey;

  /// 当前显示的下阶段礼物的解锁概率描述
  String currentShowNextGiftUnlockProbabilityString = '';

  final List<GlobalKey<ConfessV2GiftAnimateBoxState>> giftKeyList = [
    GlobalKey<ConfessV2GiftAnimateBoxState>(),
    GlobalKey<ConfessV2GiftAnimateBoxState>(),
    GlobalKey<ConfessV2GiftAnimateBoxState>(),
    GlobalKey<ConfessV2GiftAnimateBoxState>(),
    GlobalKey<ConfessV2GiftAnimateBoxState>(),
    GlobalKey<ConfessV2GiftAnimateBoxState>(),
  ];

  /// 礼物飞出动画组件
  GlobalKey<ConfessV2GiftFlyWidgetState> giftFlyWidgetKey =
      GlobalKey<ConfessV2GiftFlyWidgetState>();

  int selectedGiftNum = 1;

  /// 当前选中的礼物
  ConfessStage? selectedGift;

  /// 赠送时的可选数量
  Map<String, String> chooseNumConfig = {};

  /// 当前已在执行解锁动画
  bool isAnimating = false;

  ConfessV2SendGiftViewModel(this.room);

  void loadData() {
    loadRoomPositionUsers();
  }

  loadRoomPositionUsers() {
    IGiftManager giftManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);

    var list = giftManager.getGiftUsers(room) as List<RoomPosition>;

    final oldUserList = micUsers?.toList();

    micUsers ??= [];
    micUsers!.clear();

    list.forEachIndexed((i, e) {
      final key = ConfessV2Util.getRoomPositionKey(index: i);
      micUsers!.add(ConfessV2RoomPosition(
        key: key,
        roomPosition: e,
      ));
    });

    /// 判断麦上用户是否发生变化
    bool isDidChanged =
        checkMicUsersDidChange(oldList: oldUserList, newList: micUsers!);
    if (!isDidChanged) return;

    if (micUsers!.isEmpty) {
      actionForSwitchSelectedUser(null);
    } else {
      if (selectedUser == null) {
        actionForSwitchSelectedUser(selectedUser);
      } else {
        bool selectedUserNotFound = true;
        for (var element in micUsers!) {
          if (selectedUser!.roomPosition.uid == element.roomPosition.uid) {
            selectedUserNotFound = false;
          }
        }

        if (selectedUserNotFound) {
          /// 之前选中的人当前不在麦上,也是默认更换到麦上的第一个人
          actionForSwitchSelectedUser(micUsers!.first);
        }
      }
    }

    notifyListeners();
  }

  /// 默认礼物，由初始化通关接口不传入uid时返回的数据，可能为空
  List<ConfessStage>? getDefaultGifts() => _cachedUserGiftsMap['0'];

  /// 判断麦上用户是否发生变化
  bool checkMicUsersDidChange(
      {List<ConfessV2RoomPosition>? oldList,
      required List<ConfessV2RoomPosition> newList}) {
    if (oldList == null) return true;

    /// 都为空，表示没有变化
    if (oldList.isEmpty && newList.isEmpty) return false;

    /// 列表长度发生变化
    if (oldList.length != newList.length) return true;

    /// 列表长度相同的情况下， 判断麦上用户位置是否发生变化，也记录为发生了变化
    for (int i = 0; i < newList.length; i++) {
      final oldUid = oldList[i].roomPosition.uid;
      final newUid = newList[i].roomPosition.uid;
      if (oldUid != newUid) return true;
    }

    return false;
  }

  /// 切换礼物赠送数量
  void actionForChangeGiftNum(int num) {
    selectedGiftNum = num;
    notifyListeners();
  }

  /// 切换用户
  /// 切换后,默认选择左上角的礼物
  void actionForSwitchSelectedUser(ConfessV2RoomPosition? user) {
    selectedUser = user;
    if (user != null) {
      currentUserGifts = _cachedUserGiftsMap['${user.roomPosition.uid}'];
      onSelectGift(_findNewestUnlockedGift(currentUserGifts));
    }
    notifyListeners();
    _loadUserGiftsStatus(user?.roomPosition);
  }

  /// 礼物赠送成功
  void onSendGiftSuccess(
      List<ConfessV2RoomPosition> users, ConfessStage giftData) {
    final userKeys = users.map((e) => e.key).toList();
    final giftKey =
        _findGiftBoxKey(giftData.giftId, users.first.roomPosition.uid);
    if (giftKey != null) {
      giftFlyWidgetKey.currentState!.addGiftFlyData(ConfessV2GiftFlyData(
        flyToUserKey: userKeys.first!,
        giftId: giftData.giftId,
        giftKey: giftKey.currentState!.getGiftIconKey,
      ));
    }
  }

  /// 加载当前麦上用户的礼物解锁状态
  Future _loadUserGiftsStatus(RoomPosition? user) async {
    final res = await _requestUserGifts(user);
    if (res.success) {
      /// 将uid为0的数据作为默认初始数据
      int userId = user?.uid ?? 0;
      _setUserGiftDataList(uid: userId, giftDataList: res.data.stages);
      currentUserGifts = _cachedUserGiftsMap['$userId'];
      ConfessStage? stage = _findNewestUnlockedGift(currentUserGifts);
      onSelectGift(stage, byManual: false);
      notifyListeners();
    }
    return;
  }

  void _setUserGiftDataList(
      {required int uid, List<ConfessStage>? giftDataList}) {
    if (giftDataList != null && giftDataList.isNotEmpty) {
      _cachedUserGiftsMap['$uid'] = giftDataList;
    }
  }

  ConfessStage? _findNewestUnlockedGift(List<ConfessStage>? giftDataList) {
    ConfessStage? stage;
    if (giftDataList != null && giftDataList.isNotEmpty) {
      for (var item in giftDataList) {
        if (item.unlocked) {
          stage = item;
        } else {
          break;
        }
      }
    }
    return stage ?? giftDataList?.first;
  }

  /// 选中的globalKey
  onSelectGift(ConfessStage? gift,
      {Function(ConfessStage gift, int uid)? onUnlockGiftDialogSendBtnTap,
      bool byManual = true}) {
    if (gift == null) return;

    if (gift.unlocked) {
      /// 已解锁
      selectedGift = gift;
      currentShowGiftDescription = gift.desc;
      if (byManual) {
        currentShowGiftDescriptionKey = ValueKey(DateTime.now().toString());
      }
      notifyListeners();
    } else {
      /// 如果该礼物处于未解锁状态，则弹出解锁提示框
      final userId = selectedUser?.roomPosition.uid ?? 0;
      final previousGift = _findGift(gift.giftId, userId);

      if (previousGift != null) {
        if (!previousGift.unlocked) {
          Fluttertoast.showToast(msg: '请按照顺序解锁礼物赠送资格');
          return;
        }
        ConfessV2GiftSendTipDialog.show(
            System.context, previousGift.name, previousGift.giftId, () {
          /// 获取最后一个已解锁的礼物
          ConfessStage? lastUnlockGift = previousGift;
          if (!lastUnlockGift.unlocked) {
            bool completed = false;
            while (!completed) {
              lastUnlockGift = _findGift(lastUnlockGift?.giftId ?? 0, userId);

              if (lastUnlockGift == null) {
                completed = true;
              } else {
                if (lastUnlockGift.unlocked) {
                  completed = true;
                }
              }
            }
          }

          if (lastUnlockGift != null) {
            /// 赠送礼物，数量为1
            if (onUnlockGiftDialogSendBtnTap != null) {
              /// 已解锁
              selectedGift = lastUnlockGift;
              currentShowGiftDescription = lastUnlockGift.desc;
              if (byManual) {
                currentShowGiftDescriptionKey =
                    ValueKey(DateTime.now().toString());
              }
              selectedGiftNum = 1;
              notifyListeners();

              onUnlockGiftDialogSendBtnTap(lastUnlockGift, userId);
            }
          }
        });
      }
    }
  }

  /// 打赏礼物触发了事件
  onConfessV2IMEvent(ConfessV2EventTouchData eventData) {
    if (eventData.next) {
      if (isAnimating) return;

      _onConfessV2GiftUnlockEvent(eventData);
    }

    /// 触发失败事件，只显示文案
    if (!Util.isNullOrEmpty(eventData.text)) {
      currentShowGiftDescription = eventData.text!;
      currentShowGiftDescriptionKey = ValueKey(DateTime.now().toString());
      notifyListeners();
    }
  }

  _onConfessV2GiftUnlockEvent(ConfessV2EventTouchData eventData) async {
    _setIsAnimating(true);

    /// 触发了解锁下阶段礼物
    final unlockedGift =
        _findGift(eventData.giftId, eventData.toUid, isNeedPrevious: false);
    if (unlockedGift != null) {
      unlockedGift.unlocked = true;
    }

    /// 弹出对话框
    await ConfessV2GiftUnlockDialog.show(
        System.context, unlockedGift!.name, unlockedGift.giftId);

    /// 更新gift的解锁状态
    if ((selectedUser?.roomPosition.uid ?? 0) == eventData.toUid) {
      selectedGift = unlockedGift;
    }

    notifyListeners();

    _setIsAnimating(false);
  }

  _setIsAnimating(bool animate) {
    isAnimating = animate;
    notifyListeners();
  }

  /// 根据选择的麦上用户展示已解锁的礼物状态
  Future<ResConfessIndex> _requestUserGifts(RoomPosition? user) async {
    try {
      final uid = user?.uid ?? 0;
      String url = '${System.domain}go/yy/confess_v2/index';
      Map<String, dynamic> params = {
        if (uid > 0) 'uid': uid,
      };
      final response = await Xhr.get(url,
          queryParameters: params, pb: true, throwOnError: true);
      ResConfessIndex res = ResConfessIndex.fromBuffer(response.bodyBytes);
      for (var config in res.data.chooseNumConfig) {
        chooseNumConfig['${config.num}'] = config.desc;
      }
      return res;
    } catch (e) {
      return ResConfessIndex(success: false, msg: e.toString());
    }
  }

  /// 根据当前礼物id找到上一阶段的礼物
  /// [giftId] 当前礼物id
  /// [uid] 被打赏人的uid
  ConfessStage? _findGift(int giftId, int uid, {bool isNeedPrevious = true}) {
    var giftsList = _cachedUserGiftsMap['$uid'];
    if (Util.isCollectionEmpty(giftsList)) {
      giftsList = currentUserGifts;
    }
    if (giftsList == null) return null;

    int index = 0;
    giftsList.forEachIndexed((i, e) {
      if (e.giftId == giftId) {
        index = i;
      }
    });

    if (isNeedPrevious) {
      var previousIndex = index - 1;
      if (previousIndex < 0) {
        previousIndex = giftsList.length - 1;
      }

      final previousGift = giftsList[previousIndex];

      return previousGift;
    } else {
      return giftsList[index];
    }
  }

  /// 查找礼物所在的组件
  /// [isUseForUnlockAnimation] 判断当前的查找方式是用于解锁礼物动效还是普通查找。区别在于如果是礼物动效果，则左下和又下的礼物顺序会进行颠倒
  GlobalKey<ConfessV2GiftAnimateBoxState>? _findGiftBoxKey(
      int giftId, int uid) {
    final giftsList = _cachedUserGiftsMap['$uid'];
    if (giftsList == null) return null;

    int index = 0;
    for (int i = 0; i < giftsList.length; i++) {
      if (giftsList[i].giftId == giftId) {
        index = i;
        break;
      }
    }
    if (index < giftKeyList.length) {
      return giftKeyList[index];
    }

    return null;
  }
}

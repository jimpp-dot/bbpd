import 'dart:async';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/vindicate/model/vindicate_data.dart';
import 'package:chat_room/src/vindicate/vindicate_util.dart';
import 'package:chat_room/src/vindicate/widgets/components/vindicate_gift_animate_box.dart';
import 'package:chat_room/src/vindicate/widgets/components/vindicate_gift_fly_widget.dart';
import 'package:chat_room/src/vindicate/widgets/vindicate_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 想对你说ViewModel
class VindicateSendGiftViewModel extends ChangeNotifier {
  final ChatRoomData room;

  final int? uid;

  /// 当前选中的被打赏用户,默认不选中
  VindicateRoomPosition? selectedUser;

  /// 当前麦上的用户列表
  List<VindicateRoomPosition>? micUsers;

  /// 当前选择的麦上用户的礼物解锁状态
  List<VindicateGiftData>? currentUserGifts;

  final Map<String, List<VindicateGiftData>> _cachedUserGiftsMap = {};

  /// 当前礼物的描述
  String currentShowGiftDescription = '';

  /// 当前礼物描述需要闪烁
  ValueKey? currentShowGiftDescriptionKey;

  /// 当前显示的下阶段礼物的解锁概率描述
  String currentShowNextGiftUnlockProbabilityString = '';

  /// 左上角的礼物
  GlobalKey<VindicateGiftAnimateBoxState> topStartKey =
      GlobalKey<VindicateGiftAnimateBoxState>();

  /// 右上角礼物
  GlobalKey<VindicateGiftAnimateBoxState> topEndKey =
      GlobalKey<VindicateGiftAnimateBoxState>();

  /// 左下角礼物
  GlobalKey<VindicateGiftAnimateBoxState> bottomStartKey =
      GlobalKey<VindicateGiftAnimateBoxState>();

  /// 右下角礼物
  GlobalKey<VindicateGiftAnimateBoxState> bottomEndKey =
      GlobalKey<VindicateGiftAnimateBoxState>();

  /// 礼物飞出动画组件
  GlobalKey<VindicateGiftFlyWidgetState> giftFlyWidgetKey =
      GlobalKey<VindicateGiftFlyWidgetState>();

  int selectedGiftNum = 1;

  /// 当前选中的礼物
  VindicateGiftData? selectedGift;

  /// 赠送时的可选数量
  Map chooseNumConfig = {};

  /// 当前已在执行解锁动画
  bool isAnimating = false;

  late Completer _animateCompleter;

  int? from;

  bool isInitLoaded = false;

  /// 当前阶段
  String currentUnlockLevel = '';

  VindicateSendGiftViewModel(this.room, this.uid, this.from);

  /// 单人表白模式
  bool get isSingleUserMode => from == 1 && uid != null && uid! > 0;

  void loadData() {
    if (isSingleUserMode) {
      _loadSingleUser();
    } else {
      loadRoomPositionUsers();
    }
  }

  _loadSingleUser() async {
    RoomPosition? roomPosition = ChatRoomUtil.getPositionByUid(uid!);

    if (roomPosition == null) {
      final UserInfo? userInfo = await CachedNames.instance().get(uid ?? 0, '');
      roomPosition = RoomPosition(
        uid: uid!,
        position: -1,
        icon: userInfo?.icon ?? '',
      );
    }

    final data = VindicateRoomPosition(
      key: VindicateUtil.getRoomPositionKey(),
      roomPosition: roomPosition,
    );

    actionForSwitchSelectedUser(data);
  }

  loadRoomPositionUsers() {
    /// 一对一打赏时不刷新麦上用户状态
    if (isSingleUserMode) return;

    IGiftManager giftManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);

    var list = giftManager.getGiftUsers(room) as List<RoomPosition>;

    final oldUserList = micUsers?.toList();

    micUsers ??= [];
    micUsers!.clear();

    list.forEachIndexed((i, e) {
      final key = VindicateUtil.getRoomPositionKey(index: i);
      micUsers!.add(VindicateRoomPosition(
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
        /// 默认选中第一个打赏者
        for (var element in micUsers!) {
          if (uid == element.roomPosition.uid) {
            selectedUser = element;
          }
        }
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
  List<VindicateGiftData>? getDefaultGifts() => _cachedUserGiftsMap["0"];

  /// 判断麦上用户是否发生变化
  bool checkMicUsersDidChange(
      {List<VindicateRoomPosition>? oldList,
      required List<VindicateRoomPosition> newList}) {
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
  void actionForSwitchSelectedUser(VindicateRoomPosition? user) {
    selectedUser = user;
    if (user != null) {
      currentUserGifts = _cachedUserGiftsMap['${user.roomPosition.uid}'];
      onSelectGift(currentUserGifts?.first);
    }
    notifyListeners();
    _loadUserGiftsStatus(user?.roomPosition);
  }

  /// 礼物赠送成功
  void onSendGiftSuccess(
      List<VindicateRoomPosition> users, VindicateGiftData giftData) {
    final userKeys = users.map((e) => e.key!).toList();
    final giftKey = _findGiftBoxKey(
        giftData.giftId, users.first.roomPosition.uid,
        isNeedPrevious: false, isUseForUnlockAnimation: false);
    if (giftKey != null) {
      giftFlyWidgetKey.currentState!.addGiftFlyData(VindicateGiftFlyData(
        flyToUserKey: userKeys.first,
        giftId: giftData.giftId,
        giftKey: giftKey.currentState!.getGiftIconKey,
      ));
    }
  }

  /// 加载当前麦上用户的礼物解锁状态
  Future _loadUserGiftsStatus(RoomPosition? user) async {
    final dataRsp = await _requestUserGifts(user);
    if (dataRsp.success == true) {
      /// 将uid为0的数据作为默认初始数据
      final userId = user?.uid ?? 0;
      _setUserGiftDataList(
          uid: userId, giftDataList: dataRsp.data, isRefresh: true);
      currentUserGifts = _cachedUserGiftsMap['$userId'];
      // Log.d('currentUserGifts = $currentUserGifts');
      onSelectGift(currentUserGifts?.first, byManual: false);
      _updateCurrentUnlockLevel();
      notifyListeners();
    }
    return;
  }

  _setUserGiftDataList(
      {required int uid,
      List<VindicateGiftData>? giftDataList,
      bool isRefresh = false}) {
    if (giftDataList != null && giftDataList.isNotEmpty) {
      _cachedUserGiftsMap['$uid'] =
          _sortUserGifts(giftDataList, isRefresh: isRefresh);
    }
  }

  /// 选中的globalKey
  onSelectGift(VindicateGiftData? gift,
      {Function(VindicateGiftData gift, int uid)? onUnlockGiftDialogSendBtnTap,
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
      Log.d('礼物未解锁，弹出礼物弹窗');

      final userId = selectedUser?.roomPosition.uid ?? 0;
      final previousGift = _findGift(gift.giftId, userId);

      if (previousGift != null) {
        VindicateDialog.show(System.context,
            gift: gift,
            giftUnlocked: false,
            previousGift: previousGift, onSendBtnTap: () {
          /// 获取最后一个已解锁的礼物
          VindicateGiftData? lastUnlockGift = previousGift;
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

  /// 礼物解锁动画
  Future _giftUnlockAnimate(VindicateGiftAnimateBoxState giftBoxState) async {
    _animateCompleter = Completer();

    giftBoxState.startUnlockAnimation(onAnimationCompleted: () {
      /// 礼物解锁的动画控制由外部的心型动画播放完成后回调
      // _animateCompleter.complete(true);
    });

    await _animateCompleter.future;
    Log.d('解锁动画执行完成');
    giftBoxState.resetUnlockAnimation();
  }

  /// 礼物动画
  Future _giftBoxAnimate() async {
    _animateCompleter = Completer();

    topStartKey.currentState?.startExchangeAnimation(onAnimationCompleted: () {
      /// 动画执行完成
      _animateCompleter.complete(true);
    });
    topEndKey.currentState?.startExchangeAnimation();
    bottomStartKey.currentState?.startExchangeAnimation();
    bottomEndKey.currentState?.startExchangeAnimation();

    await _animateCompleter.future;

    Log.d('礼物动画执行完成');
  }

  /// 打赏礼物触发了事件
  onVindicateIMEvent(VindicateEventTouchData eventData) {
    if (eventData.next) {
      if (isAnimating) return;

      _onVindicateGiftUnlockEvent(eventData);
    }

    /// 触发失败事件，只显示文案
    if (!Util.isNullOrEmpty(eventData.text)) {
      currentShowGiftDescription = eventData.text;
      currentShowGiftDescriptionKey = ValueKey(DateTime.now().toString());
      notifyListeners();
    }
  }

  _onVindicateGiftUnlockEvent(VindicateEventTouchData eventData) async {
    _setIsAnimating(true);

    /// 触发了解锁下阶段礼物
    /// 此时需要锁住面板不让用户进行点击操作
    /// 动画效果：
    /// 1、面板中间的心型有闪电效果 , 礼物的解锁动画
    /// 2、弹出对话框
    /// 3、对话框消失后，四个礼物进行缩放并变换内容效果

    final unlockedGift =
        _findGift(eventData.giftId, eventData.toUid, isNeedPrevious: false);
    final currentGiftBoxKey = _findGiftBoxKey(eventData.giftId, eventData.toUid,
        isNeedPrevious: false);

    if (unlockedGift != null && currentGiftBoxKey != null) {
      /// 解锁动画
      await _giftUnlockAnimate(currentGiftBoxKey.currentState!);
      unlockedGift.unlocked = true;
    }

    /// 弹出对话框
    await VindicateDialog.show(System.context,
        gift: unlockedGift!, giftUnlocked: true);

    /// 弹出框收起动画时间
    await Future.delayed(const Duration(milliseconds: 300));
    Log.d('弹出框关闭');

    /// 交换动画
    await _giftBoxAnimate();

    /// 更新数据
    var oldGifts = _cachedUserGiftsMap['${eventData.toUid}'] ?? [];

    /// 更新gift的解锁状态
    final resultGifts = _sortUserGifts(oldGifts,
        currentUnlockGift: unlockedGift, isRefresh: false);
    Log.d('eventData.toUid = ${eventData.toUid}');
    Log.d('selectedUser.toUid = ${selectedUser?.roomPosition.uid ?? 0}');
    if ((selectedUser?.roomPosition.uid ?? 0) == eventData.toUid) {
      Log.d('XXXXXX');
      currentUserGifts = resultGifts;
      selectedGift = unlockedGift;
    }
    _cachedUserGiftsMap['${eventData.toUid}'] = resultGifts;

    Log.d('礼物数据更新完成');

    notifyListeners();

    _setIsAnimating(false);

    _updateCurrentUnlockLevel();
  }

  _setIsAnimating(bool animate) {
    isAnimating = animate;
    notifyListeners();
  }

  /// 外部的心型动画执行完成
  onHeartWebpPlayCompleted() {
    if (isAnimating) {
      if (!_animateCompleter.isCompleted) {
        _animateCompleter.complete(true);
      }
    }
  }

  /// 对礼物的最高解锁顺序进行排序，把最高解锁的礼物放在第一位，未解锁的礼物依次向右排列，把已解锁的礼物依次放在列尾
  ///
  /// [currentUnlockGift] 当前解锁的礼物
  /// [isRefresh] 表示为从接口新获取的数据
  /// 如果没有解锁的礼物，同时礼物列表又没有待解锁的礼物，那么可以表示为该列表从
  List<VindicateGiftData> _sortUserGifts(List<VindicateGiftData> inputGifts,
      {VindicateGiftData? currentUnlockGift, bool isRefresh = false}) {
    int theHighestIndex = 0;

    bool hasLockedGift = false;

    /// 遇到第一个lock礼物结束
    for (int i = 0; i < inputGifts.length; i++) {
      /// 当[theHighestIndex==inputGifts.length - 1]时表示所以礼物都已解锁，把最高级礼物放在左边

      theHighestIndex = i;

      final gift = inputGifts[i];
      if (!gift.unlocked) {
        hasLockedGift = true;
        // Log.d('locked gift id : ${gift.giftId} , name = ${gift.name}');
        break;
      }
    }

    /// 当前列表已经没有需要解锁的礼物了
    if (!hasLockedGift) {
      /// 1、inputGifts为新请求的数据
      if (isRefresh) {
        /// 直接倒序
        return inputGifts.reversed.toList();
      } else {
        /// 2、非新请求的数据，则该列表里的数据一定是经过滚动的
        /// 此时列表中礼物的阶层排列为 3 4 1 2
        theHighestIndex = 1;
      }
    } else {
      theHighestIndex--;
    }

    if (theHighestIndex <= 0) {
      return inputGifts;
    }

    var outputList = inputGifts.sublist(theHighestIndex);
    outputList.addAll(inputGifts.sublist(0, theHighestIndex));
    return outputList;
  }

  /// 根据选择的麦上用户展示已解锁的礼物状态
  /// [user]可以为nil，表示当前四个礼物全是上锁状态
  Future<DataRsp<List<VindicateGiftData>>> _requestUserGifts(
      RoomPosition? user) async {
    try {
      final uid = user?.uid ?? 0;
      String url = '${System.domain}go/yy/confess/index';
      XhrResponse response = await Xhr.getJson(url,
          params: {
            if (uid > 0) 'uid': uid,
          },
          throwOnError: true,
          formatJson: true);

      /// 请求go接口需要设置formatJson ： true
      return DataRsp<List<VindicateGiftData>>.fromXhrResponse(response, (data) {
        // Log.i('表白活动当前选择的麦上用户的礼物打赏状态 ： $data');

        if (data is Map) {
          final giftDataList = data['stages'] as List;

          if (data['choose_num_config'] is List) {
            for (Map item in data['choose_num_config']) {
              String key = item['num'].toString();
              String value = item['desc'];
              chooseNumConfig[key] = value;
            }
          } else {
            chooseNumConfig = data['choose_num_config'] ?? {};
          }

          if (isSingleUserMode) {
            /// 获取对方头像url
            if (data.containsKey('target')) {
              final targetData = data['target'] as Map<String, dynamic>;
              final icon = targetData['icon'];

              /// 更新用户头像
              final key0 = selectedUser!.key;
              selectedUser = VindicateRoomPosition(
                  key: key0,
                  roomPosition: RoomPosition(
                    uid: selectedUser!.roomPosition.uid,
                    position: selectedUser!.roomPosition.position,
                    icon: icon,
                  ));
              notifyListeners();
            }
          }

          return giftDataList
              .map((json) => VindicateGiftData.fromJson(json))
              .toList();
        } else {
          return [];
        }
      });
    } catch (e) {
      return DataRsp(success: false, msg: e.toString());
    }
  }

  /// 根据当前礼物id找到上一阶段的礼物
  /// [giftId] 当前礼物id
  /// [uid] 被打赏人的uid
  VindicateGiftData? _findGift(int giftId, int uid,
      {bool isNeedPrevious = true}) {
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
  GlobalKey<VindicateGiftAnimateBoxState>? _findGiftBoxKey(int giftId, int uid,
      {bool isNeedPrevious = true, bool isUseForUnlockAnimation = true}) {
    final giftsList = _cachedUserGiftsMap['$uid'];
    if (giftsList == null) return null;

    int index = 0;
    giftsList.forEachIndexed((i, e) {
      if (e.giftId == giftId) {
        index = i;
      }
    });

    if (isNeedPrevious) {
      int previousIndex = index - 1;
      if (isUseForUnlockAnimation) {
        if (previousIndex < 0) return bottomStartKey;
        if (previousIndex == 0) return topStartKey;
        if (previousIndex == 1) return topEndKey;
        if (previousIndex == 2) return bottomEndKey;
      } else {
        if (previousIndex < 0) return bottomEndKey;
        if (previousIndex == 0) return topStartKey;
        if (previousIndex == 1) return topEndKey;
        if (previousIndex == 2) return bottomStartKey;
      }
    } else {
      if (index == 0) return topStartKey;
      if (index == 1) return topEndKey;
      if (isUseForUnlockAnimation) {
        if (index == 2) return bottomEndKey;
        if (index == 3) return bottomStartKey;
      } else {
        if (index == 2) return bottomStartKey;
        if (index == 3) return bottomEndKey;
      }
    }
    return null;
  }

  _updateCurrentUnlockLevel() {
    final lastUnlockGift = getLastUnlockGift();
    if (lastUnlockGift != null) {
      _setCurrentUnlockLevelListener(lastUnlockGift.title);
    }
  }

  /// 获取最大解锁礼物
  VindicateGiftData? getLastUnlockGift() {
    if (Util.isCollectionEmpty(currentUserGifts)) return null;

    final giftList = currentUserGifts!.toList();

    VindicateGiftData? lastUnlockGift = giftList.first;
    if (!lastUnlockGift.unlocked) {
      bool completed = false;
      while (!completed) {
        lastUnlockGift = _findGift(lastUnlockGift?.giftId ?? 0, uid!);
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
      return lastUnlockGift;
    }
    return null;
  }

  _setCurrentUnlockLevelListener(String value) {
    currentUnlockLevel = value;
    notifyListeners();
  }
}

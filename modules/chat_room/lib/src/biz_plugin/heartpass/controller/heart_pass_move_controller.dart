import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/biz_plugin/heartpass/model/heart_pass_repos.dart';
import 'package:chat_room/src/biz_plugin/heartpass/model/heart_pass_view_model.dart';
import 'package:chat_room/src/biz_plugin/heartpass/widget/heart_pass_level_widget.dart';
import 'package:chat_room/src/protobuf/generated/plugin_lucky.pb.dart';

/// 心动闯关移动
class HeartPassMoveRecord {
  final int position; // 麦位位置
  final bool isBoss; // 移动的位置是否是老板
  bool? toLeft; // true: 左移 false: 右移
  int step = 0;

  HeartPassMoveRecord(this.position, this.isBoss); // 移动步数

  void moveLeft() {
    if (toLeft == null) {
      toLeft = true;
      step = 1;
    } else if (toLeft!) {
      toLeft = true;
      step++;
    } else {
      step--;
      toLeft = step > 0 ? false : null;
    }
  }

  void moveRight() {
    if (toLeft == null) {
      toLeft = false;
      step = 1;
    } else if (!toLeft!) {
      toLeft = false;
      step++;
    } else {
      step--;
      toLeft = step > 0 ? true : null;
    }
  }

  @override
  String toString() {
    return 'position:$position, isBoss:$isBoss, toLeft:$toLeft, step:$step';
  }
}

/// 心动闯关移动控制
mixin HeartPassMoveController<T extends HeartPassLevelWidget> on State<T> {
  /// 本地移动记录，只有房主和接待可以操作
  HeartPassMoveRecord? _moveRecord;
  int editIndex = 0; // 正在编辑的位置
  /// 编辑之前的数据，如果编辑失败需要恢复
  List<ResLuckyBaseLocationList>? _editBeforeLevelData;

  @override
  void initState() {
    viewModel.room
        .addListener(RoomConstant.Event_Heart_Pass_Refresh, _onSocketRefresh);
    super.initState();
  }

  @override
  void dispose() {
    viewModel.room.removeListener(
        RoomConstant.Event_Heart_Pass_Refresh, _onSocketRefresh);
    super.dispose();
  }

  /// 有数据更新，取消编辑状态
  void _onSocketRefresh(String name, Object? data) {
    _editBeforeLevelData = null;
  }

  /// 初始化记录
  void initRecord(int position, bool isBoss) {
    _moveRecord = HeartPassMoveRecord(position, isBoss);
    _editBeforeLevelData = viewModel.model!.clone().locationList;
  }

  /// 没有移动
  bool noMove() {
    return _moveRecord == null || _moveRecord!.step == 0;
  }

  /// 往左移动
  void moveLeft(int index) {
    _move(index, true);
    _moveRecord?.moveLeft();
    Log.d('heartPass HeartPassMoveRecord moveRecord=${_moveRecord.toString()}');
  }

  /// 往右移动
  void moveRight(int index) {
    _move(index, false);
    _moveRecord?.moveRight();
    Log.d('heartPass HeartPassMoveRecord moveRecord=${_moveRecord.toString()}');
  }

  /// 关卡移动
  /// 关卡的顺序是从右到左，第一关在最右边，注释往前走是从右到走，往回走时从左到右
  void _move(int index, bool left) {
    List<ResLuckyBaseLocationList> currentLevelList =
        viewModel.model!.locationList;
    int swapIndex;
    ResLuckyBaseLocationList front; // 右边icon
    ResLuckyBaseLocationList next; // 左边icon
    if (left) {
      swapIndex = index + 1;
      front = currentLevelList[index];
      next = currentLevelList[swapIndex];
    } else {
      swapIndex = index - 1;
      front = currentLevelList[swapIndex];
      next = currentLevelList[index];
    }
    int nextEditIndex = swapIndex; // 下一个编辑的位置
    ResLuckyBaseLocationList last = currentLevelList.last;
    // 交换对象是否包含boss
    bool hasBoss = front.isBreaker == 1 || next.isBreaker == 1;
    if (hasBoss) {
      bool bossToNext = front.isBreaker == 1;
      int bossIndex =
          front.isBreaker == 1 ? min(index, swapIndex) : max(index, swapIndex);
      if (bossIndex == 0) {
        // boss在初始位置，直接交换
        ResLuckyBaseLocationList temp = currentLevelList[index];
        currentLevelList[index] = currentLevelList[swapIndex];
        currentLevelList[swapIndex] = temp;
        nextEditIndex = swapIndex;
      } else {
        if (bossToNext) {
          // boss往前走
          if (last.user.length == 1) {
            // 最后一关只有一个人，直接换
            ResLuckyBaseLocationList temp = currentLevelList[index];
            currentLevelList[index] = currentLevelList[swapIndex];
            currentLevelList[swapIndex] = temp;
            nextEditIndex = swapIndex;
          } else {
            // 最后一关大于一个人，boss位置不变，其它位置都往前移一位
            for (int i = 0; i < currentLevelList.length; i++) {
              if (i == bossIndex) continue;
              if (i == 0) {
                currentLevelList[i].user.add(currentLevelList[i + 2].user[0]);
              } else if (i == currentLevelList.length - 1) {
                currentLevelList[i].user.removeAt(0);
              } else {
                currentLevelList[i].user[0] = currentLevelList[i + 1].user[0];
              }
            }
            if (bossIndex == index) {
              nextEditIndex = index;
            } else {
              nextEditIndex = index - 2;
            }
          }
        } else {
          // boss往回走
          if (front.user.length == 1) {
            // 前面一关只有一个人 直接换
            ResLuckyBaseLocationList temp = currentLevelList[index];
            currentLevelList[index] = currentLevelList[swapIndex];
            currentLevelList[swapIndex] = temp;
            nextEditIndex = swapIndex;
          } else {
            // 前面一关大于一个人，boss位置不变，其他位置都往后移一位
            ResLuckyBaseUser? temp;
            for (int i = 0; i < currentLevelList.length; i++) {
              if (i == bossIndex) continue;
              if (i == 0) {
                temp = currentLevelList[i].user.removeLast();
              } else if (i == currentLevelList.length - 1) {
                currentLevelList[i].user.insert(0, temp!);
              } else {
                ResLuckyBaseUser temp1 = currentLevelList[i].user.removeLast();
                currentLevelList[i].user.add(temp!);
                temp = temp1;
              }
            }
            if (bossIndex == index) {
              nextEditIndex = index;
            } else {
              nextEditIndex = index + 2;
            }
          }
        }
      }
    } else {
      // 不包含boss
      if (front.user.length == 1 && next.user.length == 1) {
        // 两个关卡都只有一个人 直接换
        ResLuckyBaseUser temp0 = next.user[0];
        next.user[0] = front.user.removeLast();
        front.user.add(temp0);
        nextEditIndex = swapIndex;
      } else if (next.user.length > 1) {
        // 后面关卡大于1
        ResLuckyBaseUser temp0 = next.user[0];
        next.user[0] = front.user.removeLast();
        front.user.add(temp0);
        nextEditIndex = swapIndex;
      } else {
        // 前面关卡大于0，第一个位置互换
        ResLuckyBaseUser temp0 = front.user.removeLast();
        front.user.add(next.user.removeLast());
        next.user.add(temp0);
        nextEditIndex = swapIndex;
      }
    }
    editIndex = nextEditIndex;
    setState(() {});
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (mounted) setState(() {});
    });
  }

  /// 保存关卡
  void postRecord() async {
    if (_moveRecord == null || _moveRecord!.step == 0) {
      viewModel.edit = false;
      return;
    }
    if (viewModel.model?.locationList.last.isBreaker == 1 &&
        viewModel.isPlaying) {
      bool result = await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return ConfirmDialog(
              content: K.room_heart_pass_end_confirm,
            );
          });
      if (!result) return;
    }
    viewModel.edit = false;
    bool result = await HeartPassRepos.move(viewModel.room.rid, _moveRecord!);
    if (result) {
      Fluttertoast.showToast(msg: K.room_heart_pass_edit_success);
    } else {
      // 编辑关卡失败需要回复
      viewModel.model?.locationList.clear();
      viewModel.model?.locationList.addAll(_editBeforeLevelData!);
    }
    _moveRecord = null;
    _editBeforeLevelData = null;
    viewModel.postRecord();
  }

  HeartPassViewModel get viewModel {
    return widget.viewModel;
  }
}

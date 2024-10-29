import 'dart:async';
import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/widget/pendant/room_activity_pendant.dart';
import 'package:chat_room/src/protobuf/generated/room_position_plugin.pb.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';

import 'pendant_introduction_dialog.dart';
import 'pendant_repo.dart';
import 'pendant_util.dart';
import 'rewards_show_dialog.dart';

/// 通用挂件,支持协议跳转和宝箱抽奖
class CommonPendant extends StatefulWidget {
  final ChatRoomData room;
  final ResRoomPositionPluginItem data;
  final ValueNotifier<int> timerNotifier;

  const CommonPendant(
      {super.key,
      required this.room,
      required this.data,
      required this.timerNotifier});

  @override
  State<CommonPendant> createState() => _CommonPendantState();
}

class _CommonPendantState extends State<CommonPendant> {
  final RepeatCallChecker _callCheck = RepeatCallChecker();

  /// 当前挂件的状态数据
  ResRoomPositionPluginItemStageInfo get _stageInfo => widget.data.stageInfo;

  /// 剩余时间
  int _remainderTime = 0;

  @override
  void initState() {
    super.initState();
    _updateRemainderTime();
    widget.timerNotifier.addListener(_onTick);
    _checkNeedPlayEffect();
  }

  @override
  void dispose() {
    widget.timerNotifier.removeListener(_onTick);
    super.dispose();
  }

  @override
  void didUpdateWidget(CommonPendant oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data.stageInfo.endTime != _stageInfo.endTime) {
      _updateRemainderTime();
    }
  }

  /// 更新剩余时间
  void _updateRemainderTime() {
    _remainderTime = remainderTime(_stageInfo.endTime);
  }

  void _onTick() {
    if (--_remainderTime < 0) {
      _notifyDeleteCache();
      return;
    }
    refresh();
  }

  /// 通知删除缓存,实现隐藏插件的目的
  void _notifyDeleteCache() {
    if (_stageInfo.endShowType != 1) return;
    // 到期后需要隐藏,发送删除对应缓存数据通知
    widget.room.emit(roomPendantKey, {
      'op': 'delete',
      'showType': widget.data.pluginShowType,
      'pluginId': widget.data.pluginId,
    });
  }

  /// 检测是否需要播放动效
  Future<void> _checkNeedPlayEffect() async {
    if (!await hasReceived(widget.data.pluginId) &&
        !alreadyHandClosePluginEffect(
            widget.data.pluginId, widget.data.stageInfo.pluginType)) {
      // 未领取该插件id对应的奖励
      _notifyPlayEffect();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          // 背景Icon
          R.img(Util.getRemoteImgUrl(widget.data.icon),
              width: 60, height: 84, fit: BoxFit.fill),
          if (_stageInfo.endTimeType ==
                  PendantTimeShowType.show_countdown.name ||
              _stageInfo.endTimeType ==
                  PendantTimeShowType
                      .show_countdown_hour.name) // 时间显示类型为倒计时时才显示
            PositionedDirectional(
              bottom: 0,
              child: Container(
                width: 60,
                height: 20,
                alignment: AlignmentDirectional.center,
                child: NumText(
                  formatTime(_remainderTime, _stageInfo.endTimeType),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _onTap() async {
    if (_stageInfo.clickType == PendantClickType.jump.name) {
      // Scheme协议跳转
      String jumpUrl;
      if (_stageInfo.clickExtra.contains('rid=')) {
        jumpUrl = _stageInfo.clickExtra;
      } else {
        jumpUrl = '${_stageInfo.clickExtra}&rid=${widget.room.rid}';
      }
      Log.d(tag: TAG, '===>jumpUrl=$jumpUrl');
      SchemeUrlHelper.instance().jump(jumpUrl);
    } else if (_stageInfo.clickType == PendantClickType.introduction.name) {
      // 说明介绍弹框
      _showIntroductionDialog();
    } else if (_stageInfo.clickType == PendantClickType.lottery.name ||
        _stageInfo.clickType == PendantClickType.act_activity.name) {
      if (await _checkHasReceived()) {
        // 已领取过奖励
        return;
      }
      // 抽奖类型
      if (!Util.isStringEmpty(_stageInfo.stageMp4)) {
        // 未领取过先播放动效再抽奖
        _notifyPlayEffect();
      } else {
        // 直接抽奖
        _drawRewards();
      }
    }
  }

  /// 展示说明介绍弹框
  void _showIntroductionDialog() {
    if (Util.isStringEmpty(_stageInfo.clickExtra)) return;
    var clickExtra = jsonDecode(_stageInfo.clickExtra);
    if (clickExtra is Map) {
      PendantIntroductionDialog.show(context,
          room: widget.room, extra: clickExtra);
    }
  }

  /// 通知播放动效
  Future<void> _notifyPlayEffect() async {
    widget.room.emit(roomTopmostEffectKey, {
      'pluginItem': widget.data,
      'onTap': _drawRewards,
    });
  }

  /// 检测是否领取过奖励
  Future<bool> _checkHasReceived() async {
    if (await hasReceived(widget.data.pluginId)) {
      // 之前该设备已领取过该红包
      Fluttertoast.showToast(msg: K.room_pendant_reward_tip);
      return true;
    }
    return false;
  }

  /// 抽奖逻辑
  Future<void> _drawRewards() async {
    if (_callCheck.isInvalidCall()) return;
    int pluginId = _stageInfo.pluginId;
    ResRoomPositionPluginClick resp = await PendantRepo.drawRewards(
      rid: widget.room.rid,
      pluginId: pluginId,
      stageId: _stageInfo.stageId,
      clickType: _stageInfo.clickType,
      clickExtra: _stageInfo.clickExtra,
    );
    if (resp.success) {
      if (resp.data.checkInfo.needIdentification) {
        // 需要实名认证,弹出实名认证弹框
        ISettingManager settingManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_SETTINGS);
        settingManager.openIdAuth(context);
      } else {
        if (!Util.isStringEmpty(resp.msg)) {
          Fluttertoast.showToast(msg: resp.msg);
        }
        // 弹出奖励弹框
        RewardsShowDialog.show(context, resp.data.actData);
        // 本地保存已领取奖励状态
        saveReceivedPlugin(pluginId);
      }
    } else {
      if (!Util.isStringEmpty(resp.msg)) {
        Fluttertoast.showToast(msg: resp.msg);
      }
    }
  }
}

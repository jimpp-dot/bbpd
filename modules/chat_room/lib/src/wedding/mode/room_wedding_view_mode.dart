import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/wedding/mode/room_wedding_beans.dart';

import 'room_wedding_repo.dart';
import 'wedding_combo_data.dart';

/// 婚礼房viewModel
class RoomWeddingViewModel extends ChangeNotifier {
  final ChatRoomData room;
  final ValueChanged<String> onLoadCallback;
  WeddingData? weddingData;
  bool loading = true; // 加载中
  bool _isDispose = false;

  RoomWeddingViewModel(this.room, this.onLoadCallback);

  WeddingState? _startWeddingState;

  /// 婚礼流程
  WeddingState? get weddingState => weddingData?.stage;

  bool get isStartWeddingState => _startWeddingState == weddingState;
  List<WeddingComboUser>? comboTopList;
  WeddingComboGift? comboGift;

  /// 婚礼当前流程的特效
  WeddingEffect? get weddingEffect {
    if (weddingData?.effect != null && weddingData!.effect.isNotEmpty) {
      for (WeddingEffect effect in weddingData!.effect) {
        if (effect.stage == weddingData!.stage) {
          return effect;
        }
      }
    }
    return null;
  }

  /// 获取当前用户的婚礼角色
  static WeddingRole getSelfRole(WeddingData? weddingData) {
    return getWeddingRole(weddingData, Session.uid);
  }

  /// 获取用户的婚礼角色，只有上麦了才有角色，没上麦默认游客
  static WeddingRole getWeddingRole(WeddingData? weddingData, int uid) {
    List<WeddingMic>? mics = weddingData?.mics;
    if (mics != null && mics.isNotEmpty) {
      for (WeddingMic mic in mics) {
        if (mic.uid == uid) {
          return mic.role;
        }
      }
    }
    return WeddingRole.Visitor;
  }

  static String getComboImageUrl(
      WeddingComboConfig comboConfig, String type, int position) {
    if ('big' == type) {
      return comboConfig.bigImageUrls[position];
    } else if ('medium' == type) {
      return comboConfig.mediumImageUrls[position];
    } else if ('small' == type) {
      return comboConfig.smallImageUrls[position];
    }
    return '';
  }

  initState() {
    room.addListener(RoomConstant.Event_Wedding_Refresh, _onWeddingStateChange);
    room.addListener(RoomConstant.Event_Wedding_Role, _onWeddingMicRefresh);
    room.addListener(
        RoomConstant.Event_Wedding_Combo_Gift, _onWeddingComboGift);
    room.addListener(
        RoomConstant.Event_Wedding_Combo_top, _onWeddingComboTopUser);
    _loadData();
  }

  @override
  void dispose() {
    _isDispose = true;
    room.removeListener(
        RoomConstant.Event_Wedding_Refresh, _onWeddingStateChange);
    room.removeListener(RoomConstant.Event_Wedding_Role, _onWeddingMicRefresh);
    room.removeListener(
        RoomConstant.Event_Wedding_Combo_Gift, _onWeddingComboGift);
    room.removeListener(
        RoomConstant.Event_Wedding_Combo_top, _onWeddingComboTopUser);
    super.dispose();
  }

  /// 加载婚礼房数据
  _loadData() async {
    final bool isInitData = weddingData == null;
    weddingData = await RoomWeddingRepo.getWeddingData(room.rid);
    if (_isDispose) return;
    if (isInitData && weddingData != null) {
      _startWeddingState = weddingState;
    }
    loading = false;
    if (weddingData == null) {
      onLoadCallback('');
    } else {
      _preCacheGift();
    }
    notifyListeners();
  }

  /// 麦位刷新
  _onWeddingMicRefresh(String type, dynamic data) {
    if (data is Map && data['list'] is List) {
      try {
        List content = data['list'];
        List<WeddingMic> list = content
            .map((e) => WeddingMic.fromJson(e as Map<String, dynamic>))
            .toList();
        weddingData?.mics = list;
        notifyListeners();
      } catch (e) {
        Log.d(e);
      }
    }
  }

  /// 状态刷新
  _onWeddingStateChange(String type, dynamic data) {
    if (data is Map) {
      try {
        WeddingUpdate updateData =
            WeddingUpdate.fromJson(data as Map<String, dynamic>);
        weddingData?.stage = updateData.stage;
        weddingData?.blessScore = updateData.blessScore;
        notifyListeners();
      } catch (e) {
        Log.d(e);
      }
    }
  }

  onConfirmNext(bool confirm) {
    RoomWeddingRepo.weddingConfirmNext(
        rid: room.rid,
        confirm: confirm ? 1 : 0,
        stage: (weddingState?.index ?? 0) + 1);
  }

  _preCacheGift() {
    if (weddingData?.comboConfig == null) return;

    for (var imageUrl in weddingData!.comboConfig!.bigImageUrls) {
      CachedImageManager.instance().add(imageUrl);
    }
    for (var imageUrl in weddingData!.comboConfig!.mediumImageUrls) {
      CachedImageManager.instance().add(imageUrl);
    }
    for (var imageUrl in weddingData!.comboConfig!.smallImageUrls) {
      CachedImageManager.instance().add(imageUrl);
    }
  }

  _onWeddingComboGift(String type, dynamic data) {
    try {
      Map<String, dynamic> content = data as Map<String, dynamic>;
      WeddingComboGift comboGift = WeddingComboGift.fromJson(content);
      for (var element in comboGift.giftList) {
        if (weddingData?.comboConfig != null) {
          element.imageUrl = getComboImageUrl(
              weddingData!.comboConfig!, comboGift.type, element.index);
        }
        element.type = comboGift.type;
      }
      this.comboGift = comboGift;
      eventCenter.emit(RoomConstant.Event_Wedding_Combo_Gift, comboGift);
    } catch (e) {
      Log.d(e);
    }
  }

  resetComboGift() {
    comboGift = null;
  }

  _onWeddingComboTopUser(String type, dynamic data) {
    try {
      if (data is Map && data['list'] is List) {
        List<Map<String, dynamic>> topList = data['list']
            .map<Map<String, dynamic>>((value) => value as Map<String, dynamic>)
            .toList();
        comboTopList =
            topList.map((e) => WeddingComboUser.fromJson(e)).toList();
        notifyListeners();
      }
    } catch (e) {
      Log.d(e);
    }
  }
}

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:chat_room/src/ktv/model/sing_tuner_widget.dart';
import '../../../assets.dart';
import '../../../k.dart';
import 'package:commonrtc_api/commonrtc_api.dart';

import 'export_model.dart';

enum KtvMusicSingMode {
  none, // 没有点歌
  leadSing, // 主唱
  chorus // 合唱
}

class KtvMusicModel extends ChangeNotifier with TunerDataSourceProvider {
  @override
  final ChatRoomData room;

  /// 演唱模式
  KtvMusicSingMode _singMode = KtvMusicSingMode.none;

  /// 点歌数量
  int _musicNum = 0;

  /// 音效数据
  TunerModel _tunerModel = TunerModel();

  /// 混响列表数据
  final List<ExportReverbItem> _effectModels = [];

  /// Getter
  KtvMusicSingMode get singMode => _singMode;

  int get musicNum => _musicNum;

  /// initialize
  KtvMusicModel(this.room) {
    _initialize();
  }

  /// Setter
  set singMode(KtvMusicSingMode mode) {
    if (_singMode != mode) {
      _singMode = mode;
      _notify();
    }
  }

  set musicNum(int num) {
    if (_musicNum != num) {
      _musicNum = num;
      _notify();
    }
  }

  void _initialize() {
    List<String> names = [
      K.room_voice_reverb_type_0, // 关闭
      'KTV', // ktv
      K.room_voice_reverb_type_2, //小房间
      K.room_voice_reverb_type_3, //大会堂
      K.room_voice_reverb_type_4, //低沉
      K.room_voice_reverb_type_5, //洪亮
      K.room_voice_reverb_type_6, //金属声
      K.room_voice_reverb_type_7, //磁性
      K.room_voice_reverb_type_8, //空灵
      K.room_voice_reverb_type_9, //录音棚
      K.room_voice_reverb_type_10 //悠扬
    ];

    List<String> icons = [
      RoomAssets.chat_room$ktv_ktv_effect_close_webp,
      RoomAssets.chat_room$ktv_ktv_effect_ktv_webp,
      RoomAssets.chat_room$ktv_ktv_effect_xfj_webp,
      RoomAssets.chat_room$ktv_ktv_effect_dht_webp,
      RoomAssets.chat_room$ktv_ktv_effect_dc_webp,
      RoomAssets.chat_room$ktv_ktv_effect_hl_webp,
      RoomAssets.chat_room$ktv_ktv_effect_jss_webp,
      RoomAssets.chat_room$ktv_ktv_effect_cx_webp,
      RoomAssets.chat_room$ktv_ktv_effect_kl_webp,
      RoomAssets.chat_room$ktv_ktv_effect_lyp_webp,
      RoomAssets.chat_room$ktv_ktv_effect_yy_webp,
    ];

    for (int i = 0; i < names.length; i++) {
      var name = names[i];
      var type = 0; // 值不重要
      var icon = icons[i];
      var value = 1; // 值不重要
      var item = ExportReverbItem(name, type, icon, value);
      _effectModels.add(item);
    }
  }

  void _notify() {
    if (hasListeners) {
      notifyListeners();
    }
  }

  /// TunerDataSourceProvider implement

  @override
  TunerModel get initTunerModel => _tunerModel;

  @override
  set tunerModel(TunerModel model) {
    _tunerModel = model;
  }

  @override
  List<ExportReverbItem> get effectModels => _effectModels;

  @override
  bool get showReverbList {
    var show = ChatRoomData.getInstance()?.currentRtcType ==
        RtcBizConfig.rtcTypeTencent;
    return show;
  }

  @override
  TunerTapIndexCallback configEffectAtIndex(
      int index,
      ExportReverbItem? lastSelectEffect,
      TunerBoolCallback isSelected,
      TunerWidgetCallback iconOf) {
    var item = effectModels[index];

    /// index 是否选中
    bool selected = (index == ChatRoomData.getInstance()?.trtcVoiceReverbType);
    isSelected(selected);

    /// index 位置的 icon
    var icon = R.img(item.icon, width: 70.dp, height: 70.dp);
    iconOf(icon);

    /// index 位置的点击事件
    return _onSelectEffect;
  }

  @override
  void adjustRecordingSignalVolume(int volume) {
    room.rtcController.engine?.adjustRecordingSignalVolume(volume);
  }

  @override
  void adjustAudioMixingVolume(int volume) {
    room.rtcController.engine?.adjustAudioMixingVolume(volume);
  }

  void _onSelectEffect(int index) {
    ChatRoomData.getInstance()?.trtcVoiceReverbType = index;
    ChatRoomData.getInstance()?.rtcController.engine?.setVoiceReverbType(index);
  }
}

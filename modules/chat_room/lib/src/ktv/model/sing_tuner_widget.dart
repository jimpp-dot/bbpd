import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/material.dart';

import 'export_model.dart';

typedef TunerWidgetCallback = void Function(Widget icon);
typedef TunerBoolCallback = void Function(bool selected);
typedef TunerTapIndexCallback = void Function(int index);

class TunerModelViewModel extends ChangeNotifier {
  AudioOutputRouting audioRouteType = AudioOutputRouting.Speakerphone;

  notifyUI() {
    if (hasListeners) notifyListeners();
  }
}

/// TunerBottomDialog 调节用到的 ViewModel
/// 抽象出该类，是为了将 TunerBottomDialog 给 ktv 和 KtvMusic 复用
///

abstract class TunerDataSourceProvider {
  TunerModel get initTunerModel;

  set tunerModel(TunerModel model);

  ChatRoomData get room;

  List<ExportReverbItem> get effectModels;

  /// 是否需要显示混响调节列表
  bool get showReverbList;

  /// 点击混响效果
  TunerTapIndexCallback configEffectAtIndex(
      int index,
      ExportReverbItem? lastSelectEffect,
      TunerBoolCallback isSelected,
      TunerWidgetCallback iconOf);

  /// 调节音量
  void adjustRecordingSignalVolume(int volume);

  void adjustAudioMixingVolume(int volume);
}

class TunerModel {
  /// 默认播放声音大小
  static const int PLAYBACK_SIGNAL_VOLUME_DEFAULT = 83;

  /// 默认耳返声音大小
  static const int EAR_MONITORING_VOLUME_DEFAULT = 83;

  /// 默认人声大小
  static const int RECORD_SIGNAL_VOLUME_DEFAULT = 83;

  /// 默认伴奏大小
  static const int MIXING_VOLUME_DEFAULT = 60;

  /// 编辑时 建议声音大小
  static const int RECORD_SIGNAL_VOLUME_SUGGEST = 83;

  /// 编辑时 建议伴奏大小
  static const int MIXING_VOLUME_SUGGEST = 60;

  /// 建议播放音量大小
  static const int PLAYBACK_SIGNAL_VOLUME_SUGGEST = 83;

  /// 耳返
  bool enableInEarMonitoring;

  /// 混响
  ExportReverbItem? effectModel;

  /// 伴奏音量
  int audioMixingVolume;

  /// 人声音量
  int recordSignalVolume;

  /// 伴奏音调
  int mixingPitch;

  /// 播放音量
  int playbackSignalVolume;

  /// 耳返音量
  int earMonitoringVolume;

  TunerModel({
    this.enableInEarMonitoring = false,
    this.effectModel,
    this.audioMixingVolume = 60,
    this.recordSignalVolume = 83,
    this.mixingPitch = 0,
    this.playbackSignalVolume = 83,
    this.earMonitoringVolume = 83,
  });

  TunerModel copyWith({
    bool? enableInEarMonitoring,
    ExportReverbItem? effectModel,
    int? audioMixingVolume,
    int? recordSignalVolume,
    int? mixingPitch,
  }) {
    return TunerModel(
      enableInEarMonitoring:
          enableInEarMonitoring ?? this.enableInEarMonitoring,
      effectModel: effectModel ?? this.effectModel,
      audioMixingVolume: audioMixingVolume ?? this.audioMixingVolume,
      recordSignalVolume: recordSignalVolume ?? this.recordSignalVolume,
      mixingPitch: mixingPitch ?? this.mixingPitch,
    );
  }
}

/// 底部弹出的调音器
class TunerBottomDialog extends StatefulWidget {
  final TunerDataSourceProvider provider;
  final bool realTimeChange; // 是否实时变化
  final AudioOutputRouting audioRouteType;
  final TunerModelViewModel? tunerModelViewModel;

  const TunerBottomDialog({
    Key? key,
    required this.provider,
    required this.realTimeChange,
    required this.tunerModelViewModel,
    this.audioRouteType = AudioOutputRouting.Speakerphone,
  }) : super(key: key);

  @override
  _TunerBottomDialogState createState() => _TunerBottomDialogState();

  ///打开调音面板
  static Future<TunerModel?> showTunerDialog(
    BuildContext context, {
    required TunerDataSourceProvider provider,
    required bool realTimeChange,
    AudioOutputRouting audioRouteType = AudioOutputRouting.Speakerphone,
    TunerModelViewModel? tunerModelViewModel,
  }) async {
    var result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      barrierColor: Colors.transparent,
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadiusDirectional.vertical(top: Radius.circular(14)),
      ),
      builder: (context) => TunerBottomDialog(
        provider: provider,
        realTimeChange: realTimeChange,
        audioRouteType: audioRouteType,
        tunerModelViewModel: tunerModelViewModel,
      ),
    );

    if (result != null) {
      provider.tunerModel = result;
    }
    return result;
  }
}

class _TunerBottomDialogState extends State<TunerBottomDialog> {
  final int REVERB_NORMAL_TYPE = 1;

  final int REVERB_CHANGE_VOICE_TYPE = 2;

  TunerModel _tuner = TunerModel();
  TunerModel _tempTuner = TunerModel();
  bool operationAuricularGyrus = true;
  List<ExportReverbItem> _reverbList = [];

  @override
  void initState() {
    super.initState();
    _addListener();
    _load();
  }

  void _initData() {
    _tuner = widget.provider.initTunerModel;
    _tempTuner = _tuner;
  }

  void _addListener() {
    operationAuricularGyrus = _operationAuricularGyrus(widget.audioRouteType);

    if (widget.tunerModelViewModel != null) {
      widget.tunerModelViewModel!.addListener(_audioRouteTypeListener);
    }
  }

  void _audioRouteTypeListener() {
    operationAuricularGyrus =
        _operationAuricularGyrus(widget.tunerModelViewModel!.audioRouteType);
    if (!operationAuricularGyrus) {
      _tempTuner.enableInEarMonitoring = false;
      widget.provider.room.rtcController.engine?.enableInEarMonitoring(false);
    }
    refresh();
  }

  TunerModel getNewModel(TunerModel model) {
    TunerModel newModel = TunerModel();
    newModel.mixingPitch = model.mixingPitch;
    newModel.recordSignalVolume = model.recordSignalVolume;
    newModel.audioMixingVolume = model.audioMixingVolume;
    newModel.enableInEarMonitoring = model.enableInEarMonitoring;
    newModel.effectModel = model.effectModel;
    return newModel;
  }

  @override
  void dispose() {
    if (widget.tunerModelViewModel != null) {
      widget.tunerModelViewModel!.removeListener(_audioRouteTypeListener);
    }
    super.dispose();
  }

  _load() {
    _reverbList = widget.provider.effectModels;
    _tuner = widget.provider.initTunerModel;
    _tempTuner = _tuner;
  }

  @override
  void didUpdateWidget(TunerBottomDialog oldWidget) {
    super.didUpdateWidget(oldWidget);
    _initData();
  }

  // @ignore_rtl 关闭RTL检查
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildHeader(), // 调音标题
        Divider(height: 1.dp, color: const Color(0x1AFFFFFF)), // 分割线
        if (widget.realTimeChange) _buildAuricularGyrus(),
        _buildVoiceSeekbar(),
        _buildAccompanySeekbar(),
        if (widget.provider.showReverbList && _reverbList.isNotEmpty) ...[
          SizedBox(height: 20.dp),
          _buildReverbListWidget(),
        ],
        SizedBox(height: 20.dp + Util.iphoneXBottom),
      ],
    );
  }

  Widget _buildHeader() {
    return GestureDetector(
      onTap: () async {
        _tuner = _tempTuner;
        await Navigator.maybePop(context, _tuner);
      },
      child: Padding(
        padding:
            EdgeInsetsDirectional.only(top: 11.dp, start: 11.dp, bottom: 6.dp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            R.img(
              RoomAssets.chat_room$ktv_arrow_down_webp,
              width: 26.dp,
              height: 26.dp,
            ),
            Text(
              K.room_set_title,
              style: TextStyle(
                  fontSize: 14.dp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 11.dp + 26.dp),
          ],
        ),
      ),
    );
  }

  /// 耳返
  Widget _buildAuricularGyrus() {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 21.dp),
      padding: EdgeInsetsDirectional.only(start: 18.dp, end: 18.dp),
      height: 74.dp,
      child: Row(
        children: [
          GestureDetector(
            onTap: () async {
              bool res = await ChatRoomUtil.changeEarMonitoringEnable();
              if (res) {
                refresh();
              }
            },
            child: Container(
              height: 74.dp,
              width: 100.dp,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: const Color(0x14FFFFFF),
                border:
                    Border.all(color: const Color(0x26E0E0E0), width: 0.1.dp),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildAuricularGyrusTitle(K.sing_auricular_gyrus),
                  Text(
                    ChatRoomUtil.earMonitoringEnable() ? K.open : K.close,
                    style: TextStyle(
                      color: operationAuricularGyrus
                          ? const Color(0xFF1CC9AA)
                          : Colors.white.withOpacity(0.5),
                      fontSize: 21.dp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 18.dp),
          Expanded(
            child: Container(
              height: 74.dp,
              // width: 100.dp,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: const Color(0x14FFFFFF),
                border:
                    Border.all(color: const Color(0x26E0E0E0), width: 0.1.dp),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildAuricularGyrusTitle(K.sing_lifting_adjustment),
                  _buildPitchSeekbar(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _operationAuricularGyrus(AudioOutputRouting audioRouteType) {
    if (audioRouteType == AudioOutputRouting.Headset) {
      return true;
    }
    return false;
  }

  Widget _buildAuricularGyrusTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white.withOpacity(0.5),
        fontSize: 13.dp,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  /// 人声音量
  Widget _buildVoiceSeekbar() {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 18.dp, top: 18.dp, end: 18.dp),
      child: _TitleSeekBarWidget(
        title: K.sing_vocal_volume,
        value: _tempTuner.recordSignalVolume,
        min: 0,
        max: 100,
        onChanged: (value) {
          if (_tempTuner.recordSignalVolume == value) return;
          _tempTuner.recordSignalVolume = value;
          widget.provider.adjustRecordingSignalVolume(value);
        },
      ),
    );
  }

  ///  伴奏音量
  Widget _buildAccompanySeekbar() {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 18.dp, top: 19.dp, end: 18.dp),
      child: _TitleSeekBarWidget(
        title: K.sing_style_volume,
        value: _tempTuner.audioMixingVolume,
        min: 0,
        max: 100,
        onChanged: (value) {
          if (_tempTuner.audioMixingVolume == value) return;
          _tempTuner.audioMixingVolume = value;
          widget.provider.adjustAudioMixingVolume(value);
        },
      ),
    );
  }

  /// 升降调
  Widget _buildPitchSeekbar() {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 18.dp, end: 18.dp),
      child: _PitchSeekBarWidget(
        value: _tempTuner.mixingPitch,
        onChanged: (value) {
          if (_tempTuner.mixingPitch == value) return;
          _tempTuner.mixingPitch = value;
          widget.provider.room.rtcController.setAudioMixingPitch(value);
        },
      ),
    );
  }

  /// 混响
  Widget _buildReverbListWidget() {
    return Column(
      children: [
        Container(
          alignment: AlignmentDirectional.centerStart,
          padding: EdgeInsetsDirectional.only(start: 18.dp, bottom: 12.dp),
          width: MediaQuery.of(context).size.width,
          child: Text(
            K.sing_reverberation,
            style: TextStyle(
              color: const Color(0xFFFFFFFF).withOpacity(0.5),
              fontSize: 13.dp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          height: 70.dp,
          padding: EdgeInsetsDirectional.only(start: 18.dp),
          child: ListView.separated(
            itemBuilder: (context, index) {
              return _reverberationCell(index);
            },
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) =>
                VerticalDivider(width: 7.0.dp),
            itemCount: _reverbList.length,
          ),
        ),
      ],
    );
  }

  /// 混响
  Widget _reverberationCell(int index) {
    var item = widget.provider.effectModels[index];

    bool isSelected = false;
    Widget? img;
    var onTap = widget.provider
        .configEffectAtIndex(index, _tempTuner.effectModel, (selected) {
      isSelected = selected;
    }, (icon) {
      img = icon;
    });

    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            _tempTuner.effectModel = item;
            onTap(index);
            refresh();
          },
          child: SizedBox(
            width: 70.dp,
            height: 70.dp,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(7)),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                child: img,
              ),
            ),
          ),
        ),
        if (isSelected)
          PositionedDirectional(
            width: 70.dp,
            height: 70.dp,
            child: IgnorePointer(
              child: R.img(
                RoomAssets.chat_room$ktv_record_edit_video_sel_webp,
                width: 70.dp,
                height: 70.dp,
                color: R.color.mainBrandColor,
              ),
            ),
          ),
        PositionedDirectional(
          top: 25.dp,
          child: IgnorePointer(
            child: Container(
              alignment: AlignmentDirectional.center,
              width: 70.dp,
              height: 26.dp,
              child: Text(item.name,
                  style: TextStyle(
                      color: const Color(0xB3FFFFFF), fontSize: 11.dp)),
            ),
          ),
        ),
      ],
    );
  }
}

/// 带标题的seekbar
class _TitleSeekBarWidget extends StatefulWidget {
  final String title;
  final int value;
  final int min;
  final int max;
  final ValueChanged<int>? onChanged;

  const _TitleSeekBarWidget({
    Key? key,
    required this.title,
    required this.value,
    this.min = 0,
    this.max = 1,
    this.onChanged,
  }) : super(key: key);

  @override
  _TitleSeekBarWidgetState createState() => _TitleSeekBarWidgetState();
}

class _TitleSeekBarWidgetState extends State<_TitleSeekBarWidget> {
  double _curProgress = 0;

  @override
  void initState() {
    super.initState();
    _curProgress = widget.value.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 36.dp;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 42.dp,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0x14FFFFFF)),
        alignment: AlignmentDirectional.center,
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            SizedBox(width: width, child: _buildSlide()),
            _buildName(),
            PositionedDirectional(
              end: 0,
              bottom: 0,
              child: _buildScore(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildName() {
    return Container(
      height: 42.dp,
      width: 100.dp,
      padding: EdgeInsetsDirectional.only(start: 18.dp),
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        widget.title,
        style: TextStyle(
            color: Colors.white, fontSize: 13.dp, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildScore() {
    return Container(
      height: 42.dp,
      width: 100.dp,
      padding: EdgeInsetsDirectional.only(end: 18.dp),
      alignment: AlignmentDirectional.centerEnd,
      child: Text(
        '${_curProgress.toInt()}',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.dp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildSlide() {
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 40.dp,
        activeTrackColor: R.color.mainBrandColor,
        inactiveTrackColor: Colors.transparent,
        thumbColor: Colors.transparent,
        disabledThumbColor: Colors.transparent,
        trackShape: _CustomTrackShape(),
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0),
        overlayColor: Colors.transparent,
        overlayShape: RoundSliderOverlayShape(overlayRadius: 0.dp),
      ),
      child: Slider(
        value: _curProgress,
        min: widget.min.toDouble(),
        max: widget.max.toDouble(),
        onChanged: (v) {
          setState(() {
            _curProgress = v;
            Log.d('_curProgress = $_curProgress');
          });
          widget.onChanged?.call(v.toInt());
        },
      ),
    );
  }
}

class _CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double? trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(-8, trackTop, trackWidth + 8, trackHeight);
    // return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

class _PitchSeekBarWidget extends StatefulWidget {
  final int value;
  final int min;
  final int max;
  final ValueChanged<int>? onChanged;

  const _PitchSeekBarWidget({
    Key? key,
    required this.value,
    this.onChanged,
    this.min = 0,
    this.max = 0,
  }) : super(key: key);

  @override
  _PitchSeekBarWidgetState createState() => _PitchSeekBarWidgetState();
}

class _PitchSeekBarWidgetState extends State<_PitchSeekBarWidget> {
  int _tone = 0;

  /// 升降调
  @override
  void initState() {
    super.initState();
    _tone = widget.value;
  }

  @override
  void didUpdateWidget(_PitchSeekBarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _tone = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildMinus(),
        const Spacer(),
        _buildNum(),
        const Spacer(),
        _buildPlus(),
      ],
    );
  }

  Widget _buildNum() {
    return Text(
      '$_tone',
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.dp,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildMinus() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (_tone > widget.min) {
          _tone--;
          refresh();
          widget.onChanged?.call(_tone);
        }
      },
      child: Container(
        alignment: AlignmentDirectional.center,
        width: 50.dp,
        height: 40.dp,
        child: R.img(
          RoomAssets.chat_room$ktv_tuner_minus_webp,
          width: 16.dp,
          height: 3.dp,
          color: R.color.mainBrandColor,
        ),
      ),
    );
  }

  Widget _buildPlus() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (_tone < widget.max) {
          _tone++;
          refresh();
          widget.onChanged?.call(_tone);
        }
      },
      child: Container(
        alignment: AlignmentDirectional.center,
        width: 50.dp,
        height: 40.dp,
        child: R.img(
          RoomAssets.chat_room$ktv_tuner_add_webp,
          width: 16.dp,
          height: 17.dp,
          color: R.color.mainBrandColor,
        ),
      ),
    );
  }
}

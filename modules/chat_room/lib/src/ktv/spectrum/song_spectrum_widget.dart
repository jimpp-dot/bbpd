import 'dart:ui';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import 'song_record_helper.dart';
import 'song_spectrum_model.dart';

/// 调试打分器
bool _debugMode = false;

/// 是否显示空白区域
bool _debugShowBlankNode = false;

mixin _SoundSpectrumControllerMixin {
  seek(Duration seekPos);

  start({Duration? start});

  sync(Duration current);

  updateCurrentValue(
      int beginPosMs, int endPosMs, double value, double percent, double score);

  updateCurrentValueForZego(int beginPosMs, int endPosMs, int value);

  pause();

  reset({Duration? begin});

  /// 清除某个时间点后面的打分比较
  void clearHitList(Duration start);
}

class SoundSpectrumController implements _SoundSpectrumControllerMixin {
  _SoundSpectrumControllerMixin? _inner;

  @override
  pause() {
    _inner?.pause();
  }

  @override
  reset({Duration? begin}) {
    _inner?.reset(begin: begin);
  }

  @override
  start({Duration? start}) {
    _inner?.start(start: start);
  }

  @override
  void sync(Duration current) {
    _inner?.sync(current);
  }

  @override
  updateCurrentValue(int beginPosMs, int endPosMs, double value, double percent,
      double score) {
    _inner?.updateCurrentValue(beginPosMs, endPosMs, value, percent, score);
  }

  @override
  updateCurrentValueForZego(int beginPosMs, int endPosMs, int value) {
    _inner?.updateCurrentValueForZego(
      beginPosMs,
      endPosMs,
      value,
    );
  }

  @override
  void clearHitList(Duration start) {
    _inner?.clearHitList(start);
  }

  @override
  seek(Duration seekPos) {
    _inner?.seek(seekPos);
  }
}

/// 音频打分控件
class SoundSpectrumWidget extends StatefulWidget {
  final SoundSpectrumController controller;
  final Duration? totalTime;
  final SpectrumModel? spectrumModel;
  final int firstLyricStartMs;
  final double height;
  final Color? borderColor;
  final Color? dividerColor;

  /// bgColor 和 bgColorList 只能选择一个
  final Color? bgColor;

  /// 设置bgGradien后bgColor无效
  final Gradient? bgGradient;
  final bool showFloater;
  final double borderRadius;

  /// 背景毛玻璃效果
  final bool bgGlassEffect;

  /// 悬浮球指示器的Size
  final double? indicatorSize;

  /// 滑块的高度
  final double? slidingNodeHeight;

  /// 滑块的圆角
  final double? slidingNodeRadius;

  /// 初始偏移量
  final int? initOffsetMs;

  const SoundSpectrumWidget({
    Key? key,
    required this.controller,
    required this.totalTime,
    required this.firstLyricStartMs,
    required this.spectrumModel,
    required this.height,
    this.borderColor,
    this.dividerColor,
    this.bgColor,
    this.bgGradient,
    this.showFloater = true,
    this.bgGlassEffect = false,
    this.borderRadius = 0,
    this.indicatorSize,
    this.slidingNodeHeight,
    this.slidingNodeRadius,
    this.initOffsetMs,
  }) : super(key: key);

  @override
  _SoundSpectrumWigetState createState() => _SoundSpectrumWigetState();
}

class _SoundSpectrumWigetState extends State<SoundSpectrumWidget>
    with _SoundSpectrumControllerMixin {
  /// 音谱数据列表
  List<SoundSpectrumNode> _spectrumNodeList = [];

  late double _widgetHeight;

  late Color _borderColor;
  late Color _dividerColor;
  Color? _bgColor;

  late ScrollController _scrollController;

  Duration? _totalTime;

  double? _currentScrollPixels;

  final double _amiLineLength = 75.dp;

  /// 当前歌声值命中滑块值的最小范围
  double _hitMinDiff = 0;

  // double _hitScoreDiff = 0;

  double get _initialPaddingStart => _amiLineLength;

  double _totalSpectrumLength = 0;

  final _FloatIndicatorProvider _indicatorProvider = _FloatIndicatorProvider();

  static const String recordTag = 'recordTag';

  @override
  void initState() {
    super.initState();
    _widgetHeight = widget.height;
    _borderColor = widget.borderColor ?? Colors.white.withOpacity(0.15);
    _dividerColor = widget.dividerColor ?? Colors.white.withOpacity(0.15);
    if (widget.bgGradient == null) {
      _bgColor = widget.bgColor ?? const Color(0x14FFFFFF);
    }

    widget.controller._inner = this;
    _scrollController = ScrollController(keepScrollOffset: true);
    _updateData();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.initOffsetMs != null && widget.initOffsetMs! > 0) {
        seek(Duration(milliseconds: widget.initOffsetMs!));
      }
    });
  }

  void _updateData() {
    _spectrumNodeList = widget.spectrumModel?.nodeList ?? const [];
    _totalTime = widget.totalTime;

    double totalLength = 0;
    for (var element in _spectrumNodeList) {
      totalLength += element.length + 1;
    }
    _totalSpectrumLength = totalLength - 1;

    if (widget.spectrumModel != null) {
      // 5 / 160 自研那边是 5 像素偏差，高度160
      _hitMinDiff = widget.spectrumModel!.valRange * 0.03125;
    }
    // _hitScoreDiff = RecordConfig.tolerance * 100;
    Log.d(
        tag: recordTag,
        'SpectrumWiget updateData _totalTime=$_totalTime,_hitMinDiff=$_hitMinDiff,spectrumModel=${widget.spectrumModel}');
  }

  @override
  void dispose() {
    widget.controller._inner = null;
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant SoundSpectrumWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    Log.d(tag: recordTag, 'SpectrumWiget didUpdateWidget');
    _updateData();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        _currentScrollPixels = notification.metrics.pixels;
        return false;
      },
      child: SizedBox(
        height: _widgetHeight,
        width: double.infinity,
        child: Stack(
          children: [
            _buildBg(),
            _buildSlidingNode(),
            if (widget.showFloater) _buildAimLine(),
            // 音节瞄准器图片
            _FloatIndicatorWidget(
              indicatorProvider: _indicatorProvider,
              indicatorSize: widget.indicatorSize,
              parentHeight: _widgetHeight,
            ),
          ],
        ),
      ),
    );
  }

  _buildBg() {
    List<Widget> dividerList = [];
    for (int i = 0; i < 4; i++) {
      dividerList.add(Divider(color: _dividerColor, height: 1));
    }

    Widget bg = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: dividerList,
    );

    Widget child;

    if (widget.bgGlassEffect) {
      child = BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: bg,
      );
    } else {
      child = bg;
    }

    return ClipRRect(
      borderRadius: widget.borderRadius > 0
          ? BorderRadius.all(Radius.circular(widget.borderRadius))
          : BorderRadius.zero,
      child: Container(
        decoration: BoxDecoration(
          color: _bgColor,
          border: _borderColor != Colors.transparent
              ? Border.all(color: _borderColor)
              : null,
          gradient: widget.bgGradient,
        ),
        child: child,
      ),
    );
  }

  _buildSlidingNode() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      padding: EdgeInsetsDirectional.only(start: _initialPaddingStart),
      itemBuilder: (context, index) {
        var item = _spectrumNodeList[index];
        if (item.isblank) {
          if (_debugMode && _debugShowBlankNode) {
            return Container(
              width: item.length,
              height: 12.dp,
              color: Colors.green,
              child: Text(
                  '${item.index}->${Utility.formatTimeClock(item.time.startTime.inSeconds)}'),
            );
          } else {
            return Container(width: item.length);
          }
        }
        return _SlideNode(data: item, nodeHeight: widget.slidingNodeHeight);
      },
      itemCount: _spectrumNodeList.length,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  /// 音节瞄准器线
  _buildAimLine() {
    return PositionedDirectional(
      start: _amiLineLength,
      top: 0,
      bottom: 0,
      child: Container(
        color: _borderColor,
        width: 1,
      ),
    );
  }

  bool get _isAudioReady {
    return _totalTime != null && _scrollController.hasClients;
  }

  @override
  pause() {
    Log.d(tag: recordTag, 'spectrum pause _isAudioReady=$_isAudioReady');
    if (!_isAudioReady) return;
    if (_currentScrollPixels != null) {
      _scrollController.jumpTo(_currentScrollPixels!);
    }
  }

  @override
  reset({Duration? begin}) {
    Log.d(
        tag: recordTag,
        'spectrum reset _isAudioReady=$_isAudioReady,begin=$begin');
    if (!_isAudioReady) return;
    clearHitList(Duration.zero);
    start(start: begin);
  }

  Duration get _currentScrollTime => _currentScrollPixels == null
      ? Duration.zero
      : Duration(milliseconds: _currentScrollPixels! ~/ perMillisecondDp);

  @override
  start({Duration? start}) {
    if (_debugMode) {
      Log.d(
          tag: recordTag,
          'spectrum start _isAudioReady=$_isAudioReady,start=$start _currentScrollPixels=$_currentScrollPixels');
    }
    if (!_isAudioReady) return;
    if (start != null) {
      double offset = start.inMilliseconds * perMillisecondDp;
      _scrollController.jumpTo(offset);
    } else if (_currentScrollPixels != null) {
      start = Duration(milliseconds: _currentScrollPixels! ~/ perMillisecondDp);
      _scrollController.jumpTo(_currentScrollPixels!);
    }
    start ??= Duration.zero;
    if (start < _totalTime!) {
      if (_debugMode) {
        Log.d(
            tag: recordTag,
            'spectrum start maxScrollExtent=${_scrollController.position.maxScrollExtent},totalSpectrumLength=$_totalSpectrumLength, duration=${_totalTime! - start}');
      }
      _scrollController.animateTo(
        _totalSpectrumLength,
        duration: _totalTime! - start,
        curve: Curves.linear,
      );
    }
  }

  @override
  seek(Duration seekPos) {
    Log.d(
        tag: recordTag,
        'spectrum seek _isAudioReady=$_isAudioReady,seekPos=$seekPos');
    if (!_isAudioReady) return;
    double offset = seekPos.inMilliseconds * perMillisecondDp;
    _scrollController.jumpTo(offset);
  }

  @override
  sync(Duration current) {
    if (_debugMode) {
      Log.d(
          tag: recordTag,
          'Sync current $current, viewCurrent=$_currentScrollTime');
    }
    if ((current - _currentScrollTime).inMilliseconds.abs() > 16) {
      if (_debugMode) {
        Log.d(tag: recordTag, 'Sync current sync $current');
      }
      start(start: current);
    } else {
      if (_debugMode) {
        Log.d(tag: recordTag, 'Sync current ignore!');
      }
    }
  }

  @override
  updateCurrentValue(int beginPosMs, int endPosMs, double value, double percent,
      double score) {
    if (_debugMode) {
      Log.d(
          tag: recordTag,
          'beginPosMs=$beginPosMs,endPosMs=$endPosMs,value=$value,percent=$percent,score=$score');
      Log.d(tag: recordTag, '_currentScrollTime=$_currentScrollTime');
    }

    var begin = Duration(milliseconds: beginPosMs);
    var end = Duration(milliseconds: endPosMs);

    // 同步时间轴
    sync(end);

    var curRegion = TimeRegion(begin, end);
    bool currentHit = false;

    for (var node in _spectrumNodeList) {
      if (node.isblank) continue;
      var region = curRegion;
      bool isOverlap = SongRecordHelper.isTimeOverlap(
        region,
        node.time,
      );
      var diff = (value - node.value).abs();
      // diff 的算法可以去掉？ 只用自研回调的score
      if (isOverlap && (diff <= _hitMinDiff /*|| score > _hitScoreDiff*/)) {
        if (_debugMode) {
          // Log.d(recordTag,
          //     ' findOverlap $region isOverlap=$isOverlap, node.time=${node.time},diff=$diff,_hitMinDiff=$_hitMinDiff,score=$score,scoreDiff=$_hitScoreDiff');
        }
        node.updateHitList(region);
        currentHit = true;
        break;
      }
    }
    if (widget.firstLyricStartMs >= 0 &&
        beginPosMs > widget.firstLyricStartMs) {
      _indicatorProvider.currentHit = currentHit;
      if (_indicatorProvider.lastPercent != percent) {
        _indicatorProvider.lastPercent = percent;
        _indicatorProvider.lastAimBottom = _indicatorProvider.curAimBottom;
        _indicatorProvider.curAimBottom = _widgetHeight * percent;
        _indicatorProvider.notifyUI();
      }
    }
  }

  @override
  updateCurrentValueForZego(int beginPosMs, int endPosMs, int pitchOrPitchHit) {
    var begin = Duration(milliseconds: beginPosMs);
    var end = Duration(milliseconds: endPosMs);

    // 同步时间轴
    sync(end);

    bool currentHit = false;
    var curRegion = TimeRegion(begin, end);
    double pitchValue = 0;
    // pitchOrPitchHit=3;
    bool isPitchHit = pitchOrPitchHit >= 0 && pitchOrPitchHit <= 5;
    //0-5 表示准确程度,10-90 表示当前音高值
    if (isPitchHit) {
      ///先找到当前时间对应的音高段
      for (var node in _spectrumNodeList) {
        if (node.isblank) continue;

        ///时间有重叠
        bool isTimeOverlap = SongRecordHelper.isTimeOverlap(
          curRegion,
          node.time,
        );
        if (isTimeOverlap) {
          currentHit = pitchOrPitchHit >= 2 && pitchOrPitchHit <= 4;

          ///如果音高准确，则当前音高用标准值展示
          if (currentHit) {
            pitchValue = node.value;
            node.updateHitList(TimeRegion(begin, end));
          } else {
            ///如果音高有偏离，则根据偏移值设置当前音高大小
            if (pitchOrPitchHit == 0) {
              pitchValue = 0;
            } else if (pitchOrPitchHit == 1) {
              pitchValue = node.value + -2 * 4;
            } else if (pitchOrPitchHit == 5) {
              pitchValue = node.value + 2 * 4;
            }
          }
          break;
        }
      }
    } else {
      pitchValue = pitchOrPitchHit.toDouble();
    }
    double percent = 0;
    const double maxPitchValue = 90;
    const double minPitchValue = 10;
    double len = maxPitchValue - minPitchValue;
    if (len != 0) {
      percent = (pitchValue - minPitchValue) / len;
      if (percent > 1) {
        percent = 1;
      }
      if (percent < 0) {
        percent = 0;
      }
    }

    if (beginPosMs > widget.firstLyricStartMs) {
      _indicatorProvider.currentHit = currentHit;
      if (_indicatorProvider.lastPercent != percent) {
        _indicatorProvider.lastPercent = percent;
        _indicatorProvider.lastAimBottom = _indicatorProvider.curAimBottom;
        _indicatorProvider.curAimBottom = _widgetHeight * percent;
        _indicatorProvider.notifyUI();
      }
    }
  }

  @override
  void clearHitList(Duration start) {
    bool clear = false;
    for (var node in _spectrumNodeList) {
      if (clear) {
        node.clearHitList();
        continue;
      }
      var region = TimeRegion(start, start);
      bool isOverlap = SongRecordHelper.isTimeOverlap(region, node.time);
      if (isOverlap) {
        clear = true;
        node.clearHitList();
      }
    }
  }
}

class _SlideNode extends StatefulWidget {
  final SoundSpectrumNode data;
  final double? nodeHeight;

  const _SlideNode({Key? key, required this.data, this.nodeHeight})
      : super(key: key);

  @override
  _SlideNodeState createState() => _SlideNodeState();
}

class _SlideNodeState extends State<_SlideNode> {
  final Color _normalColor = const Color(0x33FFFFFF);
  final Color _hitColor = R.color.mainBrandColor;

  @override
  void initState() {
    super.initState();
    widget.data.addListener(_onDataChange);
  }

  @override
  void dispose() {
    widget.data.removeListener(_onDataChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          width: widget.data.length,
          child: Align(
            alignment: FractionalOffset(0, 1 - widget.data.valuePercent),
            child: _buildNode(),
          ),
        );
      },
    );
  }

  Widget _buildNode() {
    SoundSpectrumNode item = widget.data;
    List<HitRegion> hitList = item.hitList;
    final List<Color> gradient = [];
    final List<double> stops = [];

    double curStart = 0;
    for (int i = 0; i < hitList.length; i++) {
      var hit = hitList[i];
      if (curStart == hit.start) {
        gradient.add(_hitColor);
        stops.add(curStart);

        gradient.add(_hitColor);
        stops.add(hit.end);
      } else {
        gradient.add(_normalColor);
        stops.add(curStart);

        gradient.add(_normalColor);
        stops.add(hit.start);

        gradient.add(_hitColor);
        stops.add(hit.start);

        gradient.add(_hitColor);
        stops.add(hit.end);
      }
      curStart = hit.end;
    }
    if (curStart != 1) {
      gradient.add(_normalColor);
      stops.add(curStart);

      gradient.add(_normalColor);
      stops.add(1);
    }

    return Container(
      height: widget.nodeHeight ?? 5.dp,
      width: item.length,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradient,
          stops: stops,
        ),
        borderRadius: BorderRadius.circular(2.dp),
      ),
      // child: Text('${item.index}:${Utility.formatTimeClock(item.time.startTime.inSeconds)}'),
    );
  }

  void _onDataChange() {
    refresh();
  }
}

class _FloatIndicatorProvider extends ChangeNotifier {
  double lastPercent = 0;
  bool currentHit = false;

  /// 瞄准器距离底部的距离
  double curAimBottom = 0;
  double lastAimBottom = 0;

  void notifyUI() {
    notifyListeners();
  }
}

/// 悬浮上下滑动控件
class _FloatIndicatorWidget extends StatefulWidget {
  final _FloatIndicatorProvider indicatorProvider;
  final double? indicatorSize;
  final double parentHeight;

  const _FloatIndicatorWidget({
    Key? key,
    required this.indicatorProvider,
    required this.indicatorSize,
    required this.parentHeight,
  }) : super(key: key);

  @override
  State<_FloatIndicatorWidget> createState() => _FloatIndicatorWidgetState();
}

class _FloatIndicatorWidgetState extends State<_FloatIndicatorWidget> {
  final double _velocity = 0.1;

  @override
  void initState() {
    widget.indicatorProvider.addListener(refresh);
    super.initState();
  }

  @override
  void dispose() {
    widget.indicatorProvider.removeListener(refresh);
    super.dispose();
  }

  /// 音节瞄准器图片
  @override
  Widget build(BuildContext context) {
    double imgH = widget.indicatorSize ?? 16.dp;

    /// 防止跳出屏幕
    if (widget.indicatorProvider.curAimBottom + imgH > widget.parentHeight) {
      widget.indicatorProvider.curAimBottom = widget.parentHeight - imgH;
    }
    widget.indicatorProvider.curAimBottom -= imgH / 2;
    if (widget.indicatorProvider.curAimBottom < 0) {
      widget.indicatorProvider.curAimBottom = 0;
    }
    Duration dur;
    if (widget.indicatorProvider.currentHit) {
      dur = const Duration(milliseconds: 100);
    } else {
      double distance = (widget.indicatorProvider.curAimBottom -
              widget.indicatorProvider.lastAimBottom)
          .abs();
      dur = Duration(milliseconds: distance ~/ _velocity);
    }

    return AnimatedPositionedDirectional(
      start: 67.dp,
      bottom: widget.indicatorProvider.curAimBottom,
      width: imgH,
      height: imgH,
      duration: dur,
      child: R.img('record_syllable_aim.webp',
          width: imgH,
          height: imgH,
          package: ComponentManager.MANAGER_BASE_ROOM),
    );
  }
}

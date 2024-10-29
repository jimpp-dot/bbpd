import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vap_texture/flutter_vap_texture.dart';
import 'package:vap_player/vap_player.dart';

/// 烟花显示数据
class Fireworks {
  final int uuid; // 唯一key
  final String url; // 烟花效果地址
  final int fileSize;
  final Size size; // 烟花显示大小
  final int delayTime; // 延迟显示时间
  final _ScreenGrid grid; // 烟花显示坐标

  Fireworks(
      {required this.uuid,
      required this.url,
      required this.fileSize,
      required this.delayTime,
      required this.size,
      required this.grid});

  @override
  String toString() {
    return 'Fireworks uuid=$uuid, url=$url, delayTime=$delayTime, width=$size';
  }
}

/// 烟花配置
class FireworksConfig {
  int _uuid = 0;
  final int delayInterval = 500; // 间隔时间
  int _maxNum = 10; // 一次最多显示个数
  final double _paddingStart = 50.dp; // 屏幕左边距
  final double paddingEnd = 50.dp; // 屏幕右边距
  final double paddingTop = 30.dp + Util.statusHeight; // 屏幕顶部边距
  final double paddingBottom = 200.dp + Util.bottomMargin; // 屏幕底部边距
  final double horizontalCount = 10; // 屏幕横向划分局域
  final double verticalCount = 20; // 屏幕垂直划分区域

  final List<_ScreenGrid> _gridList = []; // 将屏幕分成若干个个网格

  int get maxNum => _maxNum;

  FireworksConfig() {
    _init();
  }

  void _init() {
    // 服务端下发烟花同时播放个数
    int maxNumConfig = Session.getInt('max_fireworks_num', 0);
    // Log.d('FireworksConfig _init maxNumConfig=$maxNumConfig');
    if (maxNumConfig > 0) {
      _maxNum = maxNumConfig;
    }
    double validWidth = Util.width - _paddingStart - paddingEnd;
    double validHeight = Util.height - paddingTop - paddingBottom;
    double gridWidth = validWidth / horizontalCount;
    double gridHeight = validHeight / verticalCount;
    for (int x = 0; x < horizontalCount; x++) {
      for (int y = 0; y < verticalCount; y++) {
        _gridList.add(
          _ScreenGrid(
            centerX: _paddingStart + (x + 0.5) * gridWidth,
            centerY: paddingTop + (y + 0.5) * gridHeight,
          ),
        );
      }
    }
  }

  /// 随机生成一个grid
  _ScreenGrid _randomGrid() {
    Iterable<_ScreenGrid> randomList =
        _gridList.where((element) => element.isOccupy == false);
    if (randomList.isEmpty) {
      randomList = _gridList;
    }
    _ScreenGrid grid =
        randomList.elementAt(Random().nextInt(randomList.length));
    grid.isOccupy = true;
    return grid;
  }

  Fireworks create(GiftFireworks gift, int delayTime) {
    return Fireworks(
      uuid: _uuid++,
      url: gift.url,
      fileSize: gift.size,
      delayTime: delayTime,
      size: Size(gift.width.dp, gift.height.dp),
      grid: _randomGrid(),
    );
  }
}

/// 屏幕网格
class _ScreenGrid {
  final double centerX;
  final double centerY;
  bool isOccupy = false;

  _ScreenGrid({required this.centerX, required this.centerY});

  @override
  String toString() {
    return '_ScreenGrid centerX=$centerX, centerY=$centerY, isOccupy=$isOccupy';
  }
}

/// 烟花礼物显示
class FireworksGiftDisplayWidget extends StatefulWidget {
  const FireworksGiftDisplayWidget({super.key});

  @override
  State<FireworksGiftDisplayWidget> createState() =>
      FireworksGiftDisplayWidgetState();
}

class FireworksGiftDisplayWidgetState
    extends State<FireworksGiftDisplayWidget> {
  final FireworksConfig _config = FireworksConfig();

  final List<GiftFireworks> _bufferList = []; // 待显示列表
  final List<Fireworks> _showingList = []; // 显示列表

  /// 新的礼物消息
  void onMessageAdd(DisplayGiftConfig config, bool isResume) {
    List<GiftFireworks>? list = config.fireworksList;
    if (list == null || list.isEmpty) return;
    for (GiftFireworks item in list) {
      if (item.type == 'vap' && item.size > 0) {
        int num = item.num;
        while (num > 0) {
          num--;
          _bufferList.add(item);
        }
      }
    }
    if (isResume) {
      _next();
    }
  }

  /// app切到前台
  Future onResume() async {
    if (_bufferList.length > _config.maxNum) {
      _bufferList.removeRange(0, _bufferList.length - _config.maxNum);
    }
    await Future.delayed(const Duration(milliseconds: 250));
    if (mounted) {
      _next();
    }
  }

  void _onComplete(Fireworks item) {
    // Log.d('FireworksGiftDisplayWidgetState onComplete item=${item.toString}');
    if (!mounted) return;
    item.grid.isOccupy = false;
    _showingList.removeWhere((element) => element.uuid == item.uuid);
    _next();
  }

  void _next() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Log.d('FireworksGiftDisplayWidgetState _next() start');
      if (!mounted) return;
      if (_bufferList.isEmpty) {
        setState(() {});
        return;
      }
      int len = _showingList.length;
      if (len >= _config.maxNum) return;
      _bufferList.shuffle(); // 将烟花打乱，避免播放相同的样式
      for (int i = 0; i < _config.maxNum - len; i++) {
        if (_bufferList.isEmpty) break;
        _showingList.add(
            _config.create(_bufferList.removeAt(0), i * _config.delayInterval));
      }
      // Log.d('FireworksGiftDisplayWidgetState _next() end _showingList len=${_showingList.length}');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // Log.d('FireworksGiftDisplayWidgetState build() _showingList len=${_showingList.length}');
    return Stack(
      children: [
        SizedBox(
          width: Util.width,
          height: Util.height,
        ),
        ..._showingList.mapIndexed((index, item) {
          return FireworksWidget(
              key: ValueKey('FireworksGiftDisplayWidgetState_${item.uuid}'),
              item: item,
              onComplete: () {
                _onComplete(item);
              });
        }).toList(),
      ],
    );
  }
}

/// 单个烟花播放
class FireworksWidget extends StatefulWidget {
  final Fireworks item;
  final VoidCallback onComplete;

  const FireworksWidget(
      {super.key, required this.item, required this.onComplete});

  @override
  State<FireworksWidget> createState() => _FireworksWidgetState();
}

class _FireworksWidgetState extends State<FireworksWidget> {
  Fireworks get _item => widget.item;

  late Future _delayFuture;
  File? _effectFile;

  Timer? _overTimer; // 礼物播放超时检测
  bool _isCompleted = false; // 是否已完成

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _cancelOverTimer();
    super.dispose();
  }

  void _cancelOverTimer() {
    if (_overTimer != null) {
      _overTimer?.cancel();
      _overTimer = null;
    }
  }

  /// 加载烟花礼物资源
  Future _load() async {
    String? path =
        await cacheUrlWithTry(_item.url, _item.fileSize, subDir: giftSubDir);
    if (!mounted) return;
    if (path == null || path.isEmpty) {
      _onComplete();
      return;
    }
    File file = File(path);
    if (!file.existsSync()) {
      _onComplete();
      return;
    }
    setState(() {
      _delayFuture = Future.delayed(Duration(milliseconds: _item.delayTime));
      _effectFile = file;
    });
    _overTimer = Timer(const Duration(seconds: 20), _onComplete);
  }

  void _onComplete() {
    Log.d('_DisplayItemGiftState onComplete');
    if (!mounted) {
      return;
    }
    if (_isCompleted) return;
    _isCompleted = true;
    _cancelOverTimer();
    widget.onComplete();
  }

  @override
  Widget build(BuildContext context) {
    if (_effectFile == null) return const SizedBox.shrink();
    if (Constant.isDevMode && Util.isIOSSimulator) {
      return IgnorePointer(
          child:
              VapSimulatorWidget(onComplete: _onComplete)); // 拦截iOS模拟器播放VAP动画
    }
    Widget child = Platform.isIOS
        ? VapView(
            filePath: _effectFile!.path,
            onComplete: _onComplete,
            delayToShowFuture: _delayFuture,
          )
        : VapWidget(
            hybridComposition: !Util.cantHybridComposition(),
            onPlatformViewCreated: (FlutterVapController controller) async {
              String filePath = _effectFile!.path;
              controller.startPlay(filePath);
            },
            onComplete: _onComplete,
            delayToShowFuture: _delayFuture,
          );
    return PositionedDirectional(
      start: _item.grid.centerX - _item.size.width / 2,
      top: _item.grid.centerY - _item.size.height / 2,
      width: _item.size.width,
      height: _item.size.height,
      child: IgnorePointer(
        child: child,
      ),
    );
  }
}

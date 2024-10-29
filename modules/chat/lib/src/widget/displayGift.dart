import 'package:shared/widget/vap_simulator_player_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'dart:io';
import 'dart:convert';
import 'package:shared/shared.dart';
import 'package:flutter_vap_texture/flutter_vap_texture.dart';
import 'package:rive/rive.dart';

enum DisplayGiftType {
  /// 传统礼物，lottie实现,LottieSubType决定是否为全屏
  Lottie,

  /// 全屏礼物，VAP
  Vap,

  /// 全屏礼物，webp动图实现
  Webp,

  /// 全屏礼物，Rive
  Rive,
}

class GiftHeaderInfo {
  final int uid;
  final String? icon;

  GiftHeaderInfo.fromJson(Map json)
      : uid = Util.parseInt(json['uid']),
        icon = json['icon'];
}

class GiftHeader {
  final GiftHeaderInfo? from;
  final GiftHeaderInfo? to;
  final int start;
  final int end;

  GiftHeader.fromJson(Map json)
      : from =
            json['from'] != null ? GiftHeaderInfo.fromJson(json['from']) : null,
        to = json['from'] != null ? GiftHeaderInfo.fromJson(json['to']) : null,
        start = Util.parseInt(json['start']),
        end = Util.parseInt(json['end']);
}

class GiftConfig {
  final int id;
  final int num;
  final DisplayGiftType type;
  final String name;
  final bool withEnd;
  final int size;
  final double displayNormalGiftRatio;
  final GlobalKey<DisplayGiftState> key;
  final int vapSize;
  final GiftHeader? header;
  final double riveValue;
  final bool isHandbook; // 礼物图鉴礼物
  final int starLevel; // 礼物图鉴礼物等级
  final bool isUseAwake; // 礼物图鉴礼物是否觉醒
  final bool isCanAwake; //礼物图鉴礼物是否可觉醒
  final int fromUid; // 送礼人uid
  final String? effectUrl; // 兼容非礼物，直接显示动画特效URL
  final int effectSize;

  GiftConfig.fromJson(Map res)
      : id = res['giftId'],
        num = Util.parseInt(res['giftNum']),
        type = _getGiftType(res),
        name = res['giftName'],
        withEnd = res['giftWithEnd'] > 0,
        size = _getSize(res),
        displayNormalGiftRatio =
            Util.parseDouble(res['displayNormalGiftRatio'], 0.5),
        vapSize = Util.parseInt(res['vap_size']),
        starLevel = Util.parseInt(res['star_level']),
        effectUrl = Util.parseStr(res['effect_url']),
        effectSize = Util.parseInt(res['effect_size']),
        isHandbook = Util.parseBool(res['is_handbook']),
        isUseAwake = Util.parseBool(res['is_use_awake']),
        isCanAwake = Util.parseBool(res['is_can_awake']),
        fromUid = Util.parseInt(res['from_uid']),
        key = GlobalKey<DisplayGiftState>(),
        header =
            res['header'] != null ? GiftHeader.fromJson(res['header']) : null,
        riveValue = Util.parseDouble(res['riveValue'], 1);

  bool get isVap => type == DisplayGiftType.Vap;

  bool get isWebp => type == DisplayGiftType.Webp;

  bool get isRive => type == DisplayGiftType.Rive;

  bool get withHeader => isVap && header != null;

  int get giftSize {
    int giftSize;
    if (isVap) {
      giftSize = vapSize;
    } else {
      giftSize = size;
    }
    return giftSize;
  }
}

int _getSize(Map gift) {
  String giftType = gift['giftType'];
  int size = Util.parseInt(gift['giftSize']);
  if (giftType == 'normal' && 'big' == gift['displayNormalGiftType']) {
    size = Util.parseInt(gift['size_big']);
  }
  return size;
}

DisplayGiftType _getGiftType(Map gift) {
  if ('normal' == gift['vap_type'] || 'fullscreen' == gift['vap_type']) {
    return DisplayGiftType.Vap;
  }

  //打赏礼物播放type
  String giftType = gift['giftType'];
  if (giftType == 'rive') {
    return DisplayGiftType.Rive;
  }

  return DisplayGiftType.Webp;
}

class DisplayGift extends StatefulWidget {
  final GiftConfig config;
  final ValueChanged<GiftConfig> onComplete;
  final VoidCallback? onLoadComplete;

  const DisplayGift(
      {super.key,
      required this.config,
      required this.onComplete,
      this.onLoadComplete});

  @override
  DisplayGiftState createState() => DisplayGiftState();
}

class DisplayGiftState extends State<DisplayGift>
    with TickerProviderStateMixin<DisplayGift> {
  bool _loading = true;

  late String _assetDir;
  bool _showStarLevelWidget = false;

  @override
  void initState() {
    super.initState();

    _assetDir = path.join(Constant.documentsDirectory.path, giftSubDir,
        widget.config.id.toString());

    _loadAsset();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  void dispose() {
    _releaseHeaderAnimation();

    super.dispose();
  }

  void _releaseHeaderAnimation() {
    _inAnimationController?.dispose();
    _outAnimationController?.dispose();
  }

  bool _isAwake() {
    return widget.config.effectUrl?.isNotEmpty == true &&
        widget.config.effectSize > 0;
  }

  _loadAsset() async {
    _showStarLevelWidget = await cacheGiftWithTry(
        widget.config.id, widget.config.giftSize,
        isMultiframe: widget.config.isWebp,
        isVap: widget.config.isVap,
        isRive: widget.config.isRive,
        effect: widget.config.effectUrl,
        effectSize: widget.config.effectSize,
        isAwake: _isAwake());
    if (false == _showStarLevelWidget) {
      widget.onComplete(widget.config);
      return;
    }

    if (widget.onLoadComplete != null) widget.onLoadComplete!();

    await _playMultiFrame();
  }

  _playMultiFrame() async {
    if (!mounted) return;
    setState(() {
      _loading = false;
    });
  }

  double get _normalGiftDisplaySize =>
      Util.width * widget.config.displayNormalGiftRatio;

  Widget _renderNormalGift() {
    if (widget.config.type == DisplayGiftType.Webp) {
      return _renderMultiFrameGift();
    }
    return const SizedBox.shrink();
  }

  Widget _renderMultiFrameGift() {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final width = Util.width;
      final height = constraints.constrainHeight();
      double giftWidth, giftHeight, offsetHorizontal, offsetVertical;
      if (height / width >= giftRatio) {
        giftHeight = height;
        giftWidth = giftHeight / giftRatio;
        offsetHorizontal = -(giftWidth - width) / 2;
        offsetVertical = 0;
      } else {
        giftWidth = width;
        giftHeight = giftWidth * giftRatio;
        offsetHorizontal = 0;
        offsetVertical = -(giftHeight - height) / 2;
      }

      File file = getMultiframeGiftFile(widget.config.id);
      return Stack(clipBehavior: Clip.none, children: [
        PositionedDirectional(
          start: offsetHorizontal,
          end: offsetHorizontal,
          top: offsetVertical,
          bottom: offsetVertical,
//      	top: -150,
//				bottom: -150,
          child: MultiframeImage.file(
            file,
            onComplete: _onComplete,
          ),
        ),
      ]);
    });
  }

  void _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  bool _animInited = false;
  AnimationController? _inAnimationController;
  bool _inAnimating = false;
  bool _avatarShowing = false;
  bool _outAnimating = false;
  AnimationController? _outAnimationController;
  double avatarStart = 0;
  double avatarTop = 0;
  double avatarFinalTop = 0;
  Animation<double>? _userTranslationYAnim;
  Animation<double>? _userOpacityAnim;
  Animation<double>? _userDisappearOpacityAnim;

  void _initHeaderAnimation() {
    _inAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    CurvedAnimation curve = CurvedAnimation(
        parent: _inAnimationController!, curve: Curves.easeInOut);
    _userTranslationYAnim =
        Tween<double>(begin: avatarTop, end: avatarFinalTop).animate(curve);
    _userOpacityAnim = Tween<double>(begin: 0.0, end: 1.0).animate(curve);
    _inAnimationController!.addListener(() => _refresh());
    _inAnimationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _inAnimating = false;
      }
    });

    _outAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    CurvedAnimation outCurve = CurvedAnimation(
        parent: _outAnimationController!, curve: Curves.easeOut);
    _userDisappearOpacityAnim =
        Tween<double>(begin: 1.0, end: 0.0).animate(outCurve);
    _outAnimationController!.addListener(() => _refresh());

    _animInited = true;
  }

  double _getUserOpacity() {
    double opacity;
    if (_avatarShowing) {
      if (_inAnimating) {
        opacity = _userOpacityAnim!.value;
      } else if (_outAnimating) {
        opacity = _userDisappearOpacityAnim!.value;
      } else {
        opacity = 1.0;
      }
    } else {
      opacity = 0.0;
    }
    return opacity;
  }

  Widget _renderRiveGift() {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final width = Util.width;
      final height = constraints.constrainHeight();
      double giftWidth, giftHeight, offsetHorizontal, offsetVertical;
      if (height / width >= giftRatio) {
        giftHeight = height;
        giftWidth = giftHeight / giftRatio;
        offsetHorizontal = -(giftWidth - width) / 2;
        offsetVertical = 0;
      } else {
        giftWidth = width;
        giftHeight = giftWidth * giftRatio;
        offsetHorizontal = 0;
        offsetVertical = -(giftHeight - height) / 2;
      }

      File riveFile = getRiveGiftFile(widget.config.id);
      return Stack(
        children: [
          PositionedDirectional(
            start: offsetHorizontal,
            end: offsetHorizontal,
            top: offsetVertical,
            bottom: offsetVertical,
            child: RiveAnimation.file(
              riveFile.path,
              alignment: Alignment.center,
              fit: BoxFit.contain,
              onInit: (Artboard artboard) {
                StateMachineController? controller =
                    StateMachineController.fromArtboard(
                        artboard, 'bbStateMachine');
                if (controller != null) {
                  artboard.addController(controller);

                  /// Rive动画，进场比较简单，时间短。等_inController执行完再执行Rive动画
                  Future.delayed(const Duration(milliseconds: 50), () {
                    if (mounted) {
                      SMINumber? input =
                          controller.findInput<double>('bbInput') as SMINumber?;
                      setState(() {
                        input?.value = widget.config.riveValue;

                        controller.isActiveChanged.addListener(() {
                          if (!controller.isActive) {
                            Future.delayed(const Duration(milliseconds: 10),
                                () {
                              if (!mounted) return;
                              _onComplete();
                            });
                          }
                        });
                      });
                    }
                  });
                }
              },
            ),
          ),
        ],
      );
    });
  }

  Widget _renderVapGift() {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final width = Util.width;
      final height = constraints.constrainHeight();
      double giftWidth, giftHeight, offsetHorizontal, offsetVertical;
      double zoomRatio;
      if (height / width >= giftRatio) {
        giftHeight = height;
        giftWidth = giftHeight / giftRatio;
        offsetHorizontal = -(giftWidth - width) / 2;
        offsetVertical = 0;
        // zoomRatio = giftWidth / width;
      } else {
        giftWidth = width;
        giftHeight = giftWidth * giftRatio;
        offsetHorizontal = 0;
        offsetVertical = -(giftHeight - height) / 2;
        // zoomRatio = height / giftHeight;
      }
      zoomRatio = giftWidth / 375.0;

      avatarStart = 85 * zoomRatio;
      avatarTop = 154 * zoomRatio;
      avatarFinalTop = 185 * zoomRatio;

      if (widget.config.withHeader && !_animInited) {
        _initHeaderAnimation();
      }

      // 私聊中，将非觉醒礼物和觉醒礼物的文件路径通过条件区分，giftId.mp4和giftId.awake.mp4
      // 房间里不需要，房间消息不会持久化，私聊中的消息会持久化，多次播放
      File vapFile = _isAwake()
          ? getAwakeVapGiftFile(widget.config.id)
          : getVapGiftFile(widget.config.id);
      double opacity = _getUserOpacity();
      int avatarStartFrame =
          widget.config.withHeader ? (widget.config.header?.start ?? -1) : -1;
      int avatarEndFrame =
          widget.config.withHeader ? (widget.config.header?.end ?? -1) : -1;
      if (Constant.isDevMode && Util.isIOSSimulator) {
        return Config.getBool('SIMULATOR_PLAY_MP4', false)
            ? VAPSimulatorPlayer(
                vapAsset: vapFile.path, onComplete: _onComplete)
            : VapSimulatorWidget(onComplete: _onComplete); // 拦截iOS模拟器播放VAP动画
      }
      return Stack(clipBehavior: Clip.none, children: [
        PositionedDirectional(
          start: offsetHorizontal,
          end: offsetHorizontal,
          top: offsetVertical,
          bottom: offsetVertical,
//      	top: -150,
//				bottom: -150,
          child: VapWidget(
            hybridComposition: !Util.cantHybridComposition(),
            onPlatformViewCreated: (FlutterVapController controller) async {
              // String baseDir = join(Constant.documentsDirectory.path, 'vap');
              // await Directory(baseDir).create(recursive: true);
              // String key = 'test.mp4';
              // String filePath = join(baseDir, key);
              // controller.startPlay(filePath);
              String filePath = vapFile.path;
              controller.startPlay(filePath);
            },
            onRenderFrame: (int frameIndex, int frameTotal) {
              if (!widget.config.withHeader) return;
              if (frameIndex == avatarStartFrame) {
                _inAnimationController?.forward();
                _inAnimating = true;
                _avatarShowing = true;
              }
              if (frameIndex == avatarEndFrame) {
                _outAnimationController?.forward();
                _outAnimating = true;
              }
            },
            onComplete: () {
              _onComplete();
            },
          ),
        ),
        // 礼物图鉴等级
        if (_showStarLevelWidget && widget.config.isHandbook)
          PositionedDirectional(
            start: offsetHorizontal,
            end: offsetHorizontal,
            bottom: 0,
            child: R.img(
              giftLevel(widget.config.starLevel),
              package: ComponentManager.MANAGER_BASE_CORE,
            ),
          ),
        // 画两个头像
        if (widget.config.withHeader)
          PositionedDirectional(
            start: _getVirtualX(offsetHorizontal, avatarStart),
            top: _getVirtualY(offsetVertical, _userTranslationYAnim!.value),
            child: Opacity(
              opacity: opacity,
              child: CommonAvatar(
                path: widget.config.header!.from!.icon,
                shape: BoxShape.circle,
                size: 90 * zoomRatio,
              ),
            ),
          ),
        if (widget.config.withHeader)
          PositionedDirectional(
            end: _getVirtualX(offsetHorizontal, avatarStart),
            top: _getVirtualY(offsetVertical, _userTranslationYAnim!.value),
            child: AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(milliseconds: 100),
              child: CommonAvatar(
                path: widget.config.header!.to!.icon,
                shape: BoxShape.circle,
                size: 90 * zoomRatio,
              ),
            ),
          ),
      ]);
    });
  }

  String giftLevel(int level) {
    if (level > 5) {
      level = 5;
    }
    if (level < 1) {
      level = 1;
    }
    return 'giftbook/gift_book_level_$level.webp';
  }

  double _getVirtualX(double offsetHorizontal, double dx) {
    return dx + offsetHorizontal;
  }

  double _getVirtualY(double offsetVertical, double dy) {
    return dy + offsetVertical;
  }

  void _onComplete() {
    widget.onComplete(widget.config);
  }

  Widget _renderBody() {
    if (_loading == true) {
      return Container();
    }
    if (widget.config.isVap) {
      return _renderVapGift();
    } else if (widget.config.isRive) {
      return _renderRiveGift();
    } else {
      return _renderNormalGift();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      start: 0.0,
      end: 0.0,
      top: 0.0,
      bottom: 0.0,
      child: IgnorePointer(
        child: _renderBody(),
      ),
    );
  }
}

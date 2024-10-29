import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shared/shared.dart' hide MessageContent, MessageType;
import 'package:shared/widget/vap_simulator_player_widget.dart';
import 'package:chat_room/src/biz_plugin/birthday_gift/birthday_gift_dialog.dart';
import 'package:chat_room/src/protobuf/json_key/generated/system.screen.message.pb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vap_texture/flutter_vap_texture.dart';
import 'package:path/path.dart';
import 'package:chat_room/src/base/model/roomConstant.dart';
import 'package:chat_room/src/cplink/model/cplink_event.dart';
import 'package:rive/rive.dart';
import '../../base/config.dart';
import '../../chatRoomData.dart';
import '../../chatRoomUtil.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:pulse_log/pulse_log.dart';
import 'package:vap_player/vap_player.dart';

import 'fireworks_gift_display_widget.dart';

// 是否播放核心礼物动画(进场和出场中间的动画)，laya游戏麦上玩家屏蔽礼物动画，避免遮挡游戏操作
bool _showCoreAnimation() {
  if (ChatRoomUtil.isLayaGame(ChatRoomData.getInstance()?.config) &&
      ChatRoomUtil.isMic) {
    return false;
  }
  return true;
}

class DisplayGift extends StatefulWidget {
  final ChatRoomData room;
  final GiftGetPositionByUid? getPositionByUid;

  const DisplayGift({super.key, required this.room, this.getPositionByUid});

  @override
  _DisplayGiftState createState() => _DisplayGiftState();
}

class _DisplayGiftState extends State<DisplayGift> with WidgetsBindingObserver {
  final GlobalKey<FireworksGiftDisplayWidgetState> _fireworkKey = GlobalKey();

  final List<DisplayGiftConfig> _data = [];

  ///正在播放的礼物
  final List<DisplayGiftConfig> _buffer = [];

  ///待播放的礼物
  final Map<String, bool> _exists = {};
  AppLifecycleState _appLifecycleState = AppLifecycleState.resumed;
  final int _maxNum = 3; //并发限制

  @override
  void initState() {
    super.initState();
    widget.room.addListener(RoomConstant.Event_Message, _onMessageChanged);
    widget.room.addListener(
        RoomConstant.Event_Room_FullScreen_Effect, _onReceiveFullScreenEffect);
    widget.room
        .addListener(RoomConstant.Event_Go_Private_Gift, _onReceivePrivateGift);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    widget.room.removeListener(RoomConstant.Event_Message, _onMessageChanged);
    widget.room.removeListener(
        RoomConstant.Event_Room_FullScreen_Effect, _onReceiveFullScreenEffect);
    widget.room.removeListener(
        RoomConstant.Event_Go_Private_Gift, _onReceivePrivateGift);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _appLifecycleState = state;
    if (AppLifecycleState.resumed == _appLifecycleState) {
      _fireworkKey.currentState?.onResume();
      if (_buffer.isNotEmpty && _data.length < _maxNum) {
        _delayToPlay();
      }
    }
  }

  ///切换到前台时重新更新需要播放的礼物
  _delayToPlay() async {
    ///移除过期的礼物 _buffer最多保留_maxNum个
    _removeOutdatedGiftsFromBuffer();

    if (_isPlayingWorthyGift() || _data.length == _maxNum) {
      return;
    }

    await Future.delayed(const Duration(milliseconds: 250));
    _updatePlayingGift();
  }

  List<int> _toListInt(List? ids) {
    List<int> value = [];
    if (ids != null) {
      for (var val in ids) {
        try {
          int id = Util.parseInt(val);
          value.add(id);
        } catch (e) {
          Log.d("------------ $val");
        }
      }
    }
    return value;
  }

  /// 解析涂鸦礼物点位数据
  List<Offset> _parseGraffitiPoints(dynamic data) {
    List<Offset> points = [];
    if (data is List) {
      for (var item in data) {
        if (item is List && item.length == 2) {
          points.add(
              Offset(Util.parseDouble(item[0]), Util.parseDouble(item[1])));
        }
      }
    }
    return points;
  }

  static ScreenMessage_ScreenMessageRoomBirthdayGift? _parseBirthdayGift(
      dynamic extra) {
    if (extra is Map && extra['birthday_room_gift'] is Map) {
      try {
        Map map = extra['birthday_room_gift'];
        int from = Util.parseInt(map['from']);
        List<ScreenMessage_ScreenMessageRoomBirthdayUser> to = Util.parseList(
          map['to'],
          (e) => ScreenMessage_ScreenMessageRoomBirthdayUser(
            uid: Util.parseInt(e['uid']),
            icon: Util.parseStr(e['icon']) ?? '',
          ),
        );
        String word = Util.parseStr(map['word']) ?? '';
        String sentence = Util.parseStr(map['sentence']) ?? '';
        int duration = Util.parseInt(map['duration']);
        return ScreenMessage_ScreenMessageRoomBirthdayGift(
            from: from,
            to: to,
            word: word,
            sentence: sentence,
            duration: duration);
      } catch (e) {
        Log.d('parse error: $e');
      }
    }
    return null;
  }

  ///需要播放的礼物添加到data
  void _onMessageChanged(String type, Object? data) {
    MessageContent message = data as MessageContent;

    Log.d('_DisplayGiftState._onMessageChanged: ${message.extra}');
    // 连击礼物最后消息播放礼物动画
    if (message.extra != null && message.needShowAnimation()) {
      Log.d('_DisplayGiftState._onMessageChanged: ${message.type}');
      Map extra = message.extra ?? {};
      if (extra.containsKey('gift') && extra['gift'] != null) {
        Map gift = extra['gift'];
        if (!_isGiftSupport(gift)) return;

        String uuid = extra['uuid'].toString();
        GiftHeader? giftHeader;
        if (gift['header'] != null) {
          giftHeader = GiftHeader.fromJson(gift['header']);
        }
        //带头像的不去重
        if (_exists.containsKey(uuid) && giftHeader == null) return;
        _exists[uuid] = true;
        if (mounted) {
          DisplayGiftConfig config = DisplayGiftConfig(
            key: GlobalKey(),
            uuid: uuid,
            uid: Util.parseInt(extra['uid']),
            uids: giftHeader == null
                ? _toListInt(extra['uids'])
                : _toListInt([giftHeader.to?.uid]),
            giftId: Util.parseInt(gift['id']),
            type: _getGiftType(gift, false),
            size: _getSize(gift),
            count: Util.parseInt(gift['_num'], 1),
            giftNumMap:
                (extra.containsKey('giftNumMap') && extra['giftNumMap'] is Map)
                    ? extra['giftNumMap']
                    : null,
            withEnd: Util.parseInt(gift['with_end']) > 0,
            dateline: DateTime.now().millisecondsSinceEpoch,
            displayNormalGiftRatio:
                Util.parseDouble(gift['displayNormalGiftRatio'], 0.5),
            worthy: Util.parseInt(gift['worthy']),
            vapSize: Util.parseInt(gift['vap_size']),
            header: giftHeader,
            magic: Util.parseBool(gift['magic']),
            magicSize: Util.parseInt(gift['magic_size']),
            showStartEnd: Util.parseBool(gift['show_start_end']),
            vapImgs: Util.parseList(
                extra['vap_diy_gift_imgs'], (e) => Util.notNullStr(e)),
            vapTexts: Util.parseList(
                extra['vap_diy_gift_sign'], (e) => Util.notNullStr(e)),
            diyColor: Util.parseInt(extra['diy_gift_color'], -1),
            diySignDirection:
                Util.parseInt(extra['diy_gift_sign_direction'], 2),
            unityAndroidSize: Util.parseInt(gift['diy_unity_android_size']),
            unityIosSize: Util.parseInt(gift['diy_unity_ios_size']),
            unityRocketVersion: Util.parseInt(gift['unity_rocket_version']),
            riveValue: Util.parseDouble(gift['riveValue'], 1),
            voiceUrl: Util.getRemoteImgUrl(extra['voice_url']),
            isHandbook: Util.parseBool(gift['is_handbook']),
            starLevel: Util.parseInt(gift['star_level']),
            isUseAwake: Util.parseBool(gift['is_use_awake']),
            isCanAwake: Util.parseBool(gift['is_can_awake']),
            giftName: gift['name'],
            effectUrl: gift['effect_url'],
            fireworksList: GiftFireworks.parse(extra['gift_firework']),
            birthdayGift: _parseBirthdayGift(extra),
            graffitiGiftPoints: _parseGraffitiPoints(extra['graffiti_feature']),
          );
          _updatePlayingGift(newConfig: config);
        }
      }
    } else if (message.type == MessageType.Notify && message.extra != null) {
      Map extra = message.extra ?? {};

      if (extra.containsKey('mounts') &&
          extra['mounts'] != null &&
          extra['mounts'] is Map) {
        Map gift = extra['mounts'];
        String uuid = extra['_uuid'].toString();
        if (_exists.containsKey(uuid)) return;
        if (!_isGiftSupport(gift)) return;
        _exists[uuid] = true;
        if (mounted) {
          DisplayGiftConfig config = DisplayGiftConfig(
            key: GlobalKey(),
            uuid: uuid,
            uid: Util.parseInt(extra['uid']),
            uids: [],
            giftId: Util.parseInt(gift['id']),
            type: _getGiftType(gift, true),
            size: _getSize(gift),
            count: 1,
            withEnd: false,
            dateline: DateTime.now().millisecondsSinceEpoch,
            vapSize: Util.parseInt(gift['vap_size']),
            magic: Util.parseBool(gift['magic']),
            magicSize: Util.parseInt(gift['magic_size']),
            isMountGift: true,
            unityRocketVersion: Util.parseInt(gift['unity_rocket_version']),
            isHandbook: Util.parseBool(gift['is_handbook']),
            starLevel: Util.parseInt(gift['star_level']),
            isUseAwake: Util.parseBool(gift['is_use_awake']),
            isCanAwake: Util.parseBool(gift['is_can_awake']),
            effectUrl: gift['effect_url'],
          );
          _updatePlayingGift(newConfig: config);
        }
      }
    }
  }

  /// 房间全屏动效
  void _onReceiveFullScreenEffect(String type, Object? data) {
    if (data == null || !mounted) return;
    Log.d('_onReceiveFullScreenEffect');

    Map extra = data as Map;
    String uuid = extra['uuid'].toString();
    if (_exists.containsKey(uuid)) return;
    Map gift = extra['gift'];
    if (!_isGiftSupport(gift)) return;
    _exists[uuid] = true;
    DisplayGiftConfig config = DisplayGiftConfig(
      key: GlobalKey(),
      uuid: uuid,
      uid: Util.parseInt(extra['uid']),
      uids: [],
      giftId: Util.parseInt(gift['id']),
      type: _getGiftType(gift, false),
      size: _getSize(gift),
      count: 1,
      withEnd: false,
      dateline: DateTime.now().millisecondsSinceEpoch,
      vapSize: Util.parseInt(gift['vap_size']),
      magic: Util.parseBool(gift['magic']),
      magicSize: Util.parseInt(gift['magic_size']),
      fireworksList: GiftFireworks.parse(extra['gift_firework']),
    );
    _updatePlayingGift(newConfig: config);
  }

  /// 情感厅牵手成功，前往小窝，动效播放
  void _onReceivePrivateGift(String type, Object? data) {
    if (data == null || !mounted) return;
    Log.d('_onReceivePrivateGift');

    Map extra = data as Map;
    String uuid = extra['uuid'].toString();
    if (_exists.containsKey(uuid)) {
      return;
    }
    _exists[uuid] = true;
    DisplayGiftConfig? config;
    try {
      config = DisplayGiftConfig(
        key: GlobalKey(),
        uuid: uuid,
        type: DisplayGiftType.Vap,
        count: 1,
        withEnd: false,
        dateline: DateTime.now().millisecondsSinceEpoch,
        vapSize: extra['vap_size'],
        effectUrl: extra['url'],
        vapImgs: Util.parseList(extra['vapImgs'], (e) => Util.notNullStr(e)),
      );
    } catch (e) {
      Log.d('error: $e');
    }
    _updatePlayingGift(newConfig: config);
  }

  /// 动效能否播放
  bool _isGiftSupport(Map gift) {
    if (Session.lowDeviceSpecialEffect == 1 && !Util.isAndroidSimulator) {
      /// 低端机不播放礼物动画,允许Android模拟器播放动效
      Log.d("unable to play gift ,reason:device low");
      return false;
    }

    // Log.d("giftType=${gift['type']} vapType=${gift['vap_type']}");

    // vap格式
    if ((gift['vap_type'] == 'fullscreen' || gift['vap_type'] == 'normal') &&
        Util.parseInt(gift['vap_size']) > 0) {
      return true;
    }

    // webp格式（坐骑）
    if (gift['xtype'] == 'multiframe') {
      return true;
    }

    /// webp格式（礼物）
    if (gift['type'] == 'multiframe') {
      return true;
    }

    // lottie格式
    if (gift['type'] == 'fullscreen') {
      return true;
    }

    if (gift['type'] == 'normal') {
      return true;
    }

    /// rive格式
    if (gift['type'] == 'rive') {
      return true;
    }

    return false;
  }

  DisplayGiftType _getGiftType(Map gift, bool mount) {
    if ('normal' == gift['vap_type'] || 'fullscreen' == gift['vap_type']) {
      return DisplayGiftType.Vap;
    }

    //坐骑礼物播放type
    if (mount) {
      if (gift['xtype'] == 'multiframe') {
        return DisplayGiftType.Webp;
      } else {
        return DisplayGiftType.Webp;
      }
    }

    //打赏礼物播放type
    String giftType = gift['type'];
    if (giftType == 'rive') {
      return DisplayGiftType.Rive;
    }

    return DisplayGiftType.Webp;
  }

  int _getSize(Map gift) {
    String giftType = gift['type'];
    int size = Util.parseInt(gift['size']);
    if (giftType == 'normal' && 'big' == gift['displayNormalGiftType']) {
      size = Util.parseInt(gift['size_big']);
    }
    return size;
  }

  _onComplete(DisplayGiftConfig config) {
    if (!mounted) return;
    if (_data.contains(config)) {
      _data.remove(config);
      _updatePlayingGift();
    }
  }

  bool _dataCanAddGift() {
    return _appLifecycleState == AppLifecycleState.resumed &&
        !_isPlayingWorthyGift() &&
        _data.length < _maxNum;
  }

  ///更新播放的礼物 只能有一个unity场景
  _updatePlayingGift({DisplayGiftConfig? newConfig}) {
    if (newConfig != null) {
      //增加新的礼物加到data或buff
      if (!newConfig.showAnimation && !_showCoreAnimation()) {
        return;
      }
      if (newConfig.isFireworks) {
        _fireworkKey.currentState?.onMessageAdd(
            newConfig, _appLifecycleState == AppLifecycleState.resumed);
      } else if (_dataCanAddGift()) {
        _data.add(newConfig);
      } else {
        _buffer.add(newConfig);
      }
    } else {
      //更新缓存礼物
      if (_dataCanAddGift()) {
        DisplayGiftConfig? firstWorthyGift =
            _retrieveFirstWorthyGiftFromBuffer();
        if (firstWorthyGift != null) {
          _data.add(firstWorthyGift);
        } else {
          int count = _buffer.length;
          int canNotAddCount = 0;
          for (int i = 0; i < count; i++) {
            if (_dataCanAddGift()) {
              _data.add(_buffer.removeAt(canNotAddCount));
            } else {
              break;
            }
          }
        }
      }
    }
    _sortPlayingGifts();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      FireworksGiftDisplayWidget(key: _fireworkKey),
      ..._data.map((DisplayGiftConfig config) {
        return DisplayItemGift(
          key: config.key,
          rid: widget.room.rid,
          config: config,
          onComplete: _onComplete,
          getPointByUid: widget.getPositionByUid ?? widget.room.getPointByUid,
        );
      }).toList(),
    ]);
  }

  bool _isPlayingWorthyGift() {
    return _data
        .any((config) => config.worthy == 1 || config.isBirthdayGiftAnim);
  }

  /// 大礼物排最后，这样在Stack里面就会在最上层播放
  void _sortPlayingGifts() {
    _data.sort((config1, config2) {
      return config1.worthy.compareTo(config2.worthy);
    });
  }

  DisplayGiftConfig? _retrieveFirstWorthyGiftFromBuffer() {
    DisplayGiftConfig? config =
        _buffer.firstWhereOrNull((config) => config.worthy == 1);
    if (config != null) {
      _buffer.remove(config);
    }
    return config;
  }

  void _removeOutdatedGiftsFromBuffer() {
    int now = DateTime.now().millisecondsSinceEpoch;
    _buffer.removeWhere((config) => now - config.dateline >= 1000 * 30);

    if (_buffer.length > _maxNum) {
      _buffer.removeRange(0, _buffer.length - _maxNum);
    }
  }
}

class DisplayItemGift extends StatefulWidget {
  final int rid;
  final DisplayGiftConfig config;
  final GiftPlayCompleteCallback onComplete;
  final GiftGetPositionByUid getPointByUid;

  const DisplayItemGift(
      {super.key,
      required this.rid,
      required this.config,
      required this.onComplete,
      required this.getPointByUid});

  @override
  _DisplayItemGiftState createState() => _DisplayItemGiftState();
}

class _DisplayItemGiftState extends State<DisplayItemGift>
    with TickerProviderStateMixin<DisplayItemGift> {
  DisplayItemGiftStatus _status = DisplayItemGiftStatus.Wait;

  AnimationController? _inController; //从发送者出来的动画控制器
  Animation<double>? _inTranslateX;
  Animation<double>? _inTranslateY;
  Animation<double>? _inScale;
  Animation<double>? _inOpacity;
  Future? _inAnimCompleteFuture;

  AnimationController? _outController; //到收到礼物的控制器
  final Map<int, Animation> _outTranslateX = {};
  final Map<int, Animation> _outTranslateY = {};
  final Map<int, Animation> _outScale = {};
  final Map<int, Animation<double>> _outOpacity = {};

  // UserIconStyle _fromStyle = UserIconStyle.Normal;

  late String _assetDir;

  late double giftWidth, giftHeight, offsetHorizontal, offsetVertical;
  late double zoomRatio;
  String _animationStartIcon = '';
  String _animationEndIcon = '';
  bool _showStarLevelWidget = false;

  Timer? _overTimer; // 礼物播放超时检测
  bool _isCompleted = false; // 是否已完成

  @override
  void initState() {
    super.initState();
    _initSizes();

    if (widget.config.withHeader) {
      _initHeaderAnimation();
    }

    if (widget.config.showAnimation) {
      _initIn();
      _initOut();
    }
    _assetDir = join(Constant.documentsDirectory.path, giftSubDir,
        widget.config.giftId.toString());
    _loadAsset();

    _audioPlayer = AudioPlayer()..setReleaseMode(ReleaseMode.stop);
    eventCenter.addListener(
        RoomConstant.Event_Room_Position_Change, _onPositionChanged);
  }

  @override
  void dispose() {
    _cancelOverTimer();
    _releaseHeaderAnimation();
    if (_inController != null) {
      _inController!.removeStatusListener(_onInStatus);
      _inController!.dispose();
      _inController = null;
    }
    if (_outController != null) {
      _outController!.removeStatusListener(_onOutStatus);
      _outController!.dispose();
      _outController = null;
    }
    _onAudioCompleted();
    eventCenter.removeListener(
        RoomConstant.Event_Room_Position_Change, _onPositionChanged);
    super.dispose();
  }

  void _cancelOverTimer() {
    if (_overTimer != null) {
      _overTimer!.cancel();
      _overTimer = null;
    }
  }

  void _releaseHeaderAnimation() {
    _inAnimationController?.dispose();
    _outAnimationController?.dispose();
  }

  void _onPositionChanged(String type, Object? data) {
    List<PositionChangeData> positionChangeData = [];
    if (data is Iterable)
      positionChangeData.addAll(data as Iterable<PositionChangeData>);
    bool needRefreshAnimation = positionChangeData
        .any((_) => widget.config.uids?.contains(_.uid) == true);

    Log.d(
        'In DisplayGift._onPositionChanged, type: $type, isAnimating: ${_outController?.isAnimating}, needRefersh: $needRefreshAnimation');
    if (_outController != null && needRefreshAnimation) {
      _outController!.reset();
      for (var uid in (widget.config.uids ?? [])) {
        PositionOffset offset = widget.getPointByUid(uid);
        _outTranslateX[uid] = Tween(
          begin: _outTranslateX[uid]?.value,
          end: offset.offset.dx,
        ).animate(
          CurvedAnimation(
            parent: _outController!,
            curve: const Interval(
              0.0,
              0.4,
              curve: Curves.linear,
            ),
          ),
        );
        _outTranslateY[uid] = Tween(
          begin: _outTranslateY[uid]?.value,
          end: offset.offset.dy,
        ).animate(
          CurvedAnimation(
            parent: _outController!,
            curve: const Interval(
              0.0,
              0.4,
              curve: Curves.linear,
            ),
          ),
        );
      }
      _outController!.forward();
    }
  }

  _initIn() {
    PositionOffset inOffset = widget.getPointByUid(widget.config.uid);
    //进场动画
    _inController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    Completer inAnimCompleter = Completer();
    _inAnimCompleteFuture = inAnimCompleter.future;
    _inController!.addStatusListener(_onInStatus);
    const double stayThreshold = 0.85;
    _inController!.addListener(() {
      double value = _inController!.value;
      //进场动画快要结束的时候，礼物动画开始展示第一帧，这样会有重叠时间，避免过渡时画面闪烁
      if (value > stayThreshold) {
        if (!inAnimCompleter.isCompleted) {
          inAnimCompleter.complete();
        }
        // _refresh();
      }
    });
    Curve stayEndCurve = const StayEndCurve(stayThreshold);
    _inTranslateX = Tween(
      begin: inOffset.offset.dx,
      end: (giftWidth - _normalGiftDisplaySize) / 2 + offsetHorizontal,
    ).animate(
      CurvedAnimation(
        parent: _inController!,
        curve: Interval(
          0.5,
          1.0,
          curve: stayEndCurve,
        ),
      ),
    );
    _inTranslateY = Tween(
      begin: inOffset.offset.dy,
      end: (giftHeight - _normalGiftDisplaySize) / 2 + offsetVertical,
    ).animate(
      CurvedAnimation(
        parent: _inController!,
        curve: Interval(
          0.5,
          1.0,
          curve: stayEndCurve,
        ),
      ),
    );
    _inScale = Tween(
      begin: 1.0,
      end: (_normalGiftDisplaySize) / inOffset.size!.width,
    ).animate(
      CurvedAnimation(
        parent: _inController!,
        curve: Interval(
          0.5,
          1.0,
          curve: stayEndCurve,
        ),
      ),
    );
    _inOpacity = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _inController!,
        curve: const Interval(
          0.0,
          0.5,
          curve: Curves.easeOut,
        ),
      ),
    );
  }

  _initOut() {
    Log.d("_initOut __________________ ");
    _outController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _outController!.addStatusListener(_onOutStatus);
    for (var uid in (widget.config.uids ?? [])) {
      PositionOffset offset = widget.getPointByUid(uid);
      _outTranslateX[uid] = Tween(
        begin: (giftWidth - _normalGiftDisplaySize) / 2 + offsetHorizontal,
        end: offset.offset.dx,
      ).animate(
        CurvedAnimation(
          parent: _outController!,
          curve: const Interval(
            0.0,
            0.4,
            curve: Curves.linear,
          ),
        ),
      );
      _outTranslateY[uid] = Tween(
        begin: (giftHeight - _normalGiftDisplaySize) / 2 + offsetVertical,
        end: offset.offset.dy,
      ).animate(
        CurvedAnimation(
          parent: _outController!,
          curve: const Interval(
            0.0,
            0.4,
            curve: Curves.linear,
          ),
        ),
      );
      _outScale[uid] = Tween(
        begin: 1.0,
        end: offset.size!.width / (_normalGiftDisplaySize),
      ).animate(
        CurvedAnimation(
          parent: _outController!,
          curve: const Interval(
            0.0,
            0.4,
            curve: Curves.linear,
          ),
        ),
      );
      _outOpacity[uid] = Tween(
        begin: 1.0,
        end: 0.0,
      ).animate(
        CurvedAnimation(
          parent: _outController!,
          curve: const Interval(
            0.4,
            1.0,
            curve: Curves.decelerate,
          ),
        ),
      );
    }
  }

  _loadAsset() async {
    // 视频下载报错，VapWidget不会走onComplete，礼物动效的状态不会从Ani改为Out_Ani
    _showStarLevelWidget = await cacheGiftWithTry(
        widget.config.giftId, widget.config.giftSize,
        isMultiframe: widget.config.isWebp,
        isVap: widget.config.isVap,
        isRive: widget.config.isRive,
        effect: widget.config.effectUrl,
        voiceUrl: widget.config.voiceUrl);
    if (false == _showStarLevelWidget &&
        Util.isStringEmpty(widget.config.effectUrl)) {
      PulseLog.instance.log(GiftBody(
          GiftAction.play, widget.config.toString(), false, 'asset not found'));
      widget.onComplete(widget.config);
      return;
    }
    if (!mounted) return;
    _animationStartIcon = Util.giftImgUrl(widget.config.giftId);
    _animationEndIcon = Util.giftImgUrl(widget.config.giftId);

    if (widget.config.vapImgs != null && widget.config.vapImgs!.isNotEmpty) {
      for (var element in widget.config.vapImgs!) {
        CachedImageManager.preCache(
            this.context, Util.getRemoteImgUrl(element));
      }
    }

    if (widget.config.showAnimation) {
      CachedImageManager.preCache(
          this.context, Util.giftStartImgUrl(widget.config.giftId));
      CachedImageManager.preCache(
          this.context, Util.giftEndImgUrl(widget.config.giftId));
      CachedImageManager.preCache(
          this.context, Util.giftImgUrl(widget.config.giftId));
      if (widget.config.magic) {
        cacheMagicGiftWebp(widget.config.giftId, widget.config.magicSize);
      }
      await Future.delayed(const Duration(seconds: 1));
      await CachedImageManager.instance()
          .existsCachedImage(Util.giftStartImgUrl(widget.config.giftId))
          .then((value) {
        if (Util.parseBool(value)) {
          _animationStartIcon = Util.giftStartImgUrl(widget.config.giftId);
          if (widget.config.withEnd) {
            _animationEndIcon = _animationStartIcon;
          }
        }
      });
      await CachedImageManager.instance()
          .existsCachedImage(Util.giftEndImgUrl(widget.config.giftId))
          .then((value) {
        if (Util.parseBool(value)) {
          _animationEndIcon = Util.giftEndImgUrl(widget.config.giftId);
        }
      });
    }

    await _playInAnimationIfNeed();

    // 礼物播放超时检测，超过30秒，还未结束，自动结束
    _overTimer = Timer(const Duration(seconds: 30), _onComplete);
  }

  _playInAnimationIfNeed() {
    if (!mounted) return;
    if (widget.config.showAnimation && _inController != null) {
      setState(() {
        _status = DisplayItemGiftStatus.In;
      });
      _inController!.reset();
      _inController!.forward(from: 0.0);
    } else {
      setState(() {
        _status = DisplayItemGiftStatus.Ani;
      });
    }
    _playAudioIfNeed();
  }

  AudioPlayer? _audioPlayer;
  StreamSubscription? _playerStreamSubscription;

  /// 声音礼物
  _playAudioIfNeed() async {
    if (!mounted) return;
    if (!Util.isStringEmpty(widget.config.voiceUrl)) {
      Log.d('playAudioIfNeed:${widget.config.voiceUrl} ');
      _audioPlayer ??= AudioPlayer()..setReleaseMode(ReleaseMode.stop);
      _playerStreamSubscription =
          _audioPlayer!.onPlayerStateChanged.listen((PlayerState s) {
        Log.d('Current player state: $s');
        if (PlayerState.completed == s || PlayerState.stopped == s) {
          _onAudioCompleted();
        }
      });

      File file = getGiftVoiceFile(widget.config.voiceUrl!);
      Log.d('playAudioIfNeed:${file.path}');
      await _audioPlayer!.play(
          file.existsSync()
              ? DeviceFileSource(file.path)
              : UrlSource(widget.config.voiceUrl!),
          mode: PlayerMode.mediaPlayer);
    }
  }

  _onAudioCompleted() {
    _playerStreamSubscription?.cancel();
    _audioPlayer?.dispose();
    _audioPlayer = null;
  }

  void _onInStatus(AnimationStatus status) {
    if (!mounted) return;
    if (status == AnimationStatus.completed) {
      if (_showCoreAnimation()) {
        setState(() {
          _status = DisplayItemGiftStatus.Ani;
        });
      } else {
        setState(() {
          _status = DisplayItemGiftStatus.Out;
        });
        _outController?.reset();
        _outController?.forward();
      }
    }
  }

  void _onOutStatus(AnimationStatus status) async {
    if (status == AnimationStatus.completed) {
      bool canPlayMagic = widget.config.magic;
      if (canPlayMagic) {
        canPlayMagic = await cacheMagicGiftWebp(
            widget.config.giftId, widget.config.magicSize);
      }
      if (canPlayMagic && _showCoreAnimation()) {
        _status = DisplayItemGiftStatus.Magic;
        if (mounted) {
          setState(() {});
        }
      } else {
        _onComplete();
      }
    }
  }

  bool _showBirthdayDialog = false;

  void _onComplete() {
    if (widget.config.isBirthdayGiftAnim && !_showBirthdayDialog) {
      _showBirthdayDialog = true;
      refresh();
    } else {
      if (_isCompleted) return;
      _isCompleted = true;
      _cancelOverTimer();
      PulseLog.instance
          .log(GiftBody(GiftAction.play, widget.config.toString(), true, ''));
      widget.onComplete(widget.config);
      Log.d(
          tag: "displayGift",
          "_onComplete:${widget.config.isCanAwake},senderUid:${widget.config.uid}");
      if (widget.config.isCanAwake == true &&
          widget.config.uid == Session.uid) {
        IPersonalDataManager personalDataManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        personalDataManager.showGiftWallDialog(this.context, Session.uid,
            widget.config.giftId, widget.config.giftName,
            rid: widget.rid);
      }
    }
  }

  Widget _buildIn(BuildContext context, Widget? child) {
    PositionOffset inOffset = widget.getPointByUid(widget.config.uid);
    return Center(
      child: Container(
        width: inOffset.size!.width,
        height: inOffset.size!.height,
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..translate(_inTranslateX!.value, _inTranslateY!.value)
          ..scale(_inScale!.value, _inScale!.value),
        child: FadeTransition(
          opacity: _inOpacity!,
          child: CachedNetworkImage(
            imageUrl: _animationStartIcon,
            fadeInDuration: Duration.zero,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget _buildOut(int uid, {int giftNum = 1}) {
    return Center(
      child: Container(
        width: _normalGiftDisplaySize,
        height: _normalGiftDisplaySize,
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..translate(_outTranslateX[uid]!.value, _outTranslateY[uid]!.value)
          ..scale(_outScale[uid]!.value, _outScale[uid]!.value),
        child: FadeTransition(
          opacity: _outOpacity[uid]!,
          child: Stack(
            children: <Widget>[
              Center(
                child: CachedNetworkImage(
                  imageUrl: _animationEndIcon,
                  fadeInDuration: Duration.zero,
                  fit: BoxFit.fill,
                ),
              ),
              if (giftNum > 1) _renderGiftNum(giftNum),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderGiftNum(int giftNum) {
    return Align(
      alignment: AlignmentDirectional.bottomEnd,
      child: Text(
        'x$giftNum',
        style: const TextStyle(
          color: Color(0xFFFFF1B4),
          fontSize: 60,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic,
          shadows: [
            Shadow(
              color: Color(0xFFFF718C),
              offset: Offset(2, 2),
            ),
            Shadow(
              color: Color(0xFFFF718C),
              offset: Offset(2, -2),
            ),
            Shadow(
              color: Color(0xFFFF718C),
              offset: Offset(-2, 2),
            ),
            Shadow(
              color: Color(0xFFFF718C),
              offset: Offset(-2, -2),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderAnimationOther(BuildContext context) {
    return Stack(
      children: <Widget>[
        _renderNormalGift(context),
        if (_status == DisplayItemGiftStatus.In) _renderNormalIn(),
        if (_status == DisplayItemGiftStatus.Out ||
            _status == DisplayItemGiftStatus.Out_Ani)
          _renderNormalOut(),
      ],
    );
  }

  Widget _renderAnimationRive(BuildContext context) {
    return Stack(
      children: <Widget>[
        _renderRiveGift(context),
        if (_status == DisplayItemGiftStatus.In) _renderNormalIn(),
        if (_status == DisplayItemGiftStatus.Out ||
            _status == DisplayItemGiftStatus.Out_Ani)
          _renderNormalOut(),
      ],
    );
  }

  Widget _renderAnimationVap(BuildContext context) {
    return Stack(
      children: <Widget>[
        _renderVapGift(context),
        if (_status == DisplayItemGiftStatus.In) _renderNormalIn(),
        if (_status == DisplayItemGiftStatus.Out ||
            _status == DisplayItemGiftStatus.Out_Ani)
          _renderNormalOut(),
      ],
    );
  }

  Widget _renderNormalGift(BuildContext context) {
    if (!_showCoreAnimation()) {
      if (widget.config.showAnimation) {
        return PositionedDirectional(
          start: offsetHorizontal,
          end: offsetHorizontal,
          top: offsetVertical,
          bottom: offsetVertical,
          child: SizedBox(
            width: Util.width - 2 * offsetHorizontal,
            height: Util.height - 2 * offsetVertical,
          ),
        );
      } else {
        _onComplete();
        return const SizedBox.shrink();
      }
    }

    if (widget.config.isWebp) {
      return _renderMultiframeGift(context);
    }
    return const SizedBox.shrink();
  }

  PositionedDirectional _renderNormalIn() {
    return PositionedDirectional(
      start: 0.0,
      top: 0.0,
      child: AnimatedBuilder(animation: _inController!, builder: _buildIn),
    );
  }

  PositionedDirectional _renderNormalOut() {
    return PositionedDirectional(
      start: 0.0,
      top: 0.0,
      child: Stack(
        children: widget.config.uids!.map(_buildOutForUid).toList(),
      ),
    );
  }

  Positioned _buildOutForUid(int uid) {
    return Positioned(
      child: AnimatedBuilder(
          animation: _outController!,
          builder: (BuildContext context, Widget? child) {
            int giftNum = _giftNumForUid(uid);
            return _buildOut(uid, giftNum: giftNum);
          }),
    );
  }

  int _giftNumForUid(int uid) {
    return widget.config.giftNumMap != null &&
            widget.config.giftNumMap!.containsKey(uid)
        ? widget.config.giftNumMap![uid]
        : widget.config.count;
  }

  PositionedDirectional _renderMultiframeGift(BuildContext context) {
    double giftOpacity = _status == DisplayItemGiftStatus.Ani ||
            _status == DisplayItemGiftStatus.Out_Ani
        ? 1.0
        : 0.0;

    if (widget.config.effectUrl != null) {
      return PositionedDirectional(
        start: offsetHorizontal,
        end: offsetHorizontal,
        top: offsetVertical,
        bottom: offsetVertical,
        child: Opacity(
          opacity: giftOpacity,
          child: MultiframeImage.network(
            widget.config.effectUrl,
            'room',
            onComplete: () {
              if (!mounted) {
                return;
              }
              if (widget.config.showAnimation) {
                //礼物动画结束的时候，先把status设置为Out_Ani，稍等一下才把status设置为Out，这样礼物最后一帧会多显示一小会儿，避免衔接出场动画出现闪烁
                setState(() {
                  _status = DisplayItemGiftStatus.Out_Ani;
                });
                Future.delayed(const Duration(milliseconds: 50), () {
                  if (!mounted) return;
                  setState(() {
                    _status = DisplayItemGiftStatus.Out;
                  });
                });
                _outController?.reset();
                _outController?.forward();
              } else {
                _onComplete();
              }
            },
            delayToShowFuture: _inAnimCompleteFuture,
          ),
        ),
      );
    }

    File file = getMultiframeGiftFile(widget.config.giftId);

    return PositionedDirectional(
      start: offsetHorizontal,
      end: offsetHorizontal,
      top: offsetVertical,
      bottom: offsetVertical,
      child: Opacity(
        opacity: giftOpacity,
        child: MultiframeImage.file(
          file,
          onComplete: () {
            if (!mounted) {
              return;
            }
            if (widget.config.showAnimation) {
              //礼物动画结束的时候，先把status设置为Out_Ani，稍等一下才把status设置为Out，这样礼物最后一帧会多显示一小会儿，避免衔接出场动画出现闪烁
              setState(() {
                _status = DisplayItemGiftStatus.Out_Ani;
              });
              Future.delayed(const Duration(milliseconds: 50), () {
                if (!mounted) return;
                setState(() {
                  _status = DisplayItemGiftStatus.Out;
                });
              });
              _outController?.reset();
              _outController?.forward();
            } else {
              _onComplete();
            }
          },
          delayToShowFuture: _inAnimCompleteFuture,
        ),
      ),
    );
  }

  Widget _renderMagicGift(BuildContext context) {
    if (!_showCoreAnimation()) {
      if (widget.config.showAnimation) {
        return const PositionedDirectional(
          start: 0,
          end: 0,
          top: 0,
          bottom: 0,
          child: SizedBox.shrink(),
        );
      } else {
        _onComplete();
        return const SizedBox.shrink();
      }
    }
    return PositionedDirectional(
      start: 0,
      end: 0,
      top: 0,
      bottom: 0,
      child: Stack(
        children: widget.config.uids!.map(_buildMagicForUid).toList(),
      ),
    );
  }

  PositionedDirectional _buildMagicForUid(int uid) {
    PositionOffset offset = widget.getPointByUid(uid);
    File file = getMagicGiftWebpFile(widget.config.giftId);
    return PositionedDirectional(
        top: offset.offset.dy,
        start: offset.offset.dx,
        width: offset.size!.width,
        height: offset.size!.height,
        child: MultiframeImage.file(
          file,
          onComplete: () {
            if (!mounted) {
              return;
            }
            _onComplete();
          },
        ));
  }

  double get _normalGiftDisplaySize {
    return giftWidth * widget.config.displayNormalGiftRatio;
//    return Util.width * widget.config.displayNormalGiftRatio;
  }

  // Widget _renderFullscreen(BuildContext context) {
  //   return _renderBigGift(context, alignment: Alignment.bottomCenter);
  // }

  AnimationController? _inAnimationController;
  bool _inAnimating = false;
  bool _avatarShowing = false;
  bool _outAnimating = false;
  AnimationController? _outAnimationController;
  late double avatarStart;
  late double avatarTop;
  late double avatarFinalTop;
  Animation? _userTranslationYAnim;
  Animation? _userOpacityAnim;
  Animation? _userDisappearOpacityAnim;

  void _initHeaderAnimation() {
    _inAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    CurvedAnimation curve = CurvedAnimation(
        parent: _inAnimationController!, curve: Curves.easeInOut);
    _userTranslationYAnim =
        Tween<double>(begin: avatarTop, end: avatarFinalTop).animate(curve);
    _userOpacityAnim = Tween<double>(begin: 0.0, end: 1.0).animate(curve);
    _inAnimationController!.addListener(() {
      _refresh();
    });
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
    _outAnimationController!.addListener(() {
      _refresh();
    });
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

  Widget _renderRiveGift(BuildContext context) {
    if (!_showCoreAnimation()) {
      if (widget.config.showAnimation) {
        return PositionedDirectional(
          start: offsetHorizontal,
          end: offsetHorizontal,
          top: offsetVertical,
          bottom: offsetVertical,
          child: SizedBox(
            width: Util.width - 2 * offsetHorizontal,
            height: Util.height - 2 * offsetVertical,
          ),
        );
      } else {
        _onComplete();
        return const SizedBox.shrink();
      }
    }

    double giftOpacity = _status == DisplayItemGiftStatus.Ani ||
            _status == DisplayItemGiftStatus.Out_Ani
        ? 1.0
        : 0.0;

    File riveFile = getRiveGiftFile(widget.config.giftId);

    return PositionedDirectional(
      start: offsetHorizontal,
      end: offsetHorizontal,
      top: offsetVertical,
      bottom: offsetVertical,
      child: Offstage(
        offstage: giftOpacity == 1.0 ? false : true,
        child: RiveAnimation.file(
          riveFile.path,
          alignment: Alignment.center,
          fit: BoxFit.contain,
          onInit: (Artboard artboard) {
            StateMachineController? controller =
                StateMachineController.fromArtboard(artboard, 'bbStateMachine');
            if (controller != null) {
              artboard.addController(controller);

              /// Rive动画，进场比较简单，时间短。等_inController执行完再执行Rive动画
              Future.delayed(
                  Duration(
                      milliseconds: widget.config.showAnimation ? 1500 : 50),
                  () {
                SMIInput<double>? input =
                    controller.findInput<double>('bbInput');
                if (mounted) {
                  setState(() {
                    input?.value = widget.config.riveValue;

                    controller.isActiveChanged.addListener(() {
                      if (!controller.isActive) {
                        if (widget.config.showAnimation) {
                          Future.delayed(const Duration(milliseconds: 10), () {
                            if (!mounted) return;
                            setState(() {
                              _status = DisplayItemGiftStatus.Out_Ani;
                            });
                            Future.delayed(const Duration(milliseconds: 50),
                                () {
                              if (!mounted) return;
                              setState(() {
                                _status = DisplayItemGiftStatus.Out;
                              });
                            });
                            _outController?.reset();
                            _outController?.forward();
                          });
                        } else {
                          Future.delayed(const Duration(milliseconds: 10), () {
                            if (!mounted) return;
                            _onComplete();
                          });
                        }
                      }
                    });
                  });
                }
              });
            }
          },
        ),
      ),
    );
  }

  Widget _renderVapGift(BuildContext context) {
    if (!_showCoreAnimation()) {
      if (widget.config.showAnimation) {
        return PositionedDirectional(
          start: offsetHorizontal,
          end: offsetHorizontal,
          top: offsetVertical,
          bottom: offsetVertical,
          child: SizedBox(
            width: Util.width - 2 * offsetHorizontal,
            height: Util.height - 2 * offsetVertical,
          ),
        );
      } else {
        _onComplete();
        return const SizedBox.shrink();
      }
    }

    double giftOpacity = _status == DisplayItemGiftStatus.In ||
            _status == DisplayItemGiftStatus.Ani ||
            _status == DisplayItemGiftStatus.Out_Ani
        ? 1.0
        : 0.0;

    File vapFile = getVapGiftFile(widget.config.giftId);
    double opacity = _getUserOpacity();
    if (Constant.isDevMode && Util.isIOSSimulator) {
      return Config.getBool('SIMULATOR_PLAY_MP4', false)
          ? VAPSimulatorPlayer(vapAsset: vapFile.path, onComplete: _onComplete)
          : VapSimulatorWidget(onComplete: _onComplete);
    }
    return Stack(
      children: [
        PositionedDirectional(
          start: offsetHorizontal,
          end: offsetHorizontal,
          top: offsetVertical,
          bottom: offsetVertical,
          child: Offstage(
            offstage: giftOpacity == 1.0 ? false : true,
            child: _buildVap(vapFile.path),
          ),
        ),
        if (_showStarLevelWidget &&
            _status == DisplayItemGiftStatus.Ani &&
            widget.config.isHandbook)
          PositionedDirectional(
            start: offsetHorizontal,
            end: offsetHorizontal,
            bottom: 0,
            child: R.img(
              giftLevel(widget.config.starLevel),
              package: ComponentManager.MANAGER_BASE_CORE,
            ),
          ),
        // 画两个头像现在有你的车了 更没必要了
        if (widget.config.withHeader)
          PositionedDirectional(
            start: _getVirtualX(avatarStart),
            top: _getVirtualY(_userTranslationYAnim!.value),
            child: Opacity(
              opacity: opacity,
              child: CommonAvatar(
                path: widget.config.header?.from?.icon ?? '',
                shape: BoxShape.circle,
                size: 90 * zoomRatio,
              ),
            ),
          ),
        if (widget.config.withHeader)
          PositionedDirectional(
            end: _getVirtualX(avatarStart),
            top: _getVirtualY(_userTranslationYAnim!.value),
            child: Opacity(
              opacity: opacity,
              child: CommonAvatar(
                path: widget.config.header?.to?.icon ?? '',
                shape: BoxShape.circle,
                size: 90 * zoomRatio,
              ),
            ),
          ),
      ],
    );
  }

  void _onVapRenderFrame(int frameIndex, int frameTotal) {
    int avatarStartFrame =
        widget.config.withHeader ? widget.config.header!.start : -1;
    int avatarEndFrame =
        widget.config.withHeader ? widget.config.header!.end : -1;
    if (Platform.isAndroid &&
        (frameIndex == frameTotal - 4) &&
        widget.config.showAnimation &&
        mounted) {
      /// Android Vap播放完毕不会停在最后一帧，在即将播放完前几帧先展示Ani out动画，，避免衔接出场动画出现闪烁
      setState(() {
        _status = DisplayItemGiftStatus.Out_Ani;

        _outController?.reset();
        _outController?.forward();
      });
    }

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
  }

  void _onVapComplete() {
    Log.d('_DisplayItemGiftState._renderFullscreenVap');
    if (!mounted) {
      return;
    }
    if (widget.config.showAnimation) {
      if (_status == DisplayItemGiftStatus.Ani) {
        /// 如果在onRenderFrame中已重置过状态，这里不再需要了
        setState(() {
          _status = DisplayItemGiftStatus.Out_Ani;
        });
        Future.delayed(const Duration(milliseconds: 50), () {
          if (!mounted) return;
          setState(() {
            _status = DisplayItemGiftStatus.Out;
          });
        });
        _outController?.reset();
        _outController?.forward();
      }
    } else {
      _onComplete();
    }
  }

  /// vap融合图片
  List<String>? get _vapImgList {
    return widget.config.vapImgs
        ?.map((e) => CachedImageManager.instance()
            .getFileByUrl(Util.getRemoteImgUrl(e))
            .path)
        .toList();
  }

  Widget _buildVap(String filePath) {
    // iOS13某些机型播放礼物失败,通过配置下发使用新的播放插件,测试能否播放
    return Platform.isIOS && Session.getInt('use_new_vap', 0) > 0
        ? VapView(
            filePath: filePath,
            imgList: _vapImgList,
            onRenderFrame: _onVapRenderFrame,
            onComplete: _onVapComplete,
            delayToShowFuture: _inAnimCompleteFuture,
          )
        : VapWidget(
            hybridComposition: !Util.cantHybridComposition(),
            onPlatformViewCreated: (controller) {
              controller.startPlay(filePath,
                  textList: widget.config.vapTexts, imgList: _vapImgList);
            },
            onRenderFrame: _onVapRenderFrame,
            onComplete: _onVapComplete,
            delayToShowFuture: _inAnimCompleteFuture,
          );
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

  double _getVirtualX(double dx) {
    return dx + offsetHorizontal;
  }

  double _getVirtualY(double dy) {
    return dy + offsetVertical;
  }

  Widget _renderGraffitiGift() {
    IGiftManager giftManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
    return giftManager.getGraffitiGiftEffect(
      Util.giftImgUrl(widget.config.giftId),
      widget.config.graffitiGiftPoints ?? [],
      _onComplete,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (widget.config.isGraffitiGiftAnim) {
      // 涂鸦礼物动效
      child = _renderGraffitiGift();
    } else if (_status == DisplayItemGiftStatus.Wait) {
      child = const IgnorePointer();
    } else if (_status == DisplayItemGiftStatus.Magic) {
      child = _renderMagicGift(context);
    } else if (widget.config.isVap) {
      if (widget.config.showAnimation) {
        child = _renderAnimationVap(context);
      } else {
        child = _renderVapGift(context);
      }
    } else if (widget.config.isRive) {
      if (widget.config.showAnimation) {
        child = _renderAnimationRive(context);
      } else {
        child = _renderRiveGift(context);
      }
    } else {
      if (widget.config.showAnimation) {
        child = _renderAnimationOther(context);
      } else {
        child = _renderNormalGift(context);
      }
    }

    return Stack(
      fit: StackFit.expand,
      alignment: AlignmentDirectional.topCenter,
      children: [
        IgnorePointer(child: Stack(fit: StackFit.expand, children: [child])),
        if (_showBirthdayDialog && widget.config.isBirthdayGiftAnim)
          BirthdayGiftDialog(config: widget.config, onClose: _onComplete),
      ],
    );
  }

  void _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  void _initSizes() {
    final width = Util.width;
    final height = Util.height;
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
  }
}

class StayEndCurve extends Curve {
  final double threshold;

  const StayEndCurve(this.threshold);

  @override
  double transform(double t) {
    if (t <= threshold) {
      return 1.0 / threshold * t;
    }
    return 1.0;
  }
}

class StayBeginCurve extends Curve {
  final double threshold;

  const StayBeginCurve(this.threshold);

  @override
  double transform(double t) {
    if (t >= threshold) {
      double a = 1 / (1 - threshold);
      double b = 1 - a;
      return a * t + b;
    }
    return 0.0;
  }
}

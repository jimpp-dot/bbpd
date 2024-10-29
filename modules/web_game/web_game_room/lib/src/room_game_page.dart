import 'dart:async';

import 'package:shared/shared.dart';
import 'package:web_game_core/web_game_core.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/widget/displayGift.dart';
import 'package:flutter/foundation.dart' hide describeEnum;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'game_floating_msg.dart';
import 'mic_mixin.dart';
import 'room_game_protocol.dart';

class RoomGamePage extends StatefulWidget {
  final String gameType;
  final bool showLoadingPage; // 显示loading页
  final bool showLoadingCloseBtn; // 显示loading页里的关闭按钮

  const RoomGamePage({
    Key? key,
    required this.gameType,
    this.showLoadingPage = true,
    this.showLoadingCloseBtn = true,
  }) : super(key: key);

  @override
  State createState() => _RoomGamePageState();
}

class _RoomGamePageState extends State<RoomGamePage>
    with
        RoomTemplateMixin<RoomGamePage>,
        MicMixin<RoomGamePage>,
        RoomSettingMixin<RoomGamePage> {
  RoomGameProtocol? gameProtocol;

  init() async {
    //修复狼人杀进房的时候，有rtc拉流<关闭拉流>
    if (widget.gameType == "laya-wolf") {
      await ChatRoomData.getInstance()
          ?.rtcController
          .engine
          ?.muteAllRemoteAudioStreams(true);
    }
  }

  @override
  void initState() {
    super.initState();
    init();
    gameProtocol = RoomGameProtocol(this, onStartupCallback: () {
      trackGameState('successful');
    });
    gameProtocol!.init();
    _getGameInfo();
  }

  @override
  void didUpdateWidget(covariant oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 麦位有变化
    gameProtocol?.syncPlayerListToGame();
    if (oldWidget.gameType != widget.gameType) {
      gameProtocol?.reset();
      _getGameInfo(); // 切游戏房，重置接口
    }
  }

  @override
  void dispose() {
    switchPortraitUp();
    gameProtocol?.dispose();
    gameProtocol = null;
    super.dispose();
  }

  void trackGameState(String state) {
    if (!ChatRoomData.exists()) return;
    final room = ChatRoomData.getInstance();
    Tracker.instance.track(const TrackEvent('load_room_game'), properties: {
      'rid': room?.rid,
      'room_type': room?.config?.type,
      'room_factory_type': room?.config?.originalRFT,
      'game_type': widget.gameType,
      'state': state,
    });
  }

  Future<void> _getGameInfo() async {
    trackGameState('init');

    String gameType = widget.gameType;
    if (isGameOnlineDev) {
      int orientation = 0;
      String url = 'http://192.168.11.48:4399/$gameType/';
      if (gameType == 'laya-breakout' || gameType == 'laya-mahjong-tw') {
        orientation = 1;
      }
      GameConfig gameConfig =
          GameConfig(url: url, orientation: orientation, version: '1');
      gameProtocol!.gameResManager = GameResourceManager(gameConfig);
      gameProtocol!.gameResManager!.gameUrl = url;
      gameProtocol!.gameState = GameState.loading;
      doSwitchOrientationsIfNeeded();
    } else {
      if (GameResourceManager.gameConfigs.isEmpty) {
        await GameResourceManager.sync();
      }
      GameConfig? gameConfig = GameResourceManager.gameConfigs[gameType];
      if (gameConfig != null) {
        await _checkGameRes(gameConfig);
      } else {
        Fluttertoast.showCenter(msg: 'Unknown game: $gameType');
        gameProtocol!.closeOrQuitRoom();
      }
    }
  }

  Future<void> _checkGameRes(GameConfig gameConfig) async {
    void load() {
      if (gameProtocol == null) return;
      gameProtocol!.gameState = GameState.loading;
      trackGameState('loading');

      gameProtocol!.trackTimer?.cancel();
      gameProtocol!.trackTimer = Timer(const Duration(seconds: 10), () {
        if (!gameProtocol!.gameBooted) {
          trackGameState('timeout');
          // switchAndroidWebViewPlatform();
          gameProtocol!.closeOrQuitRoom();
        }
      });
    }

    gameProtocol!.gameResManager = GameResourceManager(gameConfig);
    doSwitchOrientationsIfNeeded();
    await gameProtocol!.gameResManager!.init();
    await gameProtocol!.gameResManager!.prepare(
      onResReady: () {
        load();
      },
      onResDownload: (int count, int total) {
        if (gameProtocol == null) return;

        if (gameProtocol!.gameState != GameState.downloading) {
          // 开始下载时，上报埋点
          gameProtocol!.gameState = GameState.downloading;
          trackGameState('downloading');
        }
        gameProtocol?.stateStreamController.add(ProgressInfo(
            state: gameProtocol!.gameState,
            progress: (count.toDouble() / total)));
      },
      onResError: (e) {
        if (gameProtocol == null) return;
        gameProtocol?.gameState = GameState.failed;
        if (e is DownloadException) {
          trackGameState('download_failed');
          Fluttertoast.showCenter(msg: 'Download failed');
        } else if (e is UnzipException) {
          trackGameState('unzip_failed');
          Fluttertoast.showCenter(msg: 'Unzip failed');
        }
        if (!mounted) return;
        Navigator.maybePop(context);
      },
    );
  }

  @override
  PositionOffset getGiftPositionByUid(int uid) {
    return getPositionOffsetByUid(uid);
  }

  void doSwitchOrientationsIfNeeded() {
    // 0:竖屏  1:横屏
    if (gameProtocol!.gameResManager?.gameConfig.orientation == 0) {
      switchPortraitUp();
    } else if (gameProtocol!.gameResManager?.gameConfig.orientation == 1) {
      switchLandscape();
    }
  }

  void switchLandscape() {
    if (Util.isLandscape) return;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
          overlays: []);
    });
  }

  Future<void> switchPortraitUp() async {
    if (!Util.isLandscape) return;

    await Future.wait([
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]),
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: SystemUiOverlay.values),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return orientation == Orientation.portrait
          ? _buildPortraitWidget()
          : _buildLandscapeWidget();
    });
  }

  Widget _buildPortraitWidget() {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        _buildWebView(),
        // 如果游戏还没启动成功，盖一个loading在上面，避免闪一下黑屏问题
        if (!gameProtocol!.gameBooted && widget.showLoadingPage)
          Positioned.fill(
            child: GameLoadingPage(
              stateStreamController: gameProtocol!.stateStreamController,
              pageStyle: LoadingPageStyle.Normal,
              onClose: widget.showLoadingCloseBtn
                  ? () {
                      gameProtocol!.closeOrQuitRoom();
                    }
                  : null,
            ),
          )
        else ...[
          ...getAllEmojiWidgets(gameProtocol!.room),
          if (gameProtocol!.msgListPosition != null)
            PositionedDirectional(
              start: gameProtocol!.msgListPosition!['start']?.toDouble(),
              end: gameProtocol!.msgListPosition!['end']?.toDouble(),
              top: gameProtocol!.msgListPosition!['top']?.toDouble(),
              bottom: gameProtocol!.msgListPosition!['bottom']?.toDouble(),
              child: Column(
                children: [
                  gameProtocol!.roomManager
                      .getMessageList(room: gameProtocol!.room),
                ],
              ),
            )
          else if (gameProtocol!.floatMsgEnabled)
            PositionedDirectional(
              start: 0,
              end: 0,
              top: MediaQuery.of(context).padding.top + 60,
              height: 120,
              child: GameFloatingMsg(
                room: gameProtocol!.room,
                startTop: 0,
                endTop: 0,
              ),
            ),
          if (ChatRoomData.getInstance()?.config?.isLandlord == true)
            _roomGameHeaderWidget(),
          if (gameProtocol!.displayGiftEnabled)
            // 礼物
            Positioned.fill(
              child: DisplayGift(
                room: gameProtocol!.room,
                getPositionByUid: getGiftPositionByUid,
              ),
            ),
        ],
      ],
    );
  }

  /// 横屏
  Widget _buildLandscapeWidget() {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        _buildWebView(),
        // 如果游戏还没启动成功，盖一个loading在上面，避免闪一下黑屏问题
        if (!gameProtocol!.gameBooted && widget.showLoadingPage)
          Positioned.fill(
            child: GameLoadingPage(
              stateStreamController: gameProtocol!.stateStreamController,
              pageStyle: LoadingPageStyle.Normal,
              onClose: widget.showLoadingCloseBtn
                  ? () {
                      gameProtocol!.closeOrQuitRoom();
                    }
                  : null,
            ),
          )
        else ...[
          ...getAllEmojiWidgets(gameProtocol!.room),
          if (gameProtocol!.floatMsgEnabled)
            PositionedDirectional(
              start: 0,
              end: 0,
              top: MediaQuery.of(context).padding.top + 20,
              height: 80,
              child: GameFloatingMsg(
                room: gameProtocol!.room,
                startTop: 0,
                endTop: 0,
              ),
            ),
          // Positioned.fill(
          //   child: DisplayGift(
          //     room: room,
          //     getPositionByUid: getGiftPositionByUid,
          //     scale: 0.5,
          //   ),
          // ),
        ],
      ],
    );
  }

  Widget _buildWebView() {
    if ((gameProtocol!.gameState != GameState.loading &&
            gameProtocol!.gameState != GameState.successful) ||
        gameProtocol!.gameResManager?.gameUrl == null) {
      // 用SizedBox有概率黑屏，这里用Container撑起来
      return Container(color: Colors.transparent);
    }

    String url =
        '${gameProtocol!.gameResManager!.gameUrl!}?platform=${describeEnum(defaultTargetPlatform).toLowerCase()}&systemVersion=${DeviceInfo.systemVersion}&ts=${DateTime.now().millisecondsSinceEpoch}';
    if (!isGameOnlineDev) {
      // 加载本地资源包
      url = 'file://$url';
    }

    return WebView(
      initialUrl: url,
      onWebViewCreated: (controller) {
        gameProtocol?.webViewController = controller;
      },
      javascriptMode: JavascriptMode.unrestricted,
      javascriptChannels: {
        JavascriptChannel(
          name: 'FlutterWebBridge',
          onMessageReceived: (JavascriptMessage message) {
            Log.d(message.message);
            gameProtocol?.onGameMessage(message.message);
          },
        ),
      },
      navigationDelegate: (NavigationRequest navigation) {
        Log.w(navigation);
        return NavigationDecision.navigate;
      },
      debuggingEnabled: Constant.isDevMode,
      gestureNavigationEnabled: false,
      onPageStarted: (String url) {
        Log.d('onPageStarted: $url');
        if (defaultTargetPlatform == TargetPlatform.android) {
          //安卓加载的时候没有更新进度，所以一开始就置1
          gameProtocol?.stateStreamController
              .add(ProgressInfo(state: gameProtocol!.gameState, progress: 1.0));
        }
      },
      onProgress: (progress) {
        Log.d('onPageProgress: $progress');
        gameProtocol?.stateStreamController.add(ProgressInfo(
            state: gameProtocol!.gameState,
            progress: progress.toDouble() / 100));
      },
      onPageFinished: (String url) {
        Log.d('onPageFinished: $url');
      },
      onWebResourceError: (WebResourceError error) {
        Log.e(
            '${error.errorCode};${error.description};${error.failingUrl};${error.errorType}');
      },
      initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
    );
  }

  Widget _roomGameHeaderWidget() {
    return Container(
      height: 32,
      margin: EdgeInsetsDirectional.only(
          top: Util.statusHeight + 6, end: 12, bottom: 6),
      child: Row(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.of(context).maybePop();
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 4),
              child: R.img("back.svg",
                  width: 24.0,
                  height: 24.0,
                  package: ComponentManager.MANAGER_BASE_ROOM),
            ),
          ),
          Text(
            ChatRoomData.getInstance()?.config?.name ?? '',
            style:
                R.textStyle.medium12.copyWith(color: Colors.white, height: 1),
          ),
          const Spacer(),
          InkWell(
            onTap: _onSettingClick,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(end: 8.0),
              child: R.img(
                "live/ic_live_room_more.svg",
                width: 24.0,
                height: 24.0,
                package: ComponentManager.MANAGER_BASE_ROOM,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onSettingClick() {
    onSettingClick(ChatRoomData.getInstance());
  }
}

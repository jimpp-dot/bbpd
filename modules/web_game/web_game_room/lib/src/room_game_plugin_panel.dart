import 'dart:async';

import 'package:shared/shared.dart';
import 'package:web_game_core/web_game_core.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/biz_plugin/base/room_plugin_beans.dart';
import 'package:chat_room/src/protobuf/generated/plugin_base.pb.dart';
import 'package:flutter/foundation.dart' hide describeEnum;
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'room_game_api.dart';
import 'room_game_plugin_mixin.dart';
import 'room_game_protocol.dart';

/// 房间内插件玩法
class RoomGamePluginPanel extends StatefulWidget {
  const RoomGamePluginPanel({Key? key}) : super(key: key);

  @override
  State<RoomGamePluginPanel> createState() => _RoomGamePluginPanelState();
}

class _RoomGamePluginPanelState extends State<RoomGamePluginPanel>
    with RoomGamePluginMixin<RoomGamePluginPanel> {
  RoomGameProtocol? gameProtocol;

  @override
  void initState() {
    super.initState();
    gameProtocol = RoomGameProtocol(
      this,
      onMinimizeGame: minimizeGame,
      onStartGame: startGame,
      onCloseGame: closeGame,
      onStartupCallback: () {
        trackGameState('successful');
      },
    );
    gameProtocol!.init();
  }

  @override
  void didUpdateWidget(covariant oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 麦位有变化
    gameProtocol?.syncPlayerListToGame();
  }

  @override
  void dispose() {
    gameProtocol?.dispose();
    gameProtocol = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!canShow) return const SizedBox();
    return WillPopScope(
      onWillPop: () async {
        if (canShow) {
          closeGamePanel();
          return false;
        } else {
          return true;
        }
      },
      child: webView,
    );
  }

  void trackGameState(String state) {
    final room = ChatRoomData.getInstance();
    Tracker.instance.track(const TrackEvent('load_room_game'), properties: {
      'rid': room?.rid,
      'room_type': room?.config?.type,
      'room_factory_type': room?.config?.originalRFT,
      'game_type':
          curGameType == RoomPluginType.LayaRichMan ? 'laya-richman' : '',
      'state': state,
    });
  }

  Future<void> _getGameInfo(RoomPluginType gameType) async {
    trackGameState('init');

    if (isGameOnlineDev) {
      int orientation = 0;
      String? url;
      if (gameType == RoomPluginType.LayaRichMan) {
        url = 'http://192.168.11.48:4399/laya-richman/';
      } else {
        Fluttertoast.showCenter(msg: 'Unknown game: $gameType');
      }
      GameConfig gameConfig =
          GameConfig(url: url!, orientation: orientation, version: '1');
      gameProtocol!.gameResManager = GameResourceManager(gameConfig);
      gameProtocol!.gameResManager!.gameUrl = url;

      gameProtocol!.gameState = GameState.loading;
    } else {
      if (GameResourceManager.gameConfigs.isEmpty) {
        await GameResourceManager.sync();
      }
      GameConfig? gameConfig;
      if (gameType == RoomPluginType.LayaRichMan) {
        gameConfig = GameResourceManager.gameConfigs['laya-richman'];
      }
      if (gameConfig != null) {
        await _checkGameRes(gameConfig);
      } else {
        Fluttertoast.showCenter(msg: 'Unknown game: $gameType');
      }
    }
  }

  Future<void> _checkGameRes(GameConfig gameConfig) async {
    void load() {
      gameProtocol!.gameState = GameState.loading;
      trackGameState('loading');

      gameProtocol!.trackTimer?.cancel();
      gameProtocol!.trackTimer = Timer(const Duration(seconds: 10), () {
        if (!gameProtocol!.gameBooted) {
          trackGameState('timeout');
          // switchAndroidWebViewPlatform();
        }
      });
    }

    gameProtocol!.gameResManager = GameResourceManager(gameConfig);
    await gameProtocol!.gameResManager!.init();
    await gameProtocol!.gameResManager!.prepare(
      onResReady: () {
        load();
      },
      onResDownload: (int count, int total) {
        if (gameProtocol!.gameState != GameState.downloading) {
          // 开始下载时，上报埋点
          gameProtocol!.gameState = GameState.downloading;
          trackGameState('downloading');
        }
        gameProtocol!.stateStreamController.add(ProgressInfo(
            state: gameProtocol!.gameState,
            progress: (count.toDouble() / total)));
      },
      onResError: (e) {
        gameProtocol!.gameState = GameState.failed;
        if (e is DownloadException) {
          trackGameState('download_failed');
          Fluttertoast.showCenter(msg: 'Download failed');
        } else if (e is UnzipException) {
          trackGameState('unzip_failed');
          Fluttertoast.showCenter(msg: 'Unzip failed');
        }
        Navigator.maybePop(context);
      },
    );
  }

  String? get gameUrl {
    if ((gameProtocol!.gameState != GameState.loading &&
            gameProtocol!.gameState != GameState.successful) ||
        gameProtocol!.gameResManager?.gameUrl == null) {
      return null;
    }
    String? url =
        '${gameProtocol!.gameResManager!.gameUrl!}?platform=${describeEnum(defaultTargetPlatform).toLowerCase()}&systemVersion=${DeviceInfo.systemVersion}&ts=${DateTime.now().millisecondsSinceEpoch}';
    if (!isGameOnlineDev) {
      // 加载本地资源包
      url = 'file://$url';
    }
    return url;
  }

  Widget get webView {
    String? url = gameUrl;
    if (url?.isEmpty ?? true) return const SizedBox.shrink();

    return WebView(
      initialUrl: url,
      onWebViewCreated: (controller) {
        gameProtocol!.webViewController = controller;
      },
      backgroundColor: Colors.transparent,
      javascriptChannels: {
        JavascriptChannel(
          name: 'FlutterWebBridge',
          onMessageReceived: (JavascriptMessage message) {
            Log.d(message);
            gameProtocol!.onGameMessage(message.message);
          },
        ),
      },
      navigationDelegate: (NavigationRequest navigation) {
        Log.i(navigation);
        return NavigationDecision.navigate;
      },
      debuggingEnabled: Constant.isDevMode,
      gestureNavigationEnabled: false,
      onPageStarted: (String url) {
        if (defaultTargetPlatform == TargetPlatform.android) {
          //安卓加载的时候没有更新进度，所以一开始就置1
          gameProtocol!.stateStreamController
              .add(ProgressInfo(state: gameProtocol!.gameState, progress: 1.0));
        }
        Log.d('onPageStarted: $url');
      },
      onProgress: (progress) {
        Log.d('onPageProgress: $progress');
        gameProtocol!.stateStreamController.add(ProgressInfo(
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

  @override
  void showGamePanel(RoomPluginType type) async {
    if (room == null) {
      return;
    }
    if (type == RoomPluginType.LayaRichMan) {
      if (!room!.inUse(RoomPluginType.LayaRichMan) &&
          room!.purview != Purview.Createor &&
          room!.purview != Purview.SuperAdmin) {
        // Fluttertoast.showToast(msg: K.room_contact_creator_to_use);
        return;
      }
      await _getGameInfo(RoomPluginType.LayaRichMan);
    }
    super.showGamePanel(RoomPluginType.LayaRichMan);
  }

  void showRichManPanel() => showGamePanel(RoomPluginType.LayaRichMan);

  /// 最小化游戏
  void minimizeGame(GamePayload payload) => closeGamePanel();

  /// 开启游戏
  void startGame(GamePayload payload) async {
    String type = '';
    if (curGameType == RoomPluginType.LayaRichMan) {
      type = 'laya-richman';
    }
    ResPluginOperate res =
        await RoomGameApi.pluginOp(rid: room!.rid, type: type, op: 1);
    gameProtocol!.sendMessageToGame(
        payload.response({'success': res.success, 'msg': res.msg}));
  }

  /// 关闭游戏
  void closeGame(GamePayload payload) async {
    String type = '';
    if (curGameType == RoomPluginType.LayaRichMan) {
      type = 'laya-richman';
    }
    ResPluginOperate res =
        await RoomGameApi.pluginOp(rid: room!.rid, type: type, op: 0);
    gameProtocol!.sendMessageToGame(
        payload.response({'success': res.success, 'msg': res.msg}));
  }
}

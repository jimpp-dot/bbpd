import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/shared.dart' hide Config;
import 'package:flutter/material.dart';

import 'audience_board.dart';
import 'broadcaster_board.dart';
import 'config.dart';
import 'control_bar.dart';
import 'trace.dart';

enum Role {
  drawer, // 绘制者
  guesser, // 猜词者
  audience, // 观众
}

enum GameGuessState {
  wait, // 等待状态, 此阶段可展示banner
  ready, // 准备阶段, 点击开始游戏后进入此状态
  choose, // 选词阶段
  drawing, // 游戏中, 此阶段绘制者可以绘画
  result, // 本轮结束, 可以展示答案及绘制内容
  end, // 游戏结束, 此阶段可以展得分排行榜
}

/// 你画我猜
class DrawSomething extends StatefulWidget {
  final OnDrawEvent? onDraw; // 只有 broadcaster 角色才会触发该回调
  final Widget? cover; // 覆盖在画板上面的Widget，比如选词页
  final String? prompt; // 显示在控制条上的提示词

  const DrawSomething({
    super.key,
    this.onDraw,
    this.cover,
    this.prompt,
  });

  @override
  DrawSomethingState createState() => DrawSomethingState();
}

class DrawSomethingState extends State<DrawSomething>
    with TickerProviderStateMixin {
  final GlobalKey<BroadcasterBoardState> _key = GlobalKey();
  Role _role = Role.audience;
  GameGuessState _gameState = GameGuessState.wait;
  Trace? _trace;
  Config _config = initialConfig;

  Role get role => _role;

  set role(Role role) {
    if (_role != role) {
      _role = role;
      _trace = null;
      refresh;
    }
  }

  set trace(Trace? trace) {
    _trace = trace;
    refresh();
  }

  GameGuessState get gameState => _gameState;

  set gameState(GameGuessState gameState) {
    if (_gameState != gameState) {
      _gameState = gameState;
      _config = initialConfig;
      _trace = null;
      _key.currentState?.reset();
      refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = 350;
    double height = 299;
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsetsDirectional.only(start: 12, end: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: widget.cover ?? _boardWidget(),
    ).toCenter();
  }

  Widget _boardWidget() {
    bool selfDrawing =
        _role == Role.drawer && _gameState == GameGuessState.drawing;
    bool showPrompt =
        _gameState == GameGuessState.drawing && widget.prompt != null;

    return ShareConfig(
      config: _config,
      child: NotificationListener<EventNotification>(
        onNotification: (notification) {
          if (notification is UpdateConfigNotification) {
            _config = notification.config;
            refresh();
          } else if (notification is UndoNotification) {
            _key.currentState?.undo();
          }
          return true;
        },
        child: Column(
          children: <Widget>[
            Expanded(
              child: _role == Role.drawer
                  ? IgnorePointer(
                      ignoring: !selfDrawing,
                      child: BroadcasterBoard(key: _key, onDraw: widget.onDraw),
                    )
                  : AudienceBoard(_trace),
            ),
            ControlBar(
              drawing: selfDrawing,
              prompt: showPrompt ? widget.prompt : null,
            ),
          ],
        ),
      ),
    );
  }
}

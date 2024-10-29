import 'dart:async';

import 'package:shared/shared.dart' hide MessageContent, MessageType;
import 'package:chat_room/assets.dart';
import 'package:draw_guess/src/room/queue/widget/guess_queue_start_widget.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data.dart';
import 'draw_something.dart';
import 'rank_dialog.dart';
import 'result_dialog.dart';
import 'word_choice.dart';
import 'package:chat_room/chat_room.dart';

/// 你画我猜
/// 对外的控件入口
class GameGuess extends StatefulWidget {
  static const String DISPATCH_GAME_GUESS_EVENT = 'room.game.guess';
  static const String EVENT_GAME_GUESS_START = 'room.game.guess.start';
  static const String EVENT_GAME_GUESS_END = 'room.game.guess.end';

  // 画猜房内的Message消息类型
  static const String MSG_TYPE_IMAGE = 'image'; // 绘制轨迹消息
  static const String MSG_TYPE_THUMBS_UP = 'thumbsUp'; // 点赞消息

  static const String KEY_GUIDE_DRAW = 'guess_draw_guide'; // 画图引导标记
  static const String KEY_GUIDE_PANEL = 'guess_panel_guide'; // 调节画笔引导标记
  static const String KEY_GUIDE_GUESS = 'guess_answer_guide'; // 调节画笔引导标记

  final ChatRoomData room;

  const GameGuess(this.room, {super.key});

  @override
  _GameGuessState createState() {
    return _GameGuessState();
  }
}

class _GameGuessState extends State<GameGuess> with TickerProviderStateMixin {
  final GlobalKey<DrawSomethingState> _drawKey = GlobalKey();
  final TraceCodec _traceCodec = const TraceCodec();

  RoomPosition? _drawerPosition;

  // 所有供选择的词
  List<Word>? _words;

  // 当前选择的描述词
  String? _answer;

  AnimationController? _controller;
  Timer? _dismissGuideTimer;

  // 展示新手引导
  bool _showDrawerGuide = false;

  int _changeWordPrice = 0;

  @override
  void initState() {
    super.initState();
    widget.room
        .addListener(GameGuess.DISPATCH_GAME_GUESS_EVENT, _dispatchGameEvent);
    widget.room.addListener(GameGuess.EVENT_GAME_GUESS_START, _onStartGame);
    widget.room.addListener(GameGuess.EVENT_GAME_GUESS_END, _onEndGame);
    widget.room.addListener(RoomConstant.Event_Game_End, _endByOwner);
    widget.room.addListener(RoomConstant.Event_Message, _onRcvImage);

    GuessConfigData? guessConfigData =
        widget.room.config?.configExpendData as GuessConfigData?;
    GuessPositionData? guessPositionData = widget
        .room.positionForCurrentUser?.positionExpendData as GuessPositionData?;

    _changeWordPrice = guessConfigData?.changeWordPrice ?? 0;

    // 恢复状态
    if (guessConfigData != null && guessConfigData.current >= 0) {
      _drawerPosition = widget.room.positions[guessConfigData.current];
    }
    Future.delayed(const Duration(milliseconds: 300), () {
      _drawKey.currentState?.gameState =
          guessConfigData?.state ?? GameGuessState.wait;
      Role? role = guessPositionData?.role;
      if (role != null) {
        _drawKey.currentState?.role = role;
      }
      _drawKey.currentState?.trace = guessConfigData?.image == null
          ? null
          : _traceCodec.decode(guessConfigData!.image);
      if (_drawKey.currentState?.role == Role.drawer &&
          (_drawKey.currentState?.gameState == GameGuessState.choose ||
              _drawKey.currentState?.gameState == GameGuessState.drawing)) {
        widget.room.setMute(true);
        _getWords();
      }

      refresh();
    });
  }

  @override
  void dispose() {
    widget.room.removeListener(
      GameGuess.DISPATCH_GAME_GUESS_EVENT,
      _dispatchGameEvent,
    );
    widget.room.removeListener(
      GameGuess.EVENT_GAME_GUESS_START,
      _onStartGame,
    );
    widget.room.removeListener(
      GameGuess.EVENT_GAME_GUESS_END,
      _onEndGame,
    );
    widget.room.removeListener(
      RoomConstant.Event_Game_End,
      _endByOwner,
    );
    widget.room.removeListener(
      RoomConstant.Event_Message,
      _onRcvImage,
    );
    _controller?.dispose();
    _dismissGuideTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 290,
          margin: const EdgeInsets.only(top: 8, left: 12, right: 12),
          alignment: Alignment.center,
          child: Stack(
            children: <Widget>[
              DrawSomething(
                key: _drawKey,
                onDraw: _onDraw,
                cover: _coverWidget(),
                prompt: _prompt(),
              ),
              if (_showDrawerGuide) _buildDrawerGuide(),
            ],
          ),
        ),
        if (_showStartWidget())
          GuessQueueStartWidget(
            room: widget.room,
          ),
      ],
    );
  }

  bool _showStartWidget() {
    return (_drawKey.currentState == null ||
        _drawKey.currentState?.gameState == GameGuessState.wait ||
        _drawKey.currentState?.gameState == GameGuessState.end);
  }

  Widget? _coverWidget() {
    if (_showStartWidget()) {
      // 游戏未开始时，显示封面
      return Container();
    } else if (_drawKey.currentState?.gameState == GameGuessState.choose) {
      // 选词
      return Container(
        alignment: Alignment.center,
        child: _drawKey.currentState?.role == Role.drawer
            ? SelectingWord(
                _words, _onSelectWord, _changeWordPrice, _onRefreshWord)
            : WaitingWord(_drawerPosition),
      );
    }
    return null;
  }

  _dismissGuide() {
    setState(() {
      _controller?.stop();
      _showDrawerGuide = false;
      SharedPreferences.getInstance().then((sp) {
        sp.setBool(GameGuess.KEY_GUIDE_DRAW, false);
      });
    });
  }

  /// 当前玩家第一次画图，显示新手引导
  Widget _buildDrawerGuide() {
    // 自动取消引导动画
    _dismissGuideTimer ??= Timer(const Duration(seconds: 5), () {
      if (mounted) {
        _dismissGuide();
      }
    });

    _controller ??= AnimationController(
        duration: const Duration(milliseconds: 1800), vsync: this);
    _controller!.repeat();
    Animation<Offset> offset =
        Tween<Offset>(begin: const Offset(-0.5, 0), end: const Offset(0.5, 0))
            .animate(
      CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0, 15 / 18, curve: Curves.linear),
      ),
    );
    Animation<double> opacity = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: const Interval(15 / 18, 1, curve: Curves.linear),
      ),
    );

    return GestureDetector(
      onTap: _dismissGuide,
      behavior: HitTestBehavior.opaque,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SlideTransition(
              position: offset,
              child: FadeTransition(
                opacity: opacity,
                child: R.img(
                  RoomAssets.chat_room$guess_guide_draw_png,
                  width: 80,
                  height: 80,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              K.room_guess_guide_draw,
              style: TextStyle(
                color: R.color.thirdTextColor,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 画图回调
  _onDraw(Trace trace) async {
    widget.room.sendGuessImage(_traceCodec.encode(trace));
  }

  /// 收到绘制轨迹的事件
  _onRcvImage(String type, dynamic data) async {
    if (data is MessageContent && data.extra != null) {
      MessageType type = data.type;
      String? subType = data.extra?['subType'];
      if (type == MessageType.Guess &&
          subType == GameGuess.MSG_TYPE_IMAGE &&
          _drawKey.currentState?.role != Role.drawer) {
        String? imageStr = Util.parseStr(data.extra?['image']);
        if (!Util.isStringEmpty(imageStr)) {
          try {
            Trace? trace = _traceCodec.decode(imageStr ?? '');
            _drawKey.currentState?.trace = trace;
          } catch (e) {
            Log.d('_onRcvImage catch');
            Log.d(e.toString());
          }
        }
      }
    } else {
      Log.d('_onRcvImage: else');
    }
  }

  /// 选择了描述词
  _onSelectWord(Word word) async {
    _answer = word.word;

    GuessPositionData? guessPositionData =
        _drawerPosition?.positionExpendData as GuessPositionData?;

    String url = '${System.domain}roomguess/choose';
    XhrResponse response = await Xhr.postJson(url, {
      'rid': widget.room.rid.toString(),
      'aid': guessPositionData?.aid.toString() ?? '',
      'wid': word.id.toString(),
    });
    if (response.error == null) {
      Map data = response.value();
      if (data['success']) {
      } else {
        Fluttertoast.showToast(
            msg: data['msg'] ?? R.string('room_submit_desc_word_failed'));
      }
    } else {
      Log.d(response.error.toString());
      Fluttertoast.showToast(
          msg: response.error.toString(), gravity: ToastGravity.CENTER);
    }
  }

  /// 刷新候选词
  _onRefreshWord() async {
    _getWords();
  }

  /// 描述、提示词
  String _prompt() {
    GuessConfigData? guessConfigData =
        widget.room.config?.configExpendData as GuessConfigData?;

    if (widget.room.config != null &&
        guessConfigData?.state == GameGuessState.drawing) {
      RoomPosition? position = widget.room.positionForCurrentUser;
      String? prompt = guessConfigData?.prompt;
      GuessPositionData? guessPositionData =
          position?.positionExpendData as GuessPositionData?;
      if (guessPositionData?.role == Role.drawer && _answer != null) {
        return '${R.string('room_desc_word')}：$_answer';
      } else if (prompt != null && prompt.isNotEmpty) {
        return '${R.string('room_prompt_word')}：$prompt';
      }
    }
    return '';
  }

  /// 点击开始游戏
  _onStartGame(String type, dynamic data) async {
    GuessConfigData? guessConfigData =
        widget.room.config?.configExpendData as GuessConfigData?;
    if (guessConfigData?.state != GameGuessState.wait &&
        guessConfigData?.state != GameGuessState.end) {
      Fluttertoast.showToast(msg: R.string('room_game_playing'));
      return;
    }
    String url = '${System.domain}roomguess/start';
    XhrResponse response =
        await Xhr.postJson(url, {'rid': widget.room.rid.toString()});
    if (response.error == null) {
      Map data = response.value();
      if (!data['success']) {
        Fluttertoast.showToast(
            msg: data['msg'] ?? R.string('room_game_start_failed'));
      }
    } else {
      Log.d(response.error.toString());
      Fluttertoast.showToast(msg: response.error.toString());
    }
  }

  /// 点击结束游戏
  _onEndGame(String type, dynamic data) async {
    GuessConfigData? guessConfigData =
        widget.room.config?.configExpendData as GuessConfigData?;
    if (guessConfigData?.state == GameGuessState.wait ||
        guessConfigData?.state == GameGuessState.end) {
      Fluttertoast.showToast(msg: R.string('room_game_not_yet_start'));
      return;
    }
    Map<String, dynamic>? map;
    if (data is Map<String, dynamic>) {
      map = data;
    }

    if (map == null || !map.containsKey('aid')) {
      Fluttertoast.showToast(msg: R.string('room_args_not_full'));
      return;
    }
    int aid = Util.parseInt(map['aid']);
    String url = '${System.domain}roomguess/end';
    XhrResponse response = await Xhr.postJson(url, {
      'rid': widget.room.rid.toString(),
      'aid': aid.toString(),
    });
    if (response.error == null) {
      Map data = response.value();
      if (!data['success']) {
        Fluttertoast.showToast(
            msg: data['msg'] ?? R.string('room_end_game_failed'));
      }
    } else {
      Log.d(response.error.toString());
      Fluttertoast.showToast(
          msg: response.error.toString(), gravity: ToastGravity.CENTER);
    }
  }

  /// 1号麦主动结束游戏
  _endByOwner(String type, dynamic data) async {
    Fluttertoast.showToast(
        msg: R.string('room_end_game_by_1_mic'), gravity: ToastGravity.CENTER);
    widget.room.sendLocalMessage(R.string('room_end_game_by_1_mic'));
    _drawKey.currentState?.gameState = GameGuessState.wait;
  }

  /// 获取候选词/描述词
  _getWords() async {
    GuessPositionData? guessPositionData =
        _drawerPosition?.positionExpendData as GuessPositionData?;
    String url = '${System.domain}roomguess/gettext';
    XhrResponse response = await Xhr.postJson(url, {
      'rid': widget.room.rid.toString(),
      'aid': guessPositionData?.aid.toString() ?? '',
    });
    if (response.error == null) {
      Map data = response.value();
      if (data['success']) {
        Log.d(data['data'].toString());
        if (data['data'] is List) {
          List<Word> words =
              List<Word>.from(data['data'].map((i) => Word.fromJson(i)));
          _words = words;
        } else if (data['data'] is Map) {
          // 选完词之后再拉取就是已选的描述词
          _answer = data['data']['word'];
        }
      } else {
        Fluttertoast.showToast(
            msg: data['msg'] ?? R.string('room_get_questions_failed'));
      }
      if (mounted) {
        setState(() {});
      }
    } else {
      Log.d(response.error.toString());
      Fluttertoast.showToast(msg: response.error.toString());
    }
  }

  /// 点赞
  _onThumbsUp() async {
    Log.d(R.string('room_liked'));
    String url = '${System.domain}roomguess/thumbsUp';
    XhrResponse response = await Xhr.postJson(url, {
      'rid': widget.room.rid.toString(),
    });
    if (response.error == null) {
      Map data = response.value();
      if (data['success']) {
      } else {
        Fluttertoast.showToast(
            msg: data['msg'] ?? R.string('room_like_failed'),
            gravity: ToastGravity.CENTER);
      }
    } else {
      Log.d(response.error.toString());
      Fluttertoast.showToast(
          msg: response.error.toString(), gravity: ToastGravity.CENTER);
    }
  }

  /// 调节画笔气泡提示
  _showPanelTips() async {
    if ((await SharedPreferences.getInstance())
            .get(GameGuess.KEY_GUIDE_PANEL) !=
        null) {
      return;
    }

    RenderBox? box = _drawKey.currentContext?.findRenderObject() as RenderBox?;
    if (box == null) return;
    Offset off = box.localToGlobal(Offset.zero);

    double width = 234;
    double height = 44;
    double arrStartPosition = 50;
    double bottom = Util.height - off.dy - box.size.height - 25;
    double left = 16;
    double right = Util.width - width - left;

    BubbleTips.showTips(
      context,
      K.room_guess_guide_panel,
      width,
      height,
      BubbleDirection.top,
      arrStartPosition,
      bottom,
      left,
      right,
      duration: const Duration(seconds: 5),
    );

    SharedPreferences.getInstance().then((sp) {
      sp.setBool(GameGuess.KEY_GUIDE_PANEL, false);
    });
  }

  /// 输入答案气泡提示
  _showAnswerTips() async {
    if ((await SharedPreferences.getInstance())
            .get(GameGuess.KEY_GUIDE_GUESS) !=
        null) {
      return;
    }

    double width = 129;
    double height = 44;
    double arrStartPosition = -1;
    double bottom = 80 + Util.iphoneXBottom;
    double right = (Util.width - width) / 2;
    double left = Util.width - width - right;

    BubbleTips.showTips(
      context,
      K.room_guess_guide_answer,
      width,
      height,
      BubbleDirection.bottom,
      arrStartPosition,
      bottom,
      left,
      right,
      duration: const Duration(seconds: 5),
    );

    SharedPreferences.getInstance().then((sp) {
      sp.setBool(GameGuess.KEY_GUIDE_GUESS, false);
    });
  }

  /// 接收ws消息
  void _dispatchGameEvent(String type, dynamic data) async {
    Log.d(data.toString());
    if (data is! Map) {
      Log.d('_dispatchGameEvent: 数据格式错误');
      return;
    }
    RoomPosition? ownPosition = widget.room.positionForCurrentUser;
    _drawKey.currentState?.role =
        (ownPosition?.positionExpendData as GuessPositionData?)?.role ??
            Role.audience;
    Map map = data;
    String op = map['op'];
    switch (op) {
      case 'game.guess.wait': // 初始状态
        _drawKey.currentState?.gameState = GameGuessState.wait;
        break;
      case 'game.guess.ready': // 准备状态，server确定麦上玩家
        _drawKey.currentState?.gameState = GameGuessState.ready;
        Fluttertoast.showToast(
            msg: R.string('room_game_was_starting'),
            gravity: ToastGravity.CENTER);
        break;
      case 'game.guess.choose': // 选词状态，可以去拉候选词
        _drawKey.currentState?.gameState = GameGuessState.choose;
        int drawerIndex = Util.parseInt(map['data']['position']);

        Log.d('change_word_price = ${map['data']['change_word_price']}');
        _changeWordPrice = Util.parseInt(map['data']['change_word_price']);
        _drawerPosition = widget.room.positions[drawerIndex];
        if (_drawerPosition?.uid == Session.uid) {
          widget.room.setMute(true); // 禁麦
          _getWords(); // 当前用户是绘画者，去拉候选词
        }
        break;
      case 'game.guess.draw': // 绘画状态
        _drawKey.currentState?.gameState = GameGuessState.drawing;
        int drawerIndex = Util.parseInt(map['data']['position']);
        _drawerPosition = widget.room.positions[drawerIndex];
        if (_drawerPosition?.uid == Session.uid) {
          // 我是绘画人
          widget.room.setMute(true); // 禁麦

          // 显示绘画提示气泡
          if ((await SharedPreferences.getInstance())
                  .get(GameGuess.KEY_GUIDE_DRAW) ==
              null) {
            setState(() {
              _showDrawerGuide = true;
            });
          }

          // 10秒后显示画笔气泡
          Future.delayed(const Duration(seconds: 10), () {
            if (mounted) {
              _showPanelTips();
            }
          });
        } else {
          // 显示猜词气泡
          _showAnswerTips();
        }
        break;
      case 'game.guess.result': // 本轮结束
        _drawKey.currentState?.gameState = GameGuessState.result;
        int drawerIndex = Util.parseInt(map['data']['position']);
        _drawerPosition = widget.room.positions[drawerIndex];
        String imageStr = map['data']['image'];
        Trace? trace = _traceCodec.decode(imageStr);
        if (trace == null) return;
        String word = map['data']['word'];
        // 结果弹框
        showDialog(
            context: context,
            builder: (context) {
              return ResultDialog(
                room: widget.room,
                answer: word,
                author: _drawerPosition!.name,
                avatar: _drawerPosition!.icon,
                trace: trace,
                canThumbsUp: _drawKey.currentState?.role != Role.drawer,
                onThumbsUp: _onThumbsUp,
              );
            });
        break;
      case 'game.guess.end': // 全局游戏结束
        _drawKey.currentState?.gameState = GameGuessState.end;
        // 排行榜弹框
        if (map['data'] is List) {
          List<RankInfo> ranks =
              List<RankInfo>.from(map['data'].map((i) => RankInfo.fromJson(i)));
          showDialog(
              context: context,
              builder: (context) {
                return RankDialog(ranks: ranks);
              });
        }
        break;
    }
  }
}

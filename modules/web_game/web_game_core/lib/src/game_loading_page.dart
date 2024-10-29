import 'dart:async';

import '../assets.dart';
import 'package:shared/shared.dart';
import '../k.dart';
import 'package:flutter/material.dart';

import 'util.dart';

enum LoadingPageStyle { Normal, Ar }

class GameLoadingPage extends StatefulWidget {
  const GameLoadingPage({
    Key? key,
    required this.stateStreamController,
    required this.pageStyle,
    this.onClose,
  }) : super(key: key);

  final StreamController<ProgressInfo> stateStreamController;
  final LoadingPageStyle pageStyle;
  final VoidCallback? onClose;

  @override
  State<StatefulWidget> createState() {
    return _GameLoadingPageState();
  }
}

class _GameLoadingPageState extends State<GameLoadingPage> {
  StreamSubscription<ProgressInfo>? _gameSs;
  GameState _gameState = GameState.initial;
  double progress = 0.0;

  @override
  void initState() {
    super.initState();

    _gameSs = widget.stateStreamController.stream.listen((event) {
      if (!mounted) return;
      _gameState = event.state;

      if (event.progress != null) {
        setState(() {
          progress = event.progress!;
        });
      } else if (event.state == GameState.successful) {
        setState(() {
          progress = 1.0;
        });
      }
    });
  }

  @override
  void dispose() {
    _gameSs?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        R.img(
          widget.pageStyle == LoadingPageStyle.Normal
              ? Assets.web_game_core$loading_bg_portrait_style_normal_webp
              : Assets.web_game_core$loading_bg_portrait_style_ar_webp,
          fit: BoxFit.cover,
          width: Util.width,
          height: Util.height,
        ),
        PositionedDirectional(
          top: 50,
          end: 12,
          child: _buildClose(),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.pageStyle == LoadingPageStyle.Normal) ...[
              R.img(
                Assets.web_game_core$rabbit_lady_webp,
                width: 66,
                height: 73,
              ),
              const SizedBox(height: 6),
            ],
            Text(
              _gameState == GameState.downloading
                  ? K.room_downloading_tips
                  : K.room_loading_tips,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 9),
            _buildLoadingBar(),
            const SizedBox(height: 13),
            SizedBox(
              height: 20,
              child: _gameState == GameState.downloading ||
                      _gameState == GameState.loading
                  ? Text(
                      "${(progress * 100).toInt()}%",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLoadingBar() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        R.img(
          widget.pageStyle == LoadingPageStyle.Normal
              ? Assets.web_game_core$loading_bar_bg_style_normal_webp
              : Assets.web_game_core$loading_bar_bg_style_ar_webp,
          fit: BoxFit.cover,
          width: 276,
          height: 24,
        ),
        Container(
          alignment: Alignment.center,
          width: 276,
          height: 24,
          padding: const EdgeInsetsDirectional.fromSTEB(5, 4.5, 5, 4.5),
          child: Container(
            height: 15,
            width: 266,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  widget.pageStyle == LoadingPageStyle.Normal ? 6 : 16),
            ),
            padding: () {
              if (widget.pageStyle == LoadingPageStyle.Normal) {
                return EdgeInsetsDirectional.only(end: (1.0 - progress) * 266);
              } else {
                return EdgeInsetsDirectional.only(
                    start: (1.0 - progress) * 266);
              }
            }(),
            child: R.img(
              Assets.web_game_core$loading_progress_style_normal_webp,
              height: 15,
              width: 266,
              fit: BoxFit.fill,
            ),
          ),
        ),
        if (widget.pageStyle == LoadingPageStyle.Ar)
          PositionedDirectional(
            end: -13,
            top: -7,
            child: R.img(
              Assets.web_game_core$loading_flower_top_left_webp,
              width: 41,
              height: 27,
            ),
          ),
        if (widget.pageStyle == LoadingPageStyle.Ar)
          PositionedDirectional(
            bottom: -6,
            start: -11,
            child: R.img(
              Assets.web_game_core$loading_flower_bottom_right_webp,
              width: 35,
              height: 22,
            ),
          ),
      ],
    );
  }

  Widget _buildClose() {
    if (widget.onClose == null) {
      return const SizedBox.shrink();
    } else {
      return GestureDetector(
        onTap: () async {
          widget.onClose?.call();
        },
        child: Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white12,
          ),
          alignment: AlignmentDirectional.center,
          child: R.img(
            Assets.web_game_core$ic_close_webp,
            width: 20,
            height: 20,
          ),
        ),
      );
    }
  }
}

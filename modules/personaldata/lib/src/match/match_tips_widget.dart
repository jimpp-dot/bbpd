import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../k.dart';

class MatchTips {
  static OverlayEntry? _overlayEntry;
  static GlobalKey<MatchSuccessTipsState>? _key;
  static show({
    OnDropMessageClick? onClick,
  }) {
    if (_overlayEntry != null) {
      dispose();
    }
    if (Util.appState != AppLifecycleState.resumed) return;
    var overlayState = Overlay.of(System.context);

    _key = GlobalKey<MatchSuccessTipsState>();
    _overlayEntry = OverlayEntry(builder: (context) {
      return MatchSuccessTips(
        key: _key!,
        hidedCallback: () {
          dispose();
        },
      );
    });
    overlayState.insert(_overlayEntry!);
  }

  static void dispose() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  static dismiss() async {
    if (_overlayEntry != null) {
      await _key?.currentState?._hide();
    }
    dispose();
  }
}

class MatchSuccessTips extends StatefulWidget {
  final VoidCallback? hidedCallback;

  const MatchSuccessTips({Key? key, this.hidedCallback}) : super(key: key);
  @override
  MatchSuccessTipsState createState() => MatchSuccessTipsState();
}

class MatchSuccessTipsState extends State<MatchSuccessTips> {
  late AnimationController _opShowAnimationController;
  late Animation<double> _opacityShowAnim;
  late AnimationController _opHideAnimationController;
  late Animation<double> _opacityHideAnim;
  late Animation<double> _moveAnim;
  bool _isShow = false;

  @override
  void initState() {
    super.initState();
    _opShowAnimationController = AnimationController(
      vsync: Overlay.of(System.context),
      duration: const Duration(milliseconds: 300),
    )..addListener(() {});
    _opacityShowAnim =
        Tween(begin: 0.0, end: 1.0).animate(_opShowAnimationController);
    _opHideAnimationController = AnimationController(
      vsync: Overlay.of(System.context),
      duration: const Duration(milliseconds: 300),
    )..addListener(() {});
    _opacityHideAnim =
        Tween(begin: 1.0, end: 0.0).animate(_opHideAnimationController);
    _moveAnim = Tween<double>(
      begin: 167 * Util.ratio + Util.width,
      end: 167 * Util.ratio + Util.width + 12,
    ).animate(_opShowAnimationController);

    _forward();
  }

  _forward() async {
    _isShow = true;
    _opShowAnimationController.forward();
    await Future.delayed(const Duration(milliseconds: 4000));
    _hide();
  }

  _hide() async {
    if (!_isShow) {
      return;
    }
    _opHideAnimationController.forward();
    await Future.delayed(const Duration(milliseconds: 300));
    if (widget.hidedCallback != null) {
      widget.hidedCallback!();
    }
  }

  @override
  void dispose() {
    _isShow = false;
    _opShowAnimationController.dispose();
    _opHideAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _opShowAnimationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: _opacityShowAnim,
          child: AnimatedBuilder(
            animation: _opHideAnimationController,
            builder: (context, child) {
              return FadeTransition(
                opacity: _opacityHideAnim,
                child: IgnorePointer(
                  ignoring: true,
                  child: Container(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 36,
                          margin: EdgeInsetsDirectional.only(
                            bottom: _moveAnim.value,
                            start: 16,
                            end: 16,
                          ),
                          padding: const EdgeInsetsDirectional.only(
                              start: 4, end: 8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(18)),
                          ),
                          child: Row(
                            children: [
                              R.img('match/match_tips.webp',
                                  width: 28,
                                  height: 28,
                                  package:
                                      ComponentManager.MANAGER_PERSONALDATA),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(K.personal_match_say_hi_send_success),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

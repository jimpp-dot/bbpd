import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//图片宽/图片高/图片地址/视图动画时间/视图停留时间
Map _allWolfTurnAniData = {
  'live.pk.win': [
    260.0,
    200.0,
    'livev3/room_live_pk_win.webp',
    300,
    2000,
    const Color(0xFF000000).withOpacity(0.1),
    208,
    404
  ], //胜利
  'live.pk.fail': [
    260.0,
    200.0,
    'livev3/room_live_pk_fail.webp',
    300,
    2000,
    const Color(0xFF000000).withOpacity(0.1),
    208,
    404
  ], //失败
  'live.pk.pin': [
    260.0,
    200.0,
    'livev3/room_live_pk_pin.webp',
    300,
    2000,
    const Color(0xFF000000).withOpacity(0.1),
    208,
    404
  ], //平局
};

///
class LivePkResultDialog extends StatefulWidget {
  final VoidCallback? disappear;
  final List data;
  final Widget? childWidget;

  const LivePkResultDialog({
    Key? key,
    this.disappear,
    required this.data,
    this.childWidget,
  }) : super(key: key);

  @override
  State<LivePkResultDialog> createState() => _LivePkResultDialogState();

  static Future show({
    required BuildContext context,
    int disappearTime = 1,
    VoidCallback? disappear,
    required String type,
    Widget? childWidget,
  }) {
    List data = _allWolfTurnAniData[type] ?? [];
    Color barrierColor = data[5] ?? const Color(0xFF000000).withOpacity(0.1);
    int milliseconds = data[3] ?? 300;
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return LivePkResultDialog(
            disappear: disappear, data: data, childWidget: childWidget);
      },
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: barrierColor,
      transitionDuration: Duration(milliseconds: milliseconds),
      transitionBuilder: _buildMaterialDialogTransitions,
      useRootNavigator: true,
    );
  }

  static Widget _buildMaterialDialogTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
      child: child,
    );
  }
}

class _LivePkResultDialogState extends State<LivePkResultDialog>
    with TickerProviderStateMixin<LivePkResultDialog> {
  List _data = [];

  late AnimationController _animationController;
  int durationMilliseconds = 300;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(EventConstant.EventWolfDialogClose, _close);
    _init();
  }

  @override
  void dispose() {
    eventCenter.removeListener(EventConstant.EventWolfDialogClose, _close);
    _animationController.dispose();
    super.dispose();
  }

  _init() async {
    _data = widget.data;
    durationMilliseconds = _data[3];
    _animationController = AnimationController(
        duration: Duration(milliseconds: durationMilliseconds), vsync: this);
    _animationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(Duration(milliseconds: _data[4]));
        if (mounted) {
          _animationController.reverse(from: 1);
        }
      } else if (status == AnimationStatus.dismissed) {
        _disMiss();
      }
    });
    _animationController.forward(from: 0.0);
  }

  _disMiss() {
    if (!mounted) {
      return;
    }
    if (ModalRoute.of(context)?.isCurrent ?? false) {
      Navigator.of(context).pop();
      if (widget.disappear != null) {
        widget.disappear!();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double realWidth = _data[0];
    double realHeight = _data[1];

    return FadeTransition(
      opacity: _animationController,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: InkWell(
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: _disMiss,
            child: _data.isNotEmpty
                ? SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: _data[6],
                          child: const SizedBox(),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: <Widget>[
                              R.img(
                                "${_data[2]}",
                                width: realWidth,
                                height: realHeight,
                                package: ComponentManager.MANAGER_BASE_ROOM,
                                fit: BoxFit.fill,
                              ),
                              if (widget.childWidget != null)
                                widget.childWidget!,
                            ],
                          ),
                        ),
                        Expanded(
                          flex: _data[7],
                          child: const SizedBox(),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }

  _close(String type, dynamic data) async {
    if (ModalRoute.of(context)?.isCurrent ?? false) {
      Navigator.of(context).pop();
      if (widget.disappear != null) {
        widget.disappear!();
      }
    }
  }
}

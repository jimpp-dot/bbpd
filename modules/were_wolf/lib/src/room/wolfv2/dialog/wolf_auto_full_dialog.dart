import 'dart:async';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//图片宽/图片高/图片地址/视图动画时间/视图停留时间
Map _allWolfTurnAniData = {
  'state.game.start': [
    375.0,
    96.0,
    'wolfv2/full_turn/wolf_game_turn_game_start_bg.webp',
    300,
    1000,
    const Color(0xFF000000).withOpacity(0.1),
    245,
    355
  ], //游戏开始
  'state.night': [
    375.0,
    270.0,
    'wolfv2/full_turn/wolf_game_turn_night_bg.webp',
    300,
    1000,
    const Color(0xFF000000).withOpacity(0.8),
    150,
    247
  ], //进入黑夜
  'state.day.time': [
    375.0,
    270.0,
    'wolfv2/full_turn/wolf_game_turn_date_time_bg.webp',
    300,
    1000,
    const Color(0xFF000000).withOpacity(0.8),
    160,
    237
  ], //进入白天
  'state.day.time.pk': [
    375.0,
    168.0,
    'wolfv2/full_turn/wolf_game_turn_date_time_pk_bg.webp',
    300,
    1000,
    const Color(0xFF000000).withOpacity(0.8),
    200,
    299
  ], //开始pk发言
  'state.day.time.wolf.explode': [
    375.0,
    270.0,
    'wolfv2/full_turn/wolf_game_turn_wolf_explode_bg.webp',
    300,
    1000,
    const Color(0xFF000000).withOpacity(0.8),
    150,
    247
  ], //狼人自爆
  'state.day.time.no.dead': [
    375.0,
    270.0,
    'wolfv2/full_turn/wolf_game_turn_night_no_dead.webp',
    300,
    1000,
    const Color(0xFF000000).withOpacity(0.8),
    160,
    237
  ], //平安夜
  'state.day.time.dead': [
    375.0,
    330.0,
    'wolfv2/full_turn/wolf_game_turn_night_dead.webp',
    300,
    2500,
    const Color(0xFF000000).withOpacity(0.8),
    96,
    241
  ], //夜晚出局
  'state.night.seer.good': [
    375.0,
    132.0,
    'wolfv2/full_turn/wolf_game_turn_wolf_seer_good.webp',
    300,
    1000,
    const Color(0xFF000000).withOpacity(0.1),
    184,
    351
  ], //预言家查验,金水(好人)
  'state.night.seer.wolf': [
    375.0,
    132.0,
    'wolfv2/full_turn/wolf_game_turn_wolf_seer_wolf.webp',
    300,
    1000,
    const Color(0xFF000000).withOpacity(0.1),
    184,
    351
  ], //预言家查验,狼人
  'state.join.police.pk': [
    375.0,
    351.0,
    'wolfv2/full_turn/wolf_state_join_police_pk.webp',
    300,
    1000,
    const Color(0xFF000000).withOpacity(0.8),
    75,
    241
  ], //竞选警长pk
  'state.join.police.result': [
    375.0,
    351.0,
    'wolfv2/full_turn/wolf_game_turn_join_plice.webp',
    300,
    2500,
    const Color(0xFF000000).withOpacity(0.8),
    75,
    241
  ], //竞选当选警长
  'state.change.police.result': [
    375.0,
    351.0,
    'wolfv2/full_turn/wolf_game_turn_change_plice.webp',
    300,
    2500,
    const Color(0xFF000000).withOpacity(0.8),
    75,
    241
  ], //移交当选警长
  'state.change.no.police.result': [
    375.0,
    248.0,
    'wolfv2/full_turn/wolf_game_turn_no_change_plice.webp',
    300,
    1000,
    const Color(0xFF000000).withOpacity(0.8),
    178,
    228
  ], //未移交警长,撕裂警徽
  'state.day.time.vote.dead': [
    375.0,
    261.0,
    'wolfv2/full_turn/wolf_game_turn_date_time_dead.webp',
    300,
    2500,
    const Color(0xFF000000).withOpacity(0.8),
    165,
    241
  ], //白天出局
  'state.await.other': [
    375.0,
    51.0,
    'wolfv2/full_turn/wolf_game_turn_await_other_action.webp',
    300,
    1000,
    const Color(0xFF000000).withOpacity(0.1),
    265,
    351
  ], //等待其它玩家行动
};

///狼人杀全屏弹框 (天黑/天亮/投票/狼人赢/好人赢)
class WolfAutoFullDialog extends StatefulWidget {
  final VoidCallback? disappear;
  final List data;
  final Widget? childWidget;

  const WolfAutoFullDialog({
    super.key,
    this.disappear,
    required this.data,
    this.childWidget,
  });

  @override
  _WolfAutoFullDialogState createState() {
    return _WolfAutoFullDialogState();
  }

  static show(
      {BuildContext? context,
      int disappearTime = 1,
      VoidCallback? disappear,
      required String type,
      Widget? childWidget}) {
    if (context == null) {
      return;
    }

    List data = _allWolfTurnAniData[type];
    Color barrierColor = data[5];
    int milliseconds = data[3];
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return WolfAutoFullDialog(
          disappear: disappear,
          data: data,
          childWidget: childWidget,
        );
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
      Widget child) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }
}

class _WolfAutoFullDialogState extends State<WolfAutoFullDialog>
    with TickerProviderStateMixin<WolfAutoFullDialog> {
  late List _data;

  late AnimationController _animationController;
  late int durationMilliseconds;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(EventConstant.EventWolfDialogClose, _close);
    _init();
  }

  _init() async {
    _data = widget.data;
    durationMilliseconds = _data[3];
    _animationController = AnimationController(
      duration: Duration(milliseconds: durationMilliseconds),
      vsync: this,
    );
    _animationController.addListener(_onUpdate);
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

  _onUpdate() {}

  @override
  void dispose() {
    eventCenter.removeListener(EventConstant.EventWolfDialogClose, _close);
    _animationController.dispose();
    super.dispose();
  }

  _disMiss() {
    if (!mounted) {
      return;
    }
    if (ModalRoute.of(context)?.isCurrent == true) {
      Navigator.of(context).pop();
      if (widget.disappear != null) {
        widget.disappear!();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double realWidth = MediaQuery.of(context).size.width;
    double realHeight = realWidth * _data[1] / _data[0];

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
            onTap: () {
              _disMiss();
            },
            child: _data != null
                ? SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
//              color: Colors.black.withOpacity(0.8),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: _data[6],
                          child: Container(),
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
                                height: realHeight, //_data[0]/_data[1]
                                package: ComponentManager.MANAGER_WERE_WOLF,
                                fit: BoxFit.fill,
                              ),
                              if (widget.childWidget != null)
                                widget.childWidget!,
                            ],
                          ),
                        ),
                        Expanded(
                          flex: _data[7],
                          child: Container(),
                        ),
                      ],
                    ),
                  )
                : Container(),
          ),
        ),
      ),
    );
  }

  _close(String type, dynamic data) async {
    if (ModalRoute.of(context)?.isCurrent == true) {
      Navigator.of(context).pop();
      if (widget.disappear != null) {
        widget.disappear!();
      }
    }
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:were_wolf/k.dart';
import 'package:were_wolf/src/room/guide/room/wolfGuideData.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_main.dart';
import 'package:were_wolf/src/room/wolfv2/main/wolf_repository.dart';

/// 新手引导
class WolfGuideScreen extends StatefulWidget {
  static const String DISPATCH_GAME_JUBEN_NEWGUIDE_CHANGE =
      'room.game.juben.newguide.chanage'; //新手引导本变化
  static const String DISPATCH_GAME_JUBEN_NEWGUIDE_GETROLE_CHANGE =
      'room.game.juben.newguide.getrole.chanage'; //新手引导本抢身份阶段变化

  static bool aiNewGuide = false; //false为旧的新手引导 true为新的人机交互新手引导

  static int from = 0; //来源 0:从选择界面进入 1:从人机本back进入

  static int aiFrom = 0; //来源 0:从选择界面进入 1:从老司机进入

  static Future<bool?> openGuideScreen(BuildContext context, {Key? key}) async {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return WolfGuideScreen(
            key: key,
          );
        },
      ),
    );
  }

  static Future<bool> guideAiBack(BuildContext context) async {
    if (WolfGuideData.getInstance().isGameOver()) {
      Navigator.of(context).pop(true);
      return false;
    }

    bool? flag = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return ConfirmDialog(
            content: K.wolf_v2_guide_exit_game_1,
            negativeButton: NegativeButton(
              text: K.wolf_v2_guide_exit_game_2,
              onPressed: () {
                Navigator.of(context).pop(false);
                Navigator.of(context).pop(true);
              },
            ),
            positiveButton: PositiveButton(
              text: K.wolf_v2_guide_exit_game_3,
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          );
        });
    return flag == true;
  }

  const WolfGuideScreen({super.key});

  @override
  _WolfGuideScreenState createState() => _WolfGuideScreenState();
}

class _WolfGuideScreenState extends State<WolfGuideScreen> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _onRefresh();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future _onRefresh() async {
    Map? newGuideData = await WolfRepository.getMachineJuben();

    if (newGuideData != null) {
      WolfGuideData.getInstance().guidData = newGuideData; //人机新手引导赋值

      WolfGuideData.getInstance().initData();
    } else {
      WolfGuideData.getInstance().guidData = null;
    }

    if (mounted) {
      setState(() {
        _loading = false;
      });
    }
  }

  Widget _renderBody() {
    Widget? widget;
    if (_loading) {
      widget = const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (!_loading && WolfGuideData.getInstance().guidData == null) {
      widget = Center(
        child: EmptyWidget(
          onTap: () {
            setState(() {
              _loading = true;
            });
            _onRefresh();
          },
        ),
      );
    }

    if (widget != null) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              R.imagePath(
                'wolfv2/bg_wolf_night.webp',
                package: ComponentManager.MANAGER_WERE_WOLF,
              ),
            ),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.topCenter,
        child: widget,
      );
    }

    return const WolfGuideMain();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return WolfGuideScreen.guideAiBack(context);
      },
      child: Scaffold(
        body: _renderBody(),
      ),
    );
  }
}

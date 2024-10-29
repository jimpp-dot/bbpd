import 'dart:async';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:were_wolf/k.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_auto_full_dialog.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_message_list.dart';
import 'package:were_wolf/src/room/wolfv2/main/wolf_repository.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';
import 'package:were_wolf/src/room/wolfv2/wolfAudioPlayUtil.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_full_turn_user_widget.dart';
import 'package:were_wolf/src/room/guide/room/wolfGuideConfig.dart';
import 'package:were_wolf/src/room/guide/room/wolfGuideData.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_controller.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_end_dialog.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_get_role_dialog.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_get_role_result_dialog.dart';
import 'package:were_wolf/src/room/guide/room/wolf_model.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_room.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_top_header.dart';
import 'package:provider/provider.dart' hide Selector;

///
///
class WolfGuideMain extends StatefulWidget {
  static const String DISPATCH_GAME_WOLF_GUIDE_PAGE_REFRESH_EVENT =
      'room.game.wolf.guide.page.refresh.event'; //界面刷新事件
  static const String DISPATCH_GAME_WOLF_GUIDE_STEP_CHANGE_EVENT =
      'room.game.wolf.guide.step.change.event'; //阶段变化事件
  static const String DISPATCH_GAME_WOLF_GUIDE_MSG_EVENT =
      'room.game.wolf.guide.msg.event'; //新消息事件
  static const String DISPATCH_GAME_WOLF_GUIDE_MSG_BOARD_HIDE_EVENT =
      'room.game.wolf.guide.msg.board.hide.event';
  static const String DISPATCH_GAME_WOLF_GUIDE_SHOW_START_FULL_DIALOG_EVENT =
      'room.game.wolf.guide.show.start.full.dialog.event';

  final ChatRoomData? room;
  final IconTapCallback? onTap;
  final bool? displayEmote;
  final bool? displayMessageList;
  final VoidCallback? onSettingClick;

  const WolfGuideMain({
    super.key,
    this.room,
    this.onTap,
    this.displayEmote,
    this.displayMessageList,
    this.onSettingClick,
  });

  @override
  State createState() {
    return _WolfGuideMainState();
  }
}

class _WolfGuideMainState extends State<WolfGuideMain> {
  late WolfModel _wolfModel;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _wolfModel = WolfModel(WolfGuideData.getInstance());
    eventCenter.addListener(
        WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_PAGE_REFRESH_EVENT,
        _onPageRefresh);
    eventCenter.addListener(
        WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_STEP_CHANGE_EVENT,
        _onStepChangeEvent);
    eventCenter.addListener(
        WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_SHOW_START_FULL_DIALOG_EVENT,
        _showStartFullDialog);
    _loadReport();

    ///进入等待状态
    WolfGuideData.getInstance().initToWait();

    ///开启状态流转任务
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      Log.d('WolfMainState Timer tick, , left: ${_.tick}');
      _wolfModel.eventControl();
    });
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      eventCenter
          .emit(WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_STEP_CHANGE_EVENT);
    });

    //ai进入埋点
    Tracker.instance.track(TrackEvent.wolf_ai_entrance, properties: {});
  }

  @override
  void dispose() {
    eventCenter.removeListener(
        WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_PAGE_REFRESH_EVENT,
        _onPageRefresh);
    eventCenter.removeListener(
        WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_STEP_CHANGE_EVENT,
        _onStepChangeEvent);
    eventCenter.removeListener(
        WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_SHOW_START_FULL_DIALOG_EVENT,
        _showStartFullDialog);
    _wolfModel.dispose();
    _timer?.cancel();
    _timer = null;
    WolfAudioPlayUtil.instance().closeSound();
    super.dispose();
  }

  _loadReport() async {
    await WolfRepository.saveJoinMachine();
  }

  _onPageRefresh(String type, dynamic data) async {
    setState(() {});
  }

  _disMiss() {
    String curName = appNavigatorObserver.getLast();
    Log.d("_disMiss curName=$curName");
    if (curName != "/") {
      Navigator.of(context).pop();
    }
  }

  Future<void> _onStepChangeEvent(String type, dynamic data) async {
    if (!mounted) return;
    WolfGuideConfigState? wolfState = _wolfModel.data.currentState;
    Log.d("_onWolfEvent wolfState=${wolfState.toString()}");
    _playVoice(wolfState, _wolfModel); //播放声音
    if (wolfState == WolfGuideConfigState.GetRole) {
      GetRoleData getRoleData = GetRoleData(
        //实际抢的角色
        [
          _wolfModel.data.currentRole!,
        ],
        //全部的角色
        _wolfModel.data.allRoles!,
      );
      WolfGuideGetRoleDialog.show(context,
          data: getRoleData, wolfModel: _wolfModel);
    } else if (wolfState == WolfGuideConfigState.PublishRole) {
      WolfGuideGetRoleResultDialog.show(
        context,
        roleItem: _wolfModel.data.currentRole!,
        wolfModel: _wolfModel,
      );
    } else if (wolfState == WolfGuideConfigState.End) {
      WolfGuideEndDialog.show(
        context,
        _wolfModel,
        _disMiss,
      );
    } else if (wolfState == WolfGuideConfigState.GameStart ||
        wolfState == WolfGuideConfigState.Night ||
        wolfState == WolfGuideConfigState.NightAntidote ||
        wolfState == WolfGuideConfigState.Daytime ||
        wolfState == WolfGuideConfigState.DaytimePublishDead ||
        wolfState == WolfGuideConfigState.DaytimeVotePublishDead) {
      Widget? childWidget;
      String type = '';
      if (wolfState == WolfGuideConfigState.GameStart) {
        type = 'state.game.start';
      } else if (wolfState == WolfGuideConfigState.Night) {
        type = 'state.night';
      } else if (wolfState == WolfGuideConfigState.NightAntidote) {
        type = 'state.await.other';
      } else if (wolfState == WolfGuideConfigState.Daytime) {
        type = 'state.day.time';
      } else if (wolfState == WolfGuideConfigState.DaytimePublishDead) {
        //白天公布死亡结果
        List<RoomPosition>? deadPositions = _wolfModel.data.deadPositions;
        if (deadPositions == null || deadPositions.isEmpty) {
          type = 'state.day.time.no.dead';
        } else {
          type = 'state.day.time.dead';
          childWidget = Positioned(
            bottom: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 87.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    R.imagePath('wolfv2/full_turn/wolf_game_turn_user_bg.webp',
                        package: ComponentManager.MANAGER_WERE_WOLF),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: deadPositions
                    .map(
                      (_) => WolfFullTurnUserWidget(
                        roomPosition: _,
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        }
      } else if (wolfState == WolfGuideConfigState.DaytimeVotePublishDead) {
        //投票公布死亡结果
        List<RoomPosition>? deadPositions = _wolfModel.data.deadPositions;
        if (deadPositions != null || deadPositions!.isNotEmpty) {
          type = 'state.day.time.vote.dead';
          childWidget = Positioned(
            bottom: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 87.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    R.imagePath('wolfv2/full_turn/wolf_game_turn_user_bg.webp',
                        package: ComponentManager.MANAGER_WERE_WOLF),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: deadPositions
                    .map(
                      (_) => WolfFullTurnUserWidget(
                        roomPosition: _,
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        }
      }
      if (type.isNotEmpty) {
        WolfGuideAutoFullDialog.show(
          context: context,
          type: type,
          childWidget: childWidget,
        );
      }
    }
  }

  void _showStartFullDialog(String type, dynamic data) async {
    Widget childWidget;
    String type = '';
    WolfGuideConfigState? wolfState = _wolfModel.data.currentState;
    if (wolfState == WolfGuideConfigState.Wait) {
      type = 'state.game.wait';
      childWidget = PositionedDirectional(
        start: 138.0 * MediaQuery.of(context).size.width / 375.0,
        child: Container(
          width: MediaQuery.of(context).size.width,
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            K.wolf_v2_guide_wait_room_creator_start_game,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      );

      WolfGuideAutoFullDialog.show(
        context: context,
        type: type,
        childWidget: childWidget,
      );
    }
  }

  void _playVoice(WolfGuideConfigState? state, WolfModel wolfModel) {
    String? voiceUrl = '';

    if (state == WolfGuideConfigState.GetRole) {
      voiceUrl = _wolfModel.data.getVoicePath("wolf_get_role_tips");
    } else if (state == WolfGuideConfigState.Night) {
      voiceUrl = _wolfModel.data.getVoicePath("wolf_night_tips");
    } else if (state == WolfGuideConfigState.NightAntidote) {
      voiceUrl = _wolfModel.data.getVoicePath("wolf_night_bg");
    } else if (state == WolfGuideConfigState.Daytime) {
      voiceUrl = _wolfModel.data.getVoicePath("wolf_day_time_tips");
    } else if (state == WolfGuideConfigState.DaytimeVote) {
      voiceUrl = _wolfModel.data.getVoicePath("wolf_day_time_vote_tips");
    } else if (state == WolfGuideConfigState.DaytimeDesc) {
      if (wolfModel.data.isCurrentDesc()) {
        voiceUrl = _wolfModel.data.getVoicePath("wolf_current_desc_tips");
      }
    }

    if (voiceUrl == null || voiceUrl.isEmpty) {
      return;
    }

    WolfAudioPlayUtil.instance().playAudio(
      '',
      url: voiceUrl,
    );
  }

  Widget getBody() {
    List<Widget> res = [];
    // 狼人杀
    res.add(
      const WolfGuideTopHeader(),
    );
    res.add(
      const WolfGuideRoom(),
    );
    res.add(
      const WolfGuideMessageList(),
    );
    res.add(
      const WolfGuideController(),
    );
    return Column(
      children: res,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WolfModel>.value(
        value: _wolfModel,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                R.imagePath(
                  _wolfModel.data.isInDay()
                      ? 'wolfv2/bg_wolf_day.webp'
                      : 'wolfv2/bg_wolf_night.webp',
                  package: ComponentManager.MANAGER_WERE_WOLF,
                ),
              ),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.topCenter,
          child: getBody(),
        ));
  }
}

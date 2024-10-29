import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:were_wolf/src/room/guide/room/wolfGuideConfig.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_datetime_vote_widget.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_night_action_widget.dart';
import 'package:were_wolf/src/room/guide/room/wolf_model.dart';

///
///
class WolfGuideStateWidgetBuilder {
  static Widget build(BuildContext context, WolfModel wolfModel) {
    WolfGuideConfigState? wolfState = wolfModel.data.currentState;
    Log.d("WolfStateWidgetBuilder state.toString()=${wolfState.toString()}");

    switch (wolfState) {
      //夜晚行动
      case WolfGuideConfigState.NightAction:
        return const WolfGuideNightActionWidget();
      case WolfGuideConfigState.DaytimeVote:
        return const WolfGuideDaytimeVoteWidget();
      default:
        return Container();
    }
  }
}

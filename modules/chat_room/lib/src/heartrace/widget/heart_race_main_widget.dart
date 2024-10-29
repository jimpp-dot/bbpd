import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

import '../../protobuf/generated/common_room_heartrace.pb.dart';
import '../model/heart_race_model.dart';
import 'heart_race_group_team.dart';
import 'heart_race_pk.dart';
import 'package:provider/provider.dart' hide Selector;

/// 心跳竞速
class HeartRaceMainWidget extends StatefulWidget {
  final ChatRoomData room;
  const HeartRaceMainWidget({super.key, required this.room});

  @override
  HeartRaceMainState createState() {
    return HeartRaceMainState();
  }
}

class HeartRaceMainState extends State<HeartRaceMainWidget> {
  late HeartRaceModel _model;

  @override
  void initState() {
    super.initState();

    _model = HeartRaceModel(HeartRaceConfig())..init(widget.room);
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Util.width,
      height: 327.0 + 51,
      child: ChangeNotifierProvider<HeartRaceModel>.value(
        value: _model,
        child: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    return Consumer<HeartRaceModel>(builder: (context, data, _) {
      if (!Util.validStr(data.value.state)) {
        return const SizedBox.shrink();
      } else {
        HeartRaceState state = HeartRaceModel.getState(data.value.state);
        if (state == HeartRaceState.wait) {
          return HeartRaceGroupTeam(
            room: widget.room,
            micPair: data.value.micPair,
            hasHat: data.value.hasHat,
          );
        }
        return HeartRacePk(
          room: widget.room,
          state: state,
          model: data,
        );
      }
    });
  }
}

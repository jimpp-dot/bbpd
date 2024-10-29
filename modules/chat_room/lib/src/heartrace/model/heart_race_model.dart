import 'package:shared/shared.dart';

import '../../../chat_room.dart';
import '../../protobuf/generated/common_room_heartrace.pb.dart';
import 'heart_race_msg_handler.dart';
import 'heart_race_repo.dart';

class HeartRaceModel extends AbsRoomModel<HeartRaceConfig> {
  HeartRaceModel(HeartRaceConfig value) : super(value);

  bool showLockAni = false;

  @override
  AbsRoomMsgHandler createMsgHandler(
      AbsRoomModel<dynamic> model, ChatRoomData room) {
    return HeartRaceMsgHandler(model, room);
  }

  @override
  void loadData() async {
    ResHeartRaceConfig config =
        await HeartRaceRepo.getHeartRaceConfig(room?.rid ?? 0);
    if (!mounted) return;
    if (config.success == true) {
      value = config.config;
      notify();
    } else {
      Fluttertoast.showToast(msg: config.msg, gravity: ToastGravity.CENTER);
    }
  }

  void notify() {
    notifyListeners();
  }

  static HeartRaceState getState(String state) {
    try {
      String current =
          '${'HeartRaceState'.toLowerCase()}.${state.toLowerCase()}';
      return HeartRaceState.values.firstWhere((HeartRaceState state) {
        return state.toString().toLowerCase() == current;
      });
    } catch (e) {}
    return HeartRaceState.wait;
  }
}

enum HeartRaceState {
  wait,

  /// 组队
  pk,

  /// pk
  pk_result,

  /// 最终确认
  choose_relation,

  /// 选择关系
}

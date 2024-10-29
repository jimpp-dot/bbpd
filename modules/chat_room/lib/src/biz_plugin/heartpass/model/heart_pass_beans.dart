import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'heart_pass_beans.g.dart';

/// 心动闯关入口
@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class HeartPassEntrance {
  @JsonKey(name: 'show_lucky_index')
  final int showEntrance; // 房间设置是否显示开启入口
  @JsonKey(name: 'show_lucky_data')
  final int showUI; // 是否显示UI

  HeartPassEntrance(this.showEntrance, this.showUI);

  factory HeartPassEntrance.fromJson(Map<String, dynamic> json) =>
      _$HeartPassEntranceFromJson(json);
}

/// 心动闯关游戏状态
enum HeartPassState {
  Wait, // 开始之前
  Play, // 游戏中
}

/// 解析抢歌state
HeartPassState parseState(String? stateStr) {
  if (stateStr == null || stateStr.isEmpty) return HeartPassState.Wait;
  try {
    String current =
        '${'HeartPassState'.toLowerCase()}.${stateStr.replaceAll('-', '').toLowerCase()}';
    return HeartPassState.values.firstWhere((HeartPassState state) {
      return state.toString().toLowerCase() == current;
    });
  } catch (e, s) {
    Log.e(e, stackTrace: s);
  }
  return HeartPassState.Wait;
}

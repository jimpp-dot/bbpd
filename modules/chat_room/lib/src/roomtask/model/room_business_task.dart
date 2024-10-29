import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/roomtask/model/room_task.dart';

part 'room_business_task.g.dart';

@JsonSerializable(createToJson: false)
class RoomBusinessTaskInfo {
  /// 该用户当前积分
  @JsonKey(name: 'current_point', fromJson: Util.parseInt)
  int currentPoint;

  /// h5链接
  String link;
  @JsonKey(name: 'box_info')
  List<RoomBusinessBoxInfo> boxInfo;
  @JsonKey(name: 'task_info')
  List<RoomTaskItem> taskInfo;

  RoomBusinessTaskInfo(
      this.currentPoint, this.link, this.boxInfo, this.taskInfo);

  factory RoomBusinessTaskInfo.fromJson(Map<String, dynamic> json) =>
      _$RoomBusinessTaskInfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class RoomBusinessBoxInfo {
  String icon;

  /// 该等级积分
  @JsonKey(fromJson: Util.parseInt)
  int point;

  /// 宝箱等级
  @JsonKey(fromJson: Util.parseInt)
  int level;

  /// 箱子状态 -1不能打开;0 能打开，还没打开;1 已经打开
  @JsonKey(name: 'box_status', fromJson: Util.parseInt)
  int status;

  RoomBusinessBoxInfo(this.icon, this.point, this.level, this.status);

  factory RoomBusinessBoxInfo.fromJson(Map<String, dynamic> json) =>
      _$RoomBusinessBoxInfoFromJson(json);

  String get pointText {
    return '${K.room_fans_Integral([''])}: ${point.toString()}';
  }

  bool get boxReadyOpen {
    return status == 0;
  }

  String get iconURL {
    if (icon.contains('http')) return icon;

    return '${System.imageDomain}$icon';
  }

  bool get showBoxArrow {
    return status == 1;
  }
}

///房间任务，单条任务信息
@JsonSerializable(createToJson: false)
class RoomTaskItem {
  String title;
  String icon;
  @JsonKey(fromJson: RoomTask.parseType)
  TaskType type;
  String rate; // 升级进度

  @JsonKey(name: 'add_exp', fromJson: Util.parseInt)
  int addExp;

  @JsonKey(name: 'add_point', fromJson: Util.parseInt)
  int addPoint;

  /// 该项任务是否已经完成
  @JsonKey(fromJson: Util.parseBool)
  bool complete = false;

  /// 该项任务是否已经完成
  @JsonKey(fromJson: Util.parseBool)
  bool status = false;

  RoomTaskItem(this.title, this.icon, this.type, this.rate, this.addExp,
      this.complete, this.status, this.addPoint);

  factory RoomTaskItem.fromJson(Map<String, dynamic> json) =>
      _$RoomTaskItemFromJson(json);

  bool get isBusinessRoom {
    return addPoint > 0;
  }

  bool get taskIsComplete {
    return complete == true || status == true;
  }

  String get iconURL {
    if (icon.contains('http')) return icon;

    return '${System.imageDomain}$icon';
  }

  String get rateText {
    if (rate.isNotEmpty) {
      return '${K.room_level_progress}$rate';
    } else {
      return '';
    }
  }

  String get bonusText {
    if (addExp != 0) {
      return '+$addExp ${K.room_exp}';
    } else {
      if (addPoint != 0) return '+$addPoint ${K.room_fans_Integral([''])}';
    }

    return '';
  }
}

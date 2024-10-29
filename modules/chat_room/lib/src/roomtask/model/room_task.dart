import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:chat_room/k.dart';

import 'room_business_task.dart';

part 'room_task.g.dart';

enum TaskType {
  signIn, //签到
  sendGift, //赠送礼物
  online, //房间停留
  onMic, //上麦
  onlineTime, // 房间时间停留
  unKnow, // 未知
}

///房间任务，信息汇总
@JsonSerializable(createToJson: false)
class RoomTaskInfo {
  @JsonKey(fromJson: Util.parseInt)
  int level;

  @JsonKey(name: 'today_exp', fromJson: Util.parseInt)
  int todayExp;

  @JsonKey(name: 'today_signed', fromJson: Util.parseBool)
  bool todaySigned;

  @JsonKey(name: 'exp_info')
  List<RoomTask> tasks;

  RoomTaskInfo(this.level, this.todayExp, this.todaySigned, this.tasks);

  factory RoomTaskInfo.fromJson(Map<String, dynamic> json) =>
      _$RoomTaskInfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class RoomTaskInfoRsp extends BaseResponse {
  @JsonKey(name: 'data')
  RoomTaskInfo? taskInfo;

  RoomTaskInfoRsp({super.success, super.msg, this.taskInfo});

  factory RoomTaskInfoRsp.fromJson(Map<String, dynamic> json) =>
      _$RoomTaskInfoRspFromJson(json);
}

@JsonSerializable(createToJson: false)
class RoomTaskExpInfo {
  @JsonKey(name: 'subtask_info')
  List<RoomTaskItem> taskInfo;

  @JsonKey(name: 'box_status', fromJson: Util.parseInt)

  /// 宝箱的状态。-1不能打开；0能打开，还没打开；1已经打开了
  int boxStatus;

  @JsonKey(name: 'lightup_info')

  /// 该房间已经点亮的用户总数。例如“1300人已点亮”
  String lightUpInfo;

  /// h5链接
  String link;

  RoomTaskExpInfo(this.taskInfo, this.boxStatus, this.lightUpInfo, this.link);

  factory RoomTaskExpInfo.fromJson(Map<String, dynamic> json) =>
      _$RoomTaskExpInfoFromJson(json);

  double get completePercent {
    double percent = 0;
    double weight = 1.0 / (taskInfo.length + 1);
    int completeNum = taskInfo.where((element) => element.complete).length;
    percent += weight * completeNum;
    if (boxStatus == 1) percent += weight;
    return percent;
  }
}

///房间任务，单条任务信息
@JsonSerializable(createToJson: false)
class RoomTask {
  final String title;
  final String icon;
  @JsonKey(fromJson: RoomTask.parseType)
  final TaskType type;

  final int limit; // 任务值上限
  final int current; // 当前已有值
  final String rule; // 任务规则

  RoomTask(
      this.title, this.icon, this.type, this.limit, this.current, this.rule);

  factory RoomTask.fromJson(Map<String, dynamic> json) =>
      _$RoomTaskFromJson(json);

  /// 任务进度后缀
  String get progressTextSuffix {
    String unit;
    switch (type) {
      case TaskType.signIn:
        unit = K.room_person;
        break;
      case TaskType.online:
        unit = K.room_experience;
        break;
      case TaskType.onMic:
        unit = K.room_person;
        break;
      case TaskType.sendGift:
        unit = K.room_experience;
        break;
      case TaskType.onlineTime:
        unit = K.room_person;
        break;
      default:
        unit = '';
        break;
    }
    return '/$limit$unit';
  }

  /// 任务是否完成
  bool get taskIsComplete {
    return limit == current;
  }

  static TaskType parseType(dynamic type) {
    if (type == 'sign') {
      return TaskType.signIn;
    } else if (type == 'online') {
      return TaskType.online;
    } else if (type == 'gift') {
      return TaskType.sendGift;
    } else if (type == 'onMicro') {
      return TaskType.onMic;
    } else if (type == 'online_3m') {
      return TaskType.onlineTime;
    } else {
      return TaskType.unKnow;
    }
  }
}

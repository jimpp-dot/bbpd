import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'accompany_model.g.dart';

/// 1+1陪伴房

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class AccompanyData {
  int value; //当前总亲密度
  int duration; //当前陪伴时长
  int totalTime; // 总时长
  @JsonKey(fromJson: Util.parseIcon)
  String? decorate; //背景
  @JsonKey(fromJson: Util.parseIcon)
  String? effect; //陪伴时长达标后的动态背景
  String? foreground; // 底部背景

  bool truthEnable; //是否显示真心话入口

  @JsonKey(fromJson: Util.parseBool)
  bool roomIsLock; // 房间锁房状态 true:已加锁
  @JsonKey(fromJson: Util.parseBool)
  bool roomAutoMic; // 自动上麦设置 true: 开启自动上麦

  AccompanyData(
      this.value,
      this.duration,
      this.totalTime,
      this.decorate,
      this.effect,
      this.truthEnable,
      this.roomIsLock,
      this.roomAutoMic,
      this.foreground);

  factory AccompanyData.fromJson(Map<String, dynamic> json) {
    AccompanyData data = _$AccompanyDataFromJson(json);
    return data;
  }

  void update(AccompanyData data) {
    value = data.value;
    duration = data.duration;
    totalTime = data.totalTime;
    truthEnable = data.truthEnable;
    roomIsLock = data.roomIsLock;
    roomAutoMic = data.roomAutoMic;
    foreground = data.foreground;
    if (data.decorate != null) decorate = data.decorate;
    if (data.effect != null) effect = data.effect;
  }
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class AccompanyExtraData {
  List<UserBean> callList;
  @JsonKey(name: 'banner')
  List<AccompanyTask> taskList;

  AccompanyExtraData(this.callList, this.taskList);

  factory AccompanyExtraData.fromJson(Map<String, dynamic> json) {
    return _$AccompanyExtraDataFromJson(json);
  }
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class AccompanyTask {
  final String? title; // 任务名称
  final int value; // 达成时间
  @JsonKey(fromJson: Util.getRemoteImgUrl)
  final String? icon;

  AccompanyTask(this.title, this.value, this.icon); // 任务icon

  factory AccompanyTask.fromJson(Map<String, dynamic> json) =>
      _$AccompanyTaskFromJson(json);
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class AccompanyMysteryGift {
  final String? title;
  final String? name;
  final int num;
  @JsonKey(fromJson: Util.getRemoteImgUrl)
  final String? picUrl;

  AccompanyMysteryGift(this.title, this.name, this.num, this.picUrl);

  factory AccompanyMysteryGift.fromJson(Map<String, dynamic> json) =>
      _$AccompanyMysteryGiftFromJson(json);
}

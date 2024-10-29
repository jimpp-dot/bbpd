import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
import 'intimate_interact_gift_data.dart';

part 'intimate_interact_task_data.g.dart';

@JsonSerializable()
class IntimateInteractTaskData {
  static const int STATUS_IDLE = 0;
  static const int STATUS_RECEIVE = 10;
  static const int STATUS_REFUSE = 20;
  static const int STATUS_CANCEL = 30;
  static const int STATUS_CONFIRM = 40;
  static const int STATUS_REFUND = 50;
  static const int STATUS_REFUND_AGREE = 60;
  static const int STATUS_REFUND_REFUSE = 70;

  final IntimateInteractGiftData gift;

  @JsonKey(name: 'gift_num')
  final int giftNum;

  final String name;

  /// 任务的状态，0.初始状态，10.接受，20.拒绝，30.取消，40.确认，50.申诉退款，60.同意退款，70.拒绝退款
  int status;

  @JsonKey(name: 'task_id')
  final int taskId;

  @JsonKey(name: 'task_name')
  final String taskName;

  IntimateInteractTaskData(this.gift, this.giftNum, this.name, this.status,
      this.taskId, this.taskName);

  factory IntimateInteractTaskData.fromJson(Map<String, dynamic> json) =>
      _$IntimateInteractTaskDataFromJson(json);

  @override
  String toString() {
    return _$IntimateInteractTaskDataToJson(this).toString();
  }
}

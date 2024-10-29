import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
import 'intimate_interact_gift_data.dart';
import 'intimate_interact_task_data.dart';

part 'intimate_interact_create_invite_data.g.dart';

@JsonSerializable()
class IntimateInteractCreateInviteData {
  @JsonKey(name: 'on_mic_icon_list')
  final List<UserBean> userList;

  @JsonKey(name: 'task_list')
  final Map taskMap;

  @JsonKey(name: 'gift_list')
  final List<IntimateInteractGiftData> giftList;

  @JsonKey(name: 'self_task')
  final List<IntimateInteractTaskData> selfTaskList;

  @JsonKey(name: 'num_list')
  final Map numMap;

  @JsonKey(name: 'list_type')
  final int listType;

  IntimateInteractCreateInviteData(this.userList, this.taskMap, this.giftList,
      this.selfTaskList, this.numMap, this.listType);

  factory IntimateInteractCreateInviteData.fromJson(
          Map<String, dynamic> json) =>
      _$IntimateInteractCreateInviteDataFromJson(json);

  @override
  String toString() {
    return _$IntimateInteractCreateInviteDataToJson(this).toString();
  }
}

import 'package:shared/shared.dart';
import 'package:shared/model/defend_bean.dart';
import 'package:json_annotation/json_annotation.dart';
part 'defend_garden_bean.g.dart';

/// 守护秘密花园页数据
@JsonSerializable(createToJson: false)
class DefendGardenBean extends BaseResponse {
  final DefendGardenData? data;

  DefendGardenBean({bool success = false, String msg = '', this.data})
      : super(msg: msg, success: success);

  factory DefendGardenBean.fromJson(Map<String, dynamic> json) =>
      _$DefendGardenBeanFromJson(json);
}

@JsonSerializable(createToJson: false)
class DefendGardenData extends BaseResponse {
  @JsonKey(name: 'hidden_list')
  List<DefendRelationModel> hiddenList;

  @JsonKey(name: 'show_list')
  List<DefendRelationModel> showList;

  int capacity;

  /// 可展示个数

  @JsonKey(name: 'can_unlock_num')
  int canUnlockNum;

  @JsonKey(name: 'unlock_money')
  int unlockMoney;

  @JsonKey(name: 'unlock_tips')
  String unlockTips;

  DefendGardenData(this.capacity, this.hiddenList, this.showList,
      this.canUnlockNum, this.unlockMoney, this.unlockTips);

  factory DefendGardenData.fromJson(Map<String, dynamic> json) =>
      _$DefendGardenDataFromJson(json);
}

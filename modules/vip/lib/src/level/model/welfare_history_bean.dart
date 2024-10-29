import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'welfare_history_bean.g.dart';

// 福利历史
@JsonSerializable()
class WelfareHistoryBean extends BaseResponse
    with PageListResponse<WelfareHistoryData> {
  List<WelfareHistoryData> data;

  int limit;

  WelfareHistoryBean(
      {required this.data, super.success, super.msg, required this.limit});

  factory WelfareHistoryBean.fromJson(Map<String, dynamic> json) =>
      _$WelfareHistoryBeanFromJson(json);

  @override
  List<WelfareHistoryData> get items => data;

  @override
  bool get hasMore => data.length == limit;
}

@JsonSerializable()
class WelfareHistoryData extends ShopMailCommodity {
  int id;
  String period;
  String time;

  WelfareHistoryData({
    required int cid,
    required String type,
    required String cType,
    required String name,
    required String avatar,
    required String image,
    required String imageBackground,
    required String desc,
    required String bubbleDesc,
    required String bubbleFontColor,
    required int cNum,
    required this.id,
    required this.period,
    required this.time,
  }) : super(
          cid: cid,
          type: type,
          cType: cType,
          name: name,
          avatar: avatar,
          image: image,
          imageBackground: imageBackground,
          desc: desc,
          bubbleDesc: bubbleDesc,
          bubbleFontColor: bubbleFontColor,
          cNum: cNum,
        );

  factory WelfareHistoryData.fromJson(Map<String, dynamic> json) =>
      _$WelfareHistoryDataFromJson(json);
}

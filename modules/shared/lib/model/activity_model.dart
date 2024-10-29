import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'activity_model.g.dart';

@JsonSerializable(createToJson: false)
class ActivityLotteryResponse extends BaseResponse {
  ActivityAwardModel? data;
  ActivityLotteryResponse({this.data, super.success, super.msg = ''});
  factory ActivityLotteryResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivityLotteryResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class ActivityBannerResponse extends BaseResponse {
  ActivityBannerModel? data;
  ActivityBannerResponse({this.data, super.success, super.msg});
  factory ActivityBannerResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivityBannerResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class ActivityLotteryResultResponse extends BaseResponse {
  List<ShopMailCommodity>? data;
  ActivityLotteryResultResponse({this.data, super.success, super.msg});
  factory ActivityLotteryResultResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivityLotteryResultResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class ActivityUserInfoResponse extends BaseResponse {
  ActivityUserInfoModel? data;
  int enable;
  ActivityUserInfoResponse(
      {this.data, this.enable = 0, super.success, super.msg});
  factory ActivityUserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivityUserInfoResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class ActivityUserInfoModel {
  String name;

  String mobile;

  String address;

  ActivityUserInfoModel(this.name, this.mobile, this.address);
  factory ActivityUserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityUserInfoModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class ActivityAwardModel {
  @JsonKey(name: 'gift_list')
  List<ShopMailCommodity> giftList;

  @JsonKey(name: 'normal_status')
  int normalStatus; //0 -不能使用 1-可以使用 2 已经使用 普通抽奖

  @JsonKey(name: 'advance_status')
  int advanceStatus; //高级抽奖

  String desc; //活动规则

  String title;

  ActivityAwardModel(this.giftList, this.normalStatus, this.advanceStatus,
      this.desc, this.title);
  factory ActivityAwardModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityAwardModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class ActivityBannerModel {
  @JsonKey(name: 'img')
  String imgUrl; //活动链接

  @JsonKey(name: 'width')
  int width;

  @JsonKey(name: 'height')
  int height;

  ActivityBannerModel(this.imgUrl, this.width, this.height);

  factory ActivityBannerModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityBannerModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class TransInviteInfo {
  String image; //活动链接
  int width;
  int height;
  int id;

  @JsonKey(name: 'jump_type')
  String jumpType;
  String redirect;

  bool get isGroup => (jumpType == 'group');
  int get groupId => Util.parseInt(redirect);

  TransInviteInfo(this.image, this.width, this.height, this.id, this.jumpType,
      this.redirect);

  factory TransInviteInfo.fromJson(Map<String, dynamic> json) =>
      _$TransInviteInfoFromJson(json);
}

import 'package:shared/shared.dart';

class SignInResp extends BaseResponse {
  bool signed;
  int popTimes;
  List<WeekSignModel>? weekSign;

  /// 格式：eg: 2020-10-21，代表本次可以签到的是本周的哪一天，目前是依次
  /// 累计签到，找寻本周第一个未签到的天
  String weekDay;

  /// 累计签到多少天
  int total;

  // 当前是否可以不绑定手机号直接签到
  bool canSignWithoutMobile;

  WeekSignModel? _firstNoSignedCacheModel;

  SignInResp(
      {super.success,
      super.msg,
      this.signed = false,
      this.popTimes = 0,
      this.weekSign,
      this.weekDay = '',
      this.total = 0,
      this.canSignWithoutMobile = false});

  WeekSignModel? getFirstNoSignedModel() {
    if (_firstNoSignedCacheModel != null) {
      return _firstNoSignedCacheModel!;
    }
    if (weekSign != null) {
      _firstNoSignedCacheModel = weekSign!.firstWhereOrNull(
        (element) => false == element.isSign,
      );
      return _firstNoSignedCacheModel;
    }
    return null;
  }

  factory SignInResp.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> data = json['data'] ?? {};
    return SignInResp(
      success: Util.parseBool(json['success']),
      msg: Util.parseStr(json['msg']),
      signed: Util.parseBool(data['signed']),
      popTimes: Util.parseInt(data['pop_times']),
      weekSign: (data['week_sign'] != null
          ? (data['week_sign'] as List)
              .asMap()
              .entries
              .map((entry) =>
                  WeekSignModel.fromJson(entry.value)..day = entry.key + 1)
              .toList()
          : null),
      weekDay: Util.notNullStr(data['week_day'], def: '0'),
      total: Util.parseInt(data['total']),
      canSignWithoutMobile: Util.parseBool(data['can_sign_without_mobile']),
    );
  }
}

class WeekSignModel {
  String icon;
  bool isSign;
  String signType;
  String missionType;
  String missionId;
  String awardType; //gold_coin/diamond
  String awardIcon;
  int awardNum;

  /// 本地赋值的索引 1...7
  int day;

  WeekSignModel(
      {this.icon = '',
      this.isSign = false,
      this.signType = '',
      this.missionType = '',
      this.missionId = '',
      this.awardType = '',
      this.awardIcon = '',
      this.awardNum = 0,
      this.day = 0});

  factory WeekSignModel.fromJson(Map<String, dynamic> json) {
    return WeekSignModel(
      signType: Util.notNullStr(json['sign_type']),
      missionType: Util.notNullStr(json['mission_type']),
      missionId: Util.notNullStr(json['mission_id']),
      awardType: Util.notNullStr(json['award_type']),
      awardIcon: Util.notNullStr(json['award_icon']),
      awardNum: Util.parseInt(json['award_num']),
      isSign: Util.parseInt(json['is_sign']) == 1,
      icon: Util.notNullStr(json['icon']),
    );
  }
}

import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'killer_nobility_bean.g.dart';

@JsonSerializable()
class KillerNobilityCenterResponse extends BaseResponse {
  @JsonKey(name: 'title')
  final MyNobilityInfo? myInfo;

  @JsonKey(name: 'config')
  final List<NobilityTabInfoItem> tabData;

  @JsonKey(name: 'benefit')
  final List<PrivilegeInfoItem> items;

  bool isOpenCurrentNobility(NobilityTabInfoItem? item) {
    return (myInfo?.title ?? 0) >= (item?.level ?? 0);
  }

  int get myNobilityLevel {
    return (myInfo?.title ?? 0);
  }

  bool get openedNobility {
    return myNobilityLevel > 0;
  }

  bool get reachRechargeCondition {
    return (myInfo?.rechargeCondition ?? 0) == 1;
  }

  int get indexNobilityLevel {
    int index = 0;
    if (myNobilityLevel > 0) {
      for (int i = 0; i < tabData.length; i++) {
        if (myNobilityLevel == tabData[i].level) {
          return i;
        }
      }
    }
    return index;
  }

  String get nextPeriodNobilityName {
    // int nobility = 0;
    // for (int i = 0; i < (tabData?.length ?? 0); i++) {
    //   if (myInfo.growth >= tabData[i].growth) {
    //     nobility = tabData[i].level;
    //   } else {
    //     break;
    //   }
    // }
    // return NobilityUtil.nobilityName(newNobility: nobility);
    return '';
  }

  //升级值
  int upgradeValue(NobilityTabInfoItem? item) {
    int value = (item?.growth ?? 0) - (myInfo?.growth ?? 0);
    return value > 0 ? value : 0;
  }

  //解锁特权数
  int get openedPrivilegeNumber {
    int number = 0;
    for (var element in items) {
      if (element.start <= (myInfo?.title ?? 0)) {
        number++;
      }
    }
    return number;
  }

  int currentTabPrivilegeNumber(NobilityTabInfoItem? item) {
    int number = 0;
    for (var element in items) {
      if (element.start <= (item?.level ?? 0)) {
        number++;
      }
    }
    return number;
  }

  KillerNobilityCenterResponse({
    super.success,
    super.msg,
    this.myInfo,
    required this.tabData,
    required this.items,
  });

  factory KillerNobilityCenterResponse.fromJson(Map<String, dynamic> json) =>
      _$KillerNobilityCenterResponseFromJson(json);
}

@JsonSerializable()
class MyNobilityInfo {
  final int title;
  @JsonKey(
    name: 'month_growth',
  )
  final int growth;
  @JsonKey(
    name: 'has_title',
  )
  final int rechargeCondition;

  MyNobilityInfo(
      {required this.title,
      required this.growth,
      required this.rechargeCondition});

  factory MyNobilityInfo.fromJson(Map<String, dynamic> json) =>
      _$MyNobilityInfoFromJson(json);
}

@JsonSerializable()
class NobilityTabInfoItem {
  final String name;
  final int level;
  final int growth;
  final String icon;
  @JsonKey(
    name: 'gray_icon',
  )
  final String grayIcon;
  @JsonKey(
    name: 'loop_icon',
  )
  final String loopIcon;

  NobilityTabInfoItem(
      {required this.name,
      required this.level,
      required this.growth,
      required this.icon,
      required this.grayIcon,
      required this.loopIcon});

  factory NobilityTabInfoItem.fromJson(Map<String, dynamic> json) =>
      _$NobilityTabInfoItemFromJson(json);
}

@JsonSerializable()
class NobilityGrowthResponse extends BaseResponse {
  @JsonKey(
    name: 'list',
  )
  final List<GrowthInfo> items;
  @JsonKey(name: 'type')
  final List<String> typeDesc;

  NobilityGrowthResponse(
      {super.success, super.msg, required this.items, required this.typeDesc});

  factory NobilityGrowthResponse.fromJson(Map<String, dynamic> json) =>
      _$NobilityGrowthResponseFromJson(json);
}

@JsonSerializable()
class GrowthInfo {
  final String id;
  final String uid;
  @JsonKey(
    name: 'app_id',
  )
  final String appId;
  final String growth;
  final String dateline;
  final String type;

  GrowthInfo(
      {required this.id,
      required this.uid,
      required this.appId,
      required this.growth,
      required this.dateline,
      required this.type});

  factory GrowthInfo.fromJson(Map<String, dynamic> json) =>
      _$GrowthInfoFromJson(json);
}

class KillerNobilityRepository {
  static Future<KillerNobilityCenterResponse> getNobilityInfo() async {
    String url = '${System.domain}games/title/gamesIndex';
    try {
      Map<String, String> params = {};
      XhrResponse response = await Xhr.postJson(url, params);
      if (response.error != null) {
        Log.d(response.error.toString());
        return KillerNobilityCenterResponse(
            msg: response.error.toString(),
            success: false,
            tabData: [],
            items: []);
      }
      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return KillerNobilityCenterResponse(
            msg: res['msg'], success: false, tabData: [], items: []);
      }
      try {
        Map<String, dynamic> data = res['data'] ?? <String, dynamic>{};
        data['success'] = true;
        return KillerNobilityCenterResponse.fromJson(data);
      } catch (e) {
        Log.d(e);
        return KillerNobilityCenterResponse(
            msg: R.array('xhr_error_type_array')[6],
            success: false,
            tabData: [],
            items: []);
      }
    } catch (e) {
      return KillerNobilityCenterResponse(
          msg: e.toString(), success: false, tabData: [], items: []);
    }
  }

  static Future<NobilityGrowthResponse> getNobilityGrowthList(int page) async {
    String url = '${System.domain}games/title/growth';
    try {
      Map<String, String> params = {'page': '$page', 'pageSize': '200'};
      XhrResponse response = await Xhr.postJson(url, params);
      if (response.error != null) {
        Log.d(response.error.toString());
        return NobilityGrowthResponse(
            msg: response.error.toString(),
            success: false,
            items: [],
            typeDesc: []);
      }
      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return NobilityGrowthResponse(
            msg: res['msg'], success: false, items: [], typeDesc: []);
      }
      try {
        Map<String, dynamic> data = res['data'] ?? <String, dynamic>{};
        data['success'] = true;
        return NobilityGrowthResponse.fromJson(data);
      } catch (e) {
        Log.d(e);
        return NobilityGrowthResponse(
            msg: R.array('xhr_error_type_array')[6],
            success: false,
            items: [],
            typeDesc: []);
      }
    } catch (e) {
      return NobilityGrowthResponse(
          msg: e.toString(), success: false, items: [], typeDesc: []);
    }
  }
}

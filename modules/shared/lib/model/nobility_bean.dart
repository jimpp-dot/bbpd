import 'package:shared/shared.dart';
import 'package:shared/k.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nobility_bean.g.dart';

@JsonSerializable()
class NobilityCenterResponse extends BaseResponse {
  @JsonKey(name: 'title')
  final NobilityInfoItem? myInfo;

  @JsonKey(name: 'config')
  final Map<String, TabInfoItem?>? tabInfo;

  @JsonKey(name: 'benefit')
  final List<PrivilegeInfoItem>? items;

  @JsonKey(name: 'gain_growth')
  final int grading;

  final int curTime;

  final NobilityExtend? extend;

  List<TabInfoItem> get tabData {
    List<TabInfoItem> tabs = [];
    tabInfo?.forEach((key, value) {
      if (value != null) {
        tabs.add(value);
      }
    });
    return tabs;
  }

  bool isOpenCurrentNobility(TabInfoItem? item) {
    return ((myInfo?.subscribeTime ?? 0) > (curTime)) &&
        ((myInfo?.level ?? 0) >= (item?.level ?? 0));
  }

  bool get openedNobility {
    return ((nobilityLevel) > 0);
  }

  TabInfoItem? get currentNobility {
    TabInfoItem? level;
    tabInfo?.forEach((key, value) {
      if (isOpenCurrentNobility(value)) {
        level = value;
      }
    });
    return level;
  }

  int get nobilityLevel {
    int level = 0;
    tabInfo?.forEach((key, value) {
      if (isOpenCurrentNobility(value)) {
        level = value!.level;
      }
    });
    return level;
  }

  int get indexNobilityLevel {
    int index = 0;
    if (nobilityLevel > 0) {
      if (tabInfo?.keys != null) {
        for (var key in tabInfo!.keys) {
          if (nobilityLevel == tabInfo![key]!.level) {
            return index;
          }
          index++;
        }
      }
    }
    return index;
  }

  int getIndexWithNobilityLevel(int level) {
    int index = 0;
    if (tabInfo?.keys != null) {
      for (var key in tabInfo!.keys) {
        if (level == tabInfo![key]!.level) {
          return index;
        }
        index++;
      }
    }
    return index;
  }

  //保级值
  int gradingValue(TabInfoItem item) {
    int value = (item.grading) - (grading);
    return value > 0 ? value : 0;
  }

  //升级值
  int upgradeValue(TabInfoItem item) {
    int value = (item.growth) - (myInfo?.growth ?? 0);
    return value > 0 ? value : 0;
  }

  //解锁特权数
  int get openedPrivilegeNumber {
    int number = 0;
    items?.forEach((element) {
      if (element.start <= (myInfo?.level ?? 0)) {
        number++;
      }
    });
    return number;
  }

  int currentTabPrivilegeNumber(TabInfoItem? item) {
    int number = 0;
    items?.forEach((element) {
      if (element.start <= (item?.level ?? 0)) {
        number++;
      }
    });
    return number;
  }

  NobilityCenterResponse({
    bool? success,
    String? msg,
    this.myInfo,
    this.tabInfo,
    this.items,
    this.grading = 0,
    this.curTime = 0,
    this.extend,
  }) : super(msg: msg, success: success ?? false);

  factory NobilityCenterResponse.fromJson(Map<String, dynamic> json) =>
      _$NobilityCenterResponseFromJson(json);
}

@JsonSerializable()
class NobilityExtend {
  /// 本月当前进度
  @JsonKey(name: 'monthly_pay')
  final int monthlyPay;

  /// 本月需要完成的总金额
  @JsonKey(name: 'monthly_pay_require')
  final int monthlyPayRequire;

  /// 0-不能申请，1-可申请，2-已申请
  @JsonKey(name: 'apply_banner')
  final int applyBanner;

  NobilityExtend(
      {this.monthlyPay = 0, this.monthlyPayRequire = 0, this.applyBanner = 0});

  factory NobilityExtend.fromJson(Map<String, dynamic> json) =>
      _$NobilityExtendFromJson(json);
}

@JsonSerializable()
class NobilityInfoItem {
  final int level;

  final int growth;
  @JsonKey(
    name: 'source',
  )
  final bool isExperienceCard;
  @JsonKey(name: 'effective_time')
  final int effectiveTime;
  @JsonKey(name: 'subscribe_time')
  final int subscribeTime;
  @JsonKey(
    name: 'experience_expiredAt',
  )
  final int experienceTime;
  @JsonKey(name: 'prev_level')
  final int prevLevel;

  NobilityInfoItem(
      {this.level = 0,
      this.growth = 0,
      this.isExperienceCard = false,
      this.effectiveTime = 0,
      this.subscribeTime = 0,
      this.experienceTime = 0,
      this.prevLevel = 0});

  factory NobilityInfoItem.fromJson(Map<String, dynamic> json) =>
      _$NobilityInfoItemFromJson(json);
}

@JsonSerializable()
class PrivilegeInfoItem {
  final String? icon;
  @JsonKey(name: 'pop_icon')
  final String? popIcon;
  @JsonKey(name: 'dis_icon')
  final String? disableIcon;
  final String? name;
  final String? remark;
  final String? description;
  @JsonKey(name: 'button_desc')
  final String? popBottomDesc;
  final String? type;
  final int start;
  final Map<String, List<String>?>? format;
  final String? key;

  String desc(int level) {
    if (format == null || format!.isEmpty) return remark ?? '';
    List<String>? formatItem = format!['$level'];
    formatItem ??= format!.values.toList().first;
    return string(remark ?? '', args: formatItem);
  }

  String popDesc(int level) {
    if (format == null || format!.isEmpty) return description ?? '';
    List<String>? formatItem = format!['$level'];
    formatItem ??= format!.values.toList().first;
    return string(description ?? '', args: formatItem);
  }

  String string(String str, {List<String>? args}) {
    if (args != null && args.isNotEmpty) {
      int count = args.length;
      for (int i = 1; i <= count; i++) {
        String placeholder = '%$i';
        str = str.replaceAll(placeholder, args[i - 1]);
      }
    }
    return str.replaceAll('\\%', '%');
  }

  PrivilegeInfoItem(
      {this.icon,
      this.popIcon,
      this.disableIcon,
      this.name,
      this.remark,
      this.description,
      this.popBottomDesc,
      this.type,
      this.start = 0,
      this.format,
      this.key});

  factory PrivilegeInfoItem.fromJson(Map<String, dynamic> json) =>
      _$PrivilegeInfoItemFromJson(json);
}

@JsonSerializable()
class TabInfoItem {
  final String? name;
  final int level;
  final int growth;
  final int grading;
  final int effective;
  final int attenuation;
  final String? icon;
  @JsonKey(name: 'gray_icon')
  final String? grayIcon;
  @JsonKey(name: 'loop_icon')
  final String? loopIcon;

  TabInfoItem({
    this.name,
    this.level = 0,
    this.growth = 0,
    this.grading = 0,
    this.effective = 0,
    this.attenuation = 0,
    this.icon,
    this.grayIcon,
    this.loopIcon,
  });

  factory TabInfoItem.fromJson(Map<String, dynamic> json) =>
      _$TabInfoItemFromJson(json);
}

enum AutoSubType {
  Null,
  Mouth,
  Quarter,
  Year,
}

@JsonSerializable()
class NobilityMealsResponse extends BaseResponse {
  @JsonKey(name: 'data')
  final List<MealInfo>? items;
  final int first;
  final MealDesc? desc;

  MealInfo? get autoYearItem {
    MealInfo? item;
    if (items == null || items!.isEmpty) return item;
    for (MealInfo e in items!) {
      if ((e.mealId) == 3) {
        item = e;
        break;
      }
    }
    return item;
  }

  int get autoSubscribedId {
    if (items == null || items!.isEmpty) return 0;
    bool isAutoSub = false;
    for (MealInfo e in items!) {
      isAutoSub = ((e.hasSigned) == 1 && (e.cycleId) != 0) ? true : false;
      if (isAutoSub) {
        return e.mealId;
      }
    }
    return 0;
  }

  AutoSubType get autoSubscribedType {
    switch (autoSubscribedId) {
      case 0:
        return AutoSubType.Null;
      case 1:
        return AutoSubType.Mouth;
      case 2:
        return AutoSubType.Quarter;
      case 3:
        return AutoSubType.Year;
    }
    return AutoSubType.Null;
  }

  String get autoSubscribedString {
    switch (autoSubscribedId) {
      case 0:
        return '';
      case 1:
        return K.base_nobility_sub_mouth;
      case 2:
        return K.base_nobility_sub_quarter;
      case 3:
        return K.base_nobility_sub_year;
    }
    return '';
  }

  bool get isAutoYearSub {
    if (items == null || items!.isEmpty) return false;
    bool isAutoSub = false;
    for (MealInfo e in items!) {
      if ((e.mealId) == 3) {
        isAutoSub = ((e.hasSigned) == 1 && (e.cycleId) != 0) ? true : false;
        break;
      }
    }
    return isAutoSub;
  }

  bool get isFirst {
    return (first) == 1;
  }

  NobilityMealsResponse({
    bool success = false,
    String? msg,
    this.items,
    this.first = 0,
    this.desc,
  }) : super(msg: msg, success: success);

  factory NobilityMealsResponse.fromJson(Map<String, dynamic> json) =>
      _$NobilityMealsResponseFromJson(json);
}

@JsonSerializable()
class MealInfo {
  final String? name;
  @JsonKey(name: 's_price')
  final int oriPrice;
  final int price;
  @JsonKey(name: 'first_price')
  final int firstPrice;
  @JsonKey(name: 'cycle_id')
  final int cycleId;
  final String? desc;
  @JsonKey(name: 'tab')
  final String? tag;
  @JsonKey(name: 'id')
  int mealId;
  @JsonKey(name: 'has_signed')
  int hasSigned;

  int get showFirstPrice {
    return (firstPrice) ~/ 100;
  }

  int get showOriPrice {
    return (oriPrice) ~/ 100;
  }

  int get showPrice {
    return (price) ~/ 100;
  }

  MealInfo(
      {this.name,
      this.price = 0,
      this.oriPrice = 0,
      this.firstPrice = 0,
      this.cycleId = 0,
      this.desc,
      this.tag,
      this.mealId = 0,
      this.hasSigned = 0});

  factory MealInfo.fromJson(Map<String, dynamic> json) =>
      _$MealInfoFromJson(json);
}

@JsonSerializable()
class NobilityGrowthResponse extends BaseResponse {
  @JsonKey(name: 'list')
  final List<GrowthInfo>? items;
  @JsonKey(name: 'type')
  final List<String>? typeDesc;

  NobilityGrowthResponse({super.success, super.msg, this.items, this.typeDesc});

  factory NobilityGrowthResponse.fromJson(Map<String, dynamic> json) =>
      _$NobilityGrowthResponseFromJson(json);
}

@JsonSerializable()
class GrowthInfo {
  final String? id;
  final String? uid;
  @JsonKey(name: 'app_id')
  final String? appId;
  final String? growth;
  final String? dateline;
  final String? type;

  GrowthInfo(
      {this.id, this.uid, this.appId, this.growth, this.dateline, this.type});

  factory GrowthInfo.fromJson(Map<String, dynamic> json) =>
      _$GrowthInfoFromJson(json);
}

class NobilityRepository {
  static Future<NobilityCenterResponse> getNobilityInfo() async {
    String url = '${System.domain}games/title/index?version=3';

    try {
      XhrResponse response = await Xhr.getJson(url);
      if (response.error != null) {
        return NobilityCenterResponse(
            msg: response.error.toString(), success: false);
      }
      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return NobilityCenterResponse(msg: res['msg'], success: false);
      }
      try {
        Map<String, dynamic> data = res['data'] ?? <String, dynamic>{};
        data['success'] = true;
        return NobilityCenterResponse.fromJson(data);
      } catch (e) {
        return NobilityCenterResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return NobilityCenterResponse(msg: e.toString(), success: false);
    }
  }

  static Future<NobilityMealsResponse> getNobilitySubscribeList() async {
    String url = '${System.domain}title/config';
    try {
      XhrResponse response = await Xhr.getJson(url);
      if (response.error != null) {
        return NobilityMealsResponse(
            msg: response.error.toString(), success: false);
      }
      Map<String, dynamic> res = response.value() as Map<String, dynamic>;
      if (!(res['success'] ?? false)) {
        return NobilityMealsResponse(msg: res['msg'], success: false);
      }
      try {
        return NobilityMealsResponse.fromJson(res);
      } catch (e) {
        return NobilityMealsResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return NobilityMealsResponse(msg: e.toString(), success: false);
    }
  }

  /// 服务器分页没效果，去掉
  ///
  static Future<NobilityGrowthResponse> getNobilityGrowthList() async {
    String url = '${System.domain}games/title/growth';
    try {
      XhrResponse response = await Xhr.getJson(url);
      if (response.error != null) {
        return NobilityGrowthResponse(
            msg: response.error.toString(), success: false);
      }
      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return NobilityGrowthResponse(msg: res['msg'], success: false);
      }
      try {
        Map<String, dynamic> data = res['data'] ?? <String, dynamic>{};
        data['success'] = true;
        return NobilityGrowthResponse.fromJson(data);
      } catch (e) {
        return NobilityGrowthResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return NobilityGrowthResponse(msg: e.toString(), success: false);
    }
  }
}

@JsonSerializable()
class MealDesc {
  @JsonKey(name: 'vip_auto_renewing_buy_desc1_android')
  final String? desc1;
  @JsonKey(name: 'vip_auto_renewing_buy_desc2_android')
  final String? desc2;
  @JsonKey(name: 'vip_auto_renewing_buy_desc3_android')
  final String? desc3;

  MealDesc({this.desc1, this.desc2, this.desc3});

  factory MealDesc.fromJson(Map<String, dynamic> json) =>
      _$MealDescFromJson(json);
}

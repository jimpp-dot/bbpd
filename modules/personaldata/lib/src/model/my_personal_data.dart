import 'package:shared/shared.dart';
import 'package:personaldata/src/page/imageModify.dart';

class MyPersonalData {
  MyPersonalData();

  String? name;
  String? sign;
  String? birthday;
  String? hometownCity;
  int? cityCode;
  int sex = 0;
  bool inVerify = false;

  int stature = 0;
  int weight = 0;
  bool showGsPhotoUpload = false;
  bool externalPhotoUpload = false;
  String? externalName;

  List<PersonalTagModel> tags = [];
  List<PersonalTagModel> friendTags = [];

  int year = 0;
  int month = 0;
  int date = 0;

  int baseInfoCount = 0;
  int peopleInfoCount = 0;
  int otherInfoCount = 0;
  int currentPhotoNum = 0;
  int completenessValue = 0;

  List<ModifyPhoto> photos = [];
  ModifyPhoto? headerPhoto;

  ChatMatchItem? cardInfo; //扩列卡信息

  /// {"first_time": false, "doc": "修改性别需要消耗2000金币，是否修改"}
  Map? sexInfo;

  PersonalInfoInAudit? inAudit; //审核中状态

  int? dynamicHeader;

  MyPersonalData.fromJson(Map json) {
    name = Util.parseStr(json['name']) ?? '';
    String icon = Util.parseStr(json['icon']) ?? '';
    String tmpIcon = Util.parseStr(json['tmp_icon']) ?? '';
    sign = Util.parseStr(json['sign']) ?? '';
    birthday = Util.parseStr(json['birthday']) ?? '';
    if (birthday?.isNotEmpty == true) {
      List<String> res = birthday!.split("-");
      if (res.length == 3) {
        DateTime dt = DateTime(
          Util.parseInt(res[0]),
          Util.parseInt(res[1]),
          Util.parseInt(res[2]),
        );
        year = dt.year;
        month = dt.month;
        date = dt.day;
      }
    }
    sex = Util.parseInt(json['sex']);

    Session.setValues({
      'name': name,
      'icon': icon,
      'tmp_icon': tmpIcon,
      'sign': sign,
      'birthday': birthday,
      'sex': sex,
    });

    showGsPhotoUpload = Util.parseBool(json['show_gs_photo_upload']);
    if (json['business_card'] is Map) {
      stature = Util.parseInt(json['business_card']['stature']);
      weight = Util.parseInt(json['business_card']['weight']);
      externalName = Util.parseStr(json['business_card']['external_name']);
      externalPhotoUpload =
          Util.parseBool(json['business_card']['external_photo_upload']);
    }

    if (json['sex_info'] is Map) {
      sexInfo = json['sex_info'];
    }

    inVerify = icon.isNotEmpty && tmpIcon.isNotEmpty;
    photos.clear();
    if (json['photos'] is List) {
      for (var value in (json['photos'] as List)) {
        if (value is Map) {
          photos.add(ModifyPhoto.fromJson(value));
        }
      }
    }
    String firstIcon = tmpIcon.isNotEmpty ? tmpIcon : icon;
    if (firstIcon.isNotEmpty) {
      headerPhoto = ModifyPhoto.icon(
        firstIcon,
        Util.parseInt(json['header']),
      );
    }
    currentPhotoNum = photos.length;
    if (photos.length < MAX_PHOTO_NUM) {
      photos.add(ModifyPhoto.empty());
    }

    if (json['card'] is Map) {
      cardInfo = ChatMatchItem.fromJson(json['card']);
      if (cardInfo?.hometownCity != null &&
          cardInfo!.hometownCity!.isNotEmpty) {
        hometownCity = cardInfo!.hometownCity;
        cityCode = cardInfo!.hometownCityCode;
      }
    }

    if (json['tags'] is List) {
      tags = Util.parseList(json['tags'], (e) => PersonalTagModel.fromJson(e));
    }
    if (json['friend_tags'] is List) {
      friendTags = Util.parseList(
          json['friend_tags'], (e) => PersonalTagModel.fromJson(e));
    }

    if (json['in_audit'] is Map) {
      inAudit = PersonalInfoInAudit.fromJson(json['in_audit']);
    }

    dynamicHeader = Util.parseInt(json['dynamic_header']);
  }

  /// 动态头像权限： 1 - 没有； 2 - 有
  bool get hasDynamicHeader {
    return dynamicHeader == 2;
  }

  void initReadSession() {
    name = Session.getString('name', '');
    sign = Session.getString('sign', '');
    sex = Session.sex;
    birthday = Session.getString('birthday', '');
    if (birthday?.isNotEmpty == true) {
      List<String> res = birthday!.split("-");
      if (res.length == 3) {
        DateTime dt = DateTime(
          Util.parseInt(res[0]),
          Util.parseInt(res[1]),
          Util.parseInt(res[2]),
        );
        year = dt.year;
        month = dt.month;
        date = dt.day;
      }
    }

    calculateCompleteness();
  }

  int calculateCompleteness() {
    // 头像	头像+照片	20 20
    // 基础资料	昵称	5	5
    // 出生日期	5	5
    // 性别	14	14
    // 家乡	10 10
    // 职业	10 10 （职业去掉）
    // 个人信息	声音	17 17
    // 签名	10	10
    // 其它信息	个人标签	1	8
    // 交友偏好	1	8
    // 身高 1
    // 行业 1
    // 学历 1
    // 总分			100
    baseInfoCount = 0;
    peopleInfoCount = 0;
    otherInfoCount = 0;
    completenessValue = 0;

    if (null != headerPhoto) {
      completenessValue += 20;
    }
    if (name?.isNotEmpty == true) {
      baseInfoCount++;
      completenessValue += 5;
    }
    if (birthday?.isNotEmpty == true) {
      baseInfoCount++;
      completenessValue += 5;
    }
    if (sex == 1 || sex == 2) {
      baseInfoCount++;
      completenessValue += 14;
    }
    if (cardInfo?.hometownCity != null &&
        cardInfo?.hometownCity!.isNotEmpty == true) {
      baseInfoCount++;
      completenessValue += 10;
    }

    if (cardInfo?.audio != null && cardInfo?.audio!.isNotEmpty == true) {
      peopleInfoCount++;
      completenessValue += 17;
    }
    if (sign?.isNotEmpty == true) {
      peopleInfoCount++;
      completenessValue += 10;
    }

    if (tags.isNotEmpty) {
      otherInfoCount++;
      completenessValue += tags.length;
    }

    if (friendTags.isNotEmpty) {
      otherInfoCount++;
      completenessValue += friendTags.length;
    }

    if (cardInfo != null && cardInfo!.height > 0) {
      otherInfoCount++;
      completenessValue += 1;
    }
    if (cardInfo != null && !Util.isNullOrEmpty(cardInfo!.industry)) {
      otherInfoCount++;
      completenessValue += 1;
    }
    if (cardInfo != null && !Util.isNullOrEmpty(cardInfo!.education)) {
      otherInfoCount++;
      completenessValue += 1;
    }

    return completenessValue;
  }
}

class PersonalInfoInAudit {
  bool? userNameInAudit; // 昵称是否正在审核中
  bool? userAudioInAudit; // 声音是否正在审核中
  bool? userSignInAudit; // 签名是否正在审核中

  PersonalInfoInAudit();

  PersonalInfoInAudit.fromJson(Map json) {
    userNameInAudit = Util.parseInt(json['user_name']) == 1;
    userAudioInAudit = Util.parseInt(json['user_audio']) == 1;
    userSignInAudit = Util.parseInt(json['user_sign']) == 1;
  }
}

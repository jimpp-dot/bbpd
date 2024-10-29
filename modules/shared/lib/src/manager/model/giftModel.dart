import 'package:shared/shared.dart';
import 'package:shared/model/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'giftModel.g.dart';

@JsonSerializable()
class Gift {
  @JsonKey(fromJson: Util.parseInt)
  final int id;

  final String? name;

  @JsonKey(fromJson: Util.parseInt)
  final int isnaming; // 是否命名

  @JsonKey(fromJson: Util.parseDouble)
  final double price;

  @JsonKey(fromJson: Util.parseInt)
  final int title;

  @JsonKey(name: 'gift_type', defaultValue: 'normal')
  final String? giftType; // 普通礼物：normal  金币礼物：coin  金豆礼物: bean

  @JsonKey(name: 'tag_url')
  final String? tagUrl; // 礼物标签url

  @JsonKey(fromJson: Util.parseInt)
  final int cid;

  final String? ctype;
  @JsonKey(fromJson: Util.parseInt)
  final int cnum;

  @JsonKey(name: 'duction_money', fromJson: Util.parseInt)
  final int ductionMoney;

  @JsonKey(name: 'only_newpay', fromJson: Util.parseInt)
  final int onlyNewPay;

  @JsonKey(fromJson: Util.parseInt)
  final int state;

  @JsonKey(fromJson: Util.parseInt)
  final int star;

  @JsonKey(name: 'tag_list')
  final List<GiftTag?>? tagList;

  @JsonKey(name: 'jump_page')
  final String? jumpPage;

  @JsonKey(name: 'grant_way')
  final String? grantWay; // 发放方式 vip 等级 title 爵位， follow关注xx星球, recall召回

  @JsonKey(name: 'grant_limit')
  final String? grantLimit;

  @JsonKey(name: 'grant_limit_range')
  final String? grantLimitRange;

  @JsonKey(name: 'tag_ids')
  final String? tagIds;

  @JsonKey(name: 'grant_limit_from', fromJson: Util.parseInt)
  final int grantLimitFrom;

  @JsonKey(name: 'grant_limit_to', fromJson: Util.parseInt)
  final int grantLimitTo;

  @JsonKey(name: 'grant_limit_icon')
  final String? grantLimitIcon;

  @JsonKey(name: 'grant_status', defaultValue: 'unlock')
  final String? grantStatus; // lock锁定， unlock解锁

  @JsonKey(fromJson: Util.parseInt)
  final int num;

  final String? description;

  @JsonKey(name: 'skin')
  final GiftSkinModel? giftSkin; // 礼物皮肤

  @JsonKey(name: 'is_combo', fromJson: Util.parseInt)
  final int isCombo; // 是否支持连击

  @JsonKey(name: 'unlock_tips')
  final String? unlockTips;

  @JsonKey(name: 'jump_tips')
  final String? jumpTips; // 跳转按钮名称

  @JsonKey(name: 'onmic_duration')
  final int micDuration; //赠送后增加的在麦时间

  final String? icon;

  @JsonKey(name: 'close_hit')
  final bool closeHit; //关闭礼物连击  默认开启

  @JsonKey(name: 'period_end_desc')
  final String? periodDesc;

  @JsonKey(name: 'pub_red_packet', fromJson: Util.parseBool)
  final bool isPubRedPacket; //是否为夜店红包礼物

  @JsonKey(name: 'icon_num')
  final int iconNum;

  /// DIY 礼物支持选择几个头像

  @JsonKey(name: 'diy_list')
  List<Gift?>? diyGift;

  @JsonKey(name: 'default_index')
  int diyDefaultIndex;

  @JsonKey(name: 'diy_preview_size')
  final int diyPreviewSize;

  @JsonKey(name: 'diy_bg_size')
  final int diyBgSize;

  @JsonKey(name: 'diy_bg')
  final String? diyBg;

  @JsonKey(name: 'lucky_egg_info')
  final List<Map<String, dynamic>>? luckyEggInfo;

  @JsonKey(name: 'gift_right_desc')
  final List<Map<String, dynamic>>? giftRightDesc;

  @JsonKey(name: 'only_for_uname')
  final String? richManName; // 大R 冠名

  @JsonKey(name: 'only_for_uid')
  final int richManUid; // 大R 冠名 uid

  /// 礼物价格
  int get giftPrice {
    if (giftType == 'coin') {
      return Util.parseInt(price);
    }
    return Util.parseInt(price * 100);
  }

  Gift(
    this.id,
    this.name,
    this.isnaming,
    this.price,
    this.title,
    this.giftType,
    this.tagUrl,
    this.cid,
    this.ctype,
    this.cnum,
    this.ductionMoney,
    this.onlyNewPay,
    this.state,
    this.star,
    this.tagList,
    this.jumpPage,
    this.grantWay,
    this.grantLimit,
    this.grantLimitRange,
    this.tagIds,
    this.grantLimitFrom,
    this.grantLimitTo,
    this.grantStatus,
    this.grantLimitIcon,
    this.num,
    this.description,
    this.giftSkin,
    this.isCombo,
    this.unlockTips,
    this.jumpTips,
    this.micDuration,
    this.icon,
    this.closeHit,
    this.periodDesc,
    this.isPubRedPacket,
    this.diyGift,
    this.diyDefaultIndex,
    this.iconNum,
    this.diyBg,
    this.diyBgSize,
    this.diyPreviewSize,
    this.luckyEggInfo,
    this.giftRightDesc,
    this.richManName,
    this.richManUid,
  );

  factory Gift.fromJson(Map<String, dynamic> json) => _$GiftFromJson(json);

  String get giftIcon {
    return Util.validStr(icon) ? Util.parseIcon(icon) : Util.giftImgUrl(id);
  }

  bool get isLocked {
    return grantStatus == 'lock';
  }

  bool get isVipGift {
    return grantWay == 'vip';
  }

  bool get isTitleGift {
    return grantWay == 'title';
  }

  bool get isKaGift {
    return grantWay == 'ka';
  }

  bool get isKnightGift {
    return grantWay == 'knight-radio';
  }

  String get privilegeIcon {
    return grantLimitIcon ?? '';
  }

  bool get showTips {
    return (grantWay != null || (jumpPage != null && jumpPage!.isNotEmpty)) &&
        isLocked;
  }

  bool get showGiftSkin {
    return giftSkin != null;
  }

  bool get isDiyGift {
    return diyGift != null && diyGift!.isNotEmpty;
  }

  bool get showRichManTag {
    return !Util.isStringEmpty(richManName);
  }

  Gift copyWithDiy(List<Gift?> diyGiftList, int defaultIndex) {
    return Gift(
      id,
      name,
      isnaming,
      price,
      title,
      giftType,
      tagUrl,
      cid,
      ctype,
      cnum,
      ductionMoney,
      onlyNewPay,
      state,
      star,
      tagList,
      jumpPage,
      grantWay,
      grantLimit,
      grantLimitRange,
      tagIds,
      grantLimitFrom,
      grantLimitTo,
      grantStatus,
      grantLimitIcon,
      num,
      description,
      giftSkin,
      isCombo,
      unlockTips,
      jumpTips,
      micDuration,
      icon,
      closeHit,
      periodDesc,
      isPubRedPacket,
      diyGiftList,
      defaultIndex,
      iconNum,
      diyBg,
      diyBgSize,
      diyPreviewSize,
      luckyEggInfo,
      giftRightDesc,
      richManName,
      richManUid,
    );
  }
}

@JsonSerializable()
class GiftTag {
  final String? id;
  final String? name;
  final String? icon;
  final String? remark;

  GiftTag(this.id, this.name, this.icon, this.remark);

  factory GiftTag.fromJson(Map<String, dynamic> json) =>
      _$GiftTagFromJson(json);
}

class GiftListRepository {
  static Future<DataRsp<List<Gift>>> getGiftList() async {
    String url = '${System.domain}screen/gift';
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<List<Gift>>.fromXhrResponse(
        response,
        (object) => Util.parseList(object, (e) => Gift.fromJson(e)),
      );
    } catch (e) {
      return DataRsp<List<Gift>>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }
}

class SelectGiftInfo {
  int num;
  int id;
  String name;
  int price;

  SelectGiftInfo(this.num, this.id, this.name, this.price);
}

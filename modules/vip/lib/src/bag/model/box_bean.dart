import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';

part 'box_bean.g.dart';

/// 箱子数据
@JsonSerializable()
class BoxBean {
  final bool success;
  @JsonKey(fromJson: Util.parseInt)
  final int star;
  @JsonKey(name: 'curmoney', fromJson: Util.parseInt)
  final int money; // 当前账户金额
  @JsonKey(name: 'gold_coin', fromJson: Util.parseInt)
  final int goldCoin; // 当前账户金币数
  @JsonKey(fromJson: Util.parseInt)
  final int maxNum; // 一次最大开箱子数量
  @JsonKey(fromJson: Util.parseInt)
  final int boxNum; // 箱子数量
  @JsonKey(fromJson: Util.parseInt)
  final int keyNum; // 钥匙数量
  final String company;
  @JsonKey(fromJson: Util.parseInt)
  final int showBuyHeader;
  @JsonKey(fromJson: Util.parseInt)
  final int openBoxUseMoney;
  @JsonKey(name: 'next_refresh_seconds', fromJson: Util.parseInt)
  final int nextRefreshSeconds; // 下一次刷新商品的时间，单位秒
  @JsonKey(name: 'data')
  final BoxContent? content;
  final BoxScreen? screen;

  // final BoxCoupon coupon;

  BoxBean(
    this.success,
    this.star,
    this.money,
    this.goldCoin,
    this.maxNum,
    this.boxNum,
    this.keyNum,
    this.company,
    this.showBuyHeader,
    this.openBoxUseMoney,
    this.nextRefreshSeconds,
    this.content,
    this.screen,
  );

  factory BoxBean.fromJson(Map<String, dynamic> json) =>
      _$BoxBeanFromJson(json);

  Map<String, dynamic> toJson() => _$BoxBeanToJson(this);
}

@JsonSerializable()
class BoxContent {
  @JsonKey(fromJson: Util.parseInt)
  final int cid;
  final String name;
  @JsonKey(name: 'name_group')
  final String nameGroup;
  @JsonKey(name: 'name_series')
  final String nameSeries;
  @JsonKey(name: 'name_zh_tw')
  final String nameZhTw;
  @JsonKey(name: 'name_en')
  final String nameEn;

  // type": "gift",
  // sub_type": "",
  final String description; // 人生为了快乐而存在，我的快乐源泉就是你我的快乐源泉就是你的快乐源泉就是你",
  // price": "334400",
  @JsonKey(name: 'image')
  final String image; // "static/commodity/c19103115123622.png",
  @JsonKey(name: 'image_bg')
  final String imageBg; // "202010/30/5f9bb3442e3df5.53169716.png",

  BoxContent(this.cid, this.name, this.nameGroup, this.nameSeries,
      this.nameZhTw, this.nameEn, this.description, this.image, this.imageBg);

  factory BoxContent.fromJson(Map<String, dynamic> json) =>
      _$BoxContentFromJson(json);

  Map<String, dynamic> toJson() => _$BoxContentToJson(this);
}

@JsonSerializable()
class BoxScreen {
  final String id;
  @JsonKey(fromJson: Util.parseInt)
  final int uid;
  @JsonKey(name: 'app_id', fromJson: Util.parseInt)
  final int appId;
  final String type;
  @JsonKey(name: 'open_num', fromJson: Util.parseInt)
  final int openNum;
  @JsonKey(fromJson: Util.parseInt)
  final int cid;
  @JsonKey(fromJson: Util.parseInt)
  final int cnum;
  final String cimage; // static/commodity/c19103115033632.png
  final String dateline;
  @JsonKey(fromJson: Util.parseInt)
  final int rid;
  final String name;
  final String icon; // 201809/16/5b9d99f9808313.47713782.jpg
  final String time;

  BoxScreen(
      this.id,
      this.uid,
      this.appId,
      this.type,
      this.openNum,
      this.cid,
      this.cnum,
      this.cimage,
      this.dateline,
      this.rid,
      this.name,
      this.icon,
      this.time); // 1天前

  factory BoxScreen.fromJson(Map<String, dynamic> json) =>
      _$BoxScreenFromJson(json);

  Map<String, dynamic> toJson() => _$BoxScreenToJson(this);
}

import 'package:shared/shared.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moment/moment.dart';

part 'moment_bean_v3.g.dart';

class MomentPageV3 {
  final int next; // 翻页topic id
  final List<MomentFollowItemBean> items;

  MomentPageV3(this.next, this.items);

  MomentPageV3.fromJson(Map<String, dynamic> json)
      : next = Util.parseInt(json['next']),
        items = Util.parseList(
            json['output'], (e) => MomentFollowItemBean.fromJson(e));

  bool get hasMore {
    return next != 0;
  }
}

/// 首页展示数据类型
enum MomentFollowItemType {
  Unknown,
  Circle, // 动态
  Activity, // 运营活动
  Broadcast, // 全局广播
  Wedding, // 婚礼动态
}

class MomentFollowItemBean {
  MomentFollowItemType type = MomentFollowItemType.Unknown;
  Moment? circleItemData;
  FollowActivityBean? activityBean;

  //下面为统计相关
  //是否已曝光
  bool isExposure = false;
  int exposureId = 0;

  //下面为统计相关

  MomentFollowItemBean({
    required this.type,
    this.circleItemData,
    this.activityBean,
    this.isExposure = false,
    this.exposureId = 0,
  });

  MomentFollowItemBean.fromJson(Map<String, dynamic> json) {
    isExposure = false;
    type = _getType(json['type']);
    if (json['info'] != null && json['info'] is Map) {
      if (MomentFollowItemType.Circle == type ||
          MomentFollowItemType.Broadcast == type) {
        circleItemData = Moment.fromJson(json['info']);
        exposureId = circleItemData!.topicId;
      } else if (MomentFollowItemType.Activity == type) {
        activityBean = FollowActivityBean.fromJson(json['info']);
        exposureId = activityBean!.activityId;
      }
    }
  }

  MomentFollowItemType _getType(String type) {
    if (type == 'circle') {
      return MomentFollowItemType.Circle;
    } else if (type == 'broadcast') {
      return MomentFollowItemType.Broadcast;
    } else if (type == 'activity') {
      return MomentFollowItemType.Activity;
    }

    return MomentFollowItemType.Unknown;
  }
}

/// 首页展示数据类型
enum MomentFollowActivityType {
  Unknown,
  User, // 用户卡片
  Love, // 真爱卡片
  OpenBox, //礼包开箱
  GetDiamond, // 幸运礼物
}

//活动卡片
class FollowActivityBean {
  int activityId = 0; //唯一id//曝光使用
  int uid = 0;
  String? name;
  int? time;
  String? icon;
  int official = 0; //1.官方
  String? content;
  MomentFollowActivityType type = MomentFollowActivityType.Unknown;
  FollowActivityUserItem? followActivityUserItem;
  FollowActivityLoveItem? followActivityLoveItem;

  FollowActivityBean.fromJson(Map<String, dynamic> json) {
    activityId = Util.parseInt(json['activityId']);
    uid = Util.parseInt(json['uid']);
    name = Util.parseStr(json['name']);
    time = Util.parseInt(json['time']);
    icon = Util.parseStr(json['icon']);
    official = Util.parseInt(json['official']);
    content = Util.parseStr(json['content']);
    type = _getType(json['type']);
    if (json['info'] != null) {
      if (MomentFollowActivityType.User == type ||
          MomentFollowActivityType.OpenBox == type ||
          MomentFollowActivityType.GetDiamond == type) {
        followActivityUserItem = FollowActivityUserItem.fromJson(json['info']);
      } else if (MomentFollowActivityType.Love == type) {
        followActivityLoveItem = FollowActivityLoveItem.fromJson(json['info']);
      }
    }
  }

  MomentFollowActivityType _getType(String type) {
    if (type == 'user') {
      return MomentFollowActivityType.User;
    } else if (type == 'love') {
      return MomentFollowActivityType.Love;
    } else if (type == 'open_box') {
      return MomentFollowActivityType.OpenBox;
    } else if (type == 'get_diamond') {
      return MomentFollowActivityType.GetDiamond;
    }

    return MomentFollowActivityType.Unknown;
  }
}

//活动-用户卡片
@JsonSerializable()
class FollowActivityUserItem {
  int uid;
  String name;
  String icon;
  int sex;
  int age;
  String mark;

  //宝箱礼物相关
  String cicon;
  int cid;
  String cname;
  int cnum;

  //幸运礼物
  @JsonKey(name: 'diamond_num')
  int diamondNum;

  FollowActivityUserItem(
    this.uid,
    this.name,
    this.icon,
    this.sex,
    this.age,
    this.mark,
    this.cicon,
    this.cid,
    this.cname,
    this.cnum,
    this.diamondNum,
  );

  factory FollowActivityUserItem.fromJson(Map<String, dynamic> json) =>
      _$FollowActivityUserItemFromJson(json);

  Map<String, dynamic> toJson() => _$FollowActivityUserItemToJson(this);
}

//活动-真爱榜卡片
@JsonSerializable()
class FollowActivityLoveItem {
  String name;
  String icon;
  int vip;
  int title; //爵位
  @JsonKey(name: 'title_new')
  int titleNew;
  String toName;
  String toIcon;
  int toVip;
  int giftId;
  int dateLine;
  String roomTitle;

  FollowActivityLoveItem(
      this.name,
      this.icon,
      this.vip,
      this.title,
      this.titleNew,
      this.toName,
      this.toIcon,
      this.toVip,
      this.giftId,
      this.dateLine,
      this.roomTitle);

  factory FollowActivityLoveItem.fromJson(Map<String, dynamic> json) =>
      _$FollowActivityLoveItemFromJson(json);

  Map<String, dynamic> toJson() => _$FollowActivityLoveItemToJson(this);
}

import 'package:chat_room/k.dart';
import 'package:chat_room/assets.dart';

mixin MoreMenuMixin {
  MoreMenu menu();

  int get priority => menu().priority();

  String get title => menu().getTitle();

  String get iconPath => menu().iconPath();
}

/// 房间右下角的入口
/// tip: 增加枚举，需要实现MoreMenuExt对应方法.
/// 后续新增时注意分类及顺序 by 2023.2.6. 产品：moana
/// https://docs.google.com/document/d/195qG6jX5Y5NkKtiWXuyHo7hXuxGaJhqw10HcuLT3how/edit#
enum MoreMenu {
  /// I类-互动玩法（枚举顺序即为显示顺序）
  RoomParking, // 房间车位
  PetFamily, // 宠物家园
  InvisibleMan, // 隐形侠
  FerrisWheel, // 摩天轮
  RichMan, // 大富翁
  dance, // 与TA共舞
  prettyId, // 靓号
  constellation, // 点亮星座
  luckyMine, // 寻宝挖矿
  HeartPass, // 心动闯关
  GrabHat, // 抢帽子

  /// ----------  分割线（I类-互动玩法）  ----------

  /// II类-房间工具（枚举顺序即为显示顺序）
  activity, // 活动中心
  ActivityCenter, // 新活动中心（汇聚）
  BirthdayParty, // 生日派对
  Bonus, // 红包
  GifPic, // 红包相册
  LoversPk, // 情侣PK
  CrossPK, // 约战
  GroupPk, // 分组PK(团战)
  Vote, // 投票
  LotteryPublic, // 公屏抽奖
  TopicEntry, // 房间话题
  OpenSpecialEffect, // 开启房间特效
  CloseSpecialEffect, // 关闭房间特效
  ShareFromBottom, // 底部工具栏位置不够 移进来的分享入口
  ChatFromBottom, // 底部工具栏位置不够 移进来的消息入口
  Drainage, // 创建小房

  /// ----------  分割线（II类-房间工具）  ----------

  /// III类-功能（枚举顺序即为显示顺序）
  Mystery, // 神秘人(App全局的，非神秘人房间玩法里面的)
  VisitantRank, // 贵宾榜
  NewUseRank, // 新人榜
  WeekStar, // 周星榜
  HeartRaceRank, // 心动榜
  ShareRoom, // 推送房间
  AnchorTaskCenter, // 主播任务中心
  UserTransfer, // 已转化
  DigitBomb, // 数字炸弹
  RiskWheel, // 大冒险
  PoorFish, // 倒霉蛋
  Intimate, // 亲密互动
  Order, // 召唤
  Confession, // 表白
  ConfessV2, // 恋爱旅行（表白活动v2）
  Accompany, // 1+1私聊
  BuyHot, // 购买房间热度

  /// ----------  分割线（III类-功能）  ----------

  /// 服务端下发自定义类型（name、icon、url均由服务端下发）。此类型在上述三大类的末尾（产品：菜子）
  Custom,

  ///已废弃
  PlayGameList, // 房间玩法入口（一起玩的更多按钮替代）
}

extension MoreMenuExt on MoreMenu {
  String getTitle() {
    switch (this) {
      case MoreMenu.GifPic:
        return K.room_gift_album;
      case MoreMenu.Bonus:
        return K.room_bonus;
      case MoreMenu.TopicEntry:
        return K.room_topic;
      case MoreMenu.GroupPk:
        return K.room_group_pk;
      case MoreMenu.ShareRoom:
        return K.room_push_room;
      case MoreMenu.RiskWheel:
        return K.room_risk_wheel;
      case MoreMenu.UserTransfer:
        return K.room_new_user_transfer;
      case MoreMenu.DigitBomb:
        return K.digit_bomb;
      case MoreMenu.PoorFish:
        return K.i_am_poor_fish;
      case MoreMenu.LotteryPublic:
        return K.room_lottery_public_screen;
      case MoreMenu.FerrisWheel:
        return K.room_more_ferris_wheel;
      case MoreMenu.ChatFromBottom:
        return K.room_more_op_chat;
      case MoreMenu.ShareFromBottom:
        return K.share;
      case MoreMenu.HeartPass:
        return K.room_heart_pass;
      case MoreMenu.CrossPK:
        return K.room_cross_pk;
      case MoreMenu.Vote:
        return K.vote;
      case MoreMenu.NewUseRank:
        return K.room_new_user_Rank;
      case MoreMenu.VisitantRank:
        return K.room_visitant_rank;
      case MoreMenu.PlayGameList:
        return K.room_play_games_list;
      case MoreMenu.Intimate:
        return K.room_more_menu_title_intimate;
      case MoreMenu.Order:
        return K.room_more_menu_title_ambassador;
      case MoreMenu.Confession:
        return K.room_more_menu_title_vindicate;
      case MoreMenu.ConfessV2:
        return K.room_love_travel;
      case MoreMenu.WeekStar:
        return K.room_more_menu_title_weakly_star_list;
      case MoreMenu.AnchorTaskCenter:
        return K.room_anchor_task;
      case MoreMenu.HeartRaceRank:
        return K.room_more_menu_title_heart_race;
      case MoreMenu.BuyHot:
        return K.room_hot;
      case MoreMenu.RichMan:
        return K.room_rich_man;
      case MoreMenu.luckyMine:
        return K.room_bottom_menu_lucky_mine;
      case MoreMenu.dance:
        return K.room_bottom_menu_dance;
      case MoreMenu.activity:
        return K.room_bottom_menu_activity;
      case MoreMenu.RoomParking:
        return K.room_bottom_parking;
      case MoreMenu.prettyId:
        return K.room_pretty_id;
      case MoreMenu.Mystery:
        return K.room_mystery;
      case MoreMenu.OpenSpecialEffect:
        return K.room_open_special_effect;
      case MoreMenu.CloseSpecialEffect:
        return K.room_close_special_effect;
      case MoreMenu.PetFamily:
        return K.room_bottom_pet_family;
      case MoreMenu.ActivityCenter:
        return K.room_bottom_menu_activity;
      case MoreMenu.constellation:
        return K.room_menu_light_constellation;
      case MoreMenu.Accompany:
        return K.room_menu_accompany;
      case MoreMenu.BirthdayParty:
        return K.room_menu_birthday_party;
      case MoreMenu.InvisibleMan:
        return K.room_menu_invisible_man;
      case MoreMenu.LoversPk:
        return K.room_menu_lovers_pk;
      case MoreMenu.Drainage:
        return K.room_menu_create_relative_room;
      case MoreMenu.GrabHat:
        return K.room_grab_hat;
      default:
        return '';
    }
  }

  String iconPath() {
    switch (this) {
      case MoreMenu.GifPic:
        return RoomAssets.chat_room$controller_ic_redpacket_entry_webp;
      case MoreMenu.Bonus:
        return RoomAssets.chat_room$controller_ic_room_bonus_entry_webp;
      case MoreMenu.TopicEntry:
        return RoomAssets.chat_room$room_topic_vote_ic_png;
      case MoreMenu.GroupPk:
        return RoomAssets.chat_room$gpk_gpk_ic_entry_webp;
      case MoreMenu.ShareRoom:
        return RoomAssets.chat_room$ic_push_room_png;
      case MoreMenu.RiskWheel:
        return RoomAssets.chat_room$riskwheel_room_riskwheel_small_webp;
      case MoreMenu.NewUseRank:
        return RoomAssets.chat_room$ic_new_user_rank_webp;
      case MoreMenu.DigitBomb:
        return RoomAssets.chat_room$ic_new_user_rank_webp;
      case MoreMenu.PoorFish:
        return RoomAssets.chat_room$bomb_poor_fish_webp;
      case MoreMenu.LotteryPublic:
        return RoomAssets.chat_room$lottery_public_screen_webp;
      case MoreMenu.FerrisWheel:
        return RoomAssets.chat_room$ic_ferris_wheel_webp;
      case MoreMenu.ChatFromBottom:
        return RoomAssets.chat_room$room_more_op_chat_webp;
      case MoreMenu.ShareFromBottom:
        return RoomAssets.chat_room$room_more_op_share_webp;
      case MoreMenu.HeartPass:
        return RoomAssets.chat_room$heartpass_ic_entrance_png;
      case MoreMenu.CrossPK:
        return RoomAssets.chat_room$crosspk_ic_entrance_webp;
      case MoreMenu.Vote:
        return RoomAssets.chat_room$vote_ic_vote_png;
      case MoreMenu.UserTransfer:
        return RoomAssets.chat_room$ic_user_transfer_webp;
      case MoreMenu.VisitantRank:
        return RoomAssets.chat_room$ic_room_visitant_rank_webp;
      case MoreMenu.PlayGameList:
        return RoomAssets.chat_room$room_ic_play_list_label_png;
      case MoreMenu.Intimate:
        return RoomAssets.chat_room$controller_ic_intimate_in_menu_webp;
      case MoreMenu.Order:
        return RoomAssets.chat_room$controller_ic_order_in_menu_webp;
      case MoreMenu.Confession:
        return RoomAssets.chat_room$controller_ic_vindicate_in_menu_webp;
      case MoreMenu.ConfessV2:
        return RoomAssets.chat_room$confess_v2_ic_love_webp;
      case MoreMenu.WeekStar:
        return RoomAssets.chat_room$controller_ic_weekly_star_list_in_menu_webp;
      case MoreMenu.AnchorTaskCenter:
        return RoomAssets.chat_room$controller_ic_gs_task_webp;
      case MoreMenu.HeartRaceRank:
        return RoomAssets.chat_room$controller_ic_heart_race_rank_webp;
      case MoreMenu.BuyHot:
        return RoomAssets.chat_room$controller_ic_hot_webp;
      case MoreMenu.RichMan:
        return RoomAssets.chat_room$controller_ic_menu_rich_man_webp;
      case MoreMenu.luckyMine:
        return RoomAssets.chat_room$controller_ic_gold_miner_more_menu_webp;
      case MoreMenu.dance:
        return RoomAssets.chat_room$ic_dance_webp;
      case MoreMenu.activity:
        return RoomAssets.chat_room$bottom_menu_ic_activity_webp;
      case MoreMenu.prettyId:
        return RoomAssets.chat_room$pretty_id_pretty_id_sell_entrance_webp;
      case MoreMenu.Mystery:
        return RoomAssets.chat_room$controller_ic_menu_mystery_webp;
      case MoreMenu.OpenSpecialEffect:
        return RoomAssets.chat_room$room_more_close_room_special_effect_webp;
      case MoreMenu.CloseSpecialEffect:
        return RoomAssets.chat_room$room_more_open_room_special_effect_webp;
      case MoreMenu.ActivityCenter:
        return RoomAssets.chat_room$controller_ic_menu_activity_center_webp;
      case MoreMenu.constellation:
        return RoomAssets.chat_room$controller_ic_light_constellation_webp;
      case MoreMenu.Accompany:
        return RoomAssets.chat_room$controller_ic_menu_accompany_webp;
      case MoreMenu.BirthdayParty:
        return RoomAssets.chat_room$birthday_housekeeper_bottom_menu_birthday_party_webp;
      case MoreMenu.InvisibleMan:
        return RoomAssets.chat_room$bottom_menu_ic_invisible_man_webp;
      case MoreMenu.LoversPk:
        return RoomAssets.chat_room$bottom_menu_ic_lovers_pk_webp;
      case MoreMenu.Drainage:
        return RoomAssets.chat_room$bottom_menu_ic_xiaofang_webp;
      case MoreMenu.GrabHat:
        return RoomAssets.chat_room$grab_hat_ic_hat_enter_webp;
      default:
        return '';
    }
  }

  /// 更多按钮的权重，值越小，越靠前
  int priority() {
    return (index + 1);
  }
}

class MoreMenuItem with MoreMenuMixin {
  MoreMenu moreMenu;
  String url; // h5跳转链接，或者通用跳转链接
  String? name;
  String? icon;
  String? type;
  Map<String, dynamic>? extra;

  MoreMenuItem(this.moreMenu, {this.url = '', this.name, this.icon, this.type, this.extra});

  @override
  MoreMenu menu() {
    return moreMenu;
  }

  @override
  String get title {
    if (moreMenu == MoreMenu.Custom) {
      return name ?? '';
    }
    return menu().getTitle();
  }

  @override
  String get iconPath {
    if (moreMenu == MoreMenu.Custom) {
      return icon ?? '';
    }
    return menu().iconPath();
  }

  bool get inUse {
    if (extra?.containsKey('in_use') ?? false) {
      return extra?['in_use'] ?? false;
    }
    return false;
  }
}

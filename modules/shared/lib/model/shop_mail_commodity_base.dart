import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

enum ShopMailCommodityType {
  Frame, // 头像框
  Bubble, // 聊天气泡
  Decorate, // 装扮
  EnterEffect, // 入场特效
  MicrophoneEffect, // 麦上光圈
  Mounts, // 入场座驾
  Defend, // 守护
  RadioDefend, // 电台守护
  Title, // 爵位
  Coupon, // 优惠券
  Gift, // 礼物
  Box, // 箱子
  Key, // xxx类型
  Piece, // 碎片
  RoomBackground, // 房间背景
  GameTicket, // 赛事门票
  BroadcastTicket, // 喊话卡
  VisitorBook, //访客记录本
  GamesBox, //充值礼包中的宝箱
  Pearl, //珍珠
  TreasureTicket, //夺宝卷
  TreasureCrystal, //珍稀水晶
  GuideCard, //导游卡
  DummyHonor, // 成就
  DummyMedal, // 名牌
  Trumpet, // 千里传音
  PrettyCard, // cp靓号卡
  GameCard, // 玩伴卡
  BubbleTail, // 聊天尾灯
  CardDecorate, // 卡片装扮
  DummyPretty, // 靓号卡
  RoomListDecorate, // 皮队友厅列表装扮
  MysteryCard, // 神秘人体验卡道具
  Unknown,
}

ShopMailCommodityType formatGoodsType(String? type) {
  switch (type) {
    case 'header':
      return ShopMailCommodityType.Frame;
    case 'bubble':
      return ShopMailCommodityType.Bubble;
    case 'decorate':
      return ShopMailCommodityType.Decorate;
    case 'effect':
      return ShopMailCommodityType.EnterEffect;
    case 'ring':
      return ShopMailCommodityType.MicrophoneEffect;
    case 'mounts':
      return ShopMailCommodityType.Mounts;
    case 'defend':
      return ShopMailCommodityType.Defend;
    case 'radio-defend':
      return ShopMailCommodityType.RadioDefend;
    case 'title':
      return ShopMailCommodityType.Title;
    case 'coupon':
      return ShopMailCommodityType.Coupon;
    case 'gift':
      return ShopMailCommodityType.Gift;
    case 'box':
      return ShopMailCommodityType.Box;
    case 'key':
      return ShopMailCommodityType.Key;
    case 'piece':
      return ShopMailCommodityType.Piece;
    case 'room_background':
      return ShopMailCommodityType.RoomBackground;
    case 'game_ticket':
      return ShopMailCommodityType.GameTicket;
    case 'broadcast_ticket':
      return ShopMailCommodityType.BroadcastTicket;
    case 'visitor_book':
      return ShopMailCommodityType.VisitorBook;
    case 'games_box':
      return ShopMailCommodityType.GamesBox;
    case 'pearl':
      return ShopMailCommodityType.Pearl;
    case 'treasure_ticket':
      return ShopMailCommodityType.TreasureTicket;
    case 'treasure_crystal':
      return ShopMailCommodityType.TreasureCrystal;
    case 'guide_card':
      return ShopMailCommodityType.GuideCard;
    case 'dummy_honor':

      /// 需要另外确定成就勋章的type字段
      return ShopMailCommodityType.DummyHonor;
    case "dummy_medal":
      return ShopMailCommodityType.DummyMedal;
    case "trumpet":
      return ShopMailCommodityType.Trumpet;
    // case "prop_mate":
    //   return ShopMailCommodityType.prop_mate;
    case "pretty_card":
      return ShopMailCommodityType.PrettyCard;
    case 'game_card':
      return ShopMailCommodityType.GameCard;
    case 'bubble_tail':
      return ShopMailCommodityType.BubbleTail;
    case 'card_decorate':
      return ShopMailCommodityType.CardDecorate;
    case 'dummy_pretty':
      return ShopMailCommodityType.DummyPretty;
    case 'room_list_decorate':
      return ShopMailCommodityType.RoomListDecorate;
    case 'mystery_card':
      return ShopMailCommodityType.MysteryCard;
    default:
      return ShopMailCommodityType.Unknown;
  }
}

abstract class IShopMailCommodity {
  ShopMailCommodityType get commodityType;

  String get commodityImage;

  String get commodityAvatar;

  String get commodityBubbleDesc;

  Color get commodityBubbleFontColor;

  int get commodityLiveOnly;

  String get commodityLiveLabel;
}

class SimpleShopMailCommodity extends IShopMailCommodity {
  final String? type;
  final String? image;
  final String? avatar;
  final String? bubbleDesc;
  final String? bubbleFontColor;
  final int liveOnly;
  final String? liveLabel;

  SimpleShopMailCommodity(
      {this.type,
      this.image,
      this.avatar,
      this.bubbleDesc,
      this.bubbleFontColor,
      this.liveOnly = 0,
      this.liveLabel});

  @override
  String get commodityAvatar => avatar ?? '';

  @override
  String get commodityBubbleDesc => bubbleDesc ?? '';

  @override
  Color get commodityBubbleFontColor =>
      Util.parseColor(bubbleFontColor, Colors.white)!;

  @override
  String get commodityImage => image ?? '';

  @override
  String get commodityLiveLabel => liveLabel ?? '';

  @override
  int get commodityLiveOnly => liveOnly;

  @override
  ShopMailCommodityType get commodityType => formatGoodsType(type);
}

import 'package:shared/src/libs/scheme/chat_scheme.dart';
import 'package:shared/src/libs/scheme/personaldata_shceme.dart';
import 'package:shared/src/libs/scheme/setting_scheme.dart';

import 'base_scheme.dart';
import 'gift_scheme.dart';
import 'rank_scheme.dart';
import 'room_scheme.dart';
import 'vip_scheme.dart';

class SchemeJumpMap {
  static final Map<String, BaseScheme> jumpSchemes = {
    /// 房间热度购买
    'buy_hot': RoomBuyHotScheme(),

    /// 亲密互动
    'intimate': RoomIntimateScheme(),

    /// 投票
    'vote': RoomVoteScheme(),

    /// 页面栈退回到RoomPageScreen
    'popUtilRoom': RoomPopUtilScheme(),

    /// 帽子榜单
    'hat_rank': RoomRankScheme(),

    /// 歌手榜单
    'rankSinger': SingerRankScheme(),

    /// 跳转到房间页面并打开礼物面板定位到指定礼物
    'room_with_gift_panel': RoomGiftPanelScheme(),

    /// 座驾系列-碎片背包
    'openMountPieceBagPage': MountPieceBagScheme(),

    /// 座驾系列-我的座驾
    'my_mount': MyMountScheme(),

    /// 聊天快捷回复分组页
    'chat_quick_reply_group': QuickReplyGroupScheme(),

    /// 恋爱旅行（表白玩法v2）
    'confess_v2': ConfessV2Scheme(),

    /// 隐形侠
    'invisible_man': InvisibleManScheme(),

    /// 甜蜜相册房间半弹层主操作面板
    'sweet_album_main_panel': SweetAlbumMainPanelScheme(),

    /// 印象标签房间半弹层主操作面板
    'impress_tag': ImpressTagMainPanelScheme(),

    /// 跳转到房间页面并打开全服喇叭面板选中指定喇叭
    'room_with_horn_panel': RoomHornPanelScheme(),

    /// 打开房间礼物红包面板
    'room_gift_red_packet': RoomGiftRedPacketScheme(),

    /// 打开星座拍拍主弹窗
    'constellation_clap_main_dialog': ConstellationClapMainScheme(),

    /// 打开星座拍拍结果弹窗
    'constellation_clap_result_dialog': ConstellationClapResultScheme(),

    /// 限时充值活动礼包
    'recharge_activity_dialog': SettingRechargeActivityScheme(),

    /// 主播推荐
    "god_recommend_page": GodRecommendScheme(),

    /// 聊愈师列表
    "healer_main": HealerMainScheme(),
  };
}

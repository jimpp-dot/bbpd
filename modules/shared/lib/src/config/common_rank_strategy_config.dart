import 'package:shared/shared.dart';
import 'package:shared/src/config/mate_rank_strategy_cache.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../pbModel/generated/banban_rank_strategy.pb.dart';

class CommonRankStrategyConfig {
  factory CommonRankStrategyConfig() => _getInstance();

  static CommonRankStrategyConfig get instance => _getInstance();
  static CommonRankStrategyConfig? _instance;

  CommonRankStrategyConfig._internal() {
    // Log.d("可以做初始化操作");
  }

  static CommonRankStrategyConfig _getInstance() {
    _instance ??= CommonRankStrategyConfig._internal();
    return _instance!;
  }

  List<HomeRankStrategy> homeRankStrategyLists = [];

  static Future<List<HomeRankStrategy>> getRankStrategy() async {
    if (!Session.isLogined) {
      return [];
    }
    List<HomeRankStrategy> data = [];
    try {
      String url = "${System.domain}go/yy/home/rankStrategy";
      XhrResponse response = await Xhr.get(url, throwOnError: true, pb: true);
      ResHomeRankStrategy homeRankStrategy =
          ResHomeRankStrategy.fromBuffer(response.bodyBytes);
      if (homeRankStrategy.success == true &&
          homeRankStrategy.data.isNotEmpty) {
        data = homeRankStrategy.data;
        _saveCache(data);
        // for (final item in data) {
        //   Log.d('------- id:${item.id},key:${item.key},name:${item.name},hideRank:${item.hideRank},hideScore:${item.hideScore},hideList:${item.hideList}, -------');
        // }
      } else {
        data = await _readCache();
      }
    } catch (e) {
      Log.d(e.toString());
      data = await _readCache();
    }
    CommonRankStrategyConfig.instance.homeRankStrategyLists = data;

    // 如果未获取到数据，就每5s重试一次，直到获取到数据
    if (Util.isCollectionEmpty(
        CommonRankStrategyConfig.instance.homeRankStrategyLists)) {
      Future.delayed(const Duration(seconds: 5), () {
        CommonRankStrategyConfig.retryGetRankStrategy();
      });
    }
    return data;
  }

  /// 重试获取榜单配置，优先读取缓存，然后再调接口
  static void retryGetRankStrategy() async {
    if (Util.connectivityResult == ConnectivityResult.none) return;
    CommonRankStrategyConfig.instance.homeRankStrategyLists =
        await _readCache();
    CommonRankStrategyConfig.getRankStrategy();
  }

  static const int _invalidSeconds = 3 * 24 * 3600;
  static int _cacheTimeSeconds = 0;
  static List<HomeRankStrategy> _cacheList = [];
  static bool _cacheInit = false;

  static bool get _timeValid {
    int nowSeconds = DateTime.now().secondsSinceEpoch;
    return nowSeconds - _cacheTimeSeconds < _invalidSeconds;
  }

  static Future<List<HomeRankStrategy>> _readCache() async {
    await _initCache();

    if (_timeValid) {
      return _cacheList;
    } else {
      return [];
    }
  }

  static Future<void> _saveCache(List<HomeRankStrategy> list) async {
    await _initCache();

    _cacheTimeSeconds = DateTime.now().secondsSinceEpoch;
    MateRankStrategyCache.instance.cacheTime = _cacheTimeSeconds;

    _cacheList = list;
    if (!const ListEquality()
        .equals(list, MateRankStrategyCache.instance.cacheList)) {
      MateRankStrategyCache.instance.cacheList = list;
    }
  }

  static Future<void> _initCache() async {
    if (!_cacheInit) {
      await MateRankStrategyCache.instance.initCache();

      _cacheTimeSeconds = MateRankStrategyCache.instance.cacheTime;
      if (_timeValid) {
        _cacheList = MateRankStrategyCache.instance.cacheList;
      }
      _cacheInit = true;
    }
  }

  /// 是否隐藏榜单名次
  static bool getHideRankByKey(String key) {
    bool hideRank = true;
    if (CommonRankStrategyConfig.instance.homeRankStrategyLists.isNotEmpty) {
      for (final item
          in CommonRankStrategyConfig.instance.homeRankStrategyLists) {
        if (key == item.key) {
          hideRank = item.hideRank;
          break;
        }
      }
    }
    return hideRank;
  }

  /// 是否隐藏榜单分数
  static bool getHideScoreByKey(String key) {
    bool hideScore = true;
    if (CommonRankStrategyConfig.instance.homeRankStrategyLists.isNotEmpty) {
      for (final item
          in CommonRankStrategyConfig.instance.homeRankStrategyLists) {
        if (key == item.key) {
          hideScore = item.hideScore;
          break;
        }
      }
    }
    return hideScore;
  }

  /// 是否隐藏榜单列表
  static bool getHideListByKey(String key) {
    bool hideList = true;
    if (CommonRankStrategyConfig.instance.homeRankStrategyLists.isNotEmpty) {
      for (final item
          in CommonRankStrategyConfig.instance.homeRankStrategyLists) {
        if (key == item.key) {
          hideList = item.hideList;
          break;
        }
      }
    }
    return hideList;
  }
}

/// 是否显示榜单名次
bool showRankByKey(String key) =>
    !CommonRankStrategyConfig.getHideRankByKey(key);

/// 是否显示榜单数值
bool showRankScoreByKey(String key) =>
    !CommonRankStrategyConfig.getHideScoreByKey(key);

/// 是否隐藏榜单列表
bool showRankListByKey(String key) =>
    !CommonRankStrategyConfig.getHideListByKey(key);

/// 房间真爱榜
const roomLoveKey = 'room_love';

/// 房间贡献榜
const roomContributeKey = 'room_contribute';

/// 房间魅力榜
const roomCharmKey = 'room_charm';

/// 房间贵族榜
const roomNobleKey = 'room_noble';

/// 房间粉丝榜
const roomFansKey = 'room_fans';

/// 房间守护榜
const roomSweetKey = 'room_sweet';

/// 房间贵宾榜
const roomVipKey = 'room_vip';

/// 首页真爱榜
const homeLoveKey = 'home_love';

/// 首页魅力榜
const homeCharmKey = 'home_charm';

/// 首页成就榜
const homeAchieveKey = 'home_achieve';

/// 首页图鉴榜
const handbookGiftKey = 'home_handbook';

/// 首页礼物榜
const homeGiftKey = 'home_gift';

/// 首页守护榜
const homeSweetKey = 'home_sweet';

/// 首页贵族榜
const homeNobleKey = 'home_noble';

/// 首页红人榜
const homeHotKey = 'home_hot';

/// 首页伴侣榜
const homeMarryKey = 'home_marry';

/// 新人榜
const userNewKey = 'user_new';

/// 搭讪榜
const autoChatKey = 'auto_chat';

/// 约战PK榜
const matchPkKey = 'match_pk';

/// 王牌经纪人星力榜
const onlineEarnStarKey = 'online_earn_star';

/// 王牌经纪人艺人榜
const onlineEarnArtistKey = 'online_earn_artist';

/// 王牌经纪人战力榜
const onlineEarnTeamKey = 'online_earn_team';

/// 王牌经纪人任务榜
const onlineEarnMissionKey = 'online_earn_mission';

/// 拍拍世界榜
const auctionWorldKey = 'auction_world';

/// 摩天轮榜
const ferrisWheelKey = 'ferris_wheel';

/// 直播周星榜
const liveWeekStarKey = 'live_week_star';

/// 直播骑士守护榜
const liveKnightKey = 'live_knight';

/// 直播主播榜
const liveRoomCharmKey = 'live_room_charm';

/// 直播用户榜
const liveUserCharmKey = 'live_user_charm';

/// 亲密度陪伴榜
const accompanyKey = 'accompany';

/// KTV榜
const ktvKey = 'ktv';

/// 礼物墙贡献榜
const intimateKey = 'intimate';

/// 礼物周星榜主播榜
const giftWeekStarLiveKey = 'gift_week_star_live';

/// 礼物周星榜平台周星榜
const giftWeekStarPlatformKey = 'gift_week_star_platform';

/// 礼物周星榜房间大人物榜
const giftWeekStarBigwigKey = 'gift_week_star_bigwig';

/// 礼物墙贡献榜(皮队友)
const giftWallContributionKey = 'gift_wall_contribution';

/// 心跳竞速排行榜
const heartRaceRankKey = 'heartrace';

/// CP旅行
const cpTravelKey = 'cp_travel';

/// cp 麦位
const roomCpDayKey = 'room_cp_day';

/// 最美小屋
const String roomHouseRank = 'room_house_rank';

/// PK厅
const String roomCpkLiving = 'room_cpk_living';

/// PK排位
const String roomCpkSegment = 'room_cpk_segment';

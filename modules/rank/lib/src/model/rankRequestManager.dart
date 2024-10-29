import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:rank/src/model/entity/moreTabRsp.dart';

import 'entity/homeMainRsp.dart';

import 'pb/generated/slp_tab_banner.pb.dart';

class RankRequestManager {
  /// v=4 每个tab增加banner_channel字段
  static Future<HomeTabData?> getHomeTabs() async {
    try {
      String url = "${System.domain}go/yy/home/tab?v=5";
      XhrResponse response =
          await Xhr.post(url, {}, throwOnError: true, pb: true);
      ResHomeTab res = ResHomeTab.fromBuffer(response.bodyBytes);
      if (res.success != true) {
        return null;
      }

      List<TabBarData> tabBarData = res.data.bars;
      saveTabData(tabBarData);

      _updateHomeBottomBarActivity(
          res.data.actBars.subBars.isNotEmpty, res.data.actBars);

      return res.data;
    } catch (e) {
      return null;
    }
  }

  static void _updateHomeBottomBarActivity(bool hasData, ActBarData data) {
    const String key = 'home_bottom_bar_activity';
    String oldCache = Config.get(key, '');
    if (hasData) {
      String newDataStr = data.writeToJson();
      if (oldCache != newDataStr) {
        for (ActSubBarsData item in data.subBars) {
          MultiframeImage.prepareFileByUrl(
              url: Util.getRemoteImgUrl(item.clickedIcon), subDir: 'home_tab');
        }
        Config.set(key, newDataStr);
        eventCenter.emit(EventConstant.EventHomeTabChange);
      }
    } else {
      if (oldCache.isNotEmpty) {
        Config.set(key, '');
        eventCenter.emit(EventConstant.EventHomeTabChange);
      }
    }
  }

  static Future<ResHomeTabHot> getHomeHot() async {
    try {
      /// version = 2 => 新增房间类型Banner
      String url = "${System.domain}go/yy/home/homeHot?version=4";
      XhrResponse response =
          await Xhr.post(url, {}, throwOnError: true, pb: true);
      ResHomeTabHot res = ResHomeTabHot.fromBuffer(response.bodyBytes);
      return res;
    } catch (e) {
      return ResHomeTabHot(success: false, msg: e.toString());
    }
  }

  /// 首页底Tab数据更新
  static void saveTabData(List<TabBarData> tabBarData) {
    try {
      String oldTabJsonStr = Config.get('home_tab_server', '');
      if (Util.validList(tabBarData) && tabBarData.length == 4) {
        List<Map<String, dynamic>> list = [];
        bool dataValid = true;
        for (TabBarData item in tabBarData) {
          if (!Util.validStr(item.clickedIcon) ||
              !Util.validStr(item.unclickedIcon) ||
              !Util.validStr(item.copyWriting)) {
            dataValid = false;
          }
          var e = item.toProto3Json();
          if (e is Map<String, dynamic>) {
            list.add(e);
          }
        }

        if (dataValid) {
          String json = jsonEncode(list);
          if (oldTabJsonStr != json) {
            Log.d('change home tab, has server tab');
            Config.set('home_tab_server', json);
            eventCenter.emit(EventConstant.EventHomeTabChange);
          }
          return;
        }
      }

      if (Util.validStr(oldTabJsonStr)) {
        Log.d('change home tab, no server tab');
        Config.set('home_tab_server', '');
        eventCenter.emit(EventConstant.EventHomeTabChange);
      }
    } catch (e) {
      Log.d('saveTabData error: $e');
    }
  }

  static Future<HomeMainXhrRsp> getHomePage(int page,
      {List? browseUids}) async {
    try {
      String url = "${System.domain}home/friendnew?version=17&page=$page";

      int sex;
      if (Session.sex == 1) {
        // 男性用户默认看女性用户
        sex = 2;
      } else {
        sex = 0;
      }
      final Map<String, String> params = {
        "browseUids": json.encode(await Session.browseUids),
        'sex': sex.toString()
      };

      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: true);
      Map res = response.value();

      if (res['success'] == true) {
        if (res['first_pay'] != null) {
          Session.setValue('first_pay', '${res['first_pay']}');
        }
      }

      HomeMainRsp rsp = HomeMainRsp.fromJson(res);
      HomeMainXhrRsp xhrRsp = HomeMainXhrRsp(rsp, response.error);
      return xhrRsp;
    } catch (e) {
      Log.d(e);
      if (e is XhrError) {
        return HomeMainXhrRsp(null, e);
      } else {
        return HomeMainXhrRsp(null, XhrError(XhrErrorCode.Json, e.toString()));
      }
    }
  }

  static Future<HomeMainRsp?> getNearBy(int page,
      {String? cityCode,
      required double longitude,
      required double latitude}) async {
    try {
      String url = "${System.domain}home/nearby?page=$page&version=1";

      int sex;
      if (Session.sex == 1) {
        // 男性用户默认看女性用户
        sex = 2;
      } else {
        sex = 0;
      }
      final Map<String, String> params = {
        'sex': sex.toString(),
        'cityCode': cityCode ?? '',
        'longitude': longitude.toString(),
        'latitude': latitude.toString(),
      };

      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: true);
      Map res = response.value();
      HomeMainRsp rsp = HomeMainRsp.fromJson(res);
      return rsp;
    } catch (e) {
      Log.d(e);
      return null;
    }
  }

  static Future<ResHomeForYou?> getHomeRecommend(int page) async {
    try {
      int sex;
      if (Session.sex == 1) {
        sex = 2;
      } else {
        sex = 0;
      }
      String url = '${System.domain}go/yy/home/foryou?page=$page&sex=$sex&v=2';

      XhrResponse response =
          await Xhr.post(url, {}, throwOnError: true, pb: true);
      ResHomeForYou rsp = ResHomeForYou.fromBuffer(response.bodyBytes);
      return rsp;
    } catch (e) {
      Log.d(e);
      return null;
    }
  }

  static Future<RoomListRes?> getHomeRoom(String type, int page) async {
    try {
      String url =
          '${System.domain}go/yy/roomlist/live?type=$type&page=$page&ver=2';

      XhrResponse response =
          await Xhr.post(url, {}, throwOnError: true, pb: true);
      RoomListRes rsp = RoomListRes.fromBuffer(response.bodyBytes);
      return rsp;
    } catch (e) {
      Log.d(e);
      return null;
    }
  }

  /// 获取猜你喜欢列表
  static Future<GuessFavoriteRoomListRes> getHomeGuessLikes() async {
    try {
      String url = '${System.domain}go/hisong/home/guessFavorite';
      XhrResponse response = await Xhr.get(url,
          queryParameters: {
            'longitude':
                Util.parseDouble(Config.get('location.longitude', '0')),
            'latitude': Util.parseDouble(Config.get('location.latitude', '0'))
          },
          throwOnError: true,
          pb: true);
      GuessFavoriteRoomListRes rsp =
          GuessFavoriteRoomListRes.fromBuffer(response.bodyBytes);
      return rsp;
    } catch (e) {
      return GuessFavoriteRoomListRes(success: false, msg: e.toString());
    }
  }

  /// 获取猜你喜欢房主当前所在房间
  static Future<GuessFavoriteInRoomRes> getHomeGuessLikeRoomId(int uid) async {
    try {
      String url = '${System.domain}go/hisong/home/guessFavoriteInRoom';
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'uid': uid}, throwOnError: true, pb: true);
      GuessFavoriteInRoomRes rsp =
          GuessFavoriteInRoomRes.fromBuffer(response.bodyBytes);
      return rsp;
    } catch (e) {
      return GuessFavoriteInRoomRes(success: false, msg: e.toString());
    }
  }

  /// 获取频道Banner 交友 friend_channel    直播 live_channel   音乐 music_channel   游戏 game_channel
  static Future<ResTabBanner> getCommonRoomlistBanner(
      String? bannerChannel, int tabId) async {
    String? position = bannerChannel;
    if (Util.isStringEmpty(position)) {
      // 兼容
      final params = {
        2: 'friend_channel',
        3: 'live_channel',
        4: 'music_channel',
        5: 'game_channel'
      };
      if (([2, 3, 4, 5].contains(tabId))) {
        position = params[tabId]!;
      }
    }
    if (Util.isStringEmpty(position)) {
      return ResTabBanner(msg: '', success: false);
    }
    String url = '${System.domain}go/yy/roomlist/banner';
    try {
      XhrResponse response = await Xhr.post(
          url, {'position': position!, 'version': '1'},
          pb: true);
      return ResTabBanner.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResTabBanner(msg: e.toString(), success: false);
    }
  }

  static Future<MoreTabRsp?> getMoreTab() async {
    try {
      String url = '${System.domain}home/moretab?version=2';

      final Map<String, String> params = {};

      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: true);
      Map res = response.value();
      MoreTabRsp rsp = MoreTabRsp.fromJson(res);
      return rsp;
    } catch (e) {
      Log.d(e);
      return null;
    }
  }

  static Future reportTabClick(
      {String? type, String? filter, int? cid, required int tabId}) async {
    try {
      String filterParam;
      if (type == 'skill') {
        filterParam = cid.toString();
      } else {
        filterParam = filter ?? '';
      }
      String url =
          '${System.domain}home/tabReport?version=1&type=$type&filter=$filterParam&tabId=$tabId';

      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      Map res = response.value();
//      if (res['success']) {
//        Fluttertoast.showToast(msg: 'report type=$type filter=$filterParam success');
//      }
      return res;
    } catch (e) {
      Log.d(e);
      return null;
    }
  }

  /// 平台游戏外放-点击上报
  static Future<NormalNull> postCommonRoomlistEnter(String type) async {
    String url = '${System.domain}go/yy/roomlist/enter';
    try {
      XhrResponse response = await Xhr.post(url, {'type': type}, pb: true);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }

  /// 获取热门标签页下面推荐房间
  static Future<ResTopRoomList> getHotRoomRecommend() async {
    try {
      String url = "${System.domain}go/yy/roomlist/topRooms";
      XhrResponse response =
          await Xhr.post(url, {}, throwOnError: true, pb: true);
      ResTopRoomList res = ResTopRoomList.fromBuffer(response.bodyBytes);
      return res;
    } catch (e) {
      return ResTopRoomList(success: false, msg: e.toString());
    }
  }

  /// 获取热门标签页下面荣耀头条
  /// lastId 最后一页的时间戳,第一页传0
  static Future<AwakeFrontPageRsp> getGloryHeadlineData(int lastId) async {
    try {
      String url = "${System.domain}go/yy/gift-handbook/awakeFrontPage";
      XhrResponse response = await Xhr.post(url, {'last_id': lastId.toString()},
          throwOnError: true, pb: true);
      AwakeFrontPageRsp res = AwakeFrontPageRsp.fromBuffer(response.bodyBytes);
      return res;
    } catch (e) {
      return AwakeFrontPageRsp(success: false, msg: e.toString());
    }
  }
}

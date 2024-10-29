import 'package:shared/shared.dart';
import 'package:chat_room/src/biz_plugin/juke_music/model/juke_music_beans.dart';
import 'package:chat_room/src/protobuf/generated/juke_music.pb.dart';

/// 点唱接口请求
class JukeMusicRepos {
  /// 点唱礼金设置配置
  static Future<DataRsp<List<JukeMusicGiftSetting>>> getSetting(int rid) async {
    XhrResponse response = await Xhr.postJson(
        '${System.domain}musicorder/music/setting', {'rid': '$rid'});
    DataRsp<List<JukeMusicGiftSetting>> dataRsp =
        DataRsp.fromXhrResponse(response, (json) {
      Map data = json as Map;
      return Util.parseList(data['list'],
          (e) => JukeMusicGiftSetting.fromJson(e as Map<String, dynamic>));
    });
    return dataRsp;
  }

  /// 点唱礼金设置配置
  static Future<bool> setJukeGift(
      {required int rid, required int giftId, required int giftCount}) async {
    Map<String, String> params = <String, String>{
      'rid': '$rid',
      'gift_id': '$giftId',
      'gift_count': '$giftCount'
    };
    XhrResponse response =
        await Xhr.postJson('${System.domain}musicorder/music/set', params);
    BaseResponse baseResponse = BaseResponse.parse(response);
    if (baseResponse.msg != null && baseResponse.msg!.isNotEmpty) {
      Fluttertoast.showToast(msg: baseResponse.msg);
    }
    return baseResponse.success;
  }

  /// 我的歌单列表
  static Future<DataRsp<JukeMyMusicData>> myMusic(int rid) async {
    XhrResponse response = await Xhr.postJson(
        '${System.domain}musicorder/music/mysongs', {'rid': '$rid'});
    DataRsp<JukeMyMusicData> dataRsp =
        DataRsp.fromXhrResponse(response, (json) {
      return JukeMyMusicData.fromJson(json as Map<String, dynamic>);
    });
    return dataRsp;
  }

  /// 我的歌单价格设置
  static Future<bool> setMyMusicPrice(
      {required int rid, required int giftId, required int giftCount}) async {
    Map<String, String> params = <String, String>{
      'rid': '$rid',
      'gift_id': '$giftId',
      'gift_count': '$giftCount'
    };
    XhrResponse response = await Xhr.postJson(
        '${System.domain}musicorder/music/mysongset', params);
    BaseResponse baseResponse = BaseResponse.parse(response);
    if (baseResponse.msg != null && baseResponse.msg!.isNotEmpty) {
      Fluttertoast.showToast(msg: baseResponse.msg);
    }
    return baseResponse.success;
  }

  /// 添加我的歌曲
  static Future<bool> myMusicAdd(
      {required int rid, required String musicName}) async {
    Map<String, String> params = <String, String>{
      'rid': '$rid',
      'name': musicName,
    };
    XhrResponse response = await Xhr.postJson(
        '${System.domain}musicorder/music/mysongadd', params);
    BaseResponse baseResponse = BaseResponse.parse(response);
    if (baseResponse.msg != null && baseResponse.msg!.isNotEmpty) {
      Fluttertoast.showToast(msg: baseResponse.msg);
    }
    return baseResponse.success;
  }

  /// 删除我的歌曲
  static Future<bool> myMusicDel(
      {required int rid, required int musicId}) async {
    Map<String, String> params = <String, String>{
      'rid': '$rid',
      'song_id': '$musicId',
    };
    XhrResponse response = await Xhr.postJson(
        '${System.domain}musicorder/music/mysongdel', params);
    BaseResponse baseResponse = BaseResponse.parse(response);
    if (baseResponse.msg != null && baseResponse.msg!.isNotEmpty) {
      Fluttertoast.showToast(msg: baseResponse.msg);
    }
    return baseResponse.success;
  }

  /// 用户可点歌单列表
  static Future<DataRsp<JukeUserOrderList>> userOrderMusicList(
      int rid, int uid) async {
    XhrResponse response = await Xhr.postJson(
        '${System.domain}musicorder/music/recommend',
        {'rid': '$rid', 'singer_uid': '$uid'});
    DataRsp<JukeUserOrderList> dataRsp =
        DataRsp.fromXhrResponse(response, (json) {
      return JukeUserOrderList.fromJson(json as Map<String, dynamic>);
    });
    return dataRsp;
  }

  /// 点单确定
  static Future<DataRsp<JukeOrderInfo>> orderConfirmInfo(
      int rid, int songId) async {
    XhrResponse response = await Xhr.postJson(
        '${System.domain}musicorder/music/order',
        {'rid': '$rid', 'song_id': '$songId'});
    DataRsp<JukeOrderInfo> dataRsp = DataRsp.fromXhrResponse(response, (json) {
      return JukeOrderInfo.fromJson(json as Map<String, dynamic>);
    });
    return dataRsp;
  }

  /// 待唱歌单
  static Future<DataRsp<JukeWaitMusicData>> planSongs(int rid, int page) async {
    XhrResponse response = await Xhr.postJson(
        '${System.domain}musicorder/music/plansongs',
        {'rid': '$rid', 'page': '$page'});
    DataRsp<JukeWaitMusicData> dataRsp =
        DataRsp.fromXhrResponse(response, (json) {
      return JukeWaitMusicData.fromJson(json as Map<String, dynamic>);
    });
    return dataRsp;
  }

  /// 开始播放
  static Future<bool> startMusic(
      {required int rid, required int musicId}) async {
    Map<String, String> params = <String, String>{
      'rid': '$rid',
      'plan_id': '$musicId',
      'ver': '1'
    };
    XhrResponse response =
        await Xhr.postJson('${System.domain}musicorder/music/start', params);
    BaseResponse baseResponse = BaseResponse.parse(response);
    if (baseResponse.msg != null && baseResponse.msg!.isNotEmpty) {
      Fluttertoast.showToast(msg: baseResponse.msg);
    }
    return baseResponse.success;
  }

  /// 切歌
  static Future<bool> stopMusic(
      {required int rid, required int musicId}) async {
    Map<String, String> params = <String, String>{
      'rid': '$rid',
      'plan_id': '$musicId',
      'ver': '1'
    };
    XhrResponse response =
        await Xhr.postJson('${System.domain}musicorder/music/stop', params);
    BaseResponse baseResponse = BaseResponse.parse(response);
    if (baseResponse.msg != null && baseResponse.msg!.isNotEmpty) {
      Fluttertoast.showToast(msg: baseResponse.msg);
    }
    return baseResponse.success;
  }

  /// 查询歌曲列表
  static Future<RespQuerySongs> querySongList(
      {required int rid,
      required int singerId,
      required String type,
      required String searchText,
      required int page}) async {
    try {
      String url = '${System.domain}go/room/musicorder/singerSongs';
      Map<String, String> params = <String, String>{
        'rid': '$rid',
        'singerId': '$singerId',
        'type': type,
        'key': searchText,
        'page': '$page',
        'version': '2',
      };
      XhrResponse response = await Xhr.postPb(url, params);
      return RespQuerySongs.fromBuffer(response.bodyBytes);
    } catch (e) {
      return RespQuerySongs(success: false, msg: e.toString());
    }
  }

  /// 查询 我已点的
  static Future<RespMyOrderSongs> queryMyOrderSongList(
      {required int rid, required int singerId, required int page}) async {
    try {
      String url = '${System.domain}go/room/musicorder/myOrderSongs';
      Map<String, String> params = <String, String>{
        'rid': '$rid',
        'singerId': '$singerId',
        'page': '$page',
      };
      XhrResponse response = await Xhr.postPb(url, params);
      return RespMyOrderSongs.fromBuffer(response.bodyBytes);
    } catch (e) {
      return RespMyOrderSongs(success: false, msg: e.toString());
    }
  }

  /// 查询 歌手
  static Future<RespQuerySingers> querySingerList({required int rid}) async {
    try {
      String url = '${System.domain}go/room/musicorder/singers';
      Map<String, String> params = <String, String>{
        'rid': '$rid',
      };
      XhrResponse response = await Xhr.postPb(url, params);
      return RespQuerySingers.fromBuffer(response.bodyBytes);
    } catch (e) {
      return RespQuerySingers(success: false, msg: e.toString());
    }
  }

  /// 加入 热门
  static Future<NormalNull> updateSongHot(
      {required int rid, required int songId, required int flag}) async {
    try {
      String url = '${System.domain}go/room/musicorder/songHotSet';
      Map<String, String> params = <String, String>{
        'rid': '$rid',
        'songId': '$songId',
        'flag': '$flag',
      };
      XhrResponse response = await Xhr.postPb(url, params);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  ///下单
  static Future<NormalNull> gotoOrderPay(
      {required int rid, required String songIds}) async {
    try {
      String url = '${System.domain}go/room/musicorder/pay';
      Map<String, String> params = <String, String>{
        'rid': '$rid',
        'songs': songIds,
      };
      XhrResponse response = await Xhr.postPb(url, params);
      return NormalNull.fromBuffer(response.bodyBytes);
    } catch (e) {
      return NormalNull(success: false, msg: e.toString());
    }
  }

  /// 歌曲置顶
  static Future<BaseResponse> topping(
      {required int rid, required int musicId}) async {
    try {
      String url = '${System.domain}musicorder/music/top';
      Map<String, String> params = <String, String>{
        'rid': '$rid',
        'plan_id': '$musicId',
      };
      XhrResponse response = await Xhr.postJson(url, params);
      BaseResponse baseResponse = BaseResponse.parse(response);
      return baseResponse;
    } catch (e) {
      return BaseResponse(success: false, msg: e.toString());
    }
  }

  /// 添加待唱歌手
  static Future<BaseResponse> addSinger(
      {required int rid, required String uids}) async {
    try {
      String url = '${System.domain}musicorder/music/addSinger';
      Map<String, String> params = <String, String>{
        'rid': '$rid',
        'uids': uids,
      };
      XhrResponse response = await Xhr.postJson(url, params);
      BaseResponse baseResponse = BaseResponse.parse(response);
      return baseResponse;
    } catch (e) {
      return BaseResponse(success: false, msg: e.toString());
    }
  }

  /// 结束演唱
  static Future<BaseResponse> endMusic({required int rid}) async {
    try {
      String url = '${System.domain}musicorder/music/end';
      Map<String, String> params = <String, String>{'rid': '$rid', 'ver': '1'};
      XhrResponse response = await Xhr.postJson(url, params);
      BaseResponse baseResponse = BaseResponse.parse(response);
      return baseResponse;
    } catch (e) {
      return BaseResponse(success: false, msg: e.toString());
    }
  }
}

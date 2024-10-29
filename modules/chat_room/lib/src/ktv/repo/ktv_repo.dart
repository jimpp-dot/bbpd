// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/ktv/kugou/kugou_repo.dart';
import 'package:chat_room/src/ktv/kugou/model/kugou_song_beans.dart';
import 'package:chat_room/src/ktv/model/ktv_accuse_beans.dart';
import 'package:chat_room/src/ktv/model/ktv_auto_generate_beans.dart';
import 'package:chat_room/src/ktv/model/ktv_song_manage_beans.dart';
import 'package:chat_room/src/ktv/model/song_sheet_beans.dart';
import 'package:chat_room/src/ktv/model/sound_type.dart';
import 'package:chat_room/src/protobuf/generated/common_ktv.pb.dart';
import 'package:chat_room/src/protobuf/generated/common_rank_pk.pb.dart';
import 'package:chat_room/src/protobuf/generated/tencent_music.pb.dart';
import 'package:dio/dio.dart';

import '../../../k.dart';

class KtvRepo {
  KtvRepo._();

  static Future<bool> submitFile(dynamic data) async {
    Dio dio = Dio();
    dio.enableDebugProxy();
    Map<String, String> args = {
      'package': Constant.packageName,
      '_ipv': Util.isVerify ? '1' : '0',
      '_platform': (Platform.isIOS ? 'ios' : 'android'),
      '_index': '0',
      '_model': DeviceInfo.model,
      '_timestamp': (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString(),
    };

    Map<String, String> headers = {'user-token': Session.token};
    headers.addAll(Xhr.globalHeaders);

    String host = '${System.domain}ktv/music';
    try {
      Response response = await dio.post(host,
          queryParameters: args,
          data: data,
          options: Options(headers: headers));
      Log.d('submitFile response = ${response.data}');
      if (response.data != null && response.data is Map) {
        return response.data['success'] == true;
      }
    } catch (e) {
      Log.d('submitFile....$e');
      return false;
    }
    return false;
  }

  /// 我的歌曲
  static Future<MySongListResp> getMySongList(int lastId) async {
    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}ktv/mySongList", {'last_id': lastId.toString()},
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return MySongListResp(msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return MySongListResp(msg: res['msg'], success: false);
      }
      try {
        MySongListResp responseData =
            MySongListResp.fromJson(res as Map<String, dynamic>);
        return responseData;
      } catch (e) {
        Log.d("getFileUploadUrl error and e msg = ${e.toString()}");

        return MySongListResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return MySongListResp(msg: e.toString(), success: false);
    }
  }

  static Future<bool> deleteSong(int id) async {
    try {
      String url = '${System.domain}ktv/delete';
      Map<String, String> params = {
        'song_id': '$id',
      };
      XhrResponse response = await Xhr.postJson(url, params);
      Map res = response.value();
      if (res['success'] == true) {
        Fluttertoast.showToast(msg: K.ktv_del_song_success);
        return true;
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      Log.d(e.toString());
    }
    return false;
  }

  static Future<bool> shareSetting(bool share) async {
    try {
      String url = '${System.domain}ktv/shareSetting';
      Map<String, String> params = {
        'share_status': share == true ? '1' : '0',
      };
      XhrResponse response = await Xhr.postJson(url, params);
      Map res = response.value();
      if (res['success'] == true) {
        Fluttertoast.showToast(msg: K.room_operate_success);
        return true;
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
      Log.d(e.toString());
    }
    return false;
  }

  static Future<SongDetailResp> getSongDetail(int songId) async {
    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}ktv/songDetail", {'song_id': songId.toString()},
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return SongDetailResp(msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return SongDetailResp(msg: res['msg'], success: false);
      }
      try {
        SongDetailResp responseData =
            SongDetailResp.fromJson(Map<String, dynamic>.from(res));
        return responseData;
      } catch (e) {
        Log.d("getMySongDetail error and e msg = ${e.toString()}");
        return SongDetailResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return SongDetailResp(msg: e.toString(), success: false);
    }
  }

  static Future<MySongDetailResp> getMySongDetail(int songId) async {
    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}ktv/mySongDetail", {'song_id': songId.toString()},
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return MySongDetailResp(msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return MySongDetailResp(msg: res['msg'], success: false);
      }
      try {
        MySongDetailResp responseData =
            MySongDetailResp.fromJson(Map<String, dynamic>.from(res));
        return responseData;
      } catch (e) {
        Log.d("getMySongDetail error and e msg = ${e.toString()}");
        return MySongDetailResp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return MySongDetailResp(msg: e.toString(), success: false);
    }
  }

  static Future<DataRsp<KtvAccuseModel>> getAccuseInfo(int sid) async {
    String url = '${System.domain}ktv/accuseInfo?song_id=$sid';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      return DataRsp<KtvAccuseModel>.fromXhrResponse(response,
          (res) => KtvAccuseModel.fromJson(res as Map<String, dynamic>));
    } catch (e) {
      return DataRsp<KtvAccuseModel>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 举报
  static Future<BaseResponse> accuse(
      {required int sid, int? mainId, int? subId, String? description}) async {
    String url = '${System.domain}ktv/accuse';
    XhrResponse response = await Xhr.postJson(url, {
      'song_id': '$sid',
      'main_id': '$mainId',
      'sub_id': '$subId',
      'description': description ?? '',
    });
    return BaseResponse.parse(response);
  }

  static Future<DataRsp<KtvAudioGenerateModel>> generateCfg() async {
    String url = '${System.domain}ktv/generateCfg';
    try {
      XhrResponse response = await Xhr.getJson(url);
      return DataRsp<KtvAudioGenerateModel>.fromXhrResponse(
        response,
        (object) =>
            KtvAudioGenerateModel.fromJson(object as Map<String, dynamic>),
      );
    } catch (e) {
      return DataRsp<KtvAudioGenerateModel>(
          msg: R.array('xhr_error_type_array')[6], success: false);
    }
  }

  /// 获取歌单tab
  /// [filterCommon]:  是否过滤公共tab 0 不过滤(KTV房间需要【我唱过的】) 1 过滤（一起听，不需要）
  static Future<RepSongTap> getSongTabs(int rid, int ktvSourceType,
      {int filterCommon = 0}) async {
    String url = '${System.domain}go/yy/tem/songTap';
    Log.d(
        'getSongTabs:rid->$rid,ktvSourceType:$ktvSourceType, filterCommon:$filterCommon');
    try {
      XhrResponse response = await Xhr.postPb(
        url,
        {
          'rid': '$rid',
          'ktv_source_type': '$ktvSourceType',
          'filter_common': '$filterCommon',
          'version': '1',
        },
      );
      RepSongTap rsp = response.formatProtobuf(RepSongTap.create());
      Log.d('getSongTabs:$rsp');
      return rsp;
    } catch (e) {
      return RepSongTap(msg: e.toString(), success: false);
    }
  }

  static Future<RcmdSongListRsp> getRcmdSongList(
      int rid, String type, int page) async {
    String url = '${System.domain}ktv/songList?page=$page';
    try {
      XhrResponse response = await Xhr.postJson(
        url,
        {'rid': '$rid', 'type': type, 'uid': '${Session.uid}'},
      );
      if (response.error != null) {
        Log.d(response.error.toString());
        return RcmdSongListRsp(msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return RcmdSongListRsp(msg: res['msg'], success: false);
      }
      try {
        Map data = res['data'] ?? {};
        data['success'] = true;
        RcmdSongListRsp responseData =
            RcmdSongListRsp.fromJson(Map<String, dynamic>.from(data));
        return responseData;
      } catch (e) {
        return RcmdSongListRsp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return RcmdSongListRsp(msg: e.toString(), success: false);
    }
  }

  static Future<SongSearchResultRsp> searchSong(
      String query, int rid, int page, bool isConfirm) async {
    String url = '${System.domain}ktv/songSearch?page=$page';
    try {
      XhrResponse response = await Xhr.postJson(url,
          {'search': query, 'rid': '$rid', 'isConfirm': '${isConfirm ? 1 : 0}'},
          throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return SongSearchResultRsp(
            msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return SongSearchResultRsp(msg: res['msg'], success: false);
      }
      try {
        SongSearchResultRsp responseData =
            SongSearchResultRsp.fromJson(Map<String, dynamic>.from(res));
        return responseData;
      } catch (e) {
        return SongSearchResultRsp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return SongSearchResultRsp(msg: e.toString(), success: false);
    }
  }

  static Future<RequestedSongListRsp> getRequestedSongList(
      int rid, int uid) async {
    String url = "${System.domain}ktv/singList?rid=$rid&uid=$uid";
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: false);
      if (response.error != null) {
        Log.d(response.error.toString());
        return RequestedSongListRsp(
            msg: response.error.toString(), success: false);
      }

      Map res = response.value();
      if (!(res['success'] ?? false)) {
        return RequestedSongListRsp(msg: res['msg'], success: false);
      }
      try {
        RequestedSongListRsp responseData =
            RequestedSongListRsp.fromJson(Map<String, dynamic>.from(res));
        return responseData;
      } catch (e) {
        return RequestedSongListRsp(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      return RequestedSongListRsp(msg: e.toString(), success: false);
    }
  }

  static const _SONG_HISTORY_KEY = 'song_sea_history_key';
  static const _MAX_COUNT = 15;

  static Future<void> clearSearchHistory() async {
    await Config.set(_SONG_HISTORY_KEY, '');
  }

  static Future<List<String>> getSearchHistory() async {
    String str = Config.get(_SONG_HISTORY_KEY, '');

    List<String> his = [];
    if (!Util.isStringEmpty(str, trim: true)) {
      his = str.split(',');
    }
    return his.reversed.toList();
  }

  static Future saveHistoryWord(String word) async {
    if (Util.isStringEmpty(word, trim: true)) {
      return;
    }

    String str = Config.get(_SONG_HISTORY_KEY, '');

    List<String> his = [];
    if (!Util.isStringEmpty(str, trim: true)) {
      his = str.split(',');
    }

    int index = his.indexOf(word);

    if (index >= 0) {
      his.removeAt(index);
    }

    his.add(word);

    if (his.length > _MAX_COUNT) {
      his = his.sublist(his.length - _MAX_COUNT);
    }
    Config.set(_SONG_HISTORY_KEY, his.join(','));
  }

  ///歌曲置顶
  static Future<bool> singUp(int rid, int songId, int requestUid) async {
    try {
      String url = '${System.domain}ktv/singUp';
      XhrResponse response = await Xhr.postJson(url,
          {'rid': '$rid', 'song_id': '$songId', 'order_uid': '$requestUid'},
          throwOnError: true);
      Map data = response.value();
      if (data['success']) {
        return true;
      }
    } catch (e) {
      Log.d(e);
    }
    return false;
  }

  ///歌曲删除
  static Future<bool> singDel(int rid, int songId, int requestUid) async {
    try {
      String url = '${System.domain}ktv/singDel';
      XhrResponse response = await Xhr.postJson(url,
          {'rid': '$rid', 'song_id': '$songId', 'order_uid': '$requestUid'},
          throwOnError: true);
      Map data = response.value();
      if (data['success']) {
        return true;
      }
    } catch (e) {
      Log.d(e);
    }
    return false;
  }

  static int END_SING_TYPE_PAUSE = 1;
  static int END_SING_TYPE_RESUME = 2;

  ///暂停演唱, type: 1 暂停  2 继续
  static Future<bool> pauseSing(
      int uid, int rid, int type, int progress) async {
    String url = '${System.domain}ktv/pausesing';
    try {
      XhrResponse response = await Xhr.postJson(
        url,
        {
          'uid': '$uid',
          'rid': '$rid',
          'type': '$type',
          'progress': '$progress',
        },
      );
      Map data = response.value();
      if (Util.parseBool(data['success'])) return true;
    } catch (e) {
      Log.d(e);
    }
    return false;
  }

  ///当前演唱者通知服务器一首歌结束
  static Future<bool> endSing(int uid, int rid, int songId) async {
    String url = '${System.domain}ktv/endsing';
    try {
      XhrResponse response = await Xhr.postJson(
        url,
        {
          'uid': '$uid',
          'rid': '$rid',
          'song_id': '$songId',
        },
      );
      Map data = response.value();
      if (Util.parseBool(data['success'])) return true;
    } catch (e) {
      Log.d(e);
    }
    return false;
  }

  ///切歌-下一首
  static Future<bool> nextSong(
      int uid, int rid, int songId, int singUid) async {
    String url = '${System.domain}ktv/nextsong';
    try {
      XhrResponse response = await Xhr.postJson(
        url,
        {
          'uid': '$uid',
          'rid': '$rid',
          'song_id': '$songId',
          'song_uid': '$singUid'
        },
      );
      Map data = response.value();
      if (Util.parseBool(data['success'])) return true;
    } catch (e) {
      Log.d(e);
    }
    return false;
  }

  ///切换原声伴奏，1 伴奏  0 原声
  static Future<BaseResponse> setBacktrack(
      int uid, int rid, SoundType soundType) async {
    String url = '${System.domain}ktv/setbacktrack';
    int type = soundType == SoundType.voice ? 0 : 1;

    XhrResponse response = await Xhr.postJson(
      url,
      {
        'uid': '$uid',
        'rid': '$rid',
        'type': '$type',
      },
    );
    return BaseResponse.parse(response);
  }

  static Future<dynamic> postUserInfo(QRCodeAuth auth, String ip) async {
    Map<String, String> p = {
      'device_id': KuGouRepo.getDeviceId(),
      'client_ip': ip,
      'tem_user_id': auth.userid,
      'tem_token': auth.token,
      'tem_token_expire': '${auth.expire}',
      'anchorid': '${ChatRoomData.getInstance()?.createor?.uid}',
      'roomid': '${ChatRoomData.getInstance()?.rid}',
      'pkg': Constant.packageName
    };

    String url = '${System.domain}go/yy/tem/saveUser';

    XhrResponse response = await Xhr.post(url, p, pb: true);

    RepTemUserInfo data = RepTemUserInfo.fromBuffer(response.bodyBytes);
  }

  static Future<RepTemUserInfo> getVipUserInfo(
      int creatorId, int rid, String ip) async {
    Map<String, String> map = {
      'device_id': KuGouRepo.getDeviceId(),
      'client_ip': ip,
      'anchorid': '$creatorId',
      'roomid': '$rid',
      'pkg': Constant.packageName
    };

    String url = '${System.domain}go/yy/tem/getTemUserInfo';

    XhrResponse response = await Xhr.post(url, map, pb: true);
    try {
      RepTemUserInfo data = RepTemUserInfo.fromBuffer(response.bodyBytes);
      return data;
    } catch (e) {
      return RepTemUserInfo(msg: e.toString(), success: false);
    }
  }

  static Future<NormalNull> chooseSongGo(int rid, Song song, int type,
      {String? krc, bool notCheckMic = false}) async {
    Map<String, String> map = {
      'rid': '$rid',
      'song_id': '${song.pid}',
      'platform': song.platform,
      'playtime': '${song.playTime}',
      'singer_name': song.singerName,
      'song_name': song.name,
      'platform_rank_id': '$type',
      'photo': song.icon,
      'not_check_mic': notCheckMic ? '1' : '0',
      'music_id': song.musicId,
      'lrc_content': krc ?? '',
    };

    Log.d('chooseSong post :$map');
    String url = '${System.domain}go/yy/tem/chooseSong';

    XhrResponse response = await Xhr.post(url, map, pb: true);

    try {
      NormalNull data = NormalNull.fromBuffer(response.bodyBytes);
      Log.d('chooseSong res:$data');
      return data;
    } catch (e) {
      return NormalNull(msg: e.toString(), success: false);
    }
  }

  static Future<Song?> getKuGouSongFromDb(int songId) async {
    List<Map<String, dynamic>> res = await LocalStorage.db?.rawQuery(
            "select * from ktv_song where id = ? and platform = ?",
            [songId, SongPlatform.KUGOU]) ??
        [];
    if (Util.isCollectionEmpty(res)) {
      return null;
    }
    Map<String, dynamic> songJson = res[0];
    Song song = Song.fromJson(songJson);
    return song;
  }

  static Future<ResKtvThisWeekRank> getWeekRank() async {
    String url = '${System.domain}go/yy/ktv/rankweek';
    XhrResponse response = await Xhr.get(url, pb: true);
    try {
      ResKtvThisWeekRank data =
          ResKtvThisWeekRank.fromBuffer(response.bodyBytes);
      return data;
    } catch (e) {
      return ResKtvThisWeekRank(msg: e.toString(), success: false);
    }
  }

  static Future<ResKtvHotSongRank> getHotSongRank() async {
    String url = '${System.domain}go/yy/ktv/rankhot';
    XhrResponse response = await Xhr.get(url, pb: true);
    try {
      ResKtvHotSongRank data = ResKtvHotSongRank.fromBuffer(response.bodyBytes);
      return data;
    } catch (e) {
      return ResKtvHotSongRank(msg: e.toString(), success: false);
    }
  }

  static Future<ResKtvSingleSongRank> getSongRank(int songId) async {
    String url = '${System.domain}go/yy/ktv/songrank?song_id=$songId';
    XhrResponse response = await Xhr.get(url, pb: true);
    try {
      ResKtvSingleSongRank data =
          ResKtvSingleSongRank.fromBuffer(response.bodyBytes);
      return data;
    } catch (e) {
      return ResKtvSingleSongRank(msg: e.toString(), success: false);
    }
  }

  static Future<bool> joinChorus(int rid) async {
    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}ktv/joinChorus", {'rid': '$rid'},
          throwOnError: false);
      Map res = response.value();
      if (res['success'] == true) {
        return true;
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: R.string('netword_exception_retry') + e.toString(),
          gravity: ToastGravity.CENTER);
    }
    return false;
  }

  /// 主唱切换：支持合唱
  /// state:是否开启合唱，0：否，1：是
  static Future<bool> chorusSwitch(int rid, int state) async {
    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}ktv/chorusSwitch",
          {'rid': '$rid', 'state': '$state'},
          throwOnError: false);
      Map res = response.value();
      if (res['success'] == true) {
        return true;
      } else {
        if (res['msg'] != null && res['msg'] is String) {
          Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
        }
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: R.string('netword_exception_retry') + e.toString(),
          gravity: ToastGravity.CENTER);
    }
    return false;
  }

  static Future<ResKtvPkRank> getPkRankData(int rid) async {
    String url = '${System.domain}go/yy/ktv/pkrank?rid=$rid';
    XhrResponse response = await Xhr.get(url, pb: true);
    try {
      return ResKtvPkRank.fromBuffer(response.bodyBytes);
    } catch (e) {
      return ResKtvPkRank(msg: e.toString(), success: false);
    }
  }

  /// 获取声网点歌token
  /// force: 0 使用缓存token 1 使用新token
  static Future<ResMusicToken> getAgoraToken(int sourceType,
      {int force = 0}) async {
    Map<String, String> param = {
      'source_type': '$sourceType',
      'force': '$force',
    };

    String url = '${System.domain}go/yy/music/getToken';
    XhrResponse response = await Xhr.postPb(url, param);
    try {
      ResMusicToken data = ResMusicToken.fromBuffer(response.bodyBytes);
      return data;
    } catch (e) {
      return ResMusicToken(msg: e.toString(), success: false);
    }
  }

  /*
  * KTV zego 曲库和 agora 曲库，在点歌面板获取每一个 tab 栏对应的音乐列表的接口
  * rid：房间 id
  * tabId：tabId
  * sourceType：对应的 room.ktvSourceType
  * page：第几页
  * */
  static Future<SongSheetSongListRespV2> getRcmdSongListV2(
      int rid, String tabId, int sourceType, int page) async {
    try {
      String url = '${System.domain}go/yy/music/getTabList';
      var param = {
        'rid': rid.toString(),
        'playlistId': tabId,
        'source_type': sourceType.toString(),
        'page': page.toString(),
      };
      var response = await Xhr.get(url, queryParameters: param, pb: true);
      var resp = ResMusicTapList.fromBuffer(response.bodyBytes);
      Log.d('getRcmdSongListV2:$resp');
      return SongSheetSongListRespV2(
          success: resp.success, msg: resp.msg, innerResp: resp);
    } catch (e) {
      var resp = ResMusicTapList(msg: e.toString(), success: false);
      return SongSheetSongListRespV2(
          success: resp.success, msg: resp.msg, innerResp: resp);
    }
  }

  /*
  * KTV zego 曲库和 agora 曲库，在点歌面板搜索音乐的接口
  * rid：房间 id
  * keyword：关键字
  * page：第几页
  * sourceType：对应的 room.ktvSourceType
  * */
  static Future<SongSheetSongListRespV2> searchSongV2(
      int rid, String keyword, int page, int sourceType,
      {int limit = 10}) async {
    ResMusicSearch rsp =
        await searchMusic(rid, keyword, page, sourceType, limit: limit);
    return SongSheetSongListRespV2(
        success: rsp.success, msg: rsp.msg, innerResp: rsp);
  }

  /// [page] 分页参数，从1开始
  static Future<ResMusicSearch> searchMusic(
      int rid, String keyword, int page, int sourceType,
      {int limit = 10}) async {
    try {
      String url = '${System.domain}go/yy/music/searchMusic';
      var param = {
        'rid': rid.toString(),
        'keyword': keyword,
        'source_type': sourceType.toString(),
        'page': page.toString(),
        'limit': '$limit',
      };
      XhrResponse response = await Xhr.post(url, param, pb: true);
      ResMusicSearch rsp = response.formatProtobuf(ResMusicSearch.create());
      return rsp;
    } catch (e) {
      return ResMusicSearch(msg: e.toString(), success: false);
    }
  }

  static Future<ResMusicSearch> getHotMusic(int rid, int sourceType) async {
    try {
      String url = '${System.domain}go/yy/music/bgMusic';
      var param = {
        'rid': rid.toString(),
        'source_type': sourceType.toString(),
      };
      XhrResponse response = await Xhr.post(url, param, pb: true);
      ResMusicSearch rsp = response.formatProtobuf(ResMusicSearch.create());
      return rsp;
    } catch (e) {
      return ResMusicSearch(msg: e.toString(), success: false);
    }
  }
}

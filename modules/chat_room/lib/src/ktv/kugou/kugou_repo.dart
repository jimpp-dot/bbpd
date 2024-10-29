import 'dart:math';

import 'package:chat_room/k.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shared/shared.dart';

// import 'package:fluwx/fluwx.dart' as FlutterWx;

import 'package:dio/dio.dart';
import 'package:chat_room/src/ktv/kugou/model/kugou_song_beans.dart';
import 'package:chat_room/src/ktv/model/song_sheet_beans.dart';
import 'package:chat_room/src/ktv/model/sound_type.dart';
import 'package:chat_room/src/ktv/repo/ktv_repo.dart';
import 'package:chat_room/src/protobuf/generated/tencent_music.pb.dart';
import 'package:uuid/uuid.dart';

/// 酷狗音速达，api相关

//微信授权
const _THIRD_SSO_HOST = 'https://thirdsso.kugou.com';

//歌曲相关
const _COMMERCIAL_HOST = 'https://commercial.kugou.com';

const _SIGNATURE_KEY = 'signature';

const _LOG_TAG = 'KuGouRepo';

//const _APP_KEY = '719b4902a4e842fdac3fde0b66e04e12';

const _PACKAGE = 'com.doudong.SelectMusic';

const _PID = '202404';

const _INTERVAL_TIME = 2500;

@Deprecated('use zego 音集协')
class KuGouRepo {
  static String? _sTicket;

  static Timer? _pingTimer;

  static const _SIZE = 10;

  static String _ip = '';

  static TemUserInfo? _userInfo;

  static String _appKey = '';

  static String _pid = '';

  static Map<String, dynamic> get _commonParams {
    return {
      'pid': _pid,
      'sp': 'KG',
      'device_id': getDeviceId(),
      'client_ip': _getIp(),
      'timestamp': (DateTime.now().millisecondsSinceEpoch.toInt() ~/ 1000),
      'nonce': const Uuid().v4()
    };
  }

  static initConfig(String appKey, String pid) {
    _appKey = appKey;
    _pid = pid;
  }

  static String _getIp() {
    if (!Util.isStringEmpty(_ip)) {
      return _ip;
    }

    Random rng = Random();
    return '192.168.${rng.nextInt(2)}.${rng.nextInt(100)}';
  }

  /// 确保参数一定有，不然会报错.
  static String getDeviceId() {
    String did = DeviceInfo.deviceId;

    if (Util.isStringEmpty(did)) {
      did = DeviceInfo.did;
    }

    if (Util.isStringEmpty(did)) {
      did = DeviceInfo.mac;
    }

    if (Util.isStringEmpty(did)) {
      String temp = 'd9ceca67668313df3ba4d50410f5d7fc';
      String model = '${DeviceInfo.model}.${DeviceInfo.brand}';
      did = Util.md5Encryption('$temp&$model');
    }

    if ((did.length) > 56) {
      return did.safeSubstring(0, 56);
    }
    return did;
  }

  static String get ip => _getIp();

  static Future<KuGouBaseResp> getAppInfoCode() async {
    String url = '$_THIRD_SSO_HOST/v2/wechat/appinfocode';

    Map<String, dynamic> p = _commonParams;
    p['package'] = _pid == _PID ? _PACKAGE : Constant.packageName;

    KuGouBaseResp response = await postJson(url, p);

    if (response.success) {
      Map dataMap = response.data;
      AppInfoCode appInfoCode =
          AppInfoCode.fromJson(dataMap as Map<String, dynamic>);

      // FlutterWx.launchWeChatMiniProgram(username: appInfoCode.reqName, path: appInfoCode.reqPath);

      _sTicket = appInfoCode.ticket;

      _disposeTimer();
      _pingTimer = Timer.periodic(
          const Duration(milliseconds: _INTERVAL_TIME), interval);
    }
    return response;
  }

  static void _disposeTimer() {
    if (_pingTimer != null) {
      _pingTimer!.cancel();
      _pingTimer = null;
    }
  }

  static void dispose() {
    _userInfo = null;
    _disposeTimer();
  }

  static void interval(Timer timer) {
    if (timer.isActive && !Util.isStringEmpty(_sTicket)) {
      getGRCodeAuth(_sTicket!);
    }
  }

  static Future<KuGouBaseResp> getGRCodeAuth(String ticket) async {
    String url = '$_THIRD_SSO_HOST/v2/wechat/qrcodeauth';

    Map<String, dynamic> p = _commonParams;

    p['ticket'] = ticket;

    KuGouBaseResp response = await postJson(url, p);
    dynamic data = response.data;

    if (response.success) {
      QRCodeAuth qrCodeAuth = QRCodeAuth.fromJson(data);
      _disposeTimer();
      _sTicket = null;
      await KtvRepo.postUserInfo(qrCodeAuth, _getIp());
    }
    return response;
  }

  static Future<RcmdSongListRsp> getSongList(int page, int type) async {
    String url = '$_COMMERCIAL_HOST/v2/commercial/top/song';

    Map<String, dynamic> p = _commonParams;

    p['userid'] = 'anonymous';
    p['token'] = 'password';
    p['page'] = page;
    p['size'] = _SIZE;
    p['top_id'] = '$type';

    KuGouBaseResp response = await postJson(url, p);

    if (response.success) {
      Map dataMap = response.data;
      try {
        KuGouSongs list = KuGouSongs.fromJson(dataMap as Map<String, dynamic>);
        List<Song> songList = convertFromKuGouSongs(list);
        return RcmdSongListRsp(success: true, songs: songList);
      } catch (e) {
        Log.d(e);
        return RcmdSongListRsp(success: false, msg: '$e');
      }
    } else {
      return RcmdSongListRsp(success: false, msg: response.errorMsg);
    }
  }

  static Future<SongSearchResultRsp> searchSong(
      int page, String keyword) async {
    String url = '$_COMMERCIAL_HOST/v2/commercial/search/song';

    Map<String, dynamic> p = _commonParams;

    p['userid'] = 'anonymous';
    p['token'] = 'password';
    p['page'] = page;
    p['size'] = _SIZE;

    p['keyword'] = keyword;
    KuGouBaseResp response = await postJson(url, p);

    if (response.success) {
      Map dataMap = response.data;
      try {
        KuGouSongs list = KuGouSongs.fromJson(dataMap as Map<String, dynamic>);
        List<Song> songList = convertFromKuGouSongs(list);
        return SongSearchResultRsp(success: true, songs: songList);
      } catch (e) {
        Log.d(e);
        return SongSearchResultRsp(success: false, msg: '$e');
      }
    } else {
      return SongSearchResultRsp(success: false, msg: response.errorMsg);
    }
  }

  static List<Song> convertFromKuGouSongs(KuGouSongs? kuGouSongs) {
    List<Song> songList = [];
    if (kuGouSongs == null || Util.isCollectionEmpty(kuGouSongs.songs)) {
      return songList;
    }

    for (var item in kuGouSongs.songs) {
      /// 可以点唱的歌曲
      if (item.copyRight?.ciqu == 1) {
        Song song2 = Song(
          id: item.songId,
          name: item.songName,
          icon: item.albumImg,
          originalUrl: '',
          originalSize: 0,
          hqUrl: '',
          hqSize: 0,
          hqStatus: 1,
          singerId: item.singerId,
          singerName: Util.isStringEmpty(item.singerName)
              ? K.room_singer_default_name
              : item.singerName,
          uploaderId: item.distributor?.distributorId ?? 0,
          uploaderName: item.distributor?.distributorName ?? '',
          uploaderIcon: '',
          brcUrl: '',
          chose: false,
          showAccuse: false,
          status: 1,
          statusDescription: '',
          platform: SongPlatform.KUGOU,
          playTime: 0,
          platformSongId: item.songId,
          musicId: '${item.songId}',
        );

        songList.add(song2);
      }
    }
    return songList;
  }

  static Future<WholeSong> prdDownload(TemUserInfo userInfo, int songId) async {
    _userInfo = userInfo;
    List<KuGouBaseResp> respList = await Future.wait(
        [getOriginal(userInfo, songId), getAccompany(userInfo, songId)]);

    if (Util.isCollectionEmpty(respList)) {
      return WholeSong(false, R.array('xhr_error_type_array')[6]);
    }

    String? errorMsg;
    bool success = true;

    /// 如果获取原唱都失败了，那就算失败了
    if (respList[0].success == false) {
      errorMsg = respList[0].errorMsg;
      success = false;
    }

    if (!success) {
      return WholeSong(false, errorMsg ?? R.array('xhr_error_type_array')[6]);
    }

    Original original;
    Accompany? accompany;
    try {
      original = Original.fromJson(respList[0].data);
      if (respList[1].success == true) {
        accompany = Accompany.fromJson(respList[1].data);
      }
    } catch (e) {
      return WholeSong(false, '$e');
    }

    /// 如果只有原唱，就直接返回原唱
    if (Util.isStringEmpty(accompany?.krcToken)) {
      return WholeSong.success(original, accompany, null, true, '');
    }

    KuGouBaseResp krcResp = await getKrc(userInfo, accompany!.krcToken);

    SongKrc krc;

    if (krcResp.success) {
      try {
        krc = SongKrc.fromJson(krcResp.data);
      } catch (e) {
        return WholeSong(false, '$e');
      }
    } else {
      /// 歌词获取失败，也返回true，让用户唱
      return WholeSong.success(original, accompany, null, true, '');
    }
    return WholeSong.success(original, accompany, krc, true, '');
  }

  /// 获取歌词
  static Future<KuGouBaseResp> getKrc(
      TemUserInfo userInfo, String krcToken) async {
    String url = '$_COMMERCIAL_HOST/v2/commercial/sdk/accompany/krc';
    Map<String, dynamic> p = _getVipParams(userInfo);
    p['krc_token'] = krcToken;
    KuGouBaseResp response = await postJson(url, p);
    return response;
  }

  static Map<String, dynamic> _getVipParams(TemUserInfo userInfo) {
    Map<String, dynamic> p = {
      'pid': userInfo.temPid,
      'sp': userInfo.temSp,
      'device_id': userInfo.deviceId,
      'client_ip': userInfo.clientIp,
      'timestamp': (DateTime.now().millisecondsSinceEpoch.toInt() ~/ 1000),
      'nonce': const Uuid().v4(),
    };

    p['userid'] = userInfo.temUid;
    p['token'] = userInfo.temToken;
    return p;
  }

  /// 原唱
  static Future<KuGouBaseResp> getOriginal(
      TemUserInfo userInfo, int songId) async {
    String url = '$_COMMERCIAL_HOST/v2/commercial/sdk/song/vip/url';
    Map<String, dynamic> p = _getVipParams(userInfo);
    p['song_id'] = '$songId';

    KuGouBaseResp response = await postJson(url, p);

    //Log.d('getOriginal.. code = ${response.errorCode}. msg = ${response.errorMsg}...data = ${response.data}');

    return response;
  }

  /// 伴奏
  static Future<KuGouBaseResp> getAccompany(
      TemUserInfo userInfo, int songId) async {
    String url = '$_COMMERCIAL_HOST/v2/commercial/sdk/accompany/vip/url';
    Map<String, dynamic> p = _getVipParams(userInfo);
    p['song_id'] = '$songId';

    KuGouBaseResp response = await postJson(url, p);
    return response;
  }

  /// 数据统计
  static Future report(
      int songId, int duration, int playTime, String sourceId) async {
    Map<String, dynamic> p = {
      'pid': _pid,
      'device_id': getDeviceId(),
      'timestamp': (DateTime.now().millisecondsSinceEpoch.toInt() ~/ 1000),
      'nonce': const Uuid().v4(),
      'data': [
        {
          'sp': 'KG',
          'userid': _userInfo?.temUid ?? 'anonymous',
          'song_id': '$songId',
          'duration': duration,
          'play_time': playTime,
          'play_type': 1,
          'api': '/v2/playlist/awesome',
          'source_id': sourceId,
          'lvt': Utility.formatDateV1(
              DateTime.now().millisecondsSinceEpoch.toInt() ~/ 1000),
          'client_ip': _getIp(),
          'media_type': 3,
          'play_quality': 'standard',
          'try_play': 0
        }
      ]
    };

    String url = 'https://thirdssomlisten.kugou.com/v2/monitor/listen';
    KuGouBaseResp resp = await postJson(url, p);
  }

  static Future<KuGouBaseResp> postJson(String url, Map<String, dynamic> params,
      {String? rsa}) async {
    try {
      String str = jsonEncode(params) + _appKey;
      String sign = Util.md5Encryption(str);
      var option = Options(
          method: "POST",
          contentType: "application/json",
          headers: {_SIGNATURE_KEY: Util.isStringEmpty(rsa) ? sign : rsa});
      Response<Map> response =
          await Dio().post<Map>(url, data: params, options: option);
      return KuGouBaseResp.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      return KuGouBaseResp(-1, '$e', null);
    }
  }

  static void initIpAddress() async {
    List<NetworkInterface> res = await NetworkInterface.list();
    for (int i = 0; i < res.length; i++) {
      List<InternetAddress> addresses = res[i].addresses;
      for (int j = 0; j < addresses.length; j++) {
        InternetAddress addr = addresses[j];
        if (isValidIp(addr)) {
          _ip = addresses[j].address;
          break;
        }
      }
    }
  }

  static bool isValidIp(InternetAddress ipAddr) {
    if (ipAddr.type == InternetAddressType.IPv4 &&
        ipAddr.isLoopback == false &&
        ipAddr.isLinkLocal == false &&
        ipAddr.isMulticast == false) {
      return true;
    }
    return false;
  }
}

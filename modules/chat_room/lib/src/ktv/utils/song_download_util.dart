import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/ktv/model/song_sheet_beans.dart';
import 'package:chat_room/src/ktv/utils/progress_provider.dart';
import 'package:chat_room/src/ktv/utils/reporter.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '../../protobuf/generated/common_ktv.pb.dart';
import '../agora/agora_music_util.dart';
import '../widget/download_song_dialog.dart';
import '../model/sound_type.dart';
import '../repo/ktv_repo.dart';
import '../widget/ktv_download_song_dialog.dart';
import '../zego_v2/zego_music_util.dart';

enum DownloadState { AlreadyExists, Success, Failure }

typedef ProgressUpdate = void Function(int count, int total);

class SongDownloadUtil {
  static const String LOG_TAG = "SongDownloadManager";

  static const String songSubDir = "songlist";

  static const String lrcSubDir = "lyrics";

  static const String TABLE_NAME = "ktv_song";

  static Future<bool?> showDownloadDialog(
      BuildContext context, Song song) async {
    return SongDownloadDialog.show(context, song);
  }

  static File getSongFile(String url) {
    String filePath = getSongFilePathByUrl(url);
    return File(filePath);
  }

  static Future<String> getSongFilePath(int songId, SoundType type) async {
    List<Map<String, dynamic>> res = await LocalStorage.db
            ?.rawQuery("select * from $TABLE_NAME where id = $songId") ??
        [];
    if (Util.isCollectionEmpty(res)) {
      return "";
    }

    Map<String, dynamic> songJson = res[0];
    Song song = Song.fromJson(songJson);

    if (await isSongDownSuccessByType(song, type)) {
      return getSongFilePathByUrl(
          type == SoundType.voice ? song.originalUrl : song.hqUrl);
    }
    return "";
  }

  static String getSongFilePathByUrl(String url) {
    if (Util.isStringEmpty(url)) {
      return "";
    }

    String baseDir = getSongSubDirPath();
    String fileName = _md5(url);
    return join(baseDir, fileName);
  }

  static String _md5(String data) {
    var content = const Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes).toLowerCase();
  }

  static Directory getSongSubDir() {
    String baseDir = getSongSubDirPath();
    return Directory(baseDir);
  }

  static String getSongSubDirPath() {
    return join(Constant.documentsDirectory.path, songSubDir);
  }

  static Future<bool> deleteSong(Song song) async {
    File orgSongFile = getSongFile(song.originalUrl);
    File hqSongFile = getSongFile(song.hqUrl);

    bool orgExists = await orgSongFile.exists();
    if (orgExists) {
      await orgSongFile.delete();
    }

    bool hqExists = await hqSongFile.exists();
    if (hqExists) {
      await hqSongFile.delete();
    }

    return true;
  }

  static Future<bool> isSongDownloadSuccess(
      Song song, ChatRoomData room) async {
    if (SongPlatform.ZEGO_V2 == song.platform) {
      bool isSongPreload =
          await room.rtcController.engine!.isMusicPreloaded(song.musicId);
      Log.d('isSongDownloadSuccess isSongPreload:$isSongPreload');
      return isSongPreload;
    }

    if (SongPlatform.AME == song.platform) {
      bool isPreload =
          await room.rtcController.engine!.isAMEMusicPreloaded(song.musicId);
      return isPreload;
    }

    if (SongPlatform.AGORA == song.platform) {
      String? rtmToken = Config.get('AGORA_MUSIC_TOKEN_${Session.uid}');

      await room.rtcController.engine!.initMusicContentCenter(
          RtcBizConfig.zegoConfig.appId, rtmToken, Session.uid);

      int songId = Util.parseInt(song.musicId);
      bool isSongPreload =
          await room.rtcController.engine!.isAgoraMusicPreloaded(songId);
      bool isLyricDownload = await AgoraMusicUtil.isFullLyricDownload(songId);
      Log.d(
          'isSongDownloadSuccess isSongPreload:$isSongPreload, isLyricDownload:$isLyricDownload');
      return isSongPreload && isLyricDownload;
    }

    String orgPath = await getSongFilePath(song.pid, SoundType.voice);

    /// 音速达的可以没有伴奏和歌词
    if (SongPlatform.KUGOU == song.platform && !Util.isStringEmpty(orgPath)) {
      return true;
    }

    String hqPath = await getSongFilePath(song.pid, SoundType.accompany);
    return !Util.isStringEmpty(orgPath) && !Util.isStringEmpty(hqPath);
  }

  static Future<bool> isSongDownSuccessByType(
      Song song, SoundType soundType) async {
    String url = _convertUrlString(song, soundType);
    if (Util.isStringEmpty(url)) {
      return false;
    }
    File songFile = getSongFile(url);
    bool exists = await songFile.exists();
    bool success = false;
    int size = soundType == SoundType.voice ? song.originalSize : song.hqSize;
    if (exists) {
      FileStat stat = await songFile.stat();
      if (stat.size == size) {
        success = true;
      } else {
        await songFile.delete();
      }
    }
    return success;
  }

  static String _convertUrlString(Song song, SoundType soundType) {
    return soundType == SoundType.voice ? song.originalUrl : song.hqUrl;
  }

  static Future<DownloadState> downloadSongs(
    Song song,
    CancelToken cancelToken,
    ValueChanged<double> onReceiveProgress, {
    String? krc,
  }) async {
    int songTotal = song.hqSize + song.originalSize;
    int oriCurrent = 0;
    int hqCurrent = 0;
    Log.d(tag: LOG_TAG, "songTotal = $songTotal");

    bool krcSuccess = true;
    if (!Util.isStringEmpty(krc)) {
      krcSuccess = await _saveKrc(krc!, song.pid);
    }

    if (!krcSuccess) {
      return DownloadState.Failure;
    }

    DownloadState orgState = await downloadSong(
        song.pid, song.originalUrl, song.originalSize, cancelToken: cancelToken,
        onReceiveProgress: (int count, int total) {
      //Log.d("Orig -----------count = $count and total = $total and currentCount = $currentCount and songTotal = $songTotal", LOG_TAG);
      oriCurrent = count;
      onReceiveProgress((oriCurrent + hqCurrent) / songTotal);
    });

    DownloadState hqState;
    if (!Util.isStringEmpty(song.hqUrl, trim: true)) {
      hqState = await downloadSong(song.pid, song.hqUrl, song.hqSize,
          cancelToken: cancelToken, onReceiveProgress: (int count, int total) {
        //Log.d("Hq -----------count = $count and total = $total and currentCount = $currentCount and songTotal = $songTotal", LOG_TAG);
        hqCurrent = count;
        onReceiveProgress((oriCurrent + hqCurrent) / songTotal);
      });
    } else {
      // 不存在也让流程继续，实际使用的时候在判断
      hqState = DownloadState.Success;
      Log.d('song hqUrl isEmpty,hqStatus= ${song.hqStatus}', tag: LOG_TAG);
    }

    bool orgSuccess = orgState == DownloadState.AlreadyExists ||
        orgState == DownloadState.Success;
    bool hqSuccess = hqState == DownloadState.AlreadyExists ||
        hqState == DownloadState.Success;

    if (orgSuccess && hqSuccess && krcSuccess) {
      await insertSong(song);
      if (orgState == DownloadState.AlreadyExists &&
          hqState == DownloadState.AlreadyExists) {
        return DownloadState.AlreadyExists;
      }
      return DownloadState.Success;
    }
    return DownloadState.Failure;
  }

  static Future<bool> insertSong(Song song) async {
    List<Map<String, dynamic>> res = await LocalStorage.db
            ?.rawQuery("select * from $TABLE_NAME where id = ${song.pid}") ??
        [];

    Map<String, dynamic> data = {
      "original_mp3": song.originalUrl,
      "size": song.originalSize,
      "hq_music": song.hqUrl,
      "hq_size": song.hqSize,
      "platform": song.platform,
      "playtime": song.playTime
    };
    if (res.isNotEmpty) {
      await LocalStorage.db
          ?.update(TABLE_NAME, data, where: "id = ?", whereArgs: [song.pid]);
    } else {
      data.putIfAbsent("id", () => song.pid);
      await LocalStorage.db?.insert(TABLE_NAME, data);
    }
    return true;
  }

  static Future<DownloadState> downloadSong(
    int songId,
    String songUrl,
    int songSize, {
    required ProgressUpdate onReceiveProgress,
    CancelToken? cancelToken,
  }) async {
    Directory baseDirectory = getSongSubDir();
    await baseDirectory.create(recursive: true);

    File file = getSongFile(songUrl);
    if (await file.exists()) {
      Log.d("File already exists", tag: LOG_TAG);
      FileStat stat = await file.stat();
      if (stat.size == songSize) {
        Log.d("already downloaded", tag: LOG_TAG);
        return DownloadState.AlreadyExists;
      }
      await file.delete();
    }

    Log.d("Start download songUrl = $songUrl file.path = ${file.path}",
        tag: LOG_TAG);

    try {
      await DownloadManager.downloadWithChunks(songUrl, file.path,
          maxChunk: 3,
          cancelToken: cancelToken, onReceiveProgress: (int count, int total) {
        //Log.d("ProgressUpdate count $count and total = $total",tag: LOG_TAG);
        onReceiveProgress(count, total);
      });
    } catch (e) {
      Log.d(e);
    }
    if (await file.exists()) {
      FileStat stat = await file.stat();
      if (stat.size == songSize) {
        return DownloadState.Success;
      }
      await file.delete();
    }
    return DownloadState.Failure;
  }

  static Future<String> getLyricFilePath(int songId) async {
    List<Map<String, dynamic>> res = await LocalStorage.db
            ?.rawQuery("select * from $TABLE_NAME where id = $songId") ??
        [];
    if (Util.isCollectionEmpty(res)) {
      return "";
    }
    Map<String, dynamic> songJson = res[0];
    String url = songJson["brc"];
    if (await isLyricDownloadSuccessByUrl(url)) {
      return getLyricFilePathByUrl(url);
    }
    return "";
  }

  static File getLyricFileByUrl(String url) {
    String path = getLyricFilePathByUrl(url);
    return File(path);
  }

  static String getLyricFilePathByUrl(String url) {
    if (Util.isStringEmpty(url)) {
      return "";
    }

    String baseDir = getLyricSubDirPath();

    int index = url.lastIndexOf(".");
    if (index > 0) {
      String fileName = url.substring(url.lastIndexOf("/") + 1);
      return join(baseDir, fileName);
    }
    return "";
  }

  static Directory getLyricSubDir() {
    String baseDir = getLyricSubDirPath();
    return Directory(baseDir);
  }

  static String getLyricSubDirPath() {
    return join(Constant.documentsDirectory.path, lrcSubDir);
  }

  static Future<File?> downloadLyricsFile(int songId, String url) async {
    File? lyricFile;
    if (await SongDownloadUtil.downloadLyrics(songId, url)) {
      lyricFile = SongDownloadUtil.getLyricFileByUrl(url);
    }
    return lyricFile;
  }

  static Future<bool> downloadLyrics(int songId, String url) async {
    if (Util.isStringEmpty(url)) {
      return false;
    }

    if (downloadingList.containsKey(songId)) {
      return downloadingList[songId]!.future;
    }
    Completer<bool> completer = Completer<bool>();
    downloadingList.putIfAbsent(songId, () => completer);

    Directory baseDirectory = getLyricSubDir();
    await baseDirectory.create(recursive: true);

    bool downloadSuccess = false;
    File file = getLyricFileByUrl(url);
    if (await file.exists()) {
      String fileMd5 = md5.convert(file.readAsBytesSync()).toString();
      if (_getLyricMd5(url).toLowerCase() == fileMd5.toLowerCase()) {
        downloadSuccess = true;
      } else {
        await file.delete();
      }
    }

    if (!downloadSuccess) {
      try {
        await DownloadManager.download(url, file.path);
      } catch (e) {
        Log.d(e);
      }
      file = getLyricFileByUrl(url);
      if (await file.exists()) {
        downloadSuccess = true;
      }
    }
    downloadingList.remove(songId);
    completer.complete(downloadSuccess);
    if (downloadSuccess) {
      await _insertLyric(songId, url);
    }
    return completer.future;
  }

  static Future<bool> _insertLyric(int songId, String url) async {
    List<Map<String, dynamic>> res = await LocalStorage.db
            ?.rawQuery("select * from $TABLE_NAME where id = $songId") ??
        [];

    Map<String, dynamic> data = {"brc": url};
    if (res.isNotEmpty) {
      await LocalStorage.db
          ?.update(TABLE_NAME, data, where: "id = ?", whereArgs: [songId]);
    } else {
      data.putIfAbsent("id", () => songId);
      await LocalStorage.db?.insert(TABLE_NAME, data);
    }
    return true;
  }

  static String _getLyricMd5(String url) {
    return url.substring(url.lastIndexOf("/") + 1, url.lastIndexOf("."));
  }

  static Future<bool> isLyricDownloadSuccess(int songId) async {
    String path = await getLyricFilePath(songId);
    return !Util.isStringEmpty(path);
  }

  static Future<File> getLyricFile(int songId) async {
    String path = await getLyricFilePath(songId);
    return File(path);
  }

  static Future<bool> isLyricDownloadSuccessByUrl(String url) async {
    File file = getLyricFileByUrl(url);
    if (await file.exists()) {
      return true;
    }
    return false;
  }

  static Future<bool> _saveKrc(String krc, int songId) async {
    Directory baseDirectory = getLyricSubDir();
    await baseDirectory.create(recursive: true);
    File file = getKuGouKrcFile(songId);

    if (await file.exists()) {
      FileStat stat = await file.stat();
      if (stat.size > 0) {
        return true;
      }
    }
    try {
      await file.writeAsString(krc);
      return true;
    } catch (e) {
      Log.d('_saveKrc...$e');
      return false;
    }
  }

  static File getKuGouKrcFile(int songId) {
    String baseDir = getLyricSubDirPath();
    String filePath = join(baseDir, 'kugou_$songId.krc');
    File file = File(filePath);
    return file;
  }

  static Future<String?> getKuGouKrc(int songId) async {
    File file = getKuGouKrcFile(songId);

    if (await file.exists()) {
      FileStat stat = await file.stat();
      if (stat.size > 0) {
        String str = await file.readAsString();
        return str;
      }
    }
    return null;
  }

  static Future<bool> isKuGouKrcDownload(int songId) async {
    File file = getKuGouKrcFile(songId);

    bool exist = await file.exists();
    int size = (await file.stat()).size;
    return exist && size > 0;
  }

  static Future<String> getAMEKrc(String musicId, ChatRoomData room) async {
    bool isPreLoad =
        await room.rtcController.engine!.isAMEMusicPreloaded(musicId);
    if (isPreLoad) {
      String filePath = await room.rtcController.engine!
          .genAMEMusicURI(musicId, AMEMusicInterface.musicTypeLyric);
      File file = File(filePath);
      bool exist = await file.exists();
      if (exist) {
        String contentStr = await file.readAsString();
        return contentStr;
      }
    }

    return '';
  }

  static Map<int, Completer<bool>> downloadingList = {};

  static Future<bool> checkAndJoinMic(
      ChatRoomData room, BuildContext context, String contentText) async {
    if (room.isMic == true) {
      return true;
    }
    //点歌前必须先上麦
    if (Session.uid == room.config?.uid) {
      //房主直接上麦
      await RoomRepository.joinMic(
        room.rid,
        -1,
        uid: 0,
        toastError: true,
        toastSuccess: false,
        needCertify: true,
        type: room.needVerify,
        newType: room.needVerifyNew,
      );
    } else {
      bool? micJoined = await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return ConfirmDialog(
              title: K.ktv_apply_for_mic,
              content: contentText,
              positiveButton: PositiveButton(
                onPressed: () async {
                  //自己上麦
                  if (room.isEightOwner(Session.uid)) {
                    room.setRole(ClientRole.Broadcaster);
                    Navigator.of(context).pop(true);
                    return;
                  }

                  KtvReporter.applyOnMic(room.rid);

                  if (room.config?.mode == RoomMode.Lock &&
                      Session.uid != room.config?.uid) {
                    // 非自由上麦，排麦
                    await RoomRepository.queue(
                        room.rid, RoomConstant.Queue_Join,
                        needCertify: true,
                        type: room.needVerify,
                        newType: room.needVerifyNew);
                    Navigator.of(context).pop(false);
                  } else {
                    // 自由上麦，上麦
                    await RoomRepository.joinMic(
                      room.rid,
                      -1,
                      uid: 0,
                      toastError: true,
                      toastSuccess: false,
                      needCertify: true,
                      type: room.needVerify,
                      newType: room.needVerifyNew,
                    );
                    Navigator.of(context).pop(true);
                  }
                },
              ),
            );
          });
      if (micJoined != true) {
        return false;
      }
    }
    return true;
  }

  static Future<SongDownloadResult> songDownload(
      Song song, ChatRoomData room, BuildContext context) async {
    bool success = false;
    String? krc;
    if (SongPlatform.AGORA == song.platform) {
      bool? hasPreload = await room.rtcController.engine
          ?.isAgoraMusicPreloaded(Util.parseInt(song.musicId));
      Log.d('isAgoraMusicPreloaded:$hasPreload');

      if (hasPreload == false) {
        int tokenSetTime = Util.parseInt(
            Config.get('AGORA_MUSIC_TOKEN_SET_TIME_WITH_${Session.uid}'));
        String? rtmToken = Config.get('AGORA_MUSIC_TOKEN_${Session.uid}');
        int now = DateTime.now().millisecondsSinceEpoch;

        bool tokenIsOk = true;

        /// 更新token
        if (tokenSetTime == 0 || now - tokenSetTime > 23 * 3600 * 1000) {
          CommonLoading.show(status: BaseK.K.common_loading);
          ResMusicToken tokenRes =
              await KtvRepo.getAgoraToken(room.ktvSourceType ?? 0, force: 1);
          CommonLoading.dismiss();

          if (tokenRes.success == true && Util.validStr(tokenRes.data.token)) {
            await Config.set('AGORA_MUSIC_TOKEN_SET_TIME_WITH_${Session.uid}',
                now.toString());
            await Config.set(
                'AGORA_MUSIC_TOKEN_${Session.uid}', tokenRes.data.token);
            rtmToken = tokenRes.data.token;
          } else {
            tokenIsOk = false;
            Fluttertoast.showToast(msg: BaseK.K.base_net_error);
          }
        }

        if (tokenIsOk) {
          await room.rtcController.engine?.initMusicContentCenter(
              RtcBizConfig.zegoConfig.appId, rtmToken, Session.uid);

          var dialog = KtvDownloadSongDialog(
            providerBuilder: (ProgressCallBack onProgressChanged,
                CompleteCallBack onCompleted) {
              return AgoraMusicProgressProvider(Util.parseInt(song.musicId),
                  room, onProgressChanged, onCompleted);
            },
          );
          success = (await dialog.show(context)) ?? false;
        }
      } else {
        var provider = AgoraMusicProgressProvider(
            Util.parseInt(song.musicId), room, null, null);
        await provider.startLoadLrc();
        success = true;
      }

      if (success) {
        int songId = Util.parseInt(song.musicId);
        if (await AgoraMusicUtil.isLyricDownload(songId)) {
          krc = await AgoraMusicUtil.getLyricString(songId);
        }
      }
    } else if (SongPlatform.ZEGO_V2 == song.platform) {
      bool? hasPreload =
          await room.rtcController.engine?.isMusicPreloaded(song.musicId);
      if (hasPreload == false) {
        var dialog = KtvDownloadSongDialog(providerBuilder:
            (ProgressCallBack onProgressChanged, CompleteCallBack onCompleted) {
          return ZegoMusicProgressProvider(
              song.musicId, room, onProgressChanged, onCompleted);
        });
        success = (await dialog.show(System.context)) ?? false;
      } else {
        success = true;
      }

      Log.d('KtvDownloadSongDialog success:$success');

      if (success) {
        krc = await ZegoMusicUtil.getLyricString(song.musicId);
      }
    } else {
      success = await SongDownloadDialog.show(context, song) ?? false;
    }
    return SongDownloadResult(success: success, krc: krc);
  }
}

class SongDownloadResult {
  bool success;
  String? krc;

  SongDownloadResult({this.success = false, this.krc});
}

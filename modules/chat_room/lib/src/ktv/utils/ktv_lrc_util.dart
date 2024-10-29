import 'dart:io';
import 'dart:typed_data';

import 'package:shared/shared.dart';
import 'package:flutter_lyric/flutter_lyric.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/ktv/model/sound_type.dart';
import '../../base/repo/ame_music_api.dart';
import '../../protobuf/generated/common_ktv.pb.dart';
import '../../protobuf/generated/tencent_music.pb.dart';
import '../kugou/kugou_repo.dart';
import '../model/song_sheet_beans.dart';
import '../repo/ktv_repo.dart';
import '../agora/agora_music_util.dart';
import '../zego_v2/zego_music_util.dart';
import 'song_download_util.dart';

class KtvLrcUtil {
  static const _LOG_TAG = 'KtvLrcUtil';

  static Future<List<Lyric>> prepareLyrics(KtvInfo? ktvInfo) async {
    List<Lyric> lyrics = [];

    if (ktvInfo == null || ktvInfo.currentSong == null) {
      return lyrics;
    }

    /// agora 的歌词
    if (SongPlatform.AGORA == ktvInfo.currentSong!.platform) {
      lyrics = await AgoraMusicUtil.loadLyric(
              Util.parseInt(ktvInfo.currentSong!.musicId),
              ktvInfo.currentSong!.brc) ??
          [];
      return lyrics;
    }

    /// zego v2 歌词
    if (SongPlatform.ZEGO_V2 == ktvInfo.currentSong!.platform) {
      lyrics = await ZegoMusicUtil.loadLyric(
          ktvInfo.currentSong!.musicId, ktvInfo.currentSong!.brc);
      return lyrics;
    }

    try {
      bool lyricDownloaded = await SongDownloadUtil.isLyricDownloadSuccess(
          ktvInfo.currentSong!.pid);
      if (lyricDownloaded) {
        lyrics = await _loadLyricsToMemory(ktvInfo);
      } else {
        lyricDownloaded = await SongDownloadUtil.downloadLyrics(
            ktvInfo.currentSong!.pid, ktvInfo.currentSong!.brc);
        if (lyricDownloaded) {
          lyrics = await _loadLyricsToMemory(ktvInfo);
        }
      }
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
    Log.d(
      tag: _LOG_TAG,
      'prepareLyrics songId = ${ktvInfo.currentSong!.sid}, name = ${ktvInfo.currentSong!.sname}, brc =  ${ktvInfo.currentSong!.brc} and lyrics.length = ${lyrics.length}',
    );
    return lyrics;
  }

  static Future<List<Lyric>> _loadLyricsToMemory(KtvInfo ktvInfo) async {
    File lyricFile =
        await SongDownloadUtil.getLyricFile(ktvInfo.currentSong!.pid);
    List<Lyric> lyrics;

    if (ktvInfo.currentSong!.platform == SongPlatform.KUGOU ||
        ktvInfo.currentSong!.platform == SongPlatform.AME) {
      String contentStr = await lyricFile.readAsString();
      lyrics = LyricUtil.formatKrcLyricWithGap(contentStr,
          ktvInfo.currentSong!.playTime, ktvInfo.currentSong!.platform);
    } else {
      Uint8List contentBytes = await lyricFile.readAsBytes();
      String lyricStr = LyricUtil.decryptXorStr(contentBytes);
      lyrics = LyricUtil.formatKrcLyricWithGap(lyricStr,
          ktvInfo.currentSong!.playTime, ktvInfo.currentSong!.platform);
    }
    return lyrics;
  }

  /*
  * 点歌面板搜索音乐(依据多个条件进行判断)
  * rid: 哪个房间
  * keyword: 关键字
  * platform: 哪个平台
  * page: 第几页
  * isConfirmSearch: 是否是确认搜索
  * */
  static Future<PageListResponse> songSheetSearchMusic(
    int rid,
    String keyword,
    String platform,
    int page,
    bool isConfirmSearch, {
    required bool userNewApi,
    required int ktvSourceType,
  }) async {
    /// 新增的逻辑
    if (userNewApi) {
      return KtvRepo.searchSongV2(rid, keyword, page, ktvSourceType);
    }

    /// 原有的逻辑
    if (platform == SongPlatform.KUGOU) {
      return KuGouRepo.searchSong(page, keyword);
    }
    if (platform == SongPlatform.AME) {
      return AMEMusicApi.searchSong(keyword, page - 1, 25, rid);
    }
    return KtvRepo.searchSong(keyword, rid, page, isConfirmSearch);
  }

  /*
  * 点歌面板获取每一个 Tab 栏对应的音乐列表
  * rid: 哪个房间
  * tab: 哪个 Tab
  * page: 第几页
  * */
  static Future<PageListResponse> songSheetGetTabSongList(
    int rid,
    SongTapItem tab,
    int page, {
    required bool userNewApi,
    required int ktvSourceType,
  }) async {
    /// 新增的逻辑
    if (userNewApi &&
        [SongPlatform.AGORA, SongPlatform.ZEGO_V2, SongPlatform.KUGOU]
            .contains(tab.platform)) {
      return KtvRepo.getRcmdSongListV2(
          rid, tab.playlistId, ktvSourceType, page);
    }

    /// 原有的逻辑
    if (tab.platform == SongPlatform.KUGOU) {
      return KuGouRepo.getSongList(page, tab.type);
    }

    if (tab.platform == SongPlatform.AME) {
      return AMEMusicApi.getSongList(page - 1, 25, tab.playlistId, rid);
    }

    return KtvRepo.getRcmdSongList(rid, '${tab.type}', page);
  }

  /*
  * 将一个 MusicInfoSet model 转换成现有的 Song model
  * music: 新的接口返回的表示一首音乐的信息
  * */
  static Song songFromMusicInfo(MusicInfoSet music, String platform) {
    var song = Song();
    song.id = Util.parseInt(music.musicId);
    song.musicId = music.musicId;
    song.platformSongId = Util.parseInt(music.musicId);
    song.name = music.name;
    song.icon = music.songCover;
    song.singerName =
        music.singerSet.reduce((value, element) => '$value,$element');
    song.chose = music.choosed;
    song.playTime = music.duration;
    song.showAccuse = false;
    song.platform = platform;
    return song;
  }
}

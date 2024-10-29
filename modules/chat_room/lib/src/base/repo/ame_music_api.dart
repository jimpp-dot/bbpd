import 'package:shared/shared.dart';
import 'package:chat_room/src/ktv/model/song_sheet_beans.dart';
import 'package:chat_room/src/ktv/model/sound_type.dart';
import 'package:chat_room/src/protobuf/generated/rpc_ame.pb.dart';

import '../../../k.dart';

class AMEMusicApi {
  /// 获取直播互动曲库推荐歌单列表
  ///  page：【0，1，2。。。。】
  static Future<RepDescribeKTVPlaylists> getDescribeKTVPlaylists(
      int page, int limit) async {
    String url =
        "${System.domain}go/yy/ame/describeKTVPlaylists?page=$page&limit=$limit";
    try {
      XhrResponse response =
          await Xhr.post(url, {}, throwOnError: true, pb: true);
      RepDescribeKTVPlaylists res =
          RepDescribeKTVPlaylists.fromBuffer(response.bodyBytes);
      return res;
    } catch (e) {
      Log.d('getDescribeKTVPlaylists error: $e');
      return RepDescribeKTVPlaylists(success: false, message: '$e');
    }
  }

  /// 获取直播互动曲库推荐歌单列表
  ///  page：【0，1，2。。。。】
  static Future<RepDescribeKTVPlaylistDetail> getDescribeKTVPlaylistDetail(
    int page,
    int limit,
    String playlistid, {
    int rid = 0,
  }) async {
    String url =
        "${System.domain}go/yy/ame/describeKTVPlaylistDetail?page=$page&limit=$limit&playlistid=$playlistid&rid=$rid";

    try {
      XhrResponse response =
          await Xhr.post(url, {}, throwOnError: true, pb: true);
      RepDescribeKTVPlaylistDetail res =
          RepDescribeKTVPlaylistDetail.fromBuffer(response.bodyBytes);
      return res;
    } catch (e) {
      Log.d('getDescribeKTVPlaylistDetail error: $e');
      return RepDescribeKTVPlaylistDetail(success: false, message: '$e');
    }
  }

  /// 获取直播互动曲目详情
  static Future<RepDescribeKTVMusicDetail> getDescribeKTVMusicDetail(
      String musicId) async {
    String url =
        "${System.domain}go/yy/ame/describeKTVMusicDetail?musicId=$musicId";

    try {
      XhrResponse response =
          await Xhr.post(url, {}, throwOnError: true, pb: true);
      RepDescribeKTVMusicDetail res =
          RepDescribeKTVMusicDetail.fromBuffer(response.bodyBytes);
      return res;
    } catch (e) {
      Log.d('getDescribeKTVMusicDetail error: $e');
      return RepDescribeKTVMusicDetail(success: false, message: '$e');
    }
  }

  /// 搜索直播互动曲库歌曲
  ///  page：【0，1，2。。。。】
  static Future<RepSearchKTVMusics> searchKTVMusics(
      String keyword, int page, int limit,
      {int rid = 0}) async {
    String url =
        "${System.domain}go/yy/ame/searchKTVMusics?keyword=$keyword&page=$page&limit=$limit&rid=$rid";

    try {
      XhrResponse response =
          await Xhr.post(url, {}, throwOnError: true, pb: true);
      RepSearchKTVMusics res =
          RepSearchKTVMusics.fromBuffer(response.bodyBytes);
      return res;
    } catch (e) {
      Log.d('searchKTVMusics error: $e');
      return RepSearchKTVMusics(success: false, message: '$e');
    }
  }

  /// KTV拉取推荐列表，并转通用数据格式
  /// page：【0，1，2。。。。】
  static Future<RcmdSongListRsp> getSongList(
      int page, int limit, String playlistid, int rid) async {
    RepDescribeKTVPlaylistDetail detail =
        await getDescribeKTVPlaylistDetail(page, limit, playlistid, rid: rid);
    if (detail.success) {
      try {
        List<Song> songList = convertFromAMESongs(detail.data.info);
        return RcmdSongListRsp(success: true, songs: songList);
      } catch (e) {
        return RcmdSongListRsp(success: false, msg: '$e');
      }
    } else {
      return RcmdSongListRsp(success: detail.success, msg: detail.message);
    }
  }

  /// KTV搜索，并转通用数据格式
  /// page：【0，1，2。。。。】
  static Future<SongSearchResultRsp> searchSong(
      String keyword, int page, int limit, int rid) async {
    RepSearchKTVMusics search =
        await searchKTVMusics(keyword, page, limit, rid: rid);
    if (search.success) {
      try {
        List<Song> songList = convertFromAMESongs(search.data.info);
        return SongSearchResultRsp(success: true, songs: songList);
      } catch (e) {
        return SongSearchResultRsp(success: false, msg: '$e');
      }
    } else {
      return SongSearchResultRsp(success: search.success, msg: search.message);
    }
  }

  static List<Song> convertFromAMESongs(List<KTVMusicInfoSet> ameSongs) {
    List<Song> songList = [];
    if (Util.isCollectionEmpty(ameSongs)) {
      return songList;
    }

    for (var item in ameSongs) {
      item.singerSet.removeWhere((element) => !Util.validStr(element));
      String singerName = item.singerSet.isNotEmpty ? item.singerSet[0] : '';
      Song song2 = Song(
        id: 0,
        name: item.name,
        icon: '',
        originalUrl: '',
        originalSize: 0,
        hqUrl: '',
        hqSize: 0,
        hqStatus: 1,
        singerId: 0,
        singerName: Util.isStringEmpty(singerName)
            ? K.room_singer_default_name
            : singerName,
        uploaderId: 0,
        uploaderName: '',
        uploaderIcon: '',
        brcUrl: '',
        chose: item.choosed,
        showAccuse: false,
        status: 1,
        statusDescription: '',
        platform: SongPlatform.AME,
        playTime: item.hasDuration() ? item.duration.toInt() * 1000 : 0,
        platformSongId: 0,
        musicId: item.musicId,
      );

      songList.add(song2);
    }
    return songList;
  }
}

class AMERcmdSongListRsp extends BaseResponse
    with PageListResponse<KTVMusicInfoSet> {
  @override
  List<KTVMusicInfoSet>? items;

  AMERcmdSongListRsp({
    required bool success,
    String? msg,
    this.items,
  }) : super(success: success, msg: msg);
}

import 'package:shared/shared.dart';
import 'package:chat_room/src/ktv/repo/ktv_repo.dart';
import 'package:chat_room/src/music/model/muisc_play_list_model.dart';
import 'package:chat_room/src/protobuf/generated/common_ktv.pb.dart';

import 'base_music_search_repo.dart';
import '../model/music_model.dart';

class ZegoMusicSearchRepo with BaseMusicSearchRepo {
  final int rid;

  ZegoMusicSearchRepo(this.rid);

  @override
  bool get filterSensitive => true;

  /// 热搜数据加载
  @override
  Future<List<Music>> loadHotSearch() async {
    List<Music> result = [];
    ResMusicSearch rsp = await KtvRepo.getHotMusic(rid, PLAY_LIST_TYPE_ZEGO);
    Log.d('zego loadHotSearch:$rsp');
    if (rsp.success) {
      for (var element in rsp.data.info) {
        Music music = Music(
          element.musicId.hashCode,
          Music.zego_v2,
          '${element.singerSet.reduce((value, element) => '$value,$element')}-${element.name}',
          '',
          0,
          musicId: element.musicId,
          author:
              element.singerSet.reduce((value, element) => '$value,$element'),
        );
        result.add(music);
      }
    }
    return result;
  }

  @override
  Future<List<Music>> searchMusic(String word) async {
    List<Music> result = [];
    ResMusicSearch rsp =
        await KtvRepo.searchMusic(rid, word, 1, PLAY_LIST_TYPE_ZEGO);
    Log.d('searchMusic:$rsp');
    if (rsp.success) {
      for (var element in rsp.data.info) {
        Music music = Music(
          element.musicId.hashCode,
          Music.zego_v2,
          '${element.singerSet.reduce((value, element) => '$value,$element')}-${element.name}',
          '',
          0,
          musicId: element.musicId,
          author:
              element.singerSet.reduce((value, element) => '$value,$element'),
        );
        result.add(music);
      }
    }

    return result;
  }
}

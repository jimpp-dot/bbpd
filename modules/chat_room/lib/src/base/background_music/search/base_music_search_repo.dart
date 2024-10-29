import 'package:shared/shared.dart';

import '../model/music_model.dart';

mixin BaseMusicSearchRepo {
  /// 是否过滤敏感内容
  bool get filterSensitive;

  Future<List<Music>> searchMusic(String word);

  Future<List<Music>> loadHotSearch();

  bool musicContainTrie(String singerName, String songName) =>
      Util.containTrie(singerName) || Util.containTrie(songName);
}

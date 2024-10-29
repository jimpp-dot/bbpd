import 'package:shared/shared.dart';
import 'package:path/path.dart';
import 'package:chat_room/src/ktv/kugou/model/kugou_song_beans.dart';
import 'package:chat_room/src/ktv/model/song_sheet_beans.dart';

class KtvUrlFileUtil {
  static String getFileName(String url) {
    if (Util.isStringEmpty(url)) {
      return '';
    }
    return basename(url);
  }

  static String getFileMd5(String url) {
    String fileName = getFileName(url);
    if (Util.isStringEmpty(fileName)) {
      return '';
    }
    return fileName.split('.')[0];
  }

  static void fillSongByKuGouSong(Song song, WholeSong wholeSong) {
    song.originalUrl = wholeSong.original?.songUrl ?? '';
    song.originalSize = wholeSong.original?.songSize ?? 0;
    song.hqUrl = wholeSong.accompany?.accompanyUrl ?? '';
    song.hqSize = wholeSong.accompany?.accompanySize ?? 0;
    song.playTime = wholeSong.original?.duration ?? 0;
  }
}

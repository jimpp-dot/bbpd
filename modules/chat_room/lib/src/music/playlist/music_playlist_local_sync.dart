import 'package:chat_room/k.dart';

import 'package:shared/shared.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:chat_room/src/music/model/muisc_play_list_model.dart';

import '../music_config.dart';
import '../music_room_helper.dart';

/// 播放列表本地上传
/// 并没有上传文件到服务器，而是记录用户的本地路径
class MusicPlayListLocalSync {
  /// 选择文件并且上传
  Future<String?> chooseMusic(BuildContext context) async {
    var hasPermission = await MusicRoomHelper.checkStoragePermission(context);
    if (hasPermission != true) {
      return null;
    }
    final result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );
    String path = result?.files.first.path ?? '';
    if (Util.isStringEmpty(path)) {
      return null;
    }
    int index = path.lastIndexOf(".");
    if (index == -1) {
      Fluttertoast.showCenter(msg: K.room_muisc_add_no_sufix);
      return null;
    }
    String ext = path.substring(index + 1).toLowerCase();
    if (!SUPPORT_MUSIC_TYPE.contains(ext)) {
      Fluttertoast.showCenter(
          msg: K.room_music_support_type + SUPPORT_MUSIC_TYPE.join(", "));
      return null;
    }
    return path;
  }

  Future<bool> chooseAndSyncServer(BuildContext context, int rid) async {
    String? path = await chooseMusic(context);
    if (path != null && path.isNotEmpty) {
      return MusicRoomHelper.syncMusic2Server(
          rid: rid, path: path, type: PLAY_LIST_TYPE_LOCAL);
    }
    return false;
  }
}

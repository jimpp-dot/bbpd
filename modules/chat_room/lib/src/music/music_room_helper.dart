import 'dart:io';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

import 'model/muisc_play_list_model.dart';
import 'repo/music_list_repo.dart';
import 'unique_music_id.dart';

class MusicRoomHelper {
  static Future<bool> checkStoragePermission(BuildContext context) async {
    if (Platform.isAndroid) {
      PermissionStatus storagePermission =
          await PermissionUtil.checkAndRequestPermissions(
              context, Permission.storage);
      if (storagePermission != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  static bool isMusicManager(ChatRoomData room) {
    return room.purview == Purview.Createor ||
        room.purview == Purview.SuperAdmin ||
        room.purview == Purview.Admin;
  }

  static bool isCreator(ChatRoomData room) {
    return room.createor?.uid == Session.uid;
  }

  static Future<bool> syncMusic2Server({
    required int rid,
    required String path,
    String? name,
    int? uniId,
    int type = PLAY_LIST_TYPE_LOCAL,
  }) async {
    var id = uniId ?? MusicUniqueId.getUniqueId(basename(path));
    if (name == null || name.isEmpty) {
      name = basenameWithoutExtension(path);
    }
    var resp = await MusicListRepo.musicAdd(
      rid: rid,
      type: type,
      resourcePath: path,
      name: name,
      uniqueId: '$id',
    );
    if (resp.success == true) {
      return true;
    } else if (resp.msg != null) {
      Fluttertoast.showCenter(msg: resp.msg);
    }
    return false;
  }

  /// 这里检测远端的文件http response head, 为200才认为文件有效
  static Future<bool> checkRemoteFileExist(String url) async {
    if (url.isEmpty) {
      return false;
    }
    Dio dio = Dio();
    dio.options
      ..connectTimeout = const Duration(seconds: 5)
      ..receiveTimeout = const Duration(seconds: 5);
    try {
      var resp = await dio.head(url);
      Log.d('checkRemoteFileExist resp->=$resp');
      return resp.statusCode == 200;
    } on DioError catch (e) {
      Log.d('checkRemoteFileExist error=$e ,url=$url');
      return false;
    }
  }
}

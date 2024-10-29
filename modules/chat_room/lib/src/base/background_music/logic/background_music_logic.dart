import 'dart:io';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/protobuf/generated/common_ktv.pb.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import '../model/music_model.dart';
import '../util/music_util.dart';

class BackgroundMusicLogic extends GetxController {
  List<Music> myMusics = [];

  RxBool displayUpload = true.obs;

  /// 默认用酷狗音乐
  bool showKugou = true;

  /// zego v2 默认关闭
  bool showZego = false;

  Future<void> loadConfig(int rid) async {
    ResBgMConfig rsp = await RoomApi.getMusicConfig(rid);
    if (rsp.success) {
      displayUpload.value = rsp.data.allowUpload;
      showZego = rsp.data.showZegoMusic;
      showKugou = rsp.data.showKugouMusic;
    }
  }

  Future<void> loadMusic(int rid) async {
    await loadConfig(rid);

    myMusics.clear();
    if (showKugou) {
      await loadKugouMusic();
    }

    if (showZego) {
      await loadZegoMusic();
    }

    sortMusic();

    MusicController.musicDatas = myMusics;
    MusicController.musicDatas.asMap().forEach((index, music) {
      if (MusicController.data != null &&
          MusicController.data!.id == music.id) {
        MusicController.playIndex = index;
      }
    });

    update();
  }

  Future<void> loadKugouMusic() async {
    List<Music> result = await MusicUtil.getMyMusics();
    myMusics.addAll(result);
  }

  Future<void> loadZegoMusic() async {
    List<Music> result = await MusicUtil.getMyZegoMusics();

    myMusics.addAll(result);
  }

  void insertMusic(Music item) {
    if (isMusicExists(item)) return;
    if (item.isZegoMusic) {
      MusicUtil.insertZegoMusic(item);
    }

    myMusics.add(item);
    myMusics.sort();
    update();
  }

  bool isMusicExists(Music item) {
    int index = myMusics.indexWhere((element) =>
        element.id == item.id && element.musicId == element.musicId);
    return index >= 0;
  }

  removeMusic(Music item) async {
    myMusics.remove(item);
    update();
    if (item.isLocalMusic) {
      _deleteLocalFile(item);
    }
  }

  void _deleteLocalFile(Music item) async {
    await LocalStorage.db
        ?.execute("delete from $musicTable where id = ${item.id}");

    String oldPath = item.path;
    String newPath;
    // IOS绝对路径，需要转换
    if (Platform.isIOS && oldPath.contains('music')) {
      newPath = path.join(
          Constant.documentsDirectory.path, "music", path.basename(oldPath));
    } else {
      newPath = oldPath;
    }

    File file = File(newPath);
    if (await file.exists()) {
      await file.delete();
    }
  }

  void sortMusic() {
    myMusics.sort();
  }
}

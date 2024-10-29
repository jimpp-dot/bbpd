import 'dart:io';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/ktv/utils/progress_provider.dart';
import 'package:chat_room/src/ktv/widget/ktv_download_song_dialog.dart';
import 'package:chat_room/src/music/model/muisc_play_list_model.dart';
import 'package:chat_room/src/music/playlist/music_playlist_manager.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:get/get.dart';
import '../download/music_download_manager.dart';
import '../logic/background_music_logic.dart';
import '../model/music_model.dart';

/// 背景音乐搜索item
///
class MusicSearchItem extends StatefulWidget {
  final ChatRoomData room;
  final Music data;

  const MusicSearchItem({
    Key? key,
    required this.room,
    required this.data,
  }) : super(key: key);

  @override
  State<MusicSearchItem> createState() => _MusicSearchItemState();
}

class _MusicSearchItemState extends State<MusicSearchItem>
    with TickerProviderStateMixin<MusicSearchItem> {
  MusicDownloadState _downloadState = MusicDownloadState.no;

  late AnimationController _downloadingAni;

  final BackgroundMusicLogic _logic = Get.find<BackgroundMusicLogic>();

  @override
  void initState() {
    super.initState();
    _downloadingAni = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _downloadingAni.addStatusListener(_aniStatusLis);

    // Log.d('this.widget.data = ${widget.data}');
    _checkLocalHas();
  }

  //检查本地是否有
  Future<bool> _checkLocalHas() async {
    int id = widget.data.id;
    if (widget.data.isZegoMusic) {
      int index = _logic.myMusics
          .indexWhere((element) => element.musicId == widget.data.musicId);
      Log.d('this.widget.data = ${widget.data}, index:$index');
      if (index >= 0) {
        _downloadState = MusicDownloadState.downloaded;
        return true;
      }

      return false;
    }

    if (widget.room.isMusicRoom == true) {
      // 检查音乐房列表是否有这个音乐
      MusicPlayListItem? item =
          MusicPlayListManager.inst.playListVM.getItemByUniqueId(id);
      if (item == null) return false;

      if (mounted) {
        setState(() {
          _downloadState = MusicDownloadState.downloaded;
        });
        return true;
      }
    } else {
      List<Map<String, dynamic>>? res = await LocalStorage.db
          ?.rawQuery("select * from $musicTable where id = $id");
      if (res?.isNotEmpty ?? false) {
        String oldPath = res![0]['path'];
        String newPath;
        if (Platform.isIOS && oldPath.contains('music')) {
          // IOS绝对路径，需要转换
          newPath = path.join(Constant.documentsDirectory.path, "music",
              path.basename(oldPath));
        } else {
          newPath = oldPath;
        }
        File file = File(newPath);
        if (await file.exists()) {
          if (mounted) {
            setState(() {
              _downloadState = MusicDownloadState.downloaded;
            });
          }
          return true;
        }
      }
    }

    return false;
  }

  @override
  void dispose() {
    _downloadingAni.removeStatusListener(_aniStatusLis);
    _downloadingAni.dispose();

    super.dispose();
  }

  void _aniStatusLis(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      if (!mounted) return;

      _downloadingAni.reset();
      if (_downloadState == MusicDownloadState.downloading) {
        _downloadingAni.forward(from: 0.0);
      }
    }
  }

  _download() async {
    int id = widget.data.id;
    bool res = await _checkLocalHas();
    if (res) return;

    if (widget.data.isZegoMusic) {
      bool success = false;
      bool? hasPreload = await widget.room.rtcController.engine
          ?.isMusicPreloaded(widget.data.musicId);
      if (hasPreload == false) {
        setState(() {
          _downloadState = MusicDownloadState.downloading;
          _downloadingAni.forward(from: 0.0);
        });
        var dialog = KtvDownloadSongDialog(providerBuilder:
            (ProgressCallBack onProgressChanged, CompleteCallBack onCompleted) {
          return ZegoMusicProgressProvider(
              widget.data.musicId, widget.room, onProgressChanged, onCompleted);
        });
        success = (await dialog.show(System.context)) ?? false;
      } else {
        success = true;
      }
      if (success) {
        _logic.insertMusic(Music(
          id,
          Music.zego_v2,
          widget.data.name,
          '',
          DateTime.now().millisecondsSinceEpoch,
          musicId: widget.data.musicId,
          author: widget.data.author,
        ));

        _downloadState = MusicDownloadState.downloaded;
        refresh();
      }
    } else {
      if (!DownloadManger.instance().exists(id)) {
        DownloadManger.instance()
            .add(widget.data, _onError, _onSuccess, widget.room);

        if (!mounted) return;
        setState(() {
          _downloadState = MusicDownloadState.downloading;
          _downloadingAni.forward(from: 0.0);
        });
      }
    }
  }

  _onError(int id) {
    if (DownloadManger.instance().data.containsKey(id)) {
      DownloadManger.instance().data.remove(id);
      Fluttertoast.showToast(msg: "下载出错了，请重试");
      if (!mounted) return;
      setState(() {
        _downloadState = MusicDownloadState.no;
      });
    }
  }

  _onSuccess(Music music) {
    Log.d('download _onSuccess id=${music.id}');
    DownloadManger.instance().delete(music.id);
    if (!mounted) return;
    setState(() {
      _downloadState = MusicDownloadState.downloaded;
    });
    if (!widget.room.isMusicRoom) {
      Music data = widget.data.copy();
      data.dateline = DateTime.now().millisecondsSinceEpoch;
      Log.d('download insertMusic id=${music.id}');
      _logic.insertMusic(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    String iconPath = 'music/music_hasnt_download.svg';
    if (_downloadState == MusicDownloadState.downloading) {
      iconPath = 'music/music_downloading.svg';
    } else if (_downloadState == MusicDownloadState.downloaded) {
      iconPath = 'music/music_has_download.svg';
    }

    return InkWell(
      onTap: _download,
      child: Container(
        alignment: AlignmentDirectional.centerStart,
        child: Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    widget.data.name,
                    maxLines: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 0.0),
                  child: _downloadState == MusicDownloadState.downloading
                      ? RotationTransition(
                          alignment: Alignment.center,
                          turns: _downloadingAni,
                          child: R.img(iconPath,
                              package: ComponentManager.MANAGER_BASE_ROOM,
                              width: 24.0,
                              color: R.color.mainTextColor),
                        )
                      : R.img(
                          iconPath,
                          package: ComponentManager.MANAGER_BASE_ROOM,
                          color: _downloadState == MusicDownloadState.downloaded
                              ? R.color.secondTextColor
                              : R.color.mainTextColor,
                          width: 24.0,
                        ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

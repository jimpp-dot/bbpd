import 'dart:io';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/model/music_bean.dart';
import 'package:chat_room/src/base/player/rtc_music_player.dart';
import 'package:chat_room/src/base/widget/music/music_controller_widget.dart';
import 'package:chat_room/src/music/model/muisc_play_list_model.dart';
import 'package:chat_room/src/music/model/music_room_info.dart';
import 'package:chat_room/src/music/music_room_helper.dart';
import 'package:chat_room/src/music/playlist/copyrighted_music_search_page.dart';
import 'package:chat_room/src/music/repo/music_list_repo.dart';
import 'package:chat_room/src/music/widget/music_search_bar.dart';
import 'package:chat_room/src/roomNavUtil.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../base/player/rtc_playlist_mixin.dart';
import '../music_config.dart';
import 'music_playlist_item_widget.dart';
import 'music_playlist_local_sync.dart';
import 'music_playlist_manager.dart';
import 'music_upload_dialog.dart';

/// 音乐房-播放列表
///
class MusicPlayListScreen extends StatefulWidget {
  final ChatRoomData room;

  const MusicPlayListScreen({
    super.key,
    required this.room,
  });

  @override
  State<MusicPlayListScreen> createState() => _MusicPlayListScreenState();

  static Future openMusicPlayListScreen(
      BuildContext context, ChatRoomData room) async {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => MusicPlayListScreen(room: room),
        settings: const RouteSettings(name: '/MusicPlayListScreen'),
      ),
    );
  }
}

class _MusicPlayListScreenState extends BaseScreenState<MusicPlayListScreen>
    with
        RtcAudioTickerStateMixin<MusicPlayListScreen>,
        RtcMixPlayerCallProtect {
  /// List Item的高度
  static const double LIST_ITEM_HEIGHT = 64;

  bool _isLoading = false;

  final ScrollController _scrollController = ScrollController();

  /// 新版本的用trtc+ame，支持服务端推流（播放音乐）,不需要房主本地播放
  bool get needCreatorPlay =>true;

  bool get _isCreator => MusicRoomHelper.isCreator(widget.room);

  @override
  void initState() {
    super.initState();
    _load();
    // 只有房主才需要显示进度，目前没有做多设备进度同步
    if (_isCreator) {
      startTimer();
    }
    MusicPlayListManager.inst.inPlayListScreen = true;
  }

  Future<void> _load() async {
    if (_isLoading) {
      return;
    }
    _isLoading = true;
    MusicListResp resp = await MusicPlayListManager.inst.loadData();
    _isLoading = false;
    if (resp.success == true) {
      setScreenReady();
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Log.d(tag: TAG, 'currentSid=${resp.currentSid}');
        if (resp.currentSid > 0) {
          int position =
              MusicPlayListManager.inst.playListVM.indexOfSid(resp.currentSid);
          Log.d(tag: TAG, 'scroll to list pos->$position');
          if (position > 0 && _scrollController.hasClients) {
            _scrollController.position.moveTo(position * LIST_ITEM_HEIGHT,
                duration: const Duration(milliseconds: 200));
          }
        }
      });
    } else {
      setScreenError(errorMsg: resp.msg, handleErrorTap: true);
    }
  }

  @override
  @protected
  void onTapErrorWidget() {
    _load();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    rtcMixCallDestroy();
    MusicPlayListManager.inst.inPlayListScreen = false;
  }

  _onTapUpload() async {
    if (Platform.isIOS) {
      /// iOS 只有wifi上传
      RoomNavUtil.openWifiScreen(context, room: widget.room);
      return;
    }
    int? index = await showMusicUploadDialog(context);
    Log.d('tap music upload index->$index', tag: 'playlist');
    if (index == OPTION_LOCAL_UPLOAD) {
      MusicPlayListLocalSync().chooseAndSyncServer(context, widget.room.rid);
    } else if (index == OPTION_WIFI_UPLOAD) {
      RoomNavUtil.openWifiScreen(context, room: widget.room);
    }
  }

  @override
  PreferredSizeWidget buildAppBar() {
    return BaseAppBar.custom(
      title: Text(
        K.room_music_playlist,
        style: TextStyle(
            color: R.color.mainTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
      actions: [
        if (_isCreator)
          GestureDetector(
            onTap: _onTapUpload,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(end: 16),
              child: Center(
                child: Text(
                  K.room_music_titlebar_add,
                  style: TextStyle(color: R.color.mainTextColor, fontSize: 16),
                ),
              ),
            ),
          )
      ],
    );
  }

  @override
  Widget buildContent() {
    return SafeArea(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
              value: MusicPlayListManager.inst.playListVM),
          ChangeNotifierProvider.value(
              value: MusicPlayListManager.inst.songCtrlVM),
          ChangeNotifierProvider.value(
              value: MusicPlayListManager.inst.remoteRobotVM),
        ],
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildSearch(),
                _buildOptions(),
                Expanded(child: _buildList()),
                if (_isCreator) _buildMusicController(),
              ],
            ),
            if (_isLoading) const Loading(),
          ],
        ),
      ),
    );
  }

  /// 搜索歌曲
  Widget _buildSearch() {
    bool showSearch = _isMusicManager() ||
        MusicPlayListManager.inst.playListVM.onlyAdminAdd == false;
    if (showSearch == false) {
      return const SizedBox.shrink();
    }
    return MusicSearchBar(
      onTap: () {
        if (widget.room.useNewRequestInKtvRoomWhenOrderSong) {
          CopyrightedMusicSearchPage.show(context: context, room: widget.room);
        } else {
          RoomNavUtil.openMusicSearchScreen(context, widget.room);
        }
      },
    );
  }

  /// 允许用户添加音乐和清空列表按钮
  Widget _buildOptions() {
    if (!_isMusicManager()) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 服务器推歌才能展示“允许用户点歌的开关”
          // if (widget.room.enableAMEMusic) _buildAllowUserAddMusic(),
          const Spacer(),
          _buildClear()
        ],
      ),
    );
  }

  /// 允许用户添加音乐
  Widget _buildAllowUserAddMusic() {
    return SizedBox(
      height: 37,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 16),
            child: Text(
              K.room_music_allow_user_add,
              style: TextStyle(
                  color: R.color.mainTextColor, fontSize: 12, height: 1.1),
            ),
          ),
          Selector<PlayListViewModel, bool>(
            shouldRebuild: (pre, next) => pre != next,
            selector: (context, model) {
              return model.onlyAdminAdd;
            },
            builder: (context, value, child) {
              return Transform.translate(
                offset: const Offset(-10.0, 0),
                child: Transform.scale(
                  scale: 0.5,
                  child: CupertinoSwitch(
                    value: !value,
                    activeColor: Theme.of(context).primaryColor,
                    onChanged: (bool value) {
                      MusicPlayListManager.inst
                          .changeOnlyAdminAdd(widget.room.rid, !value);
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  /// 清空列表
  Widget _buildClear() {
    return GestureDetector(
      onTap: _onTapClear,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            end: 16, start: 10, top: 10, bottom: 10),
        child: Text(
          K.room_music_clear_list,
          style: TextStyle(
              color: R.color.mainTextColor, fontSize: 12, height: 1.1),
        ),
      ),
    );
  }

  /// 音乐播放列表
  Widget _buildList() {
    return Consumer2<PlayListViewModel, SongCtrlViewModel>(
      builder: (context, playListVM, songCtrlVM, child) {
        if (playListVM.data.isEmpty) {
          return EmptyWidget(
            desc: K.room_music_list_empty_tip,
          );
        }

        return ListView.builder(
          itemExtent: LIST_ITEM_HEIGHT,
          itemCount: playListVM.data.length,
          controller: _scrollController,
          itemBuilder: (context, index) {
            var item = playListVM.data[index];
            var playItem = songCtrlVM.songCtrl?.currentSong?.sid == item.sid;
            return MusicPlayListItemWidget(
              data: item,
              isPlaying: playItem,
              slideEnabled: _isMusicManager(),
              onTapUserIcon: () => _onTapUserIcon(context, item),
              toPlayPressed: () {
                if (_isCreator || _isMusicManager()) {
                  rtcMixCall(() => _onTapListPlaySong(item));
                }
              },
              onTapPlayListDelete: (data) => _onTapListDeleteSong(data),
              onTapPlayListTop: (MusicPlayListItem data) {
                Slidable.of(context)?.close();
                _onTapListTopSong(data);
              },
            );
          },
        );
      },
    );
  }

  _onTapUserIcon(BuildContext context, MusicPlayListItem item) async {
    RoomNavUtil.showImage(context, Util.parseInt(item.fromUser.uid),
        const PageRefer('MusicRoomList'));
  }

  _onTapListDeleteSong(MusicPlayListItem data) async {
    var resp = await MusicListRepo.deleteSong(widget.room.rid,
        [DeleteSongReq(sid: data.sid, uid: data.fromUser.uid)]);
    if (resp.success == true) {
      // if delete current,let's play next.
      Log.d(
          tag: TAG,
          'currentSong id=${MusicPlayListManager.inst.songCtrlVM.songCtrl?.currentSong?.sid},deleteId=${data.sid}');
      // 服务器控制：列表数据会下发下一首.如果为空了，需要停止播放.并且将songCtrlVM.songCtrl置为null
      return;
    } else if (resp.msg != null) {
      Fluttertoast.showCenter(msg: resp.msg);
    }
  }

  _onTapListTopSong(MusicPlayListItem data) async {
    var resp = await MusicListRepo.upSong(
        widget.room.rid, data.sid, data.fromUser.uid);

    if (resp.success == false && resp.msg != null) {
      Fluttertoast.showCenter(msg: resp.msg);
    }
  }

  /// 底部音乐控制器
  Widget _buildMusicController() {
    if (!needCreatorPlay) {
      return Consumer2<SongCtrlViewModel, RemoteRobotViewModel>(
        builder: (context, songCtrlVM, remoteRobotVM, child) {
          return MusicControllerWidget(
            /// 服务端推流机器人暂不支持设置音量
            musicVolume: 0,
            hideVolume: true,
            isPlaying:
                songCtrlVM.songCtrl?.currentSong?.state == MusicRoomStatus.play,
            musicName: songCtrlVM.songCtrl?.currentSong?.name ?? '',
            progress: remoteRobotVM.progress,
            duration: remoteRobotVM.duration,
            playType: remoteRobotVM.playType,
            volumeChange: (volume) {
              // MusicPlayListManager.inst.volume = volume.toInt();
            },
            progressChange: (progress) async {
              /// 进度条拖动，请求服务端
              MusicPlayListManager.inst.lastSeekTime =
                  DateTime.now().millisecondsSinceEpoch;
              MusicPlayListManager.inst.remoteRobotVM.progress = progress;
              await MusicListRepo.musicOption(widget.room.rid, MusicOption.seek,
                  position: progress);
            },
            onTapPlayType: _onPlayTypeClick,
            onTapPreMusic: () => rtcMixCall(_playPre),
            onTapNextMusic: () => rtcMixCall(_playNext),
            onTapPlayMusic: () => rtcMixCall(_onPlayerClick),
          );
        },
      );
    }
    return Consumer<SongCtrlViewModel>(
      builder: (context, value, child) {
        return MusicControllerWidget(
          musicVolume: MusicPlayListManager.inst.volume.toDouble(),
          isPlaying: MusicPlayListManager.inst.player.isPlaying,
          musicName: value.songCtrl?.currentSong?.name ?? '',
          progress: progress,
          duration: duration,
          playType: MusicPlayListManager.inst.playType,
          volumeChange: (volume) {
            MusicPlayListManager.inst.volume = volume.toInt();
          },
          progressChange: (progress) async {
            await MusicPlayListManager.inst.player
                .setAudioMixingPosition(progress);
            updateProgress();
          },
          onTapPlayType: _onPlayTypeClick,
          onTapPreMusic: () => rtcMixCall(_playPre),
          onTapNextMusic: () => rtcMixCall(_playNext),
          onTapPlayMusic: () => rtcMixCall(_onPlayerClick),
        );
      },
    );
  }

  // 音乐播放模式按钮：顺序播放/随机播放/单曲循环
  _onPlayTypeClick() async {
    Log.d(tag: TAG, '_onPlayTypeClick, ${MusicPlayListManager.inst.playType}');

    if (needCreatorPlay) {
      /// 房主播放音乐方式
      if (MusicPlayListManager.inst.playType == MusicPlayType.Cycle) {
        MusicPlayListManager.inst.playType = MusicPlayType.Single;
      } else if (MusicPlayListManager.inst.playType == MusicPlayType.Single) {
        MusicPlayListManager.inst.playType = MusicPlayType.Random;
        MusicListRepo.musicOption(widget.room.rid, MusicOption.random);
      } else {
        MusicPlayListManager.inst.playType = MusicPlayType.Cycle;
        MusicListRepo.musicOption(widget.room.rid, MusicOption.order);
      }

      refresh();
    } else {
      /// 服务端推流方式
      String mode;
      if (MusicPlayListManager.inst.remoteRobotVM.playType ==
          MusicPlayType.Cycle) {
        mode = 'RepeatSingle';
      } else if (MusicPlayListManager.inst.remoteRobotVM.playType ==
          MusicPlayType.Single) {
        mode = 'Shuffle';
      } else {
        mode = 'RepeatPlaylist';
      }
      var resp = await MusicListRepo.musicOption(
          widget.room.rid, MusicOption.playmode,
          mode: mode);
      if (resp.success == true) {
        /// do nothing
      } else if (resp.msg != null) {
        Fluttertoast.showCenter(msg: resp.msg);
      }
    }
  }

  // 上一曲
  _playPre() async {
    Log.d(tag: TAG, '_playPre');
    if (needCreatorPlay) {
      /// 房主播放音乐方式
      var preMusic = MusicPlayListManager.inst.getPreMusic();
      MusicPlayListManager.inst.startPlaySong2Server(preMusic.id);
    } else {
      /// 服务端推流方式
      var resp =
          await MusicListRepo.musicOption(widget.room.rid, MusicOption.prev);
      if (resp.success == true) {
        /// do nothing
      } else if (resp.msg != null) {
        Fluttertoast.showCenter(msg: resp.msg);
      }
    }
  }

  // 下一曲
  _playNext() async {
    Log.d(tag: TAG, '_playNext');

    if (needCreatorPlay) {
      /// 房主播放音乐方式
      MusicModel? nextMusic = MusicPlayListManager.inst.getNextMusic();
      if (nextMusic == null) return;
      MusicPlayListManager.inst.startPlaySong2Server(nextMusic.id);
    } else {
      /// 服务端推流方式
      var resp =
          await MusicListRepo.musicOption(widget.room.rid, MusicOption.next);
      if (resp.success == true) {
        /// do nothing
      } else if (resp.msg != null) {
        Fluttertoast.showCenter(msg: resp.msg);
      }
    }
  }

  bool _isMusicManager() {
    return MusicRoomHelper.isMusicManager(widget.room);
  }

  void _onTapListPlaySong(MusicPlayListItem item) {
    if (_isCreator || _isMusicManager()) {
      Log.d(tag: TAG, '_onTapPlaySong sid=${item.sid}');
      MusicPlayListManager.inst.startPlaySong2Server(item.sid);
    }
  }

  _onPlayerClick() async {
    Log.d(tag: TAG, '_onPlayerClick');
    if (needCreatorPlay) {
      /// 房主播放
      var data = MusicPlayListManager.inst.currentPlayData;
      if (data == null) {
        if (MusicPlayListManager.inst.playList.isEmpty) {
          Fluttertoast.showToast(msg: K.room_no_music_play);
          return;
        }
        MusicPlayListManager.inst
            .startPlaySong2Server(MusicPlayListManager.inst.playList[0].id);
        return;
      }

      Log.d(
          tag: TAG,
          '_onPlayerClick, duration: $duration, isRelease: ${MusicPlayListManager.inst.player.isRelease}');
      if (duration == 0 || MusicPlayListManager.inst.player.isRelease) {
        MusicPlayListManager.inst.startPlaySong2Server(data.id);
        return;
      }

      // 暂停播放只有房主看的到，下面直接操作，且不需要同步到远端
      if (MusicPlayListManager.inst.player.isPlaying) {
        await MusicPlayListManager.inst.player.pause();
        MusicListRepo.musicOption(widget.room.rid, MusicOption.pause,
            sid: data.id);
      } else {
        await MusicPlayListManager.inst.player.resume();
        MusicListRepo.musicOption(widget.room.rid, MusicOption.resume,
            sid: data.id);
      }
      refresh();
    } else {
      /// 服务端推流
      if (Util.validStr(MusicPlayListManager
          .inst.songCtrlVM.songCtrl?.currentSong?.resourcePath)) {
        /// 有正在播放的音乐
        MusicListRepo.musicOption(
          widget.room.rid,
          MusicPlayListManager.inst.songCtrlVM.songCtrl?.currentSong?.state ==
                  MusicRoomStatus.pause
              ? MusicOption.resume
              : MusicOption.pause,
          sid:
              MusicPlayListManager.inst.songCtrlVM.songCtrl?.currentSong?.sid ??
                  0,
        );
      } else if (MusicPlayListManager.inst.playList.isEmpty) {
        Fluttertoast.showToast(msg: K.room_no_music_play);
      } else {
        MusicPlayListManager.inst
            .startPlaySong2Server(MusicPlayListManager.inst.playList[0].id);
      }
    }
  }

  /// 点击清空列表
  _onTapClear() async {
    bool? result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ConfirmDialog(content: '是否清空列表');
      },
    );
    if (result == true) {
      await MusicPlayListManager.inst.clearList(widget.room.rid);
      refresh();
    }
  }
}

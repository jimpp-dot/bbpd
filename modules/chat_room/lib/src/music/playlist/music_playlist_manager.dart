import 'dart:io';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/model/music_bean.dart';
import 'package:chat_room/src/base/player/rtc_playlist_mixin.dart';
import 'package:chat_room/src/base/room_music_control.dart';
import 'package:chat_room/src/music/model/muisc_play_list_model.dart';
import 'package:chat_room/src/music/model/music_room_info.dart';
import 'package:chat_room/src/music/music_config.dart';
import 'package:chat_room/src/music/music_room_helper.dart';
import 'package:chat_room/src/music/repo/music_list_repo.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/cupertino.dart';

import '../../ktv/model/sound_type.dart';

/// 音乐房播放列表逻辑控制层
class MusicPlayListManager with RtcPlayList {
  static const String TAG = 'MusicPlayListManager';

  static MusicPlayListManager inst = MusicPlayListManager._();

  MusicPlayListManager._();

  ChatRoomData? _room;

  bool _listen = false;

  bool _hasStoragePermission = false;

  PlayListViewModel playListVM = PlayListViewModel();

  SongCtrlViewModel songCtrlVM = SongCtrlViewModel();

  /// 是否在PlayListScreen页面
  bool inPlayListScreen = false;

  /// 新版本的用trtc+ame，支持服务端推流（播放音乐）,不需要房主本地播放
  /// ame 目前没有用到，固定返回true
  bool get needCreatorPlay => _room != null;

  RemoteRobotViewModel remoteRobotVM = RemoteRobotViewModel();

  Future<MusicListResp> loadData() async {
    MusicListResp listResp = await MusicListRepo.loadMusicList(_room!.rid);
    if (listResp.success == true) {
      // 文件只在房主的设备上
      if (MusicRoomHelper.isCreator(_room!) && needCreatorPlay) {
        bool hasPermission = false;
        hasPermission = await _checkStoragePermission();
        if (hasPermission == true) {
          await _filterLocalFileNotExist(listResp);
        }
      }

      playListVM.refreshMusicListResp(listResp);

      // 目前都是本地的，path 都赋值为本地路径
      var list = playListVM.data.map((e) => MusicModel(id: e.sid, path: e.resourcePath)).toList();
      playList = list;

      Log.d(tag: TAG, 'loadData resp.curSid=${listResp.currentSid},list.curSid=${currentPlayData?.id},list.size=${playList.length}');

      Log.d(tag: TAG, 'loadData songCtrlVM.Sid=${songCtrlVM.songCtrl?.currentSong?.sid}');

      if (listResp.currentSid > 0) {
        bool samePlayId = listResp.currentSid == currentPlayData?.id;

        // 更新列表index
        var index = playListVM.indexOfSid(listResp.currentSid);
        if (index >= 0) {
          updateCurrentPlay(index);
        }

        // 不是同一首歌/同一首歌但是没有暂停过播放，通知远端去播放
        if (MusicRoomHelper.isCreator(_room!) &&
            needCreatorPlay &&
            (samePlayId == false || (player.isPlaying == false && player.isPaused == false))) {
          startPlaySong2Server(listResp.currentSid);
        }
      } else {
        // 列表被清空了，停止当前正在播放的
        if (needCreatorPlay) {
          player.stopPlay();
        }

        songCtrlVM.songCtrl = null;
        resetCurrentPlay();
      }
    }
    return listResp;
  }

  Future<bool> startPlaySong2Server(int sid) async {
    Log.d(tag: TAG, 'startPlaySong2Server sid=$sid');
    if (_room == null) return false;
    var resp = await MusicListRepo.musicOption(_room!.rid, MusicOption.play, sid: sid);
    if (resp.success == true) {
      // 等待消息推送执行播放
      return true;
    } else if (resp.msg != null) {
      Fluttertoast.showCenter(msg: resp.msg);
    }
    return false;
  }

  _startPlaySong(int sid) {
    var musicModel = _getMusicModel(sid);
    Log.d(tag: TAG, 'startPlay Song musicModel->$musicModel');
    if (musicModel != null) {
      startPlayMusic(musicModel);
    }
  }

  MusicModel? _getMusicModel(int sid) {
    return playList.firstWhereOrNull((e) => e.id == sid);
  }

  // 以下逻辑检测远端的本地类型文件是否在本地存在，删除不存在的部分，并且同步给远端
  _filterLocalFileNotExist(MusicListResp listResp) async {
    var dirtyData = <MusicPlayListItem>[];
    List<int> dirtyId = [];
    // 删除本地不存在的
    await Future.forEach(listResp.data, (MusicPlayListItem item) async {
      if (item.type == PLAY_LIST_TYPE_LOCAL) {
        var exist = File(item.resourcePath).existsSync();
        Log.d(tag: TAG, 'file exist=$exist,path=${item.resourcePath}');
        if (!exist) {
          dirtyData.add(item);
          dirtyId.add(item.sid);
        }
      } else if (item.type == PLAY_LIST_TYPE_AME) {
        /// AME music判断是否存在
        bool isExist = await _room?.rtcController.engine?.isAMEMusicPreloaded(item.resourcePath) ?? false;
        if (!isExist) {
          dirtyData.add(item);
          dirtyId.add(item.sid);
        }
      } else if (item.type == PLAY_LIST_TYPE_AGORA) {
        /// AGORA版权 music判断是否存在
        bool isExist = await isAgoraMusicPreload(item.resourcePath);
        if (!isExist) {
          dirtyData.add(item);
          dirtyId.add(item.sid);
        }
      } else if (PLAY_LIST_TYPE_ZEGO == item.type) {
        bool isExist = await isZegoMusicPreload(item.resourcePath);
        if (!isExist) {
          dirtyData.add(item);
          dirtyId.add(item.sid);
        }
      }
    });

    listResp.data.removeWhere((item) => dirtyId.contains(item.sid));

    // 删除远端数据
    if (dirtyData.isNotEmpty) {
      var list = dirtyData.map((e) => DeleteSongReq(sid: e.sid, uid: e.fromUser.uid)).toList();
      MusicListRepo.deleteSong(_room!.rid, list);
    }
  }

  Future<bool> isAgoraMusicPreload(String musicId) async {
    String rtmToken = Config.get('AGORA_MUSIC_TOKEN_${Session.uid}', '');

    if (_room == null) {
      return false;
    }

    await _room?.rtcController.engine?.initMusicContentCenter(RtcBizConfig.zegoConfig.appId, rtmToken, Session.uid);

    int songId = Util.parseInt(musicId);

    /// 一起听只需要歌曲，不需要歌词
    bool isSongPreload = await _room?.rtcController.engine?.isAgoraMusicPreloaded(songId) ?? false;
    return isSongPreload;
  }

  Future<bool> isZegoMusicPreload(String musicId) async {
    if (_room == null) {
      return false;
    }
    bool isSongPreload = await _room?.rtcController.engine?.isMusicPreloaded(musicId) ?? false;
    return isSongPreload;
  }

  Future<void> changeOnlyAdminAdd(int rid, bool value) async {
    var resp = await MusicListRepo.musicOption(rid, MusicOption.addLimit);
    if (resp.success == true) {
      playListVM.changeOnlyAdminAdd(value);
    } else if (resp.msg != null) {
      Fluttertoast.showCenter(msg: resp.msg);
    }
  }

  /// 清空播放列表
  Future<bool> clearList(int rid) async {
    var resp = await MusicListRepo.musicOption(rid, MusicOption.reset);
    if (resp.success == true) {
      if (needCreatorPlay) {
        player.stopPlay();
      }
      return true;
    } else if (resp.msg != null) {
      Fluttertoast.showCenter(msg: resp.msg);
    }
    return false;
  }

  void initMusicRoomState(ChatRoomData room) {
    _room = room;
    player.initState(MusicScene.musicRoom);

    if (!_listen) {
      _listen = true;
      // 注册消息推送
      room.addListener(RoomConstant.Event_Music_Room_Song_List_Refresh, _handleRefreshList);
      room.addListener(RoomConstant.Event_Music_Room_Song_Ctrl, _handleSongCtrl);
      room.addListener(RoomConstant.Event_Music_Room_Robot_Refresh, _handleRobotSync);
      room.rtcController.engine?.setRemoteRobotListener(onRemoteRobotFrame);
    }

    loadData();
  }

  void setRemoteRobotUserId(int id) {
    Log.d('$TAG manager setRemoteRobotUserId: $id');
    _room?.rtcController.engine?.setRemoteRobotUserId(id);
  }

  /// 注销消息推送
  void disposeMusicRoomState() {
    if (_listen) {
      Log.d('$TAG disposeMusicRoomState');
      _listen = false;
      _room?.removeListener(RoomConstant.Event_Music_Room_Song_List_Refresh, _handleRefreshList);
      _room?.removeListener(RoomConstant.Event_Music_Room_Song_Ctrl, _handleSongCtrl);
      _room?.removeListener(RoomConstant.Event_Music_Room_Robot_Refresh, _handleRobotSync);
      remoteRobotVM.clear();
    }
  }

  /// seek时需要调用服务端接口，服务端再调trtc的接口实现机器人的seek，中间比较耗时，为了避免进度条跳动，seek后一段时间暂不同步远端进度
  int lastSeekTime = 0;

  void onRemoteRobotFrame(Map? data) {
    if (data != null) {
      bool needSyncProsess = (lastSeekTime == 0 || (DateTime.now().millisecondsSinceEpoch - lastSeekTime > 2000));
      if (needSyncProsess) {
        lastSeekTime = 0;
        if (data['duration'] != null && Util.parseInt(data['duration']) > 0) {
          remoteRobotVM.duration = Util.parseInt(data['duration']);
        }

        if (data['musicPlayProgress'] != null && Util.parseInt(data['musicPlayProgress']) >= 0) {
          remoteRobotVM.progress = Util.parseInt(data['musicPlayProgress']);
        }
      } else {
        Log.d('$TAG dont sync, lastSeekTime: $lastSeekTime, now: ${DateTime.now().millisecondsSinceEpoch}');
      }

      if (data['musicId'] != null && data['musicId'] is String && Util.validStr(data['musicId'])) {
        if (songCtrlVM.songCtrl?.currentSong == null || data['musicId'] != songCtrlVM.songCtrl?.currentSong!.resourcePath) {
          MusicPlayListItem? item = getMusicItem(data['musicId']);
          Log.d('$TAG change current song, musicId: ${data['musicId']}, resourcePath: ${songCtrlVM.songCtrl?.currentSong?.resourcePath}');
          if (item != null) {
            songCtrlVM.refreshCurrentSong(changeSongData(item));
          }
        }
      }
    }
  }

  CurrentSong changeSongData(MusicPlayListItem item) {
    return CurrentSong(
      sid: item.sid,
      name: item.name,
      resourcePath: item.resourcePath,
      type: item.type,
      fromUser: FromUser(item.fromUser.uid, item.fromUser.name, item.fromUser.icon),
      state: songCtrlVM.songCtrl?.currentSong?.state ?? MusicRoomStatus.play,
    );
  }

  MusicPlayListItem? getMusicItem(String musicId) {
    return playListVM.data.firstWhereOrNull((element) => element.resourcePath == musicId);
  }

  _handleRefreshList(String type, Object? data) {
    Log.d(tag: TAG, ' ------ Song Refresh List -----');
    if (inPlayListScreen == true || MusicRoomHelper.isCreator(_room!)) {
      loadData();
    }
  }

  _handleRobotSync(String type, Object? data) {
    Log.d('$TAG _handleRobotSync data: $data');
    if (data != null && data is Map) {
      if (data['PlayMode'] != null && data['PlayMode'] is String && Util.validStr(data['PlayMode'])) {
        remoteRobotVM.setPlayType(data['PlayMode']);
      }
      if (data['CurrentSong'] != null && data['CurrentSong'] is Map) {
        MusicRoomStatus? state = songCtrlVM.songCtrl?.currentSong?.state;
        CurrentSong song = CurrentSong.fromJson(data['CurrentSong']);
        songCtrlVM.refreshCurrentSong(song);
        int robotUid = Util.parseInt(data['RobotUid']);
        if (state != MusicRoomStatus.play && song.state == MusicRoomStatus.play && robotUid > 0 && remoteRobotVM.robotUid != robotUid) {
          Log.d('$TAG reset setRemoteRobotUserId');
          remoteRobotVM.robotUid = robotUid;
          setRemoteRobotUserId(remoteRobotVM.robotUid);
        }
      }
    }
  }

  /// todo 流程控制有问题，目前只能房主播放音乐，理论上房主接待管理员都可以播放
  ///
  _handleSongCtrl(String type, Object? data) {
    if (!needCreatorPlay) {
      /// 服务端机器人推流，不解析这个socket
      return;
    }
    Log.d(tag: TAG, ' ------ SongCtrl -----type=$type,data=$data');
    if (data != null && data is Map) {
      SongCtrl? songCtrl;
      try {
        songCtrl = SongCtrl.fromJson(Map<String, dynamic>.from(data));
      } catch (e) {
        Log.d(e);
      }
      if (songCtrl?.type == null) {
        return;
      }

      songCtrlVM.songCtrl = songCtrl;
      // 目前播放都走的房主的麦
      switch (songCtrl!.type) {
        case SongCtlType.play:
          if (songCtrl.currentSong == null || songCtrl.currentSong!.fromUser == null) return;
          if (MusicRoomHelper.isCreator(_room!)) {
            _startPlaySong(songCtrl.currentSong!.sid);
          }

          // if (PLAY_LIST_TYPE_ZEGO == songCtrl.currentSong!.type) {
          //   if (songCtrl.currentSong!.fromUser!.uid == Session.uid) {
          //     _startPlaySong(songCtrl.currentSong!.sid);
          //   } else {
          //     player.stopPlay();
          //   }
          // } else {
          //   if (MusicRoomHelper.isCreator(_room!)) {
          //     _startPlaySong(songCtrl.currentSong!.sid);
          //   }
          // }

          break;
        case SongCtlType.pause:
          // for other user UI
          // if (MusicRoomHelper.isCreator(_room)) {
          //   player.pause();
          // }
          break;
        case SongCtlType.resume:
          // if (MusicRoomHelper.isCreator(_room)) {
          //   player.resume();
          // }
          break;
        case SongCtlType.reset:
          playListVM.clearPlayList();
          if (MusicRoomHelper.isCreator(_room!) && needCreatorPlay) {
            player.stopPlay();
          }
          songCtrlVM.refreshCurrentSong(null);
          resetCurrentPlay();
          break;
        default:
          break;
      }
    }
  }

  /// 存储权限：进程级别只需要检查一次
  Future<bool> _checkStoragePermission() async {
    if (_hasStoragePermission == true) {
      return true;
    }
    _hasStoragePermission = await MusicRoomHelper.checkStoragePermission(System.context);
    return _hasStoragePermission;
  }

  @protected
  @override
  Future<void> onPlay(MusicModel model) async {
    if (!needCreatorPlay) {
      return;
    }
    MusicPlayListItem? item = playListVM.getItemBySid(model.id);
    if (item == null) return;
    String path = item.resourcePath;
    if (path.isEmpty) {
      return;
    }
    bool exist = true;
    if (item.type == PLAY_LIST_TYPE_LOCAL) {
      if (Session.uid != item.fromUser.uid) {
        return;
      }
      var hasPermission = await _checkStoragePermission();
      if (hasPermission != true) {
        return;
      }
      exist = await File(item.resourcePath).exists();
    } else if (item.type == PLAY_LIST_TYPE_REMOTE) {
      bool netOk = await Util.isNetworkConnected();
      if (netOk) {
        exist = await MusicRoomHelper.checkRemoteFileExist(item.resourcePath);
      }
    } else if (item.type == PLAY_LIST_TYPE_AME) {
      if (Session.uid != item.fromUser.uid) {
        return;
      }

      exist = await _room?.rtcController.engine?.isAMEMusicPreloaded(item.resourcePath) ?? false;
    } else if (PLAY_LIST_TYPE_AGORA == item.type) {
      if (Session.uid != item.fromUser.uid) {
        return;
      }
      exist = await isAgoraMusicPreload(item.resourcePath);
    } else if (PLAY_LIST_TYPE_ZEGO == item.type) {
      // if (Session.uid != item.fromUser.uid) {
      //   return;
      // }
      exist = await isZegoMusicPreload(item.resourcePath);
    }

    if (exist != true) {
      Fluttertoast.showToast(msg: K.room_music_file_not_exits);
      stopPlay();
      MusicListRepo.deleteSong(_room?.rid ?? 0, [DeleteSongReq(sid: item.sid, uid: item.fromUser.uid)]);
      return;
    }
    bool sameUrl = player.isCurrentPlayPath(item.resourcePath);
    Log.d(tag: TAG, 'is same=$sameUrl, isPlaying=${player.isPlaying}');
    if (sameUrl == true && player.isPlaying) {
      Log.d(tag: TAG, ' isPlaying Current,nothing todo.');
    } else {
      player.initState(MusicScene.musicRoom);
      if (PLAY_LIST_TYPE_AME == item.type) {
        String testMusicUrl = await _room?.rtcController.engine?.genAMEMusicURI(item.resourcePath, AMEMusicInterface.musicTypeOrigin) ?? '';
        player.startPlay(testMusicUrl, false, false, 1);
      } else if (PLAY_LIST_TYPE_AGORA == item.type) {
        player.startPlayAgoraMusic(item.resourcePath, SoundType.voice);
      } else if (PLAY_LIST_TYPE_ZEGO == item.type) {
        player.startPlayZegoMusic(item.resourcePath, SoundType.voice);
      } else {
        player.startPlay(item.resourcePath, false, false, 1);
      }
    }
  }

  void playNextMusic({bool? auto}) {
    var nextMusic = getNextMusic(auto: auto);
    if (nextMusic == null) return;
    startPlaySong2Server(nextMusic.id);
  }

  /// 播放器出错
  Future<void> handlePlayError() async {
    MusicPlayListManager.inst.player.onError();
    Fluttertoast.showCenter(msg: K.room_music_play_error);
    await _postUIPaused();
  }

  /// 播放完成后
  Future<void> handlePlayComplete() async {
    if (MusicPlayListManager.inst.player.isPaused) {
      return;
    }
    MusicPlayListManager.inst.player.isPlaying = false;
    await _postUIPaused();
    MusicPlayListManager.inst.playNextMusic(auto: true);
  }

  /// 通知转盘等当前音乐需要暂停
  Future _postUIPaused() async {
    if (currentPlayData != null && currentPlayData!.id > 0) {
      var resp = await MusicListRepo.musicOption(_room?.rid ?? 0, MusicOption.pause, sid: currentPlayData!.id);
      if (resp.success == true) {
        // 等待消息推送执行播放
        return true;
      } else if (resp.msg != null) {
        Fluttertoast.showCenter(msg: resp.msg);
      }
    }
  }

  void release() {
    playList = <MusicModel>[];
    resetCurrentPlay();
    songCtrlVM.songCtrl = null;
    if (needCreatorPlay) {
      player.stopPlay();
    }
  }
}

class SongCtrlViewModel extends ChangeNotifier {
  SongCtrl? _songCtrl;

  SongCtrl? get songCtrl => _songCtrl;

  set songCtrl(SongCtrl? song) {
    _songCtrl = song;
    notifyListeners();
  }

  refreshCurrentSong(CurrentSong? currentSong) {
    if (_songCtrl == null) {
      _songCtrl = SongCtrl(currentSong: currentSong);
    } else {
      _songCtrl!.currentSong = currentSong;
    }
    notifyListeners();
  }
}

/// 播放列表的ViewModel
class PlayListViewModel extends ChangeNotifier {
  List<MusicPlayListItem> data = [];
  bool onlyAdminAdd = false;

  PlayListViewModel();

  refreshMusicListResp(MusicListResp resp) {
    data = resp.data;

    onlyAdminAdd = resp.onlyAdminAdd;

    notifyListeners();
  }

  MusicPlayListItem? getItemBySid(int sid) {
    return data.firstWhereOrNull((e) => e.sid == sid);
  }

  int indexOfSid(int sid) {
    return data.indexWhere((e) => e.sid == sid);
  }

  MusicPlayListItem? getItemByUniqueId(int uniqueId) {
    return data.firstWhereOrNull((element) => element.uniqueId == uniqueId);
  }

  /// AME/AGORA的MusicID存在resourcePath(复用老字段)
  MusicPlayListItem? getItemByPath(String musicId) {
    return data.firstWhereOrNull((element) => element.resourcePath == musicId);
  }

  clearPlayList() {
    data.clear();
    notifyListeners();
  }

  changeOnlyAdminAdd(bool onlyAdminAdd) {
    this.onlyAdminAdd = onlyAdminAdd;
    notifyListeners();
  }
}

class RemoteRobotViewModel extends ChangeNotifier {
  int robotUid = 0;
  MusicPlayType _playType = MusicPlayType.Cycle;
  int _duration = 0;
  int _progress = 0;

  MusicPlayType get playType => _playType;

  void setPlayType(String type) {
    _playType = getRealType(type);
    notifyListeners();
  }

  int get duration => _duration;

  set duration(int data) {
    _duration = data;
    notifyListeners();
  }

  int get progress => _progress;

  set progress(int data) {
    _progress = data;
    notifyListeners();
  }

  refreshRobotInfo(int id, String type) {
    Log.d('$TAG refreshRobotInfo, robotUid: $robotUid, id: $id');
    if (robotUid == 0 && id > 0) {
      /// 第一次收到服务端机器人uid，设置trtc监听该uid的视频流，以解析播放时长和进度
      MusicPlayListManager.inst.setRemoteRobotUserId(id);
    }
    robotUid = id;
    _playType = getRealType(type);
    notifyListeners();
  }

  MusicPlayType getRealType(String type) {
    if ('RepeatSingle' == type) {
      return MusicPlayType.Single;
    } else if ('Shuffle' == type) {
      return MusicPlayType.Random;
    }
    return MusicPlayType.Cycle;
  }

  void clear() {
    robotUid = 0;
    _playType = MusicPlayType.Cycle;
    _duration = 0;
    _progress = 0;
  }
}

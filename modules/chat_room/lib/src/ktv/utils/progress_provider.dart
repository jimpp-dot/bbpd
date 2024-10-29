import 'package:shared/shared.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import '../../chatRoomData.dart';
import '../zego_v2/zego_music_util.dart';
import '../../ktv/agora/agora_music_util.dart';
import '../../base/model/roomConstant.dart';

typedef ProgressCallBack = void Function(double progress);
typedef CompleteCallBack = void Function(bool success, String? errorMsg);

/*
* 进度更新接口，用于监听各种不同的资源下载过程
*
* 不同类型的资源应该实现该接口，然后自己处理下载、取消下载过程，下载成功、失败等过程，并将进度回调出去
* */
abstract class ProgressInterface {
  final ProgressCallBack? onProgressChanged;
  final CompleteCallBack? onCompleted;

  ProgressInterface(this.onProgressChanged, this.onCompleted);

  void startDownload();

  void cancelDownload();
}

class ZegoMusicProgressProvider extends ProgressInterface {
  final String songCode;
  final ChatRoomData room;
  final bool saveLyric;

  String? resourceId;

  ZegoMusicProgressProvider(
    this.songCode,
    this.room,
    ProgressCallBack? onProgressChange,
    CompleteCallBack? onCompleted, {
    this.saveLyric = true,
  }) : super(onProgressChange, onCompleted);

  @override
  Future<void> startDownload() async {
    room.rtcController.engine?.setMusicDownloadCallback(_onDownload);

    /// 获取逐行歌词
    if (saveLyric) {
      String? result = await room.rtcController.engine?.getLyric(songCode);
      if (result != null && result.isNotEmpty) {
        await ZegoMusicUtil.saveLyricJsonString(songCode, result);
      }
    }

    ZegoMusicResource? requestResult =
        await room.rtcController.engine?.requestResource(songCode);
    if (requestResult != null && requestResult.resources.isNotEmpty) {
      resourceId = requestResult.resources[0].resource_id;
      Log.d('startDownload resourceId:$resourceId');
      room.rtcController.engine?.preloadMusic(songCode, resourceId!);
    }
  }

  @override
  void cancelDownload() {
    room.rtcController.engine?.setMusicDownloadCallback(null);
  }

  void _onDownload(String resourceId, double progress) {
    Log.d('_onDownload :$resourceId, === $progress');

    /// 更新下载进度
    if (this.resourceId == resourceId && progress < 1) {
      onProgressChanged?.call(progress);
    } else if (this.resourceId == resourceId && progress >= 1) {
      onCompleted?.call(true, null);
    }
  }
}

class AgoraMusicProgressProvider extends ProgressInterface {
  final int songCode;
  final ChatRoomData room;

  AgoraMusicProgressProvider(this.songCode, this.room,
      ProgressCallBack? onProgressChange, CompleteCallBack? onCompleted)
      : super(onProgressChange, onCompleted);

  @override
  Future<void> startDownload() async {
    room.addListener(RoomConstant.Event_AGORA_Music_Download, _onDownload);

    await room.rtcController.engine?.preloadAgoraMusic(Util.parseInt(songCode));
    await room.rtcController.engine?.getAgoraLyric(songCode.toString());
  }

  Future<void> startLoadLrc() async {
    room.addListener(RoomConstant.Event_AGORA_Music_Lyric, _onLoadLrc);
    await room.rtcController.engine?.getAgoraLyric(songCode.toString());
  }

  @override
  void cancelDownload() {
    room.removeListener(RoomConstant.Event_AGORA_Music_Download, _onDownload);
  }

  void _onDownload(String type, Object? value) {
    if (value is! Map) {
      return;
    }

    Map data = value;

    int status = Util.parseInt(data['status']);

    /// 下载歌词
    if (Util.parseInt(data['songCode']) > 0 &&
        !Util.isStringEmpty(data['lyricUrl'])) {
      AgoraMusicUtil.downloadLyric(
          Util.parseInt(data['songCode']), data['lyricUrl']);
    }

    /// 更新下载进度
    if (2 == status && songCode == Util.parseInt(data['songCode'])) {
      int percent = Util.parseInt(data['percent']);
      onProgressChanged?.call(percent / 100 * 1.0);

      return;
    }

    /// 下载完成或者下载失败
    if (songCode == Util.parseInt(data['songCode'])) {
      onCompleted?.call(0 == status, null);

      room.removeListener(RoomConstant.Event_AGORA_Music_Download, _onDownload);
    }
  }

  void _onLoadLrc(String type, Object? value) {
    room.removeListener(RoomConstant.Event_AGORA_Music_Lyric, _onLoadLrc);
    if (value is! Map) {
      return;
    }
    Map data = value;

    if (!Util.isStringEmpty(data['lyricUrl'])) {
      Log.d('_onLoadLrc: ${data['lyricUrl']}');
      AgoraMusicUtil.downloadLyric(songCode, data['lyricUrl']);
    }
  }
}

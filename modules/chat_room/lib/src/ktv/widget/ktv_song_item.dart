import 'dart:io';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/ktv/agora/agora_music_util.dart';
import 'package:chat_room/src/ktv/model/song_sheet_beans.dart';
import 'package:chat_room/src/ktv/utils/ktv_theme.dart';
import 'package:chat_room/src/ktv/utils/reporter.dart';
import 'package:chat_room/src/ktv/zego_v2/zego_music_util.dart';
import 'package:commonrtc_api/commonrtc_api.dart';
import 'package:flutter/material.dart';

import '../../../assets.dart';
import '../../music/model/muisc_play_list_model.dart';
import '../../music/music_room_helper.dart';
import '../../music/playlist/music_playlist_manager.dart';
import '../ktv_report_dialog.dart';
import '../model/ktv_song_manage_beans.dart';
import '../model/sound_type.dart';
import '../repo/ktv_repo.dart';
import '../utils/song_download_util.dart';

/// 点歌面板的每一首歌曲
///
class SongItemWidget extends StatefulWidget {
  final ChatRoomData room;
  final Song song;
  final bool autoMic; // 是否需要先上麦再点歌, true: 需要 false: 不需要
  final bool showSingerName;
  final int type;

  /// true: 一起听， false：KTV （是否点歌/点歌操作有区别）
  final bool isMusicRoom;

  const SongItemWidget({
    super.key,
    required this.room,
    required this.song,
    required this.type,
    this.autoMic = true,
    this.showSingerName = true,
    this.isMusicRoom = false,
  });

  @override
  State<SongItemWidget> createState() => _SongItemWidgetState();
}

class _SongItemWidgetState extends State<SongItemWidget> {
  bool hasChose = false;

  final Throttle _signAction = Throttle(duration: const Duration(seconds: 3));

  @override
  void initState() {
    super.initState();
    if (widget.isMusicRoom) {
      hasChose = _isInMusicRoomList;
    } else {
      hasChose = widget.song.chose;
    }
  }

  @override
  void dispose() {
    _signAction.dispose();
    super.dispose();
  }

  bool get _isInMusicRoomList {
    MusicPlayListItem? item =
        MusicPlayListManager.inst.playListVM.getItemByPath(widget.song.musicId);
    return item != null;
  }

  void _onTap() {
    FocusScope.of(context).requestFocus(FocusNode());
    _signAction.call(_signSong);
    if (widget.type == RcmdTab.TYPE_ROOM_ORDERED) {
      /// 历史已点页面的歌曲，【点歌】上报
      Tracker.instance.track(TrackEvent.click,
          properties: {'click_page': 'click_historysong'});
    }
  }

  // 点歌
  void _signSong() async {
    if (hasChose) return;

    bool granted = await ChatRoomUtil.checkAudioAuthorization();
    if (!granted) {
      return;
    }

    if (widget.autoMic) {
      bool onMic = await SongDownloadUtil.checkAndJoinMic(
          widget.room, context, K.ktv_apply_for_mic_tips);
      if (onMic != true) {
        return;
      }
    }

    _onOrderSongBtnTaped();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: Row(
        children: <Widget>[
          const SizedBox(width: 20),
          if (Util.validStr(widget.song.icon)) ...[
            CommonAvatar(
              path: widget.song.icon,
              size: 52,
              borderRadius: BorderRadius.circular(8),
              suffix: null,
            ),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildSingTitle(),
                const SizedBox(height: 2),
                _buildSingerName(),
                const SizedBox(height: 2),
              ],
            ),
          ),
          const SizedBox(width: 24),
          InkWell(
            onTap: _onTap,
            child: Container(
              height: 32,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                gradient: hasChose
                    ? const LinearGradient(
                        colors: [Color(0xFFD5D8E0), Color(0xFFE4E7EE)])
                    : LinearGradient(colors: R.color.mainBrandGradientColors),
              ),
              child: Text(
                hasChose ? K.room_ktv_has_ordered : K.ktv_music_order,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          if (widget.song.showAccuse)
            InkWell(
              onTap: () => KtvReportDialog.showDialog(context, widget.song.id),
              child: Container(
                height: 72,
                alignment: AlignmentDirectional.centerEnd,
                padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
                child: R.img(
                  RoomAssets.chat_room$ktv_ic_report_flag_svg,
                  width: 20,
                  height: 20,
                  color: KtvTheme.secondTextColor,
                  package: ComponentManager.MANAGER_BASE_ROOM,
                ),
              ),
            ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget _buildSingTitle() {
    var text = "";
    if (widget.showSingerName) {
      if (widget.room.useNewRequestInKtvRoomWhenOrderSong) {
        text = '${widget.song.name}-${widget.song.singerName}';
      } else {
        text = (widget.song.platform != SongPlatform.KUGOU &&
                widget.song.platform != SongPlatform.AME)
            ? '${widget.song.name}-${widget.song.singerName}'
            : widget.song.name;
      }
    } else {
      text = widget.song.name;
    }
    return Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: KtvTheme.mainTextColor, fontSize: 16),
    );
  }

  Widget _buildSingerName() {
    if (widget.type == RcmdTab.TYPE_SEARCH_RCMD) {
      /// 好友在唱，显示哪位好友唱过
      return Text(
        '${widget.song.orderUname}${K.room_ktv_has_sing}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: KtvTheme.songListDescribeTextColor.withAlpha(66),
          fontSize: 13,
        ),
      );
    }

    var text = "";
    if (widget.type == RcmdTab.TYPE_MINE) {
      text = '${K.ktv_song_list_status}${widget.song.statusDescription}';
    } else {
      if (widget.song.platform == SongPlatform.SLP) {
        text = widget.song.uploaderName;
      } else {
        text = widget.song.singerName;
      }
    }

    double titleMaxWidth = Util.width - 20 - 24 - 70 - 20;
    if (Util.validStr(widget.song.icon)) {
      titleMaxWidth = titleMaxWidth - 60;
    }
    if (widget.song.platform == SongPlatform.SLP) {
      titleMaxWidth = titleMaxWidth - 30;
    }
    if (Util.parseInt(widget.song.orderedCount) > 0) {
      titleMaxWidth = titleMaxWidth - 75;
    }

    return Row(
      children: [
        LimitedBox(
          maxWidth: titleMaxWidth,
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: KtvTheme.songListDescribeTextColor.withAlpha(66),
              fontSize: 13,
            ),
          ),
        ),
        if (SongPlatform.SLP == widget.song.platform)
          Text(
            K.share,
            style: TextStyle(
              color: KtvTheme.songListDescribeTextColor.withAlpha(66),
              fontSize: 13,
            ),
          ),
        if (Util.parseInt(widget.song.orderedCount) > 0) ...[
          Container(
            width: 1,
            height: 12,
            color: R.color.thirdTextColor,
            margin: const EdgeInsetsDirectional.only(start: 3, end: 3),
          ),
          Text(
            K.room_ktv_has_sing_times(['${widget.song.orderedCount}']),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: KtvTheme.songListDescribeTextColor.withAlpha(66),
              fontSize: 13,
            ),
          ),
        ],
      ],
    );
  }

  /// 使用旧的接口下载歌曲和歌词
  void _onOrderSongBtnTaped() async {
    var room = widget.room;

    /// 音速达，IOS平台，声网不支持mkv音频格式
    if (room.currentRtcType == RtcBizConfig.rtcTypeAgora &&
        widget.song.platform == SongPlatform.KUGOU &&
        Platform.isIOS) {
      Fluttertoast.showToast(
          msg: K.room_song_not_support, gravity: ToastGravity.CENTER);
      return;
    }

    if (SongPlatform.SLP == widget.song.platform) {
      SongDetailResp resp = await KtvRepo.getSongDetail(widget.song.id);
      if (resp.success == true) {
        widget.song.updateHqMusicData(resp.data!);
      }
    }

    // for 酷狗音速达+AME
    String? krc;

    bool success =
        await SongDownloadUtil.isSongDownloadSuccess(widget.song, room);

    if (widget.song.platform == SongPlatform.KUGOU && success) {
      krc = await SongDownloadUtil.getKuGouKrc(widget.song.pid);
      Song? kuGouSong = await KtvRepo.getKuGouSongFromDb(widget.song.pid);
      widget.song.playTime = kuGouSong?.playTime ?? 0;
    } else if (widget.song.platform == SongPlatform.AME && success) {
      krc = await SongDownloadUtil.getAMEKrc(widget.song.musicId, room);
    } else if (widget.song.platform == SongPlatform.AGORA && success) {
      krc = await AgoraMusicUtil.getLyricString(
          Util.parseInt(widget.song.musicId));
    } else if (SongPlatform.ZEGO_V2 == widget.song.platform && success) {
      krc = await ZegoMusicUtil.getLyricString(widget.song.musicId);
    }

    if (!success) {
      SongDownloadResult result =
          await SongDownloadUtil.songDownload(widget.song, room, context);
      success = result.success;
      krc = result.krc;
      if (!mounted) {
        return;
      }
    }

    if (success) {
      _finalChooseSong(krc);
    }
  }

  /// 最后的点歌请求
  void _finalChooseSong(String? krc) async {
    /// 一起听点歌
    if (widget.isMusicRoom) {
      await MusicRoomHelper.syncMusic2Server(
        rid: widget.room.rid,
        path: widget.song.musicId,
        name: widget.song.name,
        type: widget.room.ktvSourceType ?? 0,
      );
      hasChose = true;
      refresh();
    } else {
      /// KTV点歌
      bool notCheckMic =
          widget.room.isKtvRoom && widget.room.config?.mode == RoomMode.Auto;
      NormalNull response = await KtvRepo.chooseSongGo(
          widget.room.rid, widget.song, widget.type,
          krc: krc, notCheckMic: notCheckMic);
      if ((response.success)) {
        if (mounted) {
          setState(() {
            hasChose = true;
          });
          KtvReporter.reportChoseSong(
            widget.room.rid,
            widget.song.id,
            widget.song.name,
            widget.room.config?.originalRFT ?? '',
            widget.song.platform,
          );
        }
      } else if (Util.validStr(response.msg)) {
        Fluttertoast.showToast(msg: response.msg);
      }
    }
  }
}

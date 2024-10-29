import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/juke_music/juke_music_util.dart';
import 'package:chat_room/src/biz_plugin/juke_music/model/juke_music_beans.dart';
import 'package:chat_room/src/biz_plugin/juke_music/model/juke_music_repos.dart';

import '../widget/juke_music_base_state.dart';

/// 待唱歌单
class JukeWaitSingListWidget extends StatefulWidget {
  final int rid;

  const JukeWaitSingListWidget({super.key, required this.rid});

  @override
  _JukeWaitSingListWidgetState createState() => _JukeWaitSingListWidgetState();
}

class _JukeWaitSingListWidgetState
    extends JukeMusicBaseState<JukeWaitSingListWidget>
    with TickerProviderStateMixin {
  late _LoadRepository _loadRepository;

  @override
  void initState() {
    _loadRepository = _LoadRepository(widget.rid);
    eventCenter.addListener("event.jukemusic.singer.added", _onEvent);
    super.initState();
  }

  void _onEvent(String type, dynamic data) async {
    if (type == "event.jukemusic.singer.added") {
      loadData();
    }
  }

  @override
  void dispose() {
    eventCenter.removeListener("event.jukemusic.singer.added", _onEvent);
    super.dispose();
  }

  @override
  Future<void> loadData() async {
    await _loadRepository.refresh();
    if (_loadRepository.errorMsg != null &&
        _loadRepository.errorMsg!.isNotEmpty) {
      setScreenError(
          errorMsg: _loadRepository.errorMsg,
          errorMsgColor: Colors.white.withOpacity(0.6));
    } else if (_loadRepository.playSong == null && _loadRepository.isEmpty) {
      setScreenEmpty(emptyMsgColor: Colors.white.withOpacity(0.6));
    } else {
      setScreenReady();
    }
  }

  void _play(int musicId) async {
    bool success =
        await JukeMusicRepos.startMusic(rid: widget.rid, musicId: musicId);
    if (success && mounted) {
      setScreenLoading();
      loadData();
    }
  }

  void _stop(int musicId) async {
    bool success =
        await JukeMusicRepos.stopMusic(rid: widget.rid, musicId: musicId);
    if (success && mounted) {
      Fluttertoast.showToast(msg: K.room_juke_sing_done);
      setScreenLoading();
      loadData();
    }
  }

  void _end() async {
    BaseResponse rsp = await JukeMusicRepos.endMusic(rid: widget.rid);
    if (rsp.success && mounted) {
      setScreenLoading();
      loadData();
    } else if (rsp.success == false && rsp.msg?.isNotEmpty == true) {
      Fluttertoast.showToast(msg: rsp.msg);
    }
  }

  void _topping(int musicId) async {
    BaseResponse rsp =
        await JukeMusicRepos.topping(rid: widget.rid, musicId: musicId);
    if (rsp.success && mounted) {
      setScreenLoading();
      loadData();
    } else if (rsp.success == false && rsp.msg?.isNotEmpty == true) {
      Fluttertoast.showToast(msg: rsp.msg);
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildBody();
  }

  @override
  Widget buildTitle() {
    return const SizedBox.shrink();
  }

  @override
  Widget buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12.dp),
        Padding(
            padding: EdgeInsetsDirectional.only(start: 16.dp),
            child: Text(K.room_juke_playing,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500))),
        SizedBox(height: 8.dp),
        _renderPlaying(),
        SizedBox(height: 15.dp),
        Padding(
            padding: EdgeInsetsDirectional.only(start: 16.dp),
            child: Text('${K.room_juke_wait_song}：',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500))),
        SizedBox(height: 8.dp),
        _renderPlanList(),
        _buildBottom(),
      ],
    );
  }

  /// 底部开始/结束演唱
  Widget _buildBottom() {
    bool isPlaying = _loadRepository.playSong != null;
    bool hasPlanning = _loadRepository.isNotEmpty;
    if (!JukeMusicUtil.canOperate) {
      return const SizedBox.shrink();
    }
    return GestureDetector(
      onTap: () {
        if (isPlaying == false && hasPlanning == true) {
          _play(_loadRepository.first.id);
        } else {
          _end();
        }
      },
      child: Container(
        height: 52,
        width: Util.width,
        alignment: AlignmentDirectional.center,
        margin: EdgeInsetsDirectional.only(
            bottom: Util.iphoneXBottom + 30, top: 20, start: 16, end: 16),
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Color(0xFFDD7AE6), Color(0xFF8C35FF)]),
            borderRadius: BorderRadius.circular(26)),
        child: Text(
            (isPlaying == false && hasPlanning == true)
                ? K.room_juke_start_play
                : K.room_juke_stop_play,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600)),
      ),
    );
  }

  /// 正在演唱
  Widget _renderPlaying() {
    if (_loadRepository.playSong == null) {
      return Container(
        height: 52,
        alignment: AlignmentDirectional.center,
        margin: const EdgeInsetsDirectional.only(top: 10, bottom: 10),
        child: Text(K.room_juke_no_singer,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 16)),
      );
    }
    JukePlaySong playSong = _loadRepository.playSong!;
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 16.dp, end: 16.dp),
      child: _renderItem(context, playSong, true, 0),
    );
  }

  ///待唱列表
  Widget _renderPlanList() {
    return Expanded(
        child: _loadRepository.isNotEmpty
            ? LoadingMoreList(
                ListConfig<JukePlaySong>(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsetsDirectional.only(
                      start: 16.dp, end: 16.dp, bottom: 16.dp),
                  itemBuilder:
                      (BuildContext context, JukePlaySong item, int index) {
                    return _renderItem(context, item, false, index);
                  },
                  sourceList: _loadRepository,
                  indicatorBuilder: _indicatorBuilder,
                  autoRefresh: false,
                ),
              )
            : Container(
                height: 52,
                alignment: AlignmentDirectional.center,
                margin: const EdgeInsetsDirectional.only(top: 10, bottom: 10),
                child: Text(K.room_juke_no_order,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 16)),
              ));
  }

  Widget _renderItem(
      BuildContext context, JukePlaySong item, bool isSinging, int index) {
    return Container(
      width: Util.width - 16.dp * 2,
      height: 52.dp,
      margin: EdgeInsetsDirectional.only(bottom: 10.dp),
      alignment: AlignmentDirectional.center,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CommonAvatar(
              path: item.singerIcon, size: 37.dp, shape: BoxShape.circle),
          SizedBox(width: 10.dp),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsetsDirectional.only(end: 4.dp),
                        constraints: BoxConstraints(maxWidth: 200.dp),
                        child: MarqueeText(
                            speed: 20,
                            text: item.singerName,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500))),
                    const SizedBox(width: 4),
                    R.img(Util.getRemoteImgUrl(item.singerTag), height: 23),
                  ],
                ),
                Text(item.songName,
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          _buildOperate(isSinging, item, index),
        ],
      ),
    );
  }

  Widget _buildOperate(bool isSinging, JukePlaySong song, int index) {
    if ((JukeMusicUtil.canOperate ||
            _loadRepository.playSong?.singerUid == Session.uid) &&
        isSinging) {
      /// 切歌
      return GestureDetector(
        onTap: () {
          _stop(song.id);
        },
        child: Container(
          height: 28,
          width: 50,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white54),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text(K.room_juke_next,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold)),
        ),
      );
    } else if (JukeMusicUtil.canOperate && !isSinging && index != 0) {
      //置顶
      return GestureDetector(
        onTap: () {
          _topping(song.id);
        },
        child: Padding(
          padding: EdgeInsetsDirectional.only(start: 12.dp, end: 8.dp),
          child: R.img(RoomAssets.chat_room$jukemusic_ic_stick_webp,
              width: 24.dp, height: 24.dp),
        ),
      );
    }
    return SizedBox(width: 20.dp);
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const SizedBox.shrink();
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const SizedBox.shrink();
    } else if (status == IndicatorStatus.fullScreenError) {
      return const SizedBox.shrink();
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: BaseK.K.base_load_more_failed,
          loadMore: _loadRepository.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return const SizedBox.shrink();
    }
    return const LoadingFooter(hasMore: true);
  }
}

class _LoadRepository extends LoadingMoreBase<JukePlaySong> {
  int page = 1;
  bool _hasMore = true;
  bool forceRefresh = false;
  JukePlaySong? playSong;
  String? errorMsg;

  final int rid;

  _LoadRepository(this.rid);

  @override
  bool get hasMore => _hasMore || forceRefresh;

  @override
  Future<bool> refresh([bool clearBeforeRequest = false]) async {
    _hasMore = true;
    page = 1;
    forceRefresh = !clearBeforeRequest;
    playSong = null;
    errorMsg = null;
    bool result = await super.refresh(clearBeforeRequest);
    forceRefresh = false;
    return result;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;
    try {
      DataRsp response = await JukeMusicRepos.planSongs(rid, page);
      JukeWaitMusicData? musicData = response.data;
      if (response.success == false) {
        isSuccess = false;
        errorMsg = response.msg;
      } else {
        if (page == 1) {
          playSong = musicData?.playingSong;
        }
        List<JukePlaySong>? result = musicData?.planSongs;
        if (result != null && page == 1) {
          clear();
        }
        result?.forEach((element) {
          add(element);
        });
        _hasMore = musicData?.more == 1;
        page++;
        isSuccess = true;
      }
    } catch (exception) {
      isSuccess = false;
      Log.d(exception);
    }
    return isSuccess;
  }
}

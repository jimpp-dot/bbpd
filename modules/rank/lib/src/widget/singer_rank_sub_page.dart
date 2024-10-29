import 'package:shared/shared.dart';
import 'package:shared/src/pbModel/generated/banban_rank_common.pb.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';
import 'package:rank/src/widget/model/RankRepo.dart';
import 'package:audioplayers/audioplayers.dart';

/// 歌手榜单列表
class SingerRankSubPage extends StatefulWidget {
  const SingerRankSubPage({super.key});

  @override
  State<StatefulWidget> createState() => _SingerRankSubState();
}

class _SingerRankSubState extends State<SingerRankSubPage>
    with BaseScreenStateMixin, AutomaticKeepAliveClientMixin {
  SingerRankData? _data;

  SingerRankData get data => _data ?? SingerRankData();

  final AudioPlay _audioPlay = AudioPlay();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _audioPlay.closeSound();
    super.dispose();
  }

  Future _loadData() async {
    ResSingerRank resp = await RankRepo.getSingerRankList();
    if (!mounted) return;
    if (resp.success) {
      if (resp.data.members.isNotEmpty) {
        _data = resp.data;
        setScreenReady();
      } else {
        setScreenEmpty(emptyMsgColor: R.colors.secondTextColor);
      }
    } else {
      setScreenError(errorMsgColor: R.colors.secondTextColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return buildStatusContent();
  }

  @override
  Widget buildContent() {
    bool showMe = data.hasMe();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsetsDirectional.only(top: 0, bottom: 0),
            physics: const ClampingScrollPhysics(),
            itemCount: data.members.length,
            itemBuilder: (context, index) {
              return _buildItem(data.members[index]);
            },
          ),
        ),
        if (showMe)
          Container(
            width: Util.width,
            height: 65 + Util.bottomMargin,
            alignment: AlignmentDirectional.topCenter,
            color: R.colors.mainBgColor,
            child: _buildItem(data.me, self: true),
          )
      ],
    );
  }

  Widget _buildItem(SingerRankMember item, {bool self = false}) {
    return Container(
      width: double.infinity,
      height: 65,
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsetsDirectional.only(start: 6, end: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildRank(item.base.rank),
          _buildAvatar(item),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.base.name,
                  style: TextStyle(
                      color: R.colors.mainTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (!self) ...[
                  const SizedBox(height: 7),
                  _buildUserTags(item),
                ]
              ],
            ),
          ),
          const SizedBox(width: 12),
          if (!self) _renderButton(item),
        ],
      ),
    );
  }

  Widget _buildUserTags(SingerRankMember item) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CachedNetworkImage(
            imageUrl: item.singerUrl, height: 20, fit: BoxFit.fitHeight),
        if (item.audioUrl.isNotEmpty && item.audioSeconds > 0)
          _SingerSoundWidget(
              audioPlay: _audioPlay,
              audioUrl: Util.getRemoteImgUrl(item.audioUrl),
              audioLen: item.audioSeconds),
      ],
    );
  }

  Widget _buildAvatar(SingerRankMember item) {
    bool isDark = darkMode;
    return GestureDetector(
      onTap: () {
        if (item.inRid > 0) {
          IRoomManager roomManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_BASE_ROOM);
          roomManager.openChatRoomScreenShow(context, item.inRid);
        } else if (item.base.uid > 0 && item.base.uid != Session.uid) {
          IPersonalDataManager personalManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_PERSONALDATA);
          personalManager.openImageScreen(context, item.base.uid);
        }
      },
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: 48,
            height: 48,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF926AFF) : null,
              gradient: isDark
                  ? null
                  : const LinearGradient(
                      colors: [Color(0xFFA468FC), Color(0xFFFF56EE)],
                      begin: Alignment(-0.5, -0.5),
                      end: Alignment(0.5, 0.5),
                    ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: CommonAvatar(
                path: item.base.icon,
                size: item.inRid > 0 ? 45 : 48,
                shape: BoxShape.circle),
          ),
          if (item.inRid > 0)
            PositionedDirectional(
              end: 0,
              bottom: 0,
              child: Container(
                width: 16,
                height: 16,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF926AFF) : null,
                  gradient: isDark
                      ? null
                      : const LinearGradient(
                          colors: [Color(0xFFA468FC), Color(0xFFFF56EE)],
                          begin: Alignment(-0.5, -0.5),
                          end: Alignment(0.5, 0.5),
                        ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: RepaintBoundary(
                    child: R.img(Assets.rank$ic_room_live_webp,
                        width: 11,
                        fit: BoxFit.fitWidth,
                        color:
                            isDark ? const Color(0xFF6CFFFF) : Colors.white)),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRank(int rank) {
    String rankStr = '';
    if (rank > data.rankShowMax) {
      rankStr = '${data.rankShowMax}+';
    } else if (rank <= 0) {
      rankStr = '-';
    } else {
      rankStr = '$rank';
    }
    return Container(
      width: 50,
      alignment: AlignmentDirectional.center,
      child: (rank >= 1 && rank <= 3)
          ? R.img(
              Assets.rank_rank_big_x_png(rank),
              width: 30,
              height: 27,
              package: ComponentManager.MANAGER_RANK,
            )
          : Text(
              rankStr,
              style: TextStyle(
                  color: R.colors.mainTextColor.withOpacity(0.5),
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
    );
  }

  Widget _renderButton(SingerRankMember item) {
    bool isDark = darkMode;
    return SizedBox(
      width: 55,
      height: 26,
      child: GestureDetector(
        onTap: () {
          if (item.inRid > 0) {
            IRoomManager roomManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_BASE_ROOM);
            roomManager.openRoomWithSingerOrder(
                context, item.inRid, item.base.uid);
          } else {
            IChatManager chatManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_CHAT);
            chatManager.openUserChatScreen(context,
                targetId: item.base.uid,
                type: 'private',
                title: item.base.name);
          }
        },
        child: GradientBorder(
          borderGradient: LinearGradient(
            colors: isDark
                ? const [
                    Color(0xFF99FFBC),
                    Color(0xFF26C4FF),
                    Color(0xFF926AFF)
                  ]
                : const [Color(0xFF7D2EE6), Color(0xFF7D2EE6)],
            begin: const Alignment(-0.5, -0.5),
            end: const Alignment(0.5, 0.5),
          ),
          borderWidth: 1,
          borderRadius: 13,
          child: Center(
            child: Text(
              '去点歌',
              style: TextStyle(
                  color: isDark
                      ? const Color(0xFF6CFFFF)
                      : const Color(0xFF7D2EE6),
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

/// 音频播放控件
class _SingerSoundWidget extends StatefulWidget {
  final AudioPlay audioPlay;
  final String audioUrl;
  final int audioLen;

  const _SingerSoundWidget(
      {Key? key,
      required this.audioPlay,
      required this.audioUrl,
      required this.audioLen})
      : super(key: key);

  @override
  State<_SingerSoundWidget> createState() => _SingerSoundWidgetState();
}

class _SingerSoundWidgetState extends State<_SingerSoundWidget> {
  int _leftSeconds = 0;

  bool get _isPlaying =>
      widget.audioPlay.currentPlayUrl == widget.audioUrl &&
      widget.audioPlay.playerState == PlayerState.playing;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(
        AudioPlay.eventAudioPlayChanged, _onPositionChangeEvent);
    eventCenter.addListener(AudioPlay.eventAudioStopChanged, _onStopEvent);
  }

  @override
  void dispose() {
    super.dispose();
    eventCenter.removeListener(
        AudioPlay.eventAudioPlayChanged, _onPositionChangeEvent);
    eventCenter.removeListener(AudioPlay.eventAudioStopChanged, _onStopEvent);
  }

  void _onPositionChangeEvent(String type, dynamic data) {
    if (data is Map) {
      String? url = data['url'];
      if (url == widget.audioUrl) {
        _leftSeconds = Util.parseInt(data['seconds']);
        setState(() {});
      }
    }
  }

  void _onStopEvent(String type, dynamic data) {
    if (data is Map) {
      String? url = data['url'];
      if (url == widget.audioUrl) {
        _leftSeconds = 0;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = darkMode;
    String icon;
    if (_isPlaying) {
      icon = isDark
          ? Assets.rank$ic_sound_pause_dark_png
          : Assets.rank$ic_sound_pause_png;
    } else {
      icon = isDark
          ? Assets.rank$ic_sound_play_dark_png
          : Assets.rank$ic_sound_play_png;
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        if (widget.audioUrl != widget.audioPlay.currentPlayUrl) {
          await widget.audioPlay.stop();
          await widget.audioPlay.play(widget.audioUrl, widget.audioLen);
        } else {
          if (widget.audioPlay.playerState == PlayerState.playing) {
            await widget.audioPlay.stop();
          } else {
            await widget.audioPlay.play(widget.audioUrl, widget.audioLen);
          }
        }
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 6, end: 6),
        child: Container(
          width: 38,
          height: 16,
          decoration: BoxDecoration(
            color: isDark
                ? Colors.white.withOpacity(0.16)
                : Colors.black.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              R.img(icon, width: 16, height: 16),
              Container(
                width: 22,
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsetsDirectional.only(end: 2),
                child: Text(
                  '${_isPlaying ? _leftSeconds : widget.audioLen}s',
                  style: TextStyle(
                      color: isDark
                          ? Colors.white.withOpacity(0.9)
                          : Colors.black.withOpacity(0.9),
                      fontSize: 8,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

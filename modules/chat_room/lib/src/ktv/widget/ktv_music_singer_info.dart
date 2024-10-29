import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/util/god_tag_util.dart';
import 'package:chat_room/src/ktv/model/ktv_pk_rank.dart';
import 'package:chat_room/src/ktv/rank/ktv_pk_rank_widget.dart';
import 'package:chat_room/src/ktv/utils/time_util.dart';
import 'package:flutter/material.dart';

import '../rank/ktv_song_rank_widget.dart';

class KtvMusicSingerInfo extends StatefulWidget {
  final ChatRoomData room;
  final int uid;
  final String? name;

  /// 歌手演唱这首歌本周内收到的打赏
  final int? weekMusicalNotes;
  final int? songId;

  const KtvMusicSingerInfo({
    super.key,
    required this.room,
    required this.uid,
    this.name,
    this.weekMusicalNotes,
    this.songId,
  });

  @override
  State<KtvMusicSingerInfo> createState() => _KtvMusicSingerInfoState();
}

class _KtvMusicSingerInfoState extends State<KtvMusicSingerInfo> {
  /// 是否开启PK模式
  bool _pkMode = false;

  /// pk 模式下星光值
  int _pkScore = 0;

  /// pk 模式距离上一名还差x星光值
  int _leftScore = 0;

  /// 是否展示关注按钮
  bool _showFollow = false;

  @override
  void initState() {
    super.initState();
    _initData();
    widget.room.addListeners(_getEvents(), _onPkScoreChanged);
    if (widget.uid != Session.uid) {
      /// 自己不用展示关注按钮
      BaseRequestManager.queryFollowStatus(widget.uid, toastError: false)
          .then((value) {
        if (mounted) {
          setState(() {
            _showFollow = Util.parseInt(value, 0) == 0;
          });
        }
      });
    }
  }

  @override
  void didUpdateWidget(covariant KtvMusicSingerInfo oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.uid != widget.uid) {
      if (widget.uid == Session.uid) {
        _showFollow = false;
      } else {
        BaseRequestManager.queryFollowStatus(widget.uid, toastError: false)
            .then((value) {
          if (mounted) {
            setState(() {
              _showFollow = Util.parseInt(value, 0) == 0;
            });
          }
        });
      }
    }
  }

  void _initData() {
    _pkMode = widget.room.ktvPkRank?.isPkModeOpen ?? false;

    //主唱
    if (widget.uid == widget.room.ktvPkRank?.onMicUid) {
      _pkScore = widget.room.ktvPkRank?.currentScore ?? 0;
      _leftScore = widget.room.ktvPkRank?.beforeScore ?? 0;
    } else if (widget.uid == widget.room.ktvPkRank?.chorusUid) {
      // 合唱
      _pkScore = widget.room.ktvPkRank?.chorusCurrentScore ?? 0;
      _leftScore = widget.room.ktvPkRank?.chorusBeforeScore ?? 0;
    }

    refresh();
  }

  @override
  void dispose() {
    widget.room.removeListeners(_getEvents(), _onPkScoreChanged);
    super.dispose();
  }

  List<String> _getEvents() => [
        RoomConstant.Event_Ktv_Pk_Score_Change,
        RoomConstant.Event_Ktv_Pk_Config_Change
      ];

  void _onPkScoreChanged(String type, Object? data) async {
    if (type == RoomConstant.Event_Ktv_Pk_Score_Change) {
      if (data is! Map) return;
      Map<String, dynamic> json = data as Map<String, dynamic>;
      KtvPkScoreEventData eventData = KtvPkScoreEventData.fromJson(json);
      if (widget.uid == eventData.uid) {
        _pkScore = eventData.currentScore;
        _leftScore = eventData.beforeScore;
        refresh();
      }
    } else if (type == RoomConstant.Event_Ktv_Pk_Config_Change) {
      _initData();
    }
  }

  @override
  Widget build(BuildContext context) {
    String godTagIcon = GodTagUtil.getGodTagByUid(widget.uid);
    return SizedBox(
      width: 156,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              LimitedBox(
                maxWidth: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!Util.isStringEmpty(godTagIcon))
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 3),
                        child: CachedNetworkImage(
                          imageUrl: Util.getRemoteImgUrl(godTagIcon),
                          height: 12,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    Flexible(
                      child: Text(
                        widget.name ?? '',
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
              if (_showFollow) ...[
                const SizedBox(width: 3),
                GestureDetector(
                  onTap: () async {
                    NormalNull response = await BaseRequestManager.onFollow(
                        widget.uid.toString());
                    if (response.success) {
                      Fluttertoast.showToast(
                          msg: K.followed, gravity: ToastGravity.CENTER);
                      if (mounted) {
                        setState(() {
                          _showFollow = false;
                        });
                      }
                    } else {
                      if (response.msg.isNotEmpty) {
                        Fluttertoast.showToast(
                            msg: response.msg, gravity: ToastGravity.CENTER);
                      }
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 6, end: 6),
                    child: Container(
                      height: 20,
                      alignment: AlignmentDirectional.center,
                      padding:
                          const EdgeInsetsDirectional.only(start: 8, end: 8),
                      decoration: ShapeDecoration(
                        shape: const StadiumBorder(),
                        gradient: LinearGradient(
                            colors: R.color.mainBrandGradientColors),
                      ),
                      child: Text(
                        K.follow,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ),
                  ),
                ),
              ]
            ],
          ),
          const SizedBox(height: 2),
          GestureDetector(
            onTap: () {
              onInfoTap(context);
            },
            child: _pkMode == true ? _buildPkMode() : _buildNormal(),
          ),
        ],
      ),
    );
  }

  /// 歌手演唱这首歌本周内收到的打赏
  Widget _buildNormal() {
    return Container(
      height: 16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black.withOpacity(0.4),
      ),
      padding: const EdgeInsetsDirectional.only(start: 8, end: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          R.img(
            'ktv/ktv_rank_music_icon.png',
            width: 12,
            height: 12,
            package: ComponentManager.MANAGER_BASE_ROOM,
          ),
          const SizedBox(width: 1),
          Text(
            '${widget.weekMusicalNotes}',
            style:
                const TextStyle(fontSize: 10, color: Colors.white, height: 1),
          ),
        ],
      ),
    );
  }

  Widget _buildPkMode() {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black.withOpacity(0.4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              R.img('ktv/ktv_ic_pk_score.png',
                  width: 10,
                  height: 10,
                  package: ComponentManager.MANAGER_BASE_ROOM),
              const SizedBox(width: 2),
              Text(
                KtvTimeUtil.getMusicNum(_pkScore),
                style: const TextStyle(color: Colors.white, fontSize: 10),
              )
            ],
          ),
          const SizedBox(height: 2),
          Text(
            K.room_ktv_pk_score_dis([
              KtvTimeUtil.getMusicNum(
                  (_leftScore - _pkScore) < 0 ? 0 : (_leftScore - _pkScore))
            ]),
            style: const TextStyle(color: Colors.white, fontSize: 9),
          )
        ],
      ),
    );
  }

  void onInfoTap(BuildContext context) {
    if (_pkMode == true) {
      KtvPkRankWidget.show(context, widget.room);
    } else {
      KtvSongRankWidget.show(context, widget.songId ?? 0);
    }
  }
}

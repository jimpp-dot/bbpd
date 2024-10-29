import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'dart:ui' as ui;

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/live/model/live_pk_one_more_info.dart';
import 'package:chat_room/src/live/model/live_repository_v3.dart';
import 'package:flutter/material.dart';

import '../live_pk_config_v3.dart';
import 'live_pk_one_game_again_pop_window.dart';
import 'live_pk_user_icon_v3.dart';

/// pk 房主位
class LivePKCreatorV3 extends StatefulWidget {
  final ChatRoomData room;
  final bool displayEmoteAtMic;
  final bool needBottomRadius;
  final int winCount; //主场连胜次数
  final int toWinCount; //客场连胜次数
  final LivePKConfigV3? pkConfig;

  const LivePKCreatorV3({
    Key? key,
    required this.room,
    this.displayEmoteAtMic = true,
    this.needBottomRadius = true,
    this.winCount = 0,
    this.toWinCount = 0,
    this.pkConfig,
  }) : super(key: key);

  @override
  _LivePKCreatorV3State createState() => _LivePKCreatorV3State();
}

class _LivePKCreatorV3State extends State<LivePKCreatorV3> {
  final GlobalKey _clickAgainKey = GlobalKey();
  bool _isOneMoreSender = true; //是否是再来一局的发起方
  LivePKOneMoreInfo? _oneGameMore; // 再来一局数据
  bool _showOneMorePop = false;

  @override
  void initState() {
    super.initState();
    widget.room.addListener(
        RoomConstant.LIVE_PK_ONEMORE_NOTIFY, _onOneMoreNotifyEvent);
  }

  @override
  void dispose() {
    widget.room.removeListener(
        RoomConstant.LIVE_PK_ONEMORE_NOTIFY, _onOneMoreNotifyEvent);
    super.dispose();
  }

  Future<void> _onOneMoreNotifyEvent(String type, Object? data) async {
    if (!mounted || data is! Map) return;

    Map<String, dynamic> map = Map<String, dynamic>.from(data);
    _oneGameMore = LivePKOneMoreInfo.fromJson(map);
    Log.d('_oneGameMore = $_oneGameMore');
    if (_oneGameMore!.toUid == Session.uid) {
      _isOneMoreSender = false;
    }
    _showOneMorePop = true;
    refresh();
  }

  void _resetOneMore() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isOneMoreSender = true;
      _showOneMorePop = false;
      refresh();
    });
  }

  Widget _getOperateButton(BuildContext context, LivePKState state) {
    if (state == LivePKState.Wait ||
        !ChatRoomUtil.isOnFirstPosition(Session.uid)) {
      return const SizedBox.shrink();
    }

    if (state == LivePKState.PK) {
      return const SizedBox.shrink();
    }

    if (state == LivePKState.Match) {
      return InkWell(
        onTap: () async {
          bool? flag = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return ConfirmDialog(
                content: K.live_pk_confirm_cancel_match,
                negativeButton: NegativeButton(
                  text: K.cancel,
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                positiveButton: PositiveButton(
                  text: K.sure,
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              );
            },
          );
          if (flag == true) {
            await LiveRepositoryV3.cancelMatch('${widget.room.rid}');
          }
        },
        child: Container(
          padding: const EdgeInsetsDirectional.only(
              start: 6.0, end: 6.0, top: 2.0, bottom: 2.0),
          decoration: BoxDecoration(
            color: const Color(0xff000000).withOpacity(0.2),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          alignment: Alignment.center,
          child: Text(
            K.live_pk_cancel_match,
            style: TextStyle(
              fontSize: 10.0,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ),
      );
    } else {
      String content = '';
      if (state == LivePKState.PK) {
        content = K.live_pk_scape_content_1;
      } else if (state == LivePKState.Punish) {
        content = K.live_pk_scape_content_2;
      } else if (state == LivePKState.Ready) {
        content = K.live_pk_scape_content_3;
      }
      return InkWell(
        onTap: () async {
          bool? flag;
          if (state == LivePKState.End) {
            flag = true;
          } else {
            flag = await showDialog(
              context: context,
              builder: (BuildContext context) {
                return ConfirmDialog(
                  content: content,
                  negativeButton: NegativeButton(
                    text: K.live_pk_cancel_operate,
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  positiveButton: PositiveButton(
                    text: K.live_pk_over_now,
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                );
              },
            );
          }
          if (flag == true) {
            int rid = widget.room.rid;
            int pkId =
                widget.room.config?.liveDataV3?.pkConfigV3?.pkBase?.pk_id ?? 0;
            await LiveRepositoryV3.cancelPK(rid, pkId);
          }
        },
        child: Row(
          children: [
            Container(
              height: 24.0,
              width: 80.0,
              padding: const EdgeInsetsDirectional.only(
                  start: 8.0, end: 8.0, top: 4.0, bottom: 4.0),
              decoration: const ShapeDecoration(
                  color: Colors.black26, shape: StadiumBorder()),
              alignment: Alignment.center,
              child: Text(
                K.room_live_pk_leave,
                style: const TextStyle(fontSize: 12.0, color: Colors.white),
              ),
            ),
            const SizedBox(width: 6),
            if (widget.room.config?.liveDataV3?.pkConfigV3?.pkBase?.state ==
                    LivePKState.Punish ||
                widget.room.config?.liveDataV3?.pkConfigV3?.pkBase?.state ==
                    LivePKState.End)
              InkWell(
                onTap: _clickGameAgain,
                child: Container(
                  height: 24,
                  width: 80,
                  key: _clickAgainKey,
                  padding: const EdgeInsetsDirectional.only(
                      start: 4.0, end: 4.0, top: 4.0, bottom: 4.0),
                  decoration: const ShapeDecoration(
                      color: Colors.black26, shape: StadiumBorder()),
                  alignment: Alignment.center,
                  child: Text(
                    _isOneMoreSender ? K.room_play_again : K.start_now,
                    style: const TextStyle(fontSize: 12.0, color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      );
    }
  }

  /// 再来一局
  _clickGameAgain() async {
    int mainRid =
        widget.room.config?.liveDataV3?.pkConfigV3?.pkBase?.main?.rid ?? 0;
    int competeRid =
        widget.room.config?.liveDataV3?.pkConfigV3?.pkBase?.compete?.rid ?? 0;

    if (_isOneMoreSender) {
      if (Session.uid ==
          widget.room.config?.liveDataV3?.pkConfigV3?.pkBase?.main?.uid) {
        _launchMatchAgain(mainRid, competeRid);
      } else {
        _launchMatchAgain(competeRid, mainRid);
      }
    } else {
      /// 接收方
      if (Session.uid ==
          widget.room.config?.liveDataV3?.pkConfigV3?.pkBase?.main?.uid) {
        _acceptMatchAgain(competeRid, mainRid);
      } else {
        _acceptMatchAgain(mainRid, competeRid);
      }
    }
  }

  /// 邀请PK
  _launchMatchAgain(int fromRid, int toRid) async {
    BaseResponse response =
        await LiveRepositoryV3.launchMatchAgain(fromRid: fromRid, toRid: toRid);
    if (!(response.success == true)) {
      Fluttertoast.showToast(
          msg: response.msg ?? K.room_send_fail_please_retry,
          gravity: ToastGravity.CENTER);
      return;
    }
  }

  /// 接受邀请PK
  _acceptMatchAgain(int fromRid, int toRid) async {
    BaseResponse response =
        await LiveRepositoryV3.acceptMatchAgain(fromRid: fromRid, toRid: toRid);
    if (!(response.success == true)) {
      Fluttertoast.showToast(
          msg: response.msg ?? K.failed_to_accept_invitation,
          gravity: ToastGravity.CENTER);
      return;
    }
  }

  Widget _buildTimer(BuildContext context) {
    int diff = 0;
    if (widget.room.config?.counter != null &&
        widget.room.config!.counter - widget.room.timestamp > 0) {
      diff = widget.room.config!.counter - widget.room.timestamp;
    }
    if (diff <= 0) {
      const SizedBox.shrink();
    }

    return TimerWidget(
      key: GlobalKey(),
      stop: Duration(seconds: diff),
      onTick: () {
        diff--;
        if (diff <= 0) {
          return;
        }
      },
      builder: (context) {
        return Text(
          Util.formatTimeToMinute(diff),
          style: const TextStyle(fontSize: 12.0, color: Colors.white),
        );
      },
    );
  }

  Widget _getTopStateWidget(BuildContext context, LivePKState state) {
    if (state == LivePKState.Wait) {
      return const SizedBox.shrink();
    }

    String icon = '';
    if (state == LivePKState.Ready) {
      icon = 'livev3/room_live_pk_state_ready.webp';
    } else if (state == LivePKState.PK) {
      icon = 'livev3/room_live_pk_state_pk.webp';
    } else if (state == LivePKState.Punish) {
      icon = 'livev3/room_live_pk_state_punish.webp';
    } else if (state == LivePKState.End) {
      icon = 'livev3/room_live_pk_state_end.webp';
    }

    List<Widget> res = [];

    String punish =
        widget.room.config?.liveDataV3?.pkConfigV3?.pkBase?.punish ?? '';
    var showWidget = true;
    if (state == LivePKState.Punish && punish.isEmpty) {
      showWidget = false;
    }
    if (showWidget == true) {
      if (icon.isNotEmpty) {
        res.add(R.img(
          icon,
          width: 30.0,
          height: 22.0,
          package: ComponentManager.MANAGER_BASE_ROOM,
        ));
        res.add(const SizedBox(width: 4.0));
      }
      res.add(_buildTimer(context));
    }

    return Container(
      width: 231 / 2.5,
      height: 54.0 / 2.5,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: (R.img(
          RoomAssets.livev3_room_live_pk_state_bg_webp,
          package: RoomAssets.package,
          width: 231 / 2.5,
          height: 54.0 / 2.5,
          fit: BoxFit.cover,
        ) as Image)
                .image
            // AssetImage(R.imagePath("livev3/room_live_pk_state_bg.webp", package: ComponentManager.MANAGER_BASE_ROOM)),

            ),
      ),
      child: res.isNotEmpty
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: res,
            )
          : const SizedBox.shrink(),
    );
  }

  Widget _getMidContent(LivePKState state) {
    if (state == LivePKState.Wait) {
      return const SizedBox.shrink();
    }

    if (state == LivePKState.Match) {
      return R.img(
        'livev3/room_live_pk.webp',
        width: 216 / 3,
        height: 300.0 / 3,
        package: ComponentManager.MANAGER_BASE_ROOM,
      );
    } else {
      String punish =
          widget.room.config?.liveDataV3?.pkConfigV3?.pkBase?.punish ?? '';
      var showPunish = false;
      if (punish.isNotEmpty) {
        showPunish = true;
      }

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            showPunish ? K.live_pk_punish_content_title : '',
            style: TextStyle(
              fontSize: 10.0,
              color: Colors.white.withOpacity(0.6),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4.0),
          Container(
            constraints: const BoxConstraints(maxWidth: 120.0),
            child: Text(
              showPunish ? punish : '',
              style: const TextStyle(fontSize: 13.0, color: Colors.white),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          )
        ],
      );
    }
  }

  /// 主场 客场
  Widget _getSignWidget(bool isMain) {
    return Container(
      width: 40,
      height: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(isMain ? 10.0 : 0.0),
          topEnd: Radius.circular(isMain ? 0.0 : 10.0),
          bottomStart: Radius.circular(isMain ? 0.0 : 10.0),
          bottomEnd: Radius.circular(isMain ? 10.0 : 0.0),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isMain
              ? [const Color(0xFFFE73B8), const Color(0xFFFE73B8)]
              : [const Color(0xFF76D3F8), const Color(0xFF76D3F8)],
        ),
      ),
      child: Text(
        isMain ? K.live_pk_main : K.live_pk_compete,
        style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 10.0,
            color: Colors.white,
            height: 1),
      ),
    );
  }

  /// 我的房间
  Widget getSignWidget(bool isMain) {
    return Container(
      width: 58.0,
      height: 16.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(isMain ? 12.0 : 0.0),
          topEnd: Radius.circular(!isMain ? 12.0 : 0.0),
          bottomStart: Radius.circular(!isMain ? 12.0 : 0.0),
          bottomEnd: Radius.circular(isMain ? 12.0 : 0.0),
        ),
        image: DecorationImage(
          image: AssetImage(
            R.imagePath(
              isMain
                  ? "livev3/room_live_pk_main_sign_bg.webp"
                  : "livev3/room_live_pk_compete_sign_bg.webp",
              package: ComponentManager.MANAGER_BASE_ROOM,
            ),
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Text(
        K.live_pk_my_room,
        style: const TextStyle(
            fontWeight: FontWeight.w600, fontSize: 10.0, color: Colors.white),
      ),
    );
  }

  ///  连胜图标和文字
  Widget _getWinningStreak(int winCount) {
    return SizedBox(
      width: 32,
      child: Column(
        children: [
          R.img(
            'livev3/winning_streak.png',
            width: 32.0,
            height: 24.0,
            package: ComponentManager.MANAGER_BASE_ROOM,
          ),
          Container(
            transform: Matrix4.translationValues(0.0, -5.0, 0.0),
            child: GradientText(
              'x$winCount',
              textAlign: TextAlign.start,
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFFF6BC), Color(0xFFFFCC00)],
              ),
              style: const TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ), //Color(0xFF000000)
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.room.config == null ||
        widget.room.config!.liveDataV3 == null ||
        widget.room.config!.liveDataV3?.pkConfigV3 == null ||
        widget.room.config!.liveDataV3?.pkConfigV3?.pkBase == null) {
      return const SizedBox.shrink();
    }

    LivePKState? state =
        widget.room.config?.liveDataV3?.pkConfigV3?.pkBase?.state;
    // LivePKState? state = LivePKState.Ready;
    if (state == null || state == LivePKState.Wait) {
      return const SizedBox.shrink();
    }
    Log.d('111 state = $state');
    if (state != LivePKState.Punish &&
        state != LivePKState.End &&
        _showOneMorePop == true) {
      _resetOneMore();
    }

    double wholeHeight = 148.0;
    LivePKUserOnMicItem? mainItem;
    LivePKUserOnMicItem? competeItem;
    bool isAudience = true;
    if (state == LivePKState.Match) {
      if (widget.room.positions.isNotEmpty) {
        int origin = widget.room.positions[0].uid;
        mainItem = LivePKUserOnMicItem(
          uid: origin,
          name: widget.room.positions[0].name,
          icon: widget.room.positions[0].icon,
          rid: widget.room.rid,
          origin: origin,
          score: 0,
        );
        competeItem =
            widget.room.config?.liveDataV3?.pkConfigV3?.pkBase?.compete;
        if (Session.uid == mainItem.uid) {
          isAudience = false;
        }
      }
    } else {
      mainItem = widget.room.config?.liveDataV3?.pkConfigV3?.pkBase?.main;
      competeItem = widget.room.config?.liveDataV3?.pkConfigV3?.pkBase?.compete;
      if (Session.uid == mainItem?.uid || Session.uid == competeItem?.uid) {
        isAudience = false;
      }
    }
    return Container(
      width: MediaQuery.of(context).size.width - 32.0,
      height: wholeHeight,
      margin:
          const EdgeInsetsDirectional.only(start: 16.0, end: 16.0, top: 44.0),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: wholeHeight,
            child: ClipRRect(
              borderRadius: BorderRadiusDirectional.only(
                topStart: const Radius.circular(12.0),
                topEnd: const Radius.circular(12.0),
                bottomStart:
                    Radius.circular(widget.needBottomRadius ? 12.0 : 0.0),
                bottomEnd:
                    Radius.circular(widget.needBottomRadius ? 12.0 : 0.0),
              ).resolve(Directionality.of(context)),
              child: CustomPaint(
                painter: _PkCreatorPainter(state: state),
              ),
            ),
          ),
          if (widget.winCount >= 5)
            PositionedDirectional(
              start: 0,
              top: 21,
              child: _getWinningStreak(widget.winCount),
            ),
          if (competeItem?.uid != null && widget.toWinCount >= 5)
            PositionedDirectional(
              end: 0,
              top: 21,
              child: _getWinningStreak(widget.toWinCount),
            ),

          /// 主场
          PositionedDirectional(
            start: 0.0,
            top: 0.0,
            child: _getSignWidget(true),
          ),

          /// 客场
          PositionedDirectional(
            end: 0.0,
            top: 0.0,
            child: _getSignWidget(false),
          ),

          PositionedDirectional(
            start: 13.0,
            bottom: 36.0,
            child: LivePKUserIcon(
              displayEmoteAtMic: widget.displayEmoteAtMic,
              isAudience: isAudience,
              pkConfig: widget.pkConfig,
              item: widget.pkConfig?.pkBase?.main ?? mainItem,
              room: widget.room,
            ),
          ),
          PositionedDirectional(
            end: 13.0,
            bottom: 36.0,
            child: LivePKUserIcon(
              displayEmoteAtMic: widget.displayEmoteAtMic,
              isAudience: isAudience,
              pkConfig: widget.pkConfig,
              item: widget.pkConfig?.pkBase?.compete ?? competeItem,
              room: widget.room,
            ),
          ),
          PositionedDirectional(
            top: 0.0,
            child: _getTopStateWidget(context, state),
          ),
          PositionedDirectional(
            top: 26.0,
            child: _getMidContent(state),
          ),
          if (_showOneMorePop == true)
            PositionedDirectional(
              end: 53.0,
              bottom: 25.0,
              child: LivePkOneGameAgainPopWindow(
                room: widget.room,
                oneGameMore: _oneGameMore,
                onShowWindowCallback: (value) {
                  _showOneMorePop = value;
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    refresh();
                  });
                },
              ),
            ),
          PositionedDirectional(
            bottom: 6.0,
            child: _getOperateButton(context, state),
          ),
        ],
      ),
    );
  }
}

/// 画对抗色
class _PkCreatorPainter extends CustomPainter {
  double leftRatio = 0.5;

  final Paint leftPaint = Paint();
  final Paint rightPaint = Paint();
  final LivePKState? state;

  _PkCreatorPainter({this.state}) {
    leftPaint.isAntiAlias = true;
    leftPaint.style = PaintingStyle.fill;

    rightPaint.isAntiAlias = true;
    rightPaint.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    double leftW = leftRatio * width + 0.1 * height;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(leftW, 0);
    path.lineTo(leftW - 0.15 * height, height);
    path.lineTo(0, height);
    path.close();
    leftPaint.shader = ui.Gradient.linear(
      Offset(0, height / 2),
      Offset(leftW, height / 2),
      (state == LivePKState.Wait || state == LivePKState.Match)
          ? [const Color(0xFFFE73B8), const Color(0xFFFE73B8)]
          : [
              const Color(0xFFFE73B8).withOpacity(0.7),
              const Color(0xFFFE73B8).withOpacity(0.7)
            ],
    );
    canvas.drawPath(path, leftPaint);

    path.reset();
    path.moveTo(leftW, 0);
    path.lineTo(width, 0);
    path.lineTo(width, height);
    path.lineTo(leftW - 0.15 * height, height);
    path.close();
    rightPaint.shader = ui.Gradient.linear(
      Offset(width, height / 2),
      Offset(leftW, height / 2),
      (state == LivePKState.Wait || state == LivePKState.Match)
          ? [const Color(0xFF27C3FF), const Color(0xFF65F6C9)]
          : [
              const Color(0xFF27C3FF).withOpacity(0.7),
              const Color(0xFF65F6C9).withOpacity(0.7)
            ],
    );
    canvas.drawPath(path, rightPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

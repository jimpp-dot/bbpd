import 'dart:async';
import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/accompany/model/accompany_model.dart';
import 'package:chat_room/src/accompany/model/accompany_repository.dart';
import 'package:chat_room/src/accompany/widget/accompany_gift_dialog.dart';
import 'package:chat_room/src/base/widget/backgroundSheet.dart';

/// 1+1陪伴房
class AccompanyWidget extends StatefulWidget {
  final ChatRoomData room;
  final bool displayEmote;

  const AccompanyWidget(
      {super.key, required this.room, required this.displayEmote});

  @override
  _AccompanyWidgetState createState() => _AccompanyWidgetState();
}

class _AccompanyWidgetState extends State<AccompanyWidget> {
  AccompanyData? _accompanyData;
  AccompanyExtraData? _accompanyExtraData;
  late GlobalKey _timerGlobalKey;

  @override
  void initState() {
    super.initState();
    _timerGlobalKey = GlobalKey();
    if (widget.room.config?.configExpendData is AccompanyData) {
      _accompanyData = widget.room.config?.configExpendData as AccompanyData;
    }
    _load();
    widget.room.addListener(RoomConstant.Event_Refresh, _onRoomRefresh);
    widget.room
        .addListener(RoomConstant.Event_Accompany_Refresh, _onAccompanyRefresh);
    widget.room
        .addListener(RoomConstant.Event_Accompany_Mystery_Gift, _onMysteryGift);
  }

  @override
  void didUpdateWidget(covariant AccompanyWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.room.removeListener(RoomConstant.Event_Refresh, _onRoomRefresh);
    widget.room.removeListener(
        RoomConstant.Event_Accompany_Refresh, _onAccompanyRefresh);
    widget.room.removeListener(
        RoomConstant.Event_Accompany_Mystery_Gift, _onMysteryGift);
    super.dispose();
  }

  /// 加载陪伴房额外数据
  void _load() async {
    _accompanyExtraData = await AccompanyRepository.load(widget.room.rid);
    if (mounted) setState(() {});
  }

  void _onRoomRefresh(String name, dynamic data) {
    // Log.i('AccompanyData _onRoomRefresh data:$data');
    if (widget.room.config?.configExpendData is AccompanyData) {
      _accompanyData = widget.room.config?.configExpendData as AccompanyData;
      _timerGlobalKey = GlobalKey();
    }
    if (mounted) setState(() {});
  }

  void _onAccompanyRefresh(String name, dynamic data) {
    if (data is! Map) return;
    _accompanyExtraData =
        AccompanyExtraData.fromJson(data as Map<String, dynamic>);
    if (mounted) setState(() {});
  }

  /// 神秘礼物
  _onMysteryGift(String type, dynamic data) {
    if (data is! Map) return;
    AccompanyMysteryGift gift =
        AccompanyMysteryGift.fromJson(Map<String, dynamic>.from(data));
    if (mounted) {
      AccompanyGiftDialog.show(buildContext: context, gift: gift);
    }
  }

  bool get accompanyFinish =>
      isAccompany &&
      ((_accompanyData?.duration ?? 0) >= (_accompanyData?.totalTime ?? 1));

  /// 麦上用户数量
  int get micUser {
    if (widget.room.positions.isEmpty) return 0;
    return widget.room.positions.where((element) => element.uid > 0).length;
  }

  bool get isAccompany {
    if (widget.room.positions.length < 2) return false;

    return widget.room.positions[0].uid > 0 && widget.room.positions[1].uid > 0;
  }

  int get totalAccompany {
    if (!isAccompany) return 0;
    return _accompanyData?.value ?? 0;
  }

  /// 解锁文案
  String get getUnLockTips {
    if (isAccompany && _accompanyExtraData?.taskList != null) {
      if (accompanyFinish) {
        return '';
      } else {
        String remainTimeStr = '';

        /// 计算还有多久解锁下一颗星
        for (AccompanyTask task in _accompanyExtraData!.taskList) {
          if (task.value > _accompanyData!.duration) {
            int remainTime = task.value - _accompanyData!.duration;
            if (remainTime > 60) {
              remainTimeStr =
                  '${remainTime ~/ 60}${K.room_minute}${remainTime % 60}${K.room_second}';
            } else {
              remainTimeStr = '$remainTime${K.room_second}';
            }
            break;
          }
        }
        return K.room_accompany_task_tip([remainTimeStr]);
      }
    }
    return K.room_accompany_invite_friend_tips;
  }

  void _refresh([VoidCallback? callback]) {
    if (mounted) {
      setState(() {
        if (callback != null) callback();
      });
    }
  }

  Widget _buildUserPosition(RoomPosition? roomPosition, int index) {
    if (roomPosition == null) return const SizedBox();
    bool showInviteCall = (_accompanyExtraData?.callList != null &&
            _accompanyExtraData!.callList.isNotEmpty &&
            roomPosition.uid == 0) &&
        (micUser == 1 || (micUser == 0 && index == 1));
    return SizedBox(
      width: 77 * Util.ratio,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                width: 64,
                height: 64,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.white.withOpacity(0.2), width: 2),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: UserIcon(room: widget.room, position: roomPosition),
              ),
              if (showInviteCall)
                AccompanyInviteUser(
                    room: widget.room, userList: _accompanyExtraData!.callList),
            ],
          ),
          const SizedBox(height: 8),
          _buildName(roomPosition, showInviteCall),
        ],
      ),
    );
  }

  Widget _buildName(RoomPosition position, bool showInviteCall) {
    if (showInviteCall) {
      return Text(
        K.room_accompany_inviting,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 11, color: Colors.white),
      );
    }
    List<Color>? colors = position.colorfulName;
    if (colors == null || colors.isEmpty) {
      return Text(
        position.name,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11.0,
        ),
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      );
    }
    return ColorfulNickName(
      colors: colors,
      textBuild: (bool show, {Key? key, Paint? paint}) {
        return Text(
          position.name,
          key: key,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 11.0,
            foreground: paint,
          ),
        );
      },
    );
  }

  /// 通知、设置UI
  Widget _buildQuickSetting() {
    String leftTip = getUnLockTips;
    bool showTip = leftTip.isNotEmpty;
    return Padding(
      padding: EdgeInsetsDirectional.only(top: 20.dp, start: 12.dp, end: 6.dp),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (showTip)
            Padding(
              padding: EdgeInsetsDirectional.only(end: 4.dp),
              child: R.img(
                isAccompany
                    ? RoomAssets.chat_room$accompany_ic_lock_webp
                    : RoomAssets.chat_room$accompany_ic_trumpet_png,
                width: 16.dp,
                height: 16.dp,
                fit: BoxFit.fill,
                package: ComponentManager.MANAGER_BASE_ROOM,
              ),
            ),
          showTip
              ? Expanded(child: _buildSettingLeftTip(leftTip))
              : const Spacer(),
          if (widget.room.createor?.uid == Session.uid) ...[
            GestureDetector(
              onTap: () async {
                String? background = await displayModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return BackgroundSheet(
                        rid: widget.room.rid,
                      );
                    });
                if (background == null) return;
                await RoomRepository.opbgswitch(widget.room.rid, background);
              },
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 6.dp, end: 6.dp),
                child: R.img(
                  'accompany/ic_setting_background.webp',
                  width: 24.dp,
                  height: 24.dp,
                  fit: BoxFit.fill,
                  package: ComponentManager.MANAGER_BASE_ROOM,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _displayAutoMicSheet();
              },
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 6.dp, end: 6.dp),
                child: R.img(
                    _accompanyData!.roomAutoMic
                        ? 'accompany/ic_auto_mic_open.webp'
                        : 'accompany/ic_auto_mic_close.webp',
                    width: 24.dp,
                    height: 24.dp,
                    fit: BoxFit.fill,
                    package: ComponentManager.MANAGER_BASE_ROOM),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSettingLeftTip(String leftTip) {
    if (isAccompany) {
      return Text(
        leftTip,
        style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 11,
            fontWeight: FontWeight.bold),
      );
    }
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: <Color>[
            Colors.black,
            Colors.transparent,
            Colors.transparent,
            Colors.black,
          ],
          stops: [0.0, 0.1, 0.9, 1.0],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstOut,
      child: MarqueeText(
        text: leftTip,
        style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 11,
            fontWeight: FontWeight.bold),
        speed: 10,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_accompanyData == null) return const SizedBox();
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        if (_accompanyData!.foreground != null &&
            _accompanyData!.foreground!.isNotEmpty)
          CachedNetworkImage(
            key: ValueKey(_accompanyData!.foreground),
            width: 355 * Util.ratio,
            height: 300 * Util.ratio,
            imageUrl: _accompanyData!.foreground,
          ),
        CachedNetworkImage(
          key: ValueKey(accompanyFinish
              ? _accompanyData!.effect
              : _accompanyData!.decorate),
          width: 355 * Util.ratio,
          height: 300 * Util.ratio,
          imageUrl: accompanyFinish
              ? _accompanyData!.effect
              : _accompanyData!.decorate,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 69 * Util.ratio,
            ),
            Text(
              K.room_total_accompany(['$totalAccompany']),
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
            SizedBox(
              height: 7 * Util.ratio,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildUserPosition(widget.room.positions[0], 0),
                SizedBox(
                  width: 22 * Util.ratio,
                ),
                _buildUserPosition(widget.room.positions[1], 1),
              ],
            ),
            SizedBox(
              height: 70 * Util.ratio,
            ),
            isAccompany
                ? TimerWidget(
                    key: _timerGlobalKey,
                    onTick: () {
                      if (isAccompany) _accompanyData!.duration++;
                    },
                    stop: null,
                    builder: (context) {
                      return _buildAccompany();
                    },
                  )
                : _buildAccompany(),
            SizedBox(height: 16.dp),
          ],
        ),
      ],
    );
  }

  Widget _buildAccompany() {
    int maxAccompanySeconds = _accompanyData!.totalTime;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildQuickSetting(),
        if (_accompanyExtraData?.taskList != null &&
            _accompanyExtraData!.taskList.isNotEmpty)
          AccompanyProgressIndicator(
            value: max(
                min(_accompanyData!.duration / maxAccompanySeconds * 1.0, 1.0),
                0.05),
            duration: _accompanyData!.duration,
            totalTime: maxAccompanySeconds,
            taskList: _accompanyExtraData!.taskList,
          ),
      ],
    );
  }

  /// 进房是否自动上麦弹窗
  _displayAutoMicSheet() async {
    if (!mounted) return;

    List<SheetItem> res = [];
    if (_accompanyData!.roomAutoMic) {
      res.insert(0, SheetItem(K.room_in_not_auto_mic, "no"));
    } else {
      res.insert(0, SheetItem(K.room_in_auto_mic, "yes"));
    }
    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(title: K.room_in_auto_mic_select, data: res);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }
    int value = _accompanyData!.roomAutoMic ? 0 : 1;
    bool success = await AccompanyRepository.setAutoMic(widget.room.rid, value);
    if (success) {
      _refresh(() {
        _accompanyData!.roomAutoMic = !_accompanyData!.roomAutoMic;
      });
    }
  }
}

class AccompanyProgressIndicator extends StatelessWidget {
  final double value;
  final int duration;
  final int totalTime;
  final List<AccompanyTask> taskList;

  const AccompanyProgressIndicator(
      {super.key,
      required this.value,
      required this.duration,
      required this.totalTime,
      required this.taskList});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.dp,
      height: 52.dp,
      margin: EdgeInsetsDirectional.only(top: 8.dp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.dp),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.dp),
        gradient: const LinearGradient(
            colors: [Color(0x0014052B), Color(0xFF300071)]),
        boxShadow: [
          BoxShadow(
              color: Colors.white.withOpacity(0.08),
              offset: Offset(0, 2.dp),
              blurRadius: 12.dp),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          SizedBox(width: 350.dp, height: 52.dp),
          Container(
            width: 350.dp,
            height: 52.dp,
            padding: EdgeInsetsDirectional.only(start: 1.dp, end: 1.dp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.dp),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      double padding = (index <= 1 || index >= 12) ? 1.dp : 0;
                      return Container(
                        width: 350.dp - padding * 2,
                        height: 0.5.dp,
                        margin: EdgeInsetsDirectional.only(
                            top: 1.5.dp,
                            bottom: 1.5.dp,
                            start: padding,
                            end: padding),
                        color: Colors.white.withOpacity(0.05),
                      );
                    },
                    itemCount: 14,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 350.dp,
            height: 52.dp,
            padding: EdgeInsetsDirectional.only(top: 12.dp),
            alignment: AlignmentDirectional.topCenter,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 12.dp,
                ),
                SizedBox(
                  width: 35.dp,
                  child: Text(
                    _getFormattedDuration(duration),
                    style: TextStyle(
                        fontSize: 11,
                        color: Colors.white.withOpacity(0.6),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    double maxWidth = constraints.maxWidth;
                    double timeBarWidth = maxWidth - 12.dp;
                    double timeBarHeight = 4.dp;
                    return SizedBox(
                      width: maxWidth,
                      height: timeBarHeight,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: timeBarWidth,
                            height: timeBarHeight,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(2.dp),
                            ),
                          ),
                          Container(
                            width: timeBarWidth * (value.isNaN ? 0.0 : value),
                            height: timeBarHeight,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [Color(0xFFff5DED), Colors.white]),
                              borderRadius: BorderRadius.circular(2.dp),
                            ),
                          ),
                          PositionedDirectional(
                              top: -12.dp,
                              start: 0,
                              width: maxWidth,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: _renderTask(),
                              )),
                        ],
                      ),
                    );
                  }),
                ),
                SizedBox(
                  width: 5.dp,
                ),
                Text(
                  _getFormattedDuration(totalTime),
                  style: TextStyle(
                      fontSize: 11,
                      color: Colors.white.withOpacity(0.6),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 12.dp,
                ),
              ],
            ),
          ),
          PositionedDirectional(
            start: 124.dp,
            end: 33.dp,
            top: -0.5.dp,
            child: Container(
              width: 193.dp,
              height: 1.dp,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.white.withOpacity(0),
                  Colors.white,
                  Colors.white.withOpacity(0)
                ]),
              ),
            ),
          ),
          PositionedDirectional(
            start: 19.dp,
            end: 138.dp,
            bottom: -0.5.dp,
            child: Container(
              width: 193.dp,
              height: 1.dp,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.white.withOpacity(0),
                  Colors.white,
                  Colors.white.withOpacity(0)
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _renderTask() {
    return [
      SizedBox(width: 24.dp, height: 24.dp),
      if (taskList.length >= 2)
        ...taskList
            .sublist(0, taskList.length - 1)
            .map((e) => _renderHeart(e))
            .toList(),
      _renderBox(taskList[taskList.length - 1]),
    ];
  }

  Widget _renderHeart(AccompanyTask task) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CachedNetworkImage(
          imageUrl: task.icon,
          width: 24.dp,
          height: 24.dp,
          fit: BoxFit.fill,
        ),
        SizedBox(height: 1.dp),
        Text(task.title ?? '',
            style: TextStyle(
                color: Colors.white60,
                fontWeight: FontWeight.w500,
                fontSize: 9.dp)),
      ],
    );
  }

  Widget _renderBox(AccompanyTask task) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CachedNetworkImage(
          imageUrl: task.icon,
          width: 24.dp,
          height: 24.dp,
          fit: BoxFit.fill,
        ),
        SizedBox(height: 1.dp),
        GradientText(task.title,
            gradient: const LinearGradient(
                colors: [Color(0xffF4FF48), Color(0xFFFF9F00)]),
            style: TextStyle(
                color: Colors.white60,
                fontWeight: FontWeight.w500,
                fontSize: 9.dp)),
      ],
    );
  }

  String _twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  String _getFormattedDuration(int duration) {
    int minutes = duration ~/ 60;
    int seconds = duration % 60;

    return '${_twoDigits(minutes)}:${_twoDigits(seconds)}';
  }
}

class AccompanyInviteUser extends StatefulWidget {
  final ChatRoomData room;
  final List<UserBean> userList;

  const AccompanyInviteUser(
      {super.key, required this.room, required this.userList});

  @override
  _AccompanyInviteUserState createState() => _AccompanyInviteUserState();
}

class _AccompanyInviteUserState extends State<AccompanyInviteUser>
    with SingleTickerProviderStateMixin {
  int _index = 0;
  late Timer _timer;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        duration: const Duration(seconds: 300), vsync: this);

    _animation = Tween<double>(
      begin: 1,
      end: 300,
    ).animate(_animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // 动画完成后反转
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          // 反转回初始状态时继续播放，实现无限循环
          _animationController.forward();
        }
      });

    _animationController.forward();

    _timer = Timer.periodic(const Duration(milliseconds: 2000), (timer) {
      ++_index;
      if (_index >= widget.userList.length) {
        _index = 0;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AccompanyInviteUser oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.userList.isEmpty) {
      _animationController.stop();
    } else {
      if (widget.userList.isEmpty) {
        _animationController.forward();
      }
    }
  }

  String _getCurrentIcon() {
    if (_index >= widget.userList.length) {
      _index = 0;
    }
    return widget.userList[_index].iconUrl ?? '';
  }

  @override
  Widget build(BuildContext context) {
    if (widget.userList.isEmpty) {
      _timer.cancel();
      return const SizedBox.shrink();
    }
    Widget child = Container(
      width: 60,
      height: 60,
      alignment: AlignmentDirectional.center,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          IgnorePointer(
              child: CommonAvatar(
                  path: _getCurrentIcon(), size: 60, shape: BoxShape.circle)),
          Positioned.fill(
            child: IgnorePointer(
              child: Container(
                width: 60.dp,
                height: 60.dp,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(30.dp),
                ),
              ),
            ),
          ),
          IgnorePointer(
            child: Center(
              child: RotationTransition(
                  alignment: Alignment.center,
                  turns: _animation,
                  child: R.img(RoomAssets.chat_room$accompany_ic_loading_webp,
                      width: 24.dp, height: 24.dp)),
            ),
          ),

          /// 在麦位上用户屏蔽空麦位的点击事件
          if (ChatRoomUtil.isUidOnPosition(Session.uid))
            const AbsorbPointer(
              child: SizedBox(width: 60, height: 60),
            ),

          /// 麦上用户或房主能取消邀请
          if (ChatRoomUtil.isUidOnPosition(Session.uid) ||
              widget.room.createor?.uid == Session.uid)
            PositionedDirectional(
              top: 0,
              end: -4,
              child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () async {
                    bool result =
                        await AccompanyRepository.cancelInvite(widget.room.rid);
                    if (result) {
                      Fluttertoast.showToast(msg: K.room_has_cancel_invite);
                    }
                  },
                  child: R.img(
                      RoomAssets.chat_room$accompany_ic_cancel_invite_webp,
                      width: 20,
                      height: 20)),
            ),
        ],
      ),
    );
    return child;
  }
}

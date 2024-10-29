import 'dart:async';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/ktv/model/ktv_pk_rank.dart';
import 'package:flutter/material.dart';

import 'ktv_pk_rank_swap_list.dart';
import 'ktv_pk_rank_user_info.dart';

class KtvPkRankAnimWidget extends StatefulWidget {
  final ChatRoomData room;

  const KtvPkRankAnimWidget({Key? key, required this.room}) : super(key: key);

  @override
  State<KtvPkRankAnimWidget> createState() => _KtvPkRankAnimWidgetState();
}

class _KtvPkRankAnimWidgetState extends State<KtvPkRankAnimWidget>
    with TickerProviderStateMixin {
  Timer? _timer;

  GlobalKey<SwapReorderListState> _swapKey = GlobalKey();

  List<KtvPkRankEventItem>? _list;

  AnimationController? _opacityController;

  Animation<double>? _opacityAnim;

  String _animImg = '';

  static const LOG_TAG = '_KtvPkRankAnimWidgetState';

  @override
  void initState() {
    super.initState();
    widget.room
        .addListener(RoomConstant.Event_Ktv_Pk_Rank_Change, _onKtvRankChanged);
  }

  void _initAnimation() {
    _opacityController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    _opacityAnim = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: _opacityController!, curve: Curves.linear))
      ..addListener(() {
        if (mounted) {
          Log.d(
              tag: LOG_TAG,
              '_opacityController, data = ${_opacityAnim!.value}');
          setState(() {});
        }
      })
      ..addStatusListener((status) {
        Log.d(tag: LOG_TAG, "_opacityAnim status = $status");
        if (status == AnimationStatus.completed && mounted) {
          _pop();
        }
      });
  }

  void _onKtvRankChanged(String type, Object? data) async {
    Log.d(tag: LOG_TAG, '_onKtvRankChanged, data = $data');
    if (_list == null && data != null && data is Map<String, dynamic>) {
      Map<String, dynamic> content = data;
      KtvPkRankEventData eventData = KtvPkRankEventData.fromJson(content);

      Log.d(tag: LOG_TAG, '_onKtvRankChanged, data = 111');
      if (eventData.list.length != 2) {
        return;
      }

      Log.d(tag: LOG_TAG, '_onKtvRankChanged, data = 222');

      /// rank排序, rank小的在前面，即排名高的前面
      eventData.list.sort((o1, o2) => o1.rank - o2.rank);

      /// 为当前演唱者的uid
      if (eventData.list[0].uid !=
          widget.room.config?.ktvInfo?.currentSong?.uid) {
        return;
      }

      Log.d(tag: LOG_TAG, '_onKtvRankChanged, data = 333');

      _reset();

      _list = eventData.list;
      _animImg = eventData.animImg;
      setState(() {});
      _scheduleTask();
    }
  }

  void _reset() {
    _swapKey = GlobalKey();
    _initAnimation();
  }

  void _scheduleTask() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(const Duration(seconds: 5), _pop);
  }

  @override
  void dispose() {
    widget.room.removeListener(
        RoomConstant.Event_Ktv_Pk_Rank_Change, _onKtvRankChanged);
    _timer?.cancel();
    _opacityController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_list == null || _list!.length != 2 || _opacityAnim == null) {
      return const SizedBox.shrink();
    }

    return Container(
      color: Colors.black54,
      padding: const EdgeInsetsDirectional.only(top: 156),
      child: FadeTransition(
        opacity: _opacityAnim!,
        child: Stack(
          children: [
            MultiframeImage.network(
              Util.getRemoteImgUrl(_animImg),
              'room',
              width: Util.width,
              height: Util.width,
            ),
            PositionedDirectional(
              top: 220,
              child: SizedBox(
                width: Util.width,
                height: 68 * 3.0,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 24, end: 24),
                  child: SwapReorderList(
                    key: _swapKey,
                    duration: const Duration(milliseconds: 650),
                    children: [
                      _buildUseInfo(_list![1], false),
                      _buildUseInfo(_list![0], true)
                    ],
                    swapCallback: () {
                      if (mounted) {
                        _swapKey.currentState?.swap(0, 1);
                      }
                    },
                    dismissCallBack: () {
                      if (mounted) _startOpacityAnim();
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildUseInfo(KtvPkRankEventItem item, bool first) {
    return KtvPKRankUserInfoWidget(data: item, first: first);
  }

  void _startOpacityAnim() {
    if (!(_opacityController?.isAnimating ?? false)) {
      _opacityController?.forward();
    }
  }

  void _pop() {
    if (!mounted) return;
    _list = null;
    setState(() {});
  }
}

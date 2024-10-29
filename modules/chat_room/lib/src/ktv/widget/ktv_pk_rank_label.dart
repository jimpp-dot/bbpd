import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/ktv/model/ktv_pk_rank.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:async';

/// pk模式下，PK榜入口，如果不是自己的排名提升，会显示动画效果
///
class KtvPkRankLabel extends StatefulWidget {
  final ChatRoomData room;

  const KtvPkRankLabel({Key? key, required this.room}) : super(key: key);

  @override
  State<KtvPkRankLabel> createState() => _KtvPkRankLabelState();
}

class _KtvPkRankLabelState extends State<KtvPkRankLabel> {
  static const LOG_TAG = '_KtvPkRankLabelState';

  final SwiperController _controller = SwiperController();

  static const RANK_LABEL = -1001;

  Timer? _timer;

  final List<KtvPkRankEventItem> _list = [KtvPkRankEventItem.rank(RANK_LABEL)];

  @override
  void initState() {
    super.initState();
    widget.room
        .addListener(RoomConstant.Event_Ktv_Pk_Rank_Change, _onKtvRankChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
    widget.room.removeListener(
        RoomConstant.Event_Ktv_Pk_Rank_Change, _onKtvRankChanged);
    super.dispose();
  }

  void _onKtvRankChanged(String type, Object? data) async {
    if (data != null && data is Map<String, dynamic>) {
      Map<String, dynamic> content = data;
      KtvPkRankEventData eventData = KtvPkRankEventData.fromJson(content);

      if (eventData.list.length != 2) {
        return;
      }

      /// rank排序, rank小的在前面，即排名高的前面
      eventData.list.sort((o1, o2) {
        return o1.rank - o2.rank;
      });

      /// 排名高的如果是当前演唱者，这里不用做任何处理，因为在KtvPkRankAnimWidget会显示动画效果
      if (eventData.list[0].uid ==
          widget.room.config?.ktvInfo?.currentSong?.uid) {
        return;
      }

      _list.add(eventData.list[0]);
      setState(() {});
      if (_list.length == 2) {
        await _controller.next(animation: true);
        _scheduleTask();
      }
    }
  }

  void _pop() async {
    if (!mounted) return;
    await _controller.next(animation: true);
    if (_list.length > 1) {
      _list.removeLast();
      setState(() {});
    }

    Log.d(tag: LOG_TAG, 'length = ${_list.length}');

    if (_list.length > 1) {
      _scheduleTask();
    }
  }

  void _scheduleTask() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(const Duration(seconds: 3), _pop);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      width: 103,
      child: Swiper(
        itemCount: _list.length,
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
          return _buildItemLabel(_list[index]);
        },
      ),
    );
  }

  Widget _buildItemLabel(KtvPkRankEventItem eventData) {
    if (eventData.rank == RANK_LABEL) {
      return _buildPkRankLabel();
    } else {
      return _buildRankInfo(eventData);
    }
  }

  Widget _buildRankInfo(KtvPkRankEventItem eventData) {
    return Container(
      height: 28,
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: Colors.black.withOpacity(0.3),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonAvatar(
            path: eventData.icon,
            size: 24,
            shape: BoxShape.circle,
          ),
          const SizedBox(width: 4),
          Text(
            K.room_ktv_rank_upgrade(['${eventData.rank}']),
            style: const TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }

  Widget _buildPkRankLabel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 62,
          height: 28,
          decoration: ShapeDecoration(
            shape: const StadiumBorder(),
            color: Colors.black.withOpacity(0.3),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                R.img('ktv/ktv_ic_pk_mode_rank.png',
                    width: 18,
                    height: 18,
                    package: ComponentManager.MANAGER_BASE_ROOM),
                const SizedBox(width: 2),
                Text(
                  K.room_pk_rank,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

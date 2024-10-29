import 'dart:async';

import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import '../gpk_constants.dart';

/// 分组PK顶部状态显示控件，目前有
/// 1.pk进行中
/// 2.惩罚进行中
class GPKStatusWidget extends StatefulWidget {
  final GPKState? state;
  final int remainingTime;
  final VoidCallback? onTapCallback;

  const GPKStatusWidget(
      {super.key, this.state, required this.remainingTime, this.onTapCallback});

  @override
  _GPKStatusWidgetState createState() => _GPKStatusWidgetState();
}

class _GPKStatusWidgetState extends State<GPKStatusWidget> {
  Timer? _timer;

  int _currentRemainingSecond = 0;

  @override
  void initState() {
    super.initState();
    if (_needTimer()) {
      _currentRemainingSecond = widget.remainingTime;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _currentRemainingSecond--;
        if (_currentRemainingSecond < 0) {
          _currentRemainingSecond = 0;
        }
        if (_needTimer()) {
          _refresh();
        }
      });
    }
  }

  @override
  void didUpdateWidget(GPKStatusWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.remainingTime != oldWidget.remainingTime ||
        widget.state != oldWidget.state) {
      if (_needTimer()) {
        _currentRemainingSecond = widget.remainingTime;
      } else {
        _currentRemainingSecond = 0;
      }
    }
  }

  _refresh() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state != GPKState.pk_ing && widget.state != GPKState.punish_ing)
      return const SizedBox.shrink();
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        widget.onTapCallback?.call();
      },
      child: Container(
        child: widget.state == GPKState.pk_ing ? _buildPK() : _buildPunish(),
      ),
    );
  }

  Widget _buildPK() {
    return Container(
      width: 240.dp / 3.4,
      height: 162.dp / 3.4,
      alignment: Alignment.center,
      padding: EdgeInsetsDirectional.only(top: 6.dp),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(RoomAssets.chat_room$gpk_main_pk_status_bg_webp),
          fit: BoxFit.contain,
        ),
      ),
      child: _buildCountdown().paddingOnly(top: 4),
    );
  }

  Widget _buildPunish() {
    return Container(
      width: 128.dp,
      height: 50.dp,
      alignment: Alignment.center,
      padding: EdgeInsetsDirectional.only(top: 6.dp),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image:
              AssetImage(RoomAssets.chat_room$gpk_main_punish_status_bg_webp),
          fit: BoxFit.contain,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildStatus(),
          _buildCountdown(),
        ],
      ),
    );
  }

  Widget _buildStatus() {
    if (widget.state == GPKState.punish_ing) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(end: 8),
        child: Text(
          K.room_gpk_punish,
          style: const TextStyle(
            color: Color(0xFFEFE1FF),
            fontWeight: FontWeight.w600,
            fontSize: 12,
            height: 1,
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildCountdown() {
    if (_currentRemainingSecond < 0) {
      return const SizedBox.shrink();
    }

    var minute = Duration(seconds: _currentRemainingSecond).inMinutes;
    var second = _currentRemainingSecond - minute * Duration.secondsPerMinute;

    return Text(
      '${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}',
      style: const TextStyle(
        color: Color(0xFFEFE1FF),
        fontWeight: FontWeight.w600,
        fontSize: 12,
        height: 1,
      ),
    );
  }

  bool _needTimer() {
    return widget.state == GPKState.pk_ing ||
        widget.state == GPKState.punish_ing;
  }
}

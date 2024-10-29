import 'dart:async';

import 'package:shared/shared.dart';
import 'package:chat_room/src/ktv/model/ktv_pk_rank.dart';
import 'package:chat_room/src/ktv/utils/time_util.dart';
import 'package:flutter/material.dart';

class KtvPKRankUserInfoWidget extends StatefulWidget {
  final KtvPkRankEventItem data;
  final bool first;

  const KtvPKRankUserInfoWidget(
      {Key? key, required this.data, this.first = false})
      : super(key: key);

  @override
  _KtvPKRankUserInfoWidgetState createState() =>
      _KtvPKRankUserInfoWidgetState();
}

class _KtvPKRankUserInfoWidgetState extends State<KtvPKRankUserInfoWidget>
    with TickerProviderStateMixin {
  Timer? _timer;

  //颜色渐变动画
  late AnimationController _colorController;
  late Animation<Color?> _colorAni;

  @override
  void initState() {
    super.initState();
    _initAnim();
    _timer = Timer(const Duration(milliseconds: 300), _changeColor);
  }

  void _initAnim() {
    _colorController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 650));
    _colorAni = ColorTween(begin: Colors.white, end: const Color(0xFFFFB703))
        .animate(_colorController)
      ..addListener(() {
        refresh();
      });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _colorController.dispose();
    super.dispose();
  }

  void _changeColor() {
    if (mounted) {
      _colorController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildUseInfo(widget.data);
  }

  Widget _buildUseInfo(KtvPkRankEventItem item) {
    String img = widget.first
        ? 'ktv/ktv_pk_rank_first_light.webp'
        : 'ktv/ktv_pk_rank_second_bg.png';
    BoxDecoration decoration = BoxDecoration(
        image: DecorationImage(
      image: AssetImage(
          R.imagePath(img, package: ComponentManager.MANAGER_BASE_ROOM)),
      fit: BoxFit.fill,
    ));

    return Container(
      width: Util.width - 48,
      height: 68,
      decoration: decoration,
      padding: const EdgeInsetsDirectional.only(start: 24, end: 24),
      margin: const EdgeInsetsDirectional.only(top: 4, bottom: 4),
      child: Row(
        children: [
          Text(
            '${item.rank}',
            style: TextStyle(
              color: widget.first
                  ? _colorAni.value
                  : Colors.white.withOpacity(0.8),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            width: 16,
            height: 68,
          ),
          Stack(
            children: [
              if (widget.first)
                HierarchicalRipple(
                  beginRadius: 24,
                  endRadius: 34,
                  beginColor: const Color(0xFFFFB703),
                  endColor: const Color(0xFFFFB703).withOpacity(0.0),
                  autoStart: true,
                  duration: const Duration(milliseconds: 800),
                  onlyBorder: true,
                  layers: 2,
                  borderWidth: 2,
                ),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    shape: BoxShape.circle),
                child: CommonAvatar(
                  path: item.icon,
                  size: 46,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              item.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: widget.first ? _colorAni.value : Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 8),
          R.img('ktv/ktv_ic_pk_mode_rank.png',
              width: 16,
              height: 16,
              package: ComponentManager.MANAGER_BASE_ROOM),
          Text(
            KtvTimeUtil.getMusicNum(item.score),
            style: const TextStyle(
                color: Color(0xFFFFD718),
                fontSize: 13,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

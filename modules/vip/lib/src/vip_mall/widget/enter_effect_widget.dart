import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/src/vip_mall/model/commodity_base.dart';

import '../../../k.dart';

/// 入场特效
///
class EnterEffectWidget extends StatefulWidget {
  final String image;
  final Map<String, dynamic> extra;
  final int? liveOnly;
  final String? liveLabel; //粉丝牌名

  const EnterEffectWidget(
      {super.key,
      required this.image,
      required this.extra,
      this.liveOnly,
      this.liveLabel});

  @override
  _EnterEffectWidgetState createState() => _EnterEffectWidgetState();
}

class _EnterEffectWidgetState extends State<EnterEffectWidget>
    with TickerProviderStateMixin {
  final GlobalKey _key = GlobalKey();
  ValueAnimation? _translateX;
  Sequence? _sequence;
  final bool _toLeft = true;

  AnimationController? controller;
  Animation<Offset>? animation;
  late EffectCommodity item;

  @override
  void initState() {
    super.initState();

    item = EffectCommodity.fromJson(widget.extra);

    WidgetsBinding.instance.addPostFrameCallback(_onLayout);
  }

  @override
  void dispose() {
    if (_sequence != null) {
      _sequence?.stop();
      _sequence = null;
    }
    controller?.dispose();
    super.dispose();
  }

  _onComplete() {
    _sequence = null;
  }

  _onLayout(Duration? timeStamp) {
    if (_key.currentContext == null || !mounted) {
      return;
    }
    RenderBox box = _key.currentContext?.findRenderObject() as RenderBox;
    double end = 0.0;
    if (_toLeft) {
      end = -(Util.width - box.size.width) / 2;
    }
    if (!mounted) return;
    setState(() {
      _translateX = Animated.value(box.size.width);
    });

    startAni(end, true);
  }

  void startAni(double end, bool needTranslateX) {
    WidgetsBinding.instance.addPostFrameCallback((Duration duration) {
      if (!mounted || _translateX == null) return;

      _sequence = Animated.sequence([
        if (needTranslateX)
          Animated.spring(_translateX!, toValue: end, speed: 2, bounciness: 0,
              onUpdate: (bool end) {
            // if (end == true) {
            // }
          }),
        Animated.delay(const Duration(milliseconds: 2500)),
        Animated.spring(_translateX!,
            toValue: -Util.width,
            speed: 1,
            bounciness: 0,
            overshootClamping: true),
        Animated.delay(const Duration(milliseconds: 500)),
      ], (bool complete) {
        if (!mounted) return;
        if (complete) {
          _onComplete();
          _onLayout(null);
        } else {
          setState(() {});
        }
      }).start();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(
          _translateX == null ? Util.width : _translateX!.value, 0.0, 0.0),
      alignment: AlignmentDirectional.centerEnd,
      child: SizedBox(
          key: _key,
          height: 60,
          width: 300,
          child: Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              IgnorePointer(
                child: SizedBox(
                  height: 60,
                  width: 300,
                  child: MultiframeImage.network(widget.image, 'effect',
                      loop: true),
                ),
              ),
              _buildContent(),
              if (widget.liveOnly != null &&
                  widget.liveOnly == 1 &&
                  widget.liveLabel != null &&
                  widget.liveLabel!.isNotEmpty)
                UserLiveLabelWidget(widget.liveLabel, UserLiveLabelType.effect,
                    bgHeight: 60),
            ],
          )),
    );
  }

  Widget _buildContent() {
    List<Widget> res = [];

    // 显示爵位
    res.add(NobilityCornerMarker(
      titleNew: item.userTitleNew,
    ));

    // VIP、萌新、人气等级只显示一个，优先级：VIP > 萌新 > 人气等级
    if (item.vipLevel > 0) {
      res.add(UserVipWidget(vip: item.vipLevel, height: 26));
    } else if (item.popularityLevel > 0) {
      // 人气等级
      res.add(
          UserPopularity(popularityLevel: item.popularityLevel, height: 26));
    }

    res.add(const SizedBox(width: 2));

    Color fontColor = item.getTextColor(); // 字体颜色
    Color fontShadeColor = Colors.black.withOpacity(0.2); // 字体投影颜色

    res.add(
      Flexible(
        child: Text(
          item.userName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: fontColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            shadows: [
              Shadow(
                  color: fontShadeColor,
                  offset: const Offset(0, 0.5),
                  blurRadius: 0.5)
            ],
          ),
        ),
      ),
    );

    res.add(const SizedBox(width: 12));

    res.add(
      Text(
        K.vip_enter_effect_come,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: fontColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          shadows: [
            Shadow(
                color: fontShadeColor,
                offset: const Offset(0, 0.5),
                blurRadius: 0.5)
          ],
        ),
      ),
    );

    res.add(const SizedBox(width: 40));

    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 56.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: res,
      ),
    );
  }
}

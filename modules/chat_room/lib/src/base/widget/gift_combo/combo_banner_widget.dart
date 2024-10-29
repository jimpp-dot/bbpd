import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/talent/talent_constants.dart';

import 'model/combo_banner_model.dart';

const double kNameplateHeight = 22;

class ComboBannerWidget extends StatefulWidget {
  final ComboBanner data;
  final ValueChanged<ComboBanner> onComplete;

  const ComboBannerWidget({
    super.key,
    required this.data,
    required this.onComplete,
  });

  @override
  _ComboBannerWidgetState createState() => _ComboBannerWidgetState();
}

class _ComboBannerWidgetState extends State<ComboBannerWidget> {
  late int _hitNum;
  Widget? _body;
  Sequence? _sequence;
  bool _translateXEnd = false;
  ValueAnimation? _translateX;
  ValueAnimation _opacity = Animated.value(1.0);
  late int _duration;

  final GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    _hitNum = widget.data.hitNum;
    _duration = 3000;

    WidgetsBinding.instance.addPostFrameCallback(_onLayout);
  }

  _onLayout(Duration timeStamp) {
    if (_key.currentContext == null || !mounted) {
      return;
    }
    RenderBox box = _key.currentContext!.findRenderObject() as RenderBox;
    double end = 0.0;
    end = -(Util.width - box.size.width) + 18.0;

    if (!mounted) return;
    setState(() {
      _translateX = Animated.value(box.size.width);
    });

    startAni(end, true);
  }

  @override
  Widget build(BuildContext context) {
    if (_hitNum != widget.data.hitNum) {
      // 礼物发生连击
      _hitNum = widget.data.hitNum;
      _body = null;
      if (_sequence != null && _translateXEnd == true) {
        // 当前还在做动画，切水平移动动画已完成，重新倒计时3s
        _sequence!.stop();
        _sequence = null;
        startAni(0, false);
      }
    }
    return _renderComboGift();
  }

  void startAni(double end, bool needTranslateX) {
    _opacity = Animated.value(1.0);
    WidgetsBinding.instance.addPostFrameCallback((Duration duration) {
      if (!mounted || _translateX == null) return;
      _sequence = Animated.sequence([
        if (needTranslateX)
          Animated.spring(_translateX!,
              toValue: end, speed: 1.0, bounciness: 3.0, onUpdate: (bool end) {
            if (end == true) {
              _translateXEnd = true;
            }
          }),
        Animated.delay(Duration(milliseconds: _duration)),
        Animated.spring(_opacity,
            toValue: 0.0, speed: 1.0, bounciness: 1.0, overshootClamping: true),
      ], (bool complete) {
        if (!mounted) return;
        if (complete) {
          _onComplete();
        } else {
          setState(() {});
        }
      }).start();
    });
  }

  _onComplete() {
    Log.d(tag: TAG, "combo banner _onComplete->${widget.data.name} toClose");
    _sequence = null;
    widget.onComplete(widget.data);
  }

  @override
  void dispose() {
    if (_sequence != null) {
      _sequence!.stop();
      _sequence = null;
    }
    super.dispose();
  }

  Widget _renderComboGift() {
    _body ??= _renderComboGiftWidget();
    return Opacity(
      opacity: _opacity == null ? 1.0 : _opacity.value,
      child: Container(
        transform: Matrix4.translationValues(
            _translateX == null ? Util.width : _translateX!.value, 0.0, 0.0),
        alignment: AlignmentDirectional.centerEnd,
        margin: const EdgeInsetsDirectional.only(
          bottom: 6.0,
        ),
        child: _body,
      ),
    );
  }

  Widget _renderComboGiftWidget() {
    String giftIcon = Util.getRemoteImgUrl(widget.data.giftIcon);
    return Row(
      key: _key,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Stack(
          alignment: AlignmentDirectional.centerEnd,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 44,
                  constraints: const BoxConstraints(
                    minWidth: 160,
                    maxWidth: 221,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      centerSlice: const Rect.fromLTWH(100, 0, 1, 44),
                      image: AssetImage(
                        R.imagePath('combo_gift_banner_bg_left.webp',
                            package: ComponentManager.MANAGER_BASE_ROOM),
                      ),
                      // fit: BoxFit.fill,
                    ),
                  ),
                  padding: const EdgeInsetsDirectional.only(
                    start: 4,
                    end: 46,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CommonAvatar(
                        path: widget.data.icon,
                        size: 36,
                        shape: BoxShape.circle,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              UserVipWidget(
                                  vip: widget.data.vipLevel,
                                  height: kNameplateHeight),
                              const SizedBox(
                                width: 4,
                              ),
                              Container(
                                constraints: const BoxConstraints(
                                  maxWidth: 99,
                                ),
                                child: Text(
                                  widget.data.name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            constraints: const BoxConstraints(
                              maxWidth: 131,
                            ),
                            child: Text(
                              widget.data.message,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.white60,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                R.img(
                  'combo_gift_banner_bg_right.webp',
                  width: 24,
                  height: 44,
                  package: ComponentManager.MANAGER_BASE_ROOM,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 8),
              child: CachedNetworkImage(
                placeholder: const CupertinoActivityIndicator(),
                imageUrl: giftIcon,
                width: 56,
                height: 56,
                fit: BoxFit.contain,
                fadeInDuration: const Duration(microseconds: 0),
                fadeOutDuration: const Duration(microseconds: 0),
              ),
            ),
          ],
        ),
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              colors: <Color>[Color(0xFFFFF3AA), Color(0xFFF2A04D)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.mirror,
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcATop,
          child: SizedBox(
            width: 75,
            child: RichText(
              maxLines: 1,
              text: TextSpan(
                text: 'x',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  fontFamily: Util.fontFamily,
                  shadows: const <Shadow>[
                    Shadow(
                        offset: Offset(0.0, 0.0),
                        blurRadius: 1.0,
                        color: Color(0xFF974200))
                  ],
                ),
                children: <TextSpan>[
                  const TextSpan(
                    text: ' ',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: '${widget.data.hitNum}',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                      shadows: <Shadow>[
                        Shadow(
                            offset: Offset(0.0, 0.0),
                            blurRadius: 1.0,
                            color: Color(0xFF974200))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

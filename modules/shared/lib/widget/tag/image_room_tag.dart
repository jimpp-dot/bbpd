import 'dart:io';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../k.dart';

/// 在房间的带动画条
class ImageRoomTag extends StatefulWidget {
  final double? height;
  final double iconSize;
  final TextStyle textStyle;
  final BorderRadiusGeometry borderRadius;
  final int roomId;
  final String? roomName;
  final String? roomIcon;
  final String? subTitle;
  final TextStyle? subTextStyle;
  final GestureTapCallback? onTap;
  final Widget? navigatorIcon;
  final EdgeInsetsDirectional iconPadding;
  final List<BoxShadow>? boxShadow;

  /// 踩房对象的uid
  final int uid;
  final String? refer;

  const ImageRoomTag({
    super.key,
    this.height,
    this.iconSize = 40,
    this.textStyle = const TextStyle(
        color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.refer,
    this.onTap,
    required this.roomId,
    this.roomName,
    this.roomIcon,
    this.subTitle,
    this.subTextStyle,
    this.navigatorIcon,
    this.iconPadding = const EdgeInsetsDirectional.only(start: 8, end: 10),
    this.boxShadow,
    required this.uid,
  });

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<ImageRoomTag>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late AnimationController aniController;
  late Animation<double> scaleAni;
  late Animation<double> opacityAni;
  late Animation<double> scale2Ani;
  late Animation<double> opacity2Ani;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    aniController = AnimationController(
        duration: const Duration(milliseconds: 3300), vsync: this);

    scaleAni = Tween(begin: 1.0, end: 5.0).animate(
      CurvedAnimation(
          parent: aniController,
          curve: const Interval(0.0, 1500 / 3300, curve: Curves.linear)),
    );
    opacityAni = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
          parent: aniController,
          curve: const Interval(0.0, 1500 / 3300, curve: Curves.linear)),
    );

    scale2Ani = Tween(begin: 1.0, end: 5.0).animate(
      CurvedAnimation(
          parent: aniController,
          curve: const Interval(800 / 3300, 2300 / 3300, curve: Curves.linear)),
    );
    opacity2Ani = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
          parent: aniController,
          curve: const Interval(800 / 3300, 2300 / 3300, curve: Curves.linear)),
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      aniController.repeat();
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (Util.appState != state) {
      if (state == AppLifecycleState.resumed) {
        if (!aniController.isAnimating) aniController.forward();
      } else if (Util.appState == AppLifecycleState.resumed) {
        if ((Platform.isIOS && state == AppLifecycleState.inactive) ||
            (Platform.isAndroid && state == AppLifecycleState.paused)) {
          aniController.stop();
        }
      }
    }
  }

  @override
  void dispose() {
    aniController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    InlineSpan span = TextSpan(
        text: widget.roomName ?? K.base_in_room, style: widget.textStyle);
    final tp =
        TextPainter(text: span, maxLines: 1, textDirection: TextDirection.ltr);
    tp.layout(maxWidth: Util.width);
    return Stack(
      children: <Widget>[
        /// 为了加阴影，clipBehavior: Clip.antiAlias模式阴影不生效
        if (widget.boxShadow != null && widget.boxShadow!.isNotEmpty)
          Container(
              height: widget.height,
              decoration: BoxDecoration(
                  boxShadow: widget.boxShadow,
                  borderRadius: widget.borderRadius)),
        GestureDetector(
          onTap: widget.onTap ??
              () {
                if (!Session.isLogined) {
                  ILoginManager loginManager = ComponentManager.instance
                      .getManager(ComponentManager.MANAGER_LOGIN);
                  loginManager.show(context);
                  return;
                }
                if (widget.roomId > 0) {
                  IRoomManager roomManager = ComponentManager.instance
                      .getManager(ComponentManager.MANAGER_BASE_ROOM);
                  roomManager.openChatRoomScreenShow(context, widget.roomId,
                      refer: widget.refer, uid: widget.uid);
                }
              },
          child: Container(
            height: widget.height,
            clipBehavior: Clip.antiAlias,
            alignment: AlignmentDirectional.centerStart,
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: R.colors.mainBrandGradientColors),
                borderRadius: widget.borderRadius),
            child: Row(
              children: <Widget>[
                SizedBox(width: widget.iconPadding.start),
                _buildIcon(),
                SizedBox(width: widget.iconPadding.end),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: [
                        Baseline(
                            baseline: tp.height,
                            baselineType: TextBaseline.alphabetic,
                            child: Rext.autoStyleImg(
                              'in_room_status.webp',
                              width: 18,
                              height: 18,
                              package: ComponentManager.MANAGER_BASE_CORE,
                            )),
                        Expanded(
                            child: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 8, end: 8),
                                child: Text(
                                  widget.roomName ?? K.base_in_room,
                                  style: widget.textStyle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )))
                      ],
                    ),
                    if (widget.subTitle != null && widget.subTitle!.isNotEmpty)
                      Padding(
                          padding: const EdgeInsetsDirectional.only(top: 2),
                          child: Text(
                            widget.subTitle!,
                            style: widget.subTextStyle ??
                                const TextStyle(
                                    color: Colors.white, fontSize: 13),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ))
                  ],
                )),
                if (widget.navigatorIcon != null) widget.navigatorIcon!
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildIcon() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        AnimatedBuilder(
          animation: aniController,
          builder: _buildWave,
        ),
        AnimatedBuilder(
          animation: aniController,
          builder: _build2Wave,
        ),
        Container(
          width: widget.iconSize,
          height: widget.iconSize,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 0.5)),
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: widget.roomIcon,
              width: widget.iconSize,
              height: widget.iconSize,
              placeholder: const CircularProgressIndicator(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWave(BuildContext context, Widget? child) {
    double translate =
        0.0 - ((scaleAni.value - 1.0) * widget.iconSize / 2 / scaleAni.value);
    return Container(
        width: widget.iconSize,
        height: widget.iconSize,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.3 * opacityAni.value)),
        transform: Matrix4.identity()
          ..scale(scaleAni.value, scaleAni.value)
          ..translate(translate, translate));
  }

  Widget _build2Wave(BuildContext context, Widget? child) {
    double translate =
        0.0 - ((scale2Ani.value - 1.0) * widget.iconSize / 2 / scale2Ani.value);
    return Container(
        width: widget.iconSize,
        height: widget.iconSize,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.3 * opacity2Ani.value)),
        transform: Matrix4.identity()
          ..scale(scale2Ani.value, scale2Ani.value)
          ..translate(translate, translate));
  }
}

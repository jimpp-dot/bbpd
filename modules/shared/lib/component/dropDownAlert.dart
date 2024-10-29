import 'dart:async';
import 'package:shared/shared.dart';
import 'package:shared/k.dart';
import 'package:shared/widget/notify/online_notification.dart';
import 'package:flutter/material.dart';

// UI调试代码
// DropDownAlert.show(
//     content: '内容消息一段话，文字颜色',
//     type: DropDownAlertType.small_account_notification,
//     replace: true,
//     mapContent: <String, dynamic>{'is_auto_chat': 'true', 'auto_chat_gs_sex': '1', 'name': '标题阿斯顿看见哦科技', 'title': '标题阿斯顿看见哦科技', 'desc': '内容消息一段话，文字颜色', 'sub_title': '内容消息一段话，文字颜色', 'origin_level' : '4', 'level': '3', 'link': 'https://www.baidu.com'});

/// 消息类型
enum DropDownAlertType {
  normal, // 普通消息
  order_notify, // 订单提醒消息
  room_notify, //推荐房间消息
  popularity_upgrade, // 人气等级升级
  online_notification, // 在线通知
  normal_click_text_notify, // 通用可点击纯文本通知
  small_account_notification, // 小号消息通知
}

/// 消息样式
enum DropDownAlertStyle {
  info,
  warn,
  error,
  success,
}

typedef OnDropMessageClick = Function(BuildContext context); //默认点击或者确认点击
typedef OnDropMessageRefuseClick = Function(BuildContext context); //拒绝点击
typedef OnDropMessageAutoMiss = Function(BuildContext context); //自动消失

/// 顶部下滑弹出的小蓝条
class DropDownAlert {
  static OverlayEntry? _overlayEntry;

  static show({
    required String content,
    OnDropMessageClick? onClick,
    OnDropMessageRefuseClick? onRefuseClick,
    OnDropMessageAutoMiss? onAutoMiss,
    Duration? duration,
    Map? mapContent,
    bool replace = false,
    bool showCountdownSubtitle = false,
    DropDownAlertType type = DropDownAlertType.normal,
    DropDownAlertStyle style = DropDownAlertStyle.info,
    bool ignoreAppstate = false,
    Widget? widget,
  }) {
    if (_overlayEntry != null) {
      if (replace == true) {
        dispose();
      } else {
        //当前正忙
        if (mapContent != null && mapContent['channelName'] != null) {
          Xhr.postJson("${System.domain}agora/leavel",
              {'channelName': mapContent['channelName'], 'reason': '4'});
        }

        return;
      }
    }

    if (!ignoreAppstate && Util.appState != AppLifecycleState.resumed) {
      return;
    }
    var overlayState = Overlay.of(System.context);

    _overlayEntry = OverlayEntry(builder: (context) {
      return DropDownAlertMessage(
        content: content,
        onClick: onClick,
        onRefuseClick: onRefuseClick,
        onAutoMiss: onAutoMiss,
        duration: duration,
        type: type,
        style: style,
        mapContent: mapContent,
        showCountdownSubtitle: showCountdownSubtitle,
        widget: widget,
      );
    });
    overlayState.insert(_overlayEntry!);
  }

  static void dispose() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }
}

class DropDownAlertMessage extends StatefulWidget {
  final String content;
  final bool showCountdownSubtitle;
  final DropDownAlertStyle? style;
  final OnDropMessageClick? onClick;
  final OnDropMessageRefuseClick? onRefuseClick;
  final OnDropMessageAutoMiss? onAutoMiss;
  final Duration? duration;
  final DropDownAlertType? type;
  final Map? mapContent;
  final Widget? widget;

  const DropDownAlertMessage({
    super.key,
    required this.content,
    this.style,
    this.onClick,
    this.onRefuseClick,
    this.onAutoMiss,
    this.duration,
    this.type,
    this.mapContent,
    this.showCountdownSubtitle = false,
    this.widget,
  });

  @override
  DropStateMessage createState() {
    return DropStateMessage();
  }
}

class DropStateMessage extends State<DropDownAlertMessage>
    with TickerProviderStateMixin<DropDownAlertMessage> {
  late AnimationController _animationController;
  final GlobalKey _key = GlobalKey();

  double _height = 0.0;
  double _top = -1000.0;
  double _dy = 0.0;
  Timer? _timer;

  // 人气等级动画
  AnimationController? _popularityAniController;

  // 原等级消失动画
  Animation<double>? _originTransitionAni;
  Animation<double>? _originFadeAni;

  // 新等级出现动画
  Animation<double>? _newScaleAni;
  Animation<double>? _newFadeAni;
  double originAniDuration = 840;

  dynamic valueOfMapContent(List<String> keys, dynamic placeholder,
      {String? append}) {
    dynamic value = widget.mapContent;
    for (String k in keys) {
      if (value != null && value.containsKey(k)) {
        value = value[k];
      }
    }
    if (value == null || value is Map) {
      return placeholder;
    }
    return append == null ? value : '$value$append';
  }

  @override
  initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _animationController.addStatusListener(_onStatus);
    _animationController.addListener(_onUpdate);

    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      if (!mounted) return;
      try {
        final RenderBox box =
            _key.currentContext?.findRenderObject() as RenderBox;
        _height = box.size.height;
        setState(() {
          _top = 0 - _height;
        });
        _animationController.forward(from: 0.0);
        // ignore: empty_catches
      } catch (e) {}
    });

    if (widget.type == DropDownAlertType.popularity_upgrade) {
      _popularityAniController = AnimationController(
        // 1s后开始动画，origin消失840ms，间隔100ms，new出现840ms
        duration: Duration(
            milliseconds: 1000 +
                originAniDuration.floor() +
                originAniDuration.floor() +
                100),
        vsync: this,
      );

      _originTransitionAni = TweenSequence([
        TweenSequenceItem<double>(
            tween: Tween(begin: 0.0, end: 0.0), weight: 1000),
        TweenSequenceItem<double>(
            tween: Tween(begin: 0.0, end: 11.0), weight: originAniDuration),
        TweenSequenceItem<double>(
            tween: Tween(begin: 11.0, end: 11.0),
            weight: originAniDuration + 100),
      ]).animate(
        CurvedAnimation(
          parent: _popularityAniController!,
          curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
        ),
      );

      _originFadeAni = TweenSequence([
        TweenSequenceItem<double>(
            tween: Tween(begin: 1.0, end: 1.0), weight: 1000),
        TweenSequenceItem<double>(
            tween: Tween(begin: 1.0, end: 0.0), weight: originAniDuration),
        TweenSequenceItem<double>(
            tween: Tween(begin: 0.0, end: 0.0),
            weight: originAniDuration + 100),
      ]).animate(
        CurvedAnimation(
          parent: _popularityAniController!,
          curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
        ),
      );

      _newScaleAni = TweenSequence([
        TweenSequenceItem<double>(
            tween: Tween(begin: 1.0, end: 1.0), weight: 1000),
        TweenSequenceItem<double>(
            tween: Tween(begin: 1.0, end: 1.0),
            weight: originAniDuration + 100),
        TweenSequenceItem<double>(
            tween: Tween(begin: 1.0, end: 1.3), weight: originAniDuration / 2),
        TweenSequenceItem<double>(
            tween: Tween(begin: 1.3, end: 1.0), weight: originAniDuration / 2),
      ]).animate(
        CurvedAnimation(
          parent: _popularityAniController!,
          curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
        ),
      );

      _newFadeAni = TweenSequence([
        TweenSequenceItem<double>(
            tween: Tween(begin: 0.0, end: 0.0), weight: 1000),
        TweenSequenceItem<double>(
            tween: Tween(begin: 0.0, end: 0.0),
            weight: originAniDuration + 100),
        TweenSequenceItem<double>(
            tween: Tween(begin: 0.0, end: 1.0), weight: originAniDuration),
      ]).animate(
        CurvedAnimation(
          parent: _popularityAniController!,
          curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
        ),
      );
    }
  }

  @override
  dispose() {
    _animationController.removeStatusListener(_onStatus);
    _animationController.removeListener(_onUpdate);
    _animationController.dispose();
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }

    if (_popularityAniController != null) {
      _popularityAniController!.dispose();
    }

    super.dispose();
  }

  Color _getBackgroundColor() {
    // color 规范待定
    if (widget.style == DropDownAlertStyle.info) {
      return R.colors.mainBgColor;
    } else if (widget.style == DropDownAlertStyle.warn) {
      return const Color(0xFFCD853F);
    } else if (widget.style == DropDownAlertStyle.error) {
      return const Color(0xFFCC3232);
    } else if (widget.style == DropDownAlertStyle.success) {
      return const Color(0xFF32A54A);
    } else {
      return R.color.mainBrandColor;
    }
  }

  String _getIcon() {
    if (widget.type == DropDownAlertType.order_notify) {
      return R.imagePath("dropdown_order_notify.png",
          package: ComponentManager.MANAGER_BASE_CORE);
    } else {
      switch (widget.style) {
        case DropDownAlertStyle.info:
          return R.imagePath("dropdown_info.png",
              package: ComponentManager.MANAGER_BASE_CORE);
        case DropDownAlertStyle.warn:
          return R.imagePath("dropdown_warn.png",
              package: ComponentManager.MANAGER_BASE_CORE);
        case DropDownAlertStyle.error:
          return R.imagePath("dropdown_error.png",
              package: ComponentManager.MANAGER_BASE_CORE);
        case DropDownAlertStyle.success:
          return R.imagePath("dropdown_success.png",
              package: ComponentManager.MANAGER_BASE_CORE);
        default:
          return R.imagePath("dropdown_success.png",
              package: ComponentManager.MANAGER_BASE_CORE);
      }
    }
  }

  _onUpdate() {
    setState(() {
      _top = (_animationController.value - 1) * _height;
    });
  }

  _onStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      if (widget.type != DropDownAlertType.order_notify) {
        int sec = Constant.defaultDropDownAlertSec;
        if (widget.type == DropDownAlertType.room_notify) {
          sec = 6;
        } else if (widget.type == DropDownAlertType.popularity_upgrade) {
          sec = 6;
          _popularityAniController?.forward();
        }
        if (_timer != null) {
          _timer!.cancel();
          _timer = null;
        }
        _timer = Timer(
          widget.duration ?? Duration(seconds: sec),
          _onTimer,
        );
      }
    } else if (status == AnimationStatus.dismissed) {
      DropDownAlert.dispose();
    }
  }

  ///自动消失
  _onTimer() {
    if (_animationController.isCompleted) {
      _dismiss();
      if (widget.onAutoMiss != null) {
        widget.onAutoMiss!(context);
      }
    }
  }

  _dismiss() {
    _animationController.reverse();
  }

  _forward() {
    if (_animationController.value < 1.0) {
      _animationController.forward();
    }
  }

  //默认点击或者确认点击
  _onTap() async {
    _dismiss();
    if (widget.onClick != null) {
      widget.onClick!(context);
    }
  }

  //拒绝点击
  _onRefuse() {
    _dismiss();
    if (widget.onRefuseClick != null) {
      widget.onRefuseClick!(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      key: _key,
      top: _top,
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (widget.type == DropDownAlertType.order_notify) {
      return _buildOrderNotify();
    } else if (widget.type == DropDownAlertType.room_notify) {
      return _buildRoomNotify();
    } else if (widget.type == DropDownAlertType.popularity_upgrade) {
      // 人气等级升级
      return AnimatedBuilder(
        animation: _popularityAniController!,
        builder: (BuildContext context, _) {
          return _buildPopularityUpgrade();
        },
      );
    } else if (widget.type == DropDownAlertType.online_notification) {
      return _buildGestureContainer(_buildOnlineNotification());
    } else if (widget.type == DropDownAlertType.normal_click_text_notify) {
      return _buildGestureContainer(_buildNormalClickTextNotify());
    } else if (widget.type == DropDownAlertType.small_account_notification) {
      return _buildGestureContainer(_buildSmallAccountContainer());
    } else {
      bool isAccostMsg = widget.mapContent != null
          ? Util.parseBool(widget.mapContent!['is_auto_chat'])
          : false;
      return _buildGestureContainer(
          isAccostMsg ? _buildAccostMsg() : _buildNormal());
    }
  }

  Widget _buildSmallAccountContainer() {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      margin: const EdgeInsetsDirectional.only(start: 20, top: 50),
      padding: const EdgeInsetsDirectional.all(12),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            offset: Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
        color: R.colors.mainBgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildAvatar(valueOfMapContent(['icon'], '')),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  valueOfMapContent(['name'], ''),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: R.colors.mainTextColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  R.string('small_account_receive_msg_num', args: [
                    '${valueOfMapContent(['left'], 0)}'
                  ]),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: R.colors.secondTextColor,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          InkWell(
            onTap: _onTap,
            child: Container(
              height: 28,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: R.colors.secondBrandGradientColors,
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                R.string("small_account_change"),
                style: TextStyle(
                  color: R.colors.mainBgColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          InkWell(
            onTap: _dismiss,
            child: R.img("ic_small_account_close.webp",
                color: R.colors.mainTextColor,
                width: 16,
                height: 16,
                package: ComponentManager.MANAGER_MESSAGE),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(String url) {
    return ClipOval(
      child: CommonAvatar(
        path: url,
        size: 48,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildOnlineNotification() {
    return OnlineNotification(
      mapContent: widget.mapContent,
      dismissCallBack: (needLeavelChannel) async {
        Log.d('OnlineNotification dismiss');

        if (needLeavelChannel == true) {
          if (valueOfMapContent(['channelName'], null) != null) {
            await Xhr.postJson("${System.domain}agora/leavel", {
              'channelName': valueOfMapContent(['channelName'], ''),
              'reason': '3'
            });
          }
        }
        _animationController.reverse();
      },
    );
  }

  Widget _buildGestureContainer(Widget child) {
    return GestureDetector(
      onTap: _onTap,
      onVerticalDragStart: (DragStartDetails details) {
        if (_animationController.status != AnimationStatus.completed) return;
        _dy = 0;
      },
      onVerticalDragUpdate: (DragUpdateDetails details) {
//        Log.d('onVerticalDragUpdate: ${_animationController.status}');
        if (_animationController.status != AnimationStatus.completed &&
            _animationController.status != AnimationStatus.forward) return;
//        Log.d('cey delta: ${details.delta.dy}');
        _dy += details.delta.dy;
//        Log.d('cey dy: $_dy');
        if (_dy > 0) return;
        _animationController.value = 1 - (_dy / _height).abs();
//        Log.d('cey value: ${_animationController.value}');
      },
      onVerticalDragEnd: (DragEndDetails details) {
        double value = _animationController.value;
        //Log.d("details v = ${details.velocity.pixelsPerSecond.dy}");
        if (details.velocity.pixelsPerSecond.dy < 0) {
          _dismiss();
          return;
        }

        if (value > 0.6) {
          _forward();
          _dy = 0;
        } else {
          _dismiss();
        }
      },
      onVerticalDragCancel: () {
        _dy = 0;
      },
      child: child,
    );
  }

  Widget _buildAccostMsg() {
    double gap = 20;
    double width = Util.width - 2 * gap;
    double height = width * 72 / 350;
    bool male = Util.parseInt(widget.mapContent?['auto_chat_gs_sex']) == 1;
    String icon = Util.parseStr(widget.mapContent?['user_icon']) ?? '';
    return Container(
      margin: EdgeInsetsDirectional.only(
          top: MediaQuery.of(context).padding.top, start: gap, end: gap),
      width: width,
      height: height,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: R.img(
              male
                  ? 'accost_notify_bg_male.webp'
                  : 'accost_notify_bg_female.webp',
              width: width,
              height: height,
              package: ComponentManager.MANAGER_BASE_CORE,
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              Container(
                width: 49,
                height: 49,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.5),
                  border: Border.all(
                      color: Colors.white.withOpacity(0.2), width: 0.5),
                ),
                child: ImageBlurWidget(
                  borderRadius: 24,
                  child: CommonAvatar(
                    path: icon,
                    shape: BoxShape.circle,
                    size: 48,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  child: Text(
                K.base_receive_accost_notify,
                style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              )),
              const SizedBox(
                width: 8,
              ),
              Container(
                width: 60,
                height: 28,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Text(
                  K.base_go_to_see,
                  style: TextStyle(
                    fontSize: 12,
                    color: male
                        ? const Color(0xFFBA57FF)
                        : const Color(0xFFFF5F7D),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  _dismiss();
                },
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: R.img(
                    'ic_close.svg',
                    package: ComponentManager.MANAGER_BASE_CORE,
                    width: 16,
                    height: 16,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildNormal() {
    return Container(
      width: Util.width,
      color: _getBackgroundColor(),
      padding: EdgeInsetsDirectional.only(
        top: MediaQuery.of(context).padding.top,
        start: 8,
        end: 8,
      ),
      child: SizedBox(
        height: 56,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: R.img(
                _getIcon(),
                width: 28,
                height: 28,
                wholePath: true,
                color: R.colors.mainTextColor,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: widget.widget ??
                  Text(
                    widget.content,
                    style: TextStyle(
                      color: R.colors.mainTextColor,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderNotify() {
    return Container(
      width: Util.width,
      color: _getBackgroundColor(),
      padding: EdgeInsetsDirectional.only(
        top: MediaQuery.of(context).padding.top,
        start: 16,
        end: 16,
      ),
      child: SizedBox(
        height: 56,
        child: Row(
          children: <Widget>[
            R.img(
              _getIcon(),
              width: 28,
              height: 28,
              wholePath: true,
              color: R.colors.mainTextColor,
              fit: BoxFit.contain,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
                child: Text(
                  widget.content,
                  style: TextStyle(
                    color: R.colors.mainTextColor,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            GestureDetector(
              onTap: _onTap,
              child: Container(
                width: 60,
                height: 28,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: R.colors.secondBrandGradientColors),
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: Text(
                  K.base_go_to_process,
                  style: TextStyle(
                    color: _getBackgroundColor(),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoomNotify() {
    String? icon;
    String? title;
    String? subTitle;
    int? sex;
    int? age;
    if (widget.mapContent != null) {
      if (widget.mapContent!.containsKey('icon')) {
        icon = '${widget.mapContent!['icon']}';
      }
      if (widget.mapContent!.containsKey('name')) {
        title = '${widget.mapContent!['name']}';
      }
      if (widget.mapContent!.containsKey('desc')) {
        subTitle = '${widget.mapContent!['desc']}';
      }
      if (widget.mapContent!.containsKey('sex')) {
        sex = Util.parseInt(widget.mapContent!['sex'], 0);
      }
      if (widget.mapContent!.containsKey('age')) {
        age = Util.parseInt(widget.mapContent!['age'], 0);
      }
    }

    return Container(
      width: Util.width - 32.0,
      margin: EdgeInsetsDirectional.only(
        top: MediaQuery.of(context).padding.top + 8.0,
        start: 16.0,
        end: 16.0,
      ),
      padding: const EdgeInsetsDirectional.only(start: 12.0, end: 12.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        gradient: LinearGradient(
          begin: AlignmentDirectional.centerStart,
          end: AlignmentDirectional.centerEnd,
          colors: [
            Color(0xFF7544FF),
            Color(0xFF6F7EFF),
          ],
        ),
      ),
      child: Stack(
        children: <Widget>[
          PositionedDirectional(
            top: 0.0,
            start: 33.0,
            child: R.img("dropdown_room_notify_top.png",
                width: 132,
                height: 36,
                fit: BoxFit.fill,
                package: ComponentManager.MANAGER_BASE_CORE),
          ),
          PositionedDirectional(
            bottom: 0.0,
            end: 31.0,
            child: R.img("dropdown_room_notify_bottom.png",
                width: 128,
                height: 32,
                fit: BoxFit.fill,
                package: ComponentManager.MANAGER_BASE_CORE),
          ),
          SizedBox(
            height: 64,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: icon ?? '',
                    fit: BoxFit.fill,
                    width: 40.0,
                    height: 40.0,
                    errorWidget: const SizedBox(
                      width: 40.0,
                      height: 40.0,
                    ),
                  ),
                ),
                Container(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: Util.width - 270.0,
                            ),
                            child: Text(
                              title ?? '',
                              style: const TextStyle(
                                color: Color(0xFFFEFEFE),
                                fontSize: 16,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            width: 3.0,
                          ),
                          UserSexAndAgeWidget(
                            sex: sex,
                            age: age,
                            width: 31,
                            height: 14,
                          ),
                        ],
                      ),
                      Container(
                        height: 2.0,
                      ),
                      Text(
                        subTitle ?? '',
                        style: TextStyle(
                          color: const Color(0xFFFEFEFE).withOpacity(0.6),
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                Container(
                  width: 8.0,
                ),
                GestureDetector(
                  onTap: () {
                    _onTap();
                  },
                  child: Container(
                    width: 50,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      K.accept,
                      style: const TextStyle(
                        color: Color(0xFF7453FF),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 8.0,
                ),
                GestureDetector(
                  onTap: () {
                    _onRefuse();
                  },
                  child: Container(
                    width: 50,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      K.refuse,
                      style: const TextStyle(
                        color: Color(0xFFFEFEFE),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularityUpgrade() {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        width: Util.width,
        height: 80 + MediaQuery.of(context).padding.top,
        padding: EdgeInsetsDirectional.only(
          top: MediaQuery.of(context).padding.top,
          start: 2,
          end: 16,
        ),
        decoration: BoxDecoration(
          color: R.colors.mainBgColor,
          borderRadius: const BorderRadiusDirectional.only(
            bottomStart: Radius.circular(16),
            bottomEnd: Radius.circular(16),
          ),
        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 82,
              height: 80,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  R.img(
                    'ic_popularity_upgrade.webp',
                    width: 82,
                    height: 80,
                    package: ComponentManager.MANAGER_BASE_CORE,
                  ),
                  FadeTransition(
                    opacity: _originFadeAni!,
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                          end: 4, bottom: _originTransitionAni!.value),
                      child: Text(
                        valueOfMapContent(['origin_level'], ''),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFFFD7B08),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  FadeTransition(
                    opacity: _newFadeAni!,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(end: 4),
                      child: ScaleTransition(
                        scale: _newScaleAni!,
                        child: Text(
                          valueOfMapContent(['level'], ''),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFFFD7B08),
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    valueOfMapContent(['title'], ''),
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: R.colors.mainTextColor,
                        height: 1),
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    valueOfMapContent(['sub_title'], ''),
                    style: TextStyle(
                        fontSize: 13,
                        color: R.colors.thirdTextColor,
                        height: 1),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            (valueOfMapContent(['link'], '').isEmpty)
                ? const SizedBox(
                    width: 10,
                    height: 32,
                  )
                : Container(
                    height: 32,
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(32)),
                      gradient: LinearGradient(
                        colors: R.colors.secondBrandGradientColors,
                        begin: AlignmentDirectional.centerStart,
                        end: AlignmentDirectional.centerEnd,
                      ),
                    ),
                    child: Text(
                      K.base_popularity_upgrade_button,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: R.colors.mainBgColor,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  // 通用可点击纯文本通知条
  Widget _buildNormalClickTextNotify() {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        margin: EdgeInsetsDirectional.only(
            start: 8, end: 8, top: MediaQuery.of(context).padding.top + 8.0),
        width: Util.width - 16,
        height: 72,
        decoration: BoxDecoration(
          color: R.colors.mainBgColor,
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.12),
                offset: const Offset(0, 2),
                blurRadius: 12)
          ],
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                widget.content,
                style: TextStyle(
                  fontSize: 16,
                  color: R.colors.mainTextColor,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Container(
              height: 28,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: R.colors.secondBrandGradientColors),
                borderRadius: const BorderRadius.all(Radius.circular(14)),
              ),
              alignment: AlignmentDirectional.center,
              child: Text(
                K.base_lookup,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: R.colors.mainBgColor,
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
          ],
        ),
      ),
    );
  }
}

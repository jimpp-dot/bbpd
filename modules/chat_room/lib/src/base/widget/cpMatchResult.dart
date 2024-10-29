import 'dart:async';

import 'package:shared/shared.dart';
import 'package:chat_room/src/base/widget/cp_match_result.dart';
import 'package:chat_room/src/cplove/heart/cp_heart_hat_avatar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../k.dart';
import 'cp_match_vap_result.dart';

class CpMatchResultor {
  ///缓存队列，正在播放时新来的进队列，等当前的播放完毕立即播放下一个
  static final List<Map> _dataList = [];

  static show(dynamic context, Map data) async {
    var overlayState = Overlay.of(System.context);

    if (_overlayEntry != null) {
      _dataList.add(data);
      return;
    }

    String url = Util.notNullStr(data['webp_url']);
    String vapUrl = Util.notNullStr(data['vap_url']);
    int vapSize = Util.parseInt(data['vap_size']);

    if (Util.validStr(vapUrl) && vapSize > 0) {
      /// vap格式
      await cacheCpMatchBg(vapUrl, vapSize);

      ///  cacheWebpCpMatchBg为耗时任务，在这里还需要判断一次，防止短时间内收到两个cp-match,出现_overlayEntry remove不掉的BUG
      if (_overlayEntry != null) {
        _dataList.add(data);
        return;
      }

      _overlayEntry = OverlayEntry(builder: (context) {
        return CpMatchVapResult(data: data, onComplete: _onComplete);
      });
    } else if (url.isNotEmpty) {
      /// webp格式
      int level = Util.parseInt(data['level']);
      int size = Util.parseInt(data['size']);
      await cacheCpMatchBg(url, size);

      ///  cacheWebpCpMatchBg为耗时任务，在这里还需要判断一次，防止短时间内收到两个cp-match,出现_overlayEntry remove不掉的BUG
      if (_overlayEntry != null) {
        _dataList.add(data);
        return;
      }

      _overlayEntry = OverlayEntry(builder: (context) {
        return CpMatchResultPage(data: data, onComplete: _onComplete);
      });
    } else {
      _overlayEntry = OverlayEntry(builder: (context) {
        return CPMatchResult(
          context: context,
          data: data,
          onComplete: _onComplete,
        );
      });
    }
    overlayState.insert(_overlayEntry!);
  }

  static OverlayEntry? _overlayEntry;

  static _onComplete() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }

    if (_dataList.isNotEmpty) {
      Map data = _dataList.removeAt(0);
      show(System.context, data);
    }
  }

  static dismiss() {
    _onComplete();
    _dataList.clear();
  }
}

enum CPMatchAnimateStatus { Ready, In, Display, Out, Disposed }

class CPMatchResult extends StatefulWidget {
  final Map data;
  final dynamic context;
  final VoidCallback onComplete;

  const CPMatchResult({
    super.key,
    this.context,
    required this.data,
    required this.onComplete,
  });

  @override
  CPMatchResultStatus createState() {
    return CPMatchResultStatus();
  }
}

typedef OnDropMessageClick = Function(dynamic context);

class CPMatchResultStatus extends State<CPMatchResult>
    with TickerProviderStateMixin<CPMatchResult> {
  late AnimationController _inAnimationController;
  late AnimationController _animationController;
  final GlobalKey _captureKey = GlobalKey();
  int _level = 0;
  String _dateline = '';
  late Animation<double> _padding;
  final double _maxPadding = (Util.width - 95 * 2 + 27) / 2;
  Timer? _timer;
  late Animation<double> _loveOpacity;
  late Animation<double> _headerOpacity;

  CPMatchAnimateStatus _status = CPMatchAnimateStatus.Ready;

  @override
  initState() {
    super.initState();

    _inAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _inAnimationController.addStatusListener(_onInStatus);
    _headerOpacity = Tween(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(
          parent: _inAnimationController, curve: const Interval(0.0, 1.0)),
    );

    _animationController = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);
    _animationController.addStatusListener(_onStatus);
    _animationController.addListener(_onUpdate);

    _level = Util.parseInt(widget.data['level']);
    _padding =
        Tween<double>(begin: _level > 0 ? 0.0 : _maxPadding, end: _maxPadding)
            .animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );

    var formatter = DateFormat('yyyy.MM.dd');
    _dateline = formatter.format(DateTime.fromMicrosecondsSinceEpoch(
        Util.parseInt(widget.data['dateline']) * 1000000));

    _loveOpacity = Tween(begin: 0.0, end: 0.8).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.2, 1.0, curve: Curves.bounceIn),
      ),
    );

    _status = CPMatchAnimateStatus.In;
    _inAnimationController.forward(from: 0.0);
  }

  @override
  dispose() {
    super.dispose();

    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }

    _inAnimationController.removeStatusListener(_onInStatus);
    _inAnimationController.dispose();

    _animationController.removeStatusListener(_onStatus);
    _animationController.removeListener(_onUpdate);
    _animationController.dispose();
  }

  _onUpdate() {
    setState(() {});
  }

  _onInStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _animationController.forward(from: 0.0);
    } else if (status == AnimationStatus.dismissed) {
      _status = CPMatchAnimateStatus.Disposed;
      widget.onComplete();
    }
  }

  _onStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      if (_status == CPMatchAnimateStatus.In) {
        _status = CPMatchAnimateStatus.Display;
        _timer = Timer(const Duration(milliseconds: 2500), _handleHide);
      }
    } else if (status == AnimationStatus.dismissed) {
      _status = CPMatchAnimateStatus.Disposed;
      widget.onComplete();
    }
  }

  void _handleHide() {
    _status = CPMatchAnimateStatus.Disposed;
    widget.onComplete();
  }

  _dismiss() {
    _status = CPMatchAnimateStatus.Out;
    _animationController.reverse();
  }

  Widget _buildCpMatchIcon() {
    return Container(
      width: 100.0,
      height: 120.0,
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          PositionedDirectional(
            end: 0.0,
            top: 15,
            child: FadeTransition(
              opacity: _headerOpacity,
              child: _buildIcon(widget.data['user_a'], true),
            ),
          ),
          PositionedDirectional(
            start: 0.0,
            top: 15,
            child: FadeTransition(
              opacity: _headerOpacity,
              child: _buildIcon(widget.data['user_b'], false),
            ),
          ),
          PositionedDirectional(
            start: 68.0,
            top: 15,
            child: FadeTransition(
              opacity: _loveOpacity,
              child: Container(
                child: R.img(
                  (_level < 0 || _level > 3)
                      ? 'icon_cpmatch1.png'
                      : "icon_cpmatch${_level + 1}.png",
                  width: 27,
                  height: 95,
                  fit: BoxFit.contain,
                  package: ComponentManager.MANAGER_BASE_ROOM,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildIcon(Map data, bool man) {
    String icon = Util.notNullStr(data['icon']);
    int hatLevel = Util.parseInt(data['hat_level']);
    String hatUrl = Util.notNullStr(data['hat_url']);
    if (hatLevel == 1 || hatLevel == 2 || hatLevel == 3) {
      return CpHeartHatAvatar(
        icon: icon,
        level: hatLevel,
        man: man,
        size: 95.0,
        headUrl: hatUrl,
      );
    } else {
      return CommonAvatar(path: icon, size: 95.0, shape: BoxShape.circle);
    }
  }

  Widget _buildCenter() {
    double paddingTop = Util.isIphoneX ? 227.0 + 24.0 : 227.0;

    return PositionedDirectional(
      start: _padding.value,
      end: _padding.value,
      top: paddingTop,
      child: SizedBox(width: Util.width, child: _buildCpMatchIcon()),
    );
  }

  Widget _buildBottomText() {
    Color textColor = _getTextColor();
    Color coinColor = _getCoinColor();

    return PositionedDirectional(
      start: 0,
      top: _textTop(),
      child: Container(
        width: Util.width,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "${K.room_congratulations} ",
                  textScaleFactor: 1.0,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: textColor,
                  ),
                ),
                Container(
                    constraints: BoxConstraints(
                      maxWidth: (Util.width - 80) / 2,
                    ),
                    child: Text(
                      "${widget.data['user_a']['name']}",
                      textScaleFactor: 1.0,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: textColor,
                      ),
                    )),
                Text(
                  "${K.room_with} ",
                  textScaleFactor: 1.0,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: textColor,
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: (Util.width - 80) / 2,
                  ),
                  child: Text(
                    "${widget.data['user_b']['name']}",
                    textScaleFactor: 1.0,
                    maxLines: 1,
                    style: TextStyle(fontSize: 16.0, color: textColor),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 3)),
            Text(
              K.room_user_in_friends_room([
                "${Util.appName} [${widget.data['rname']}] ",
                "${widget.data['word']}"
              ]),
              textScaleFactor: 1.0,
              maxLines: 1,
              style: TextStyle(fontSize: 16.0, color: textColor),
            ),
            const Padding(padding: EdgeInsets.only(top: 3)),
            Text.rich(
              TextSpan(
                text: K.room_heart_value,
                style: TextStyle(
                    color: coinColor,
                    fontSize: 16.0,
                    fontFamily: Util.fontFamily),
                children: <TextSpan>[
                  TextSpan(
                    text: " ${Util.parseInt(widget.data['package'])} ",
                    style: TextStyle(
                        color: textColor,
                        fontSize: 16.0,
                        fontFamily: Util.fontFamily,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCaptureBtn() {
    return PositionedDirectional(
        top: _textTop() + 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CpCaptureButton(captureKey: _captureKey),
            SizedBox(
              width: Util.width,
            )
          ],
        ));
  }

  double _textTop() => Util.isIphoneX ? 396.0 : 376.0;

  Color _getTextColor() {
    switch (_level) {
      case 0:
        return const Color(0xFFDBCBFF);
      case 1:
        return const Color(0xFFE1F2FF);
      case 2:
        return const Color(0xFF263736);
      case 3:
        return const Color(0xFF5F3073);
    }
    return const Color(0xFFDBCBFF);
  }

  Color _getCoinColor() {
    switch (_level) {
      case 0:
        return const Color(0xFFE99CC9);
      case 1:
        return const Color(0xFFFFBECA);
      case 2:
        return const Color(0xFFFF4A82);
      case 3:
        return const Color(0xFFE7467F);
    }

    return const Color(0xFFE99CC9);
  }

  Widget _buildHeader() {
    double paddintTop = Util.isIphoneX ? 99.0 + 24.0 : 99.0;

    return PositionedDirectional(
      start: 0,
      top: paddintTop,
      child: SizedBox(
        width: Util.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              _dateline,
              textScaleFactor: 1.0,
              style: const TextStyle(
                fontSize: 20.0,
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.bold,
                fontFamily: 'DINCond-Bold',
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 8.0),
              child: R.img(
                "cpmatch_text${_level + 1}.png",
                width: 0.52 * Util.width,
                fit: BoxFit.fitWidth,
                package: ComponentManager.MANAGER_BASE_ROOM,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      shadowColor: Colors.black26,
      color: Colors.transparent.withAlpha(153),
      child: SizedBox(
        height: Util.height,
        child: Stack(
          children: [
            RepaintBoundary(
              key: _captureKey,
              child: Stack(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: CachedNetworkImage(
                      imageUrl: Util.getImgUrl('cpmatch_bg${_level + 1}.png',
                          package: ComponentManager.MANAGER_BASE_ROOM),
                      width: Util.width,
                      height: Util.height,
                      fit: BoxFit.cover,
                    ),
                  ),
                  _buildHeader(),
                  _buildCenter(),
                  _buildBottomText(),
                ],
              ),
            ),
            _buildCaptureBtn()
          ],
        ),
      ),
    );
  }
}

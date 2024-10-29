import 'dart:async';
import 'dart:io';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/k.dart';
import 'package:vip/src/bag/model/box_bean.dart';

typedef OpenBoxAction = Function(int num);

/// 我的背包拆箱子弹窗UI
class BagBoxOpenWidget extends StatefulWidget {
  final String? boxName;
  final BoxScreen? boxScreen; // 谁谁谁收到了N个大礼盒数据
  final BoxContent content;
  final int maxNum; // 最大数量
  final int nextRefreshSeconds; // 下次刷新剩余时间 单位秒
  final VoidCallback reload; // 刷新页面回调
  final OpenBoxAction openBoxAction; // 拆箱子回调

  const BagBoxOpenWidget({
    super.key,
    this.boxName,
    this.boxScreen,
    required this.content,
    required this.maxNum,
    required this.nextRefreshSeconds,
    required this.reload,
    required this.openBoxAction,
  });

  @override
  _BagBoxOpenWidgetState createState() => _BagBoxOpenWidgetState();
}

class _BagBoxOpenWidgetState extends State<BagBoxOpenWidget> {
  int _num = 1;

  @override
  void initState() {
    super.initState();
    _num = widget.maxNum;
  }

  @override
  void didUpdateWidget(BagBoxOpenWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget != widget) {
      _num = widget.maxNum;
    }
  }

  _add() {
    if (_num >= widget.maxNum) {
      return;
    }
    setState(() {
      _num++;
    });
  }

  _reduce() {
    if (_num <= 1) {
      return;
    }
    setState(() {
      _num--;
    });
  }

  @override
  Widget build(BuildContext context) {
    String openTips =
        K.vip_open_pac_tips([BoxUtil.boxActName, widget.content.name]);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _renderTop(),
        Container(
          alignment: AlignmentDirectional.topStart,
          color: R.colors.bottomBarColor,
          padding: const EdgeInsetsDirectional.only(
              start: 20, end: 20, top: 8, bottom: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.boxName ?? '',
                    style: TextStyle(
                        color: R.colors.mainTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      openTips,
                      style: TextStyle(
                          color: R.colors.mainTextColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              if (widget.content.description.isNotEmpty)
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 8),
                  child: Text(
                    widget.content.description,
                    style: TextStyle(
                        fontSize: 13, color: R.colors.secondTextColor),
                  ),
                ),
              const SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: _renderIosTip()),
                  GestureDetector(
                    onTap: _reduce,
                    child: Container(
                      width: 32,
                      height: 32,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: R.colors.dividerColor, width: 1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        "-",
                        style: TextStyle(
                            color: R.colors.thirdTextColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Container(
                    width: 32,
                    height: 32,
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      "$_num",
                      style: TextStyle(
                          color: R.colors.mainTextColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  GestureDetector(
                    onTap: _add,
                    child: Container(
                      width: 32,
                      height: 32,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: R.colors.dividerColor, width: 1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        "+",
                        style: TextStyle(
                            color: R.colors.thirdTextColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _renderBtn(),
            ],
          ),
        )
      ],
    );
  }

  Widget _renderTop() {
    return SizedBox(
      width: Util.width,
      height: 210,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl(widget.content.imageBg),
              width: Util.width,
              height: 210,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl(widget.content.image),
              width: 193,
              height: 193,
              fit: BoxFit.cover,
            ),
          ),
          PositionedDirectional(
            top: 8,
            start: 8,
            child: RepaintBoundary(
                child: _CountDownTimer(
                    seconds: widget.nextRefreshSeconds,
                    reloadCallback: widget.reload)),
          ),
          if (widget.boxScreen != null)
            PositionedDirectional(
                bottom: 15,
                start: 50,
                end: 50,
                child: Center(child: _renderTip())),
        ],
      ),
    );
  }

  /// 本活动与Apple Inc. 无关 说明
  Widget _renderIosTip() {
    return Platform.isIOS
        ? Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                K.special_statement,
                style: TextStyle(
                  fontSize: 9,
                  color: R.colors.thirdTextColor,
                ),
              ),
              const SizedBox(width: 2),
              GestureDetector(
                onTap: () {
                  // HelpScreen xxx活动说明
                  String url = BoxUtil.getBoxH5();
                  BaseWebviewScreen.show(context, url: url);
                },
                child: Text(
                  K.explain,
                  style: TextStyle(
                    fontSize: 9,
                    color: R.colors.thirdTextColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          )
        : Container();
  }

  /// 谁谁谁刚收到了几个大礼盒
  Widget _renderTip() {
    BoxScreen? boxScreen = widget.boxScreen;
    return Container(
      padding:
          const EdgeInsetsDirectional.only(start: 4, end: 4, top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: R.colors.mainTextColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(21),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (boxScreen?.icon != null)
            CommonAvatar(
              path: boxScreen!.icon,
              size: 30,
              suffix: '!head100',
              shape: BoxShape.circle,
            ),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              K.someone_open_box_and_get([
                boxScreen?.name ?? '',
                '${boxScreen?.openNum}',
                _getBoxName(boxScreen?.type)
              ]),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: R.colors.reversedTextColor, fontSize: 11),
            ),
          ),
          const SizedBox(width: 4),
          boxScreen?.cimage != null
              ? CachedNetworkImage(
                  imageUrl: Util.getRemoteImgUrl(boxScreen!.cimage),
                  fit: BoxFit.cover,
                  width: 32.0,
                  height: 32.0,
                  cachedHeight: (32 * Util.devicePixelRatio).toInt(),
                  cachedWidth: (32 * Util.devicePixelRatio).toInt(),
                )
              : const SizedBox(width: 32.0, height: 32.0),
          const SizedBox(width: 4),
          Text(
            'X${boxScreen?.cnum}',
            style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Color(0xFFFF6363)),
          ),
          const SizedBox(width: 15),
          Text(
            boxScreen?.time ?? '',
            style: TextStyle(
              fontSize: 11,
              color: R.colors.reversedTextColor.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }

  /// 底部按钮
  Widget _renderBtn() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        // 老版本是maxNum大于0时显示连拆几个按钮
        Expanded(
          child: GestureDetector(
            onTap: () {
              _onBtnAction(_num);
            },
            child: Container(
              height: 52,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: R.colors.mainBrandGradientColors),
                borderRadius: BorderRadius.circular(26),
              ),
              child: Text(
                Session.useStar != BoxGameType.None
                    ? K.vip_open_star([_num.toString()])
                    : K.open_some_box([_num.toString()]),
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: R.colors.brightTextColor),
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: GestureDetector(
            onTap: () {
              _onBtnAction(1);
            },
            child: Container(
              height: 52,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                color: R.colors.minorBgColor,
                borderRadius: BorderRadius.circular(26),
              ),
              child: Text(
                Session.useStar != BoxGameType.None
                    ? K.vip_open_one_star
                    : K.open_one_box,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: R.colors.mainTextColor),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _getBoxName(type) {
    if (type == 'gold') {
      return BoxUtil.goldBoxName;
    } else if (type == 'silver') {
      return BoxUtil.silverBoxName;
    } else {
      return BoxUtil.copperBoxName;
    }
  }

  /// 开箱子回调
  void _onBtnAction(int count) {
    widget.openBoxAction(count);
  }
}

/// 倒计时
class _CountDownTimer extends StatefulWidget {
  final VoidCallback reloadCallback;
  final int seconds;

  const _CountDownTimer({required this.reloadCallback, required this.seconds});

  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<_CountDownTimer> {
  int _nextRefreshSeconds = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _nextRefreshSeconds = widget.seconds;
    _timer = Timer.periodic(const Duration(seconds: 1), _onTimeCallback);
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _timer = null;
  }

  void _onTimeCallback(Timer timer) {
    if (_nextRefreshSeconds > 1) {
      _nextRefreshSeconds--;
      if (mounted) {
        setState(() {});
      }
    } else {
      _timer?.cancel();
      widget.reloadCallback();
    }
  }

  @override
  Widget build(BuildContext context) {
    String hour = _getTimeStr(_nextRefreshSeconds ~/ 3600);
    String minutes = _getTimeStr(((_nextRefreshSeconds) % 3600 ~/ 60));
    String seconds = _getTimeStr(_nextRefreshSeconds % 60);
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            color: R.colors.mainTextColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
                color: R.colors.reversedTextColor.withOpacity(0.2), width: 1),
          ),
          child: Text(
            hour,
            style: TextStyle(
                color: R.colors.reversedTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(width: 2),
        Text(':',
            style: TextStyle(
                color: R.colors.reversedTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w600)),
        const SizedBox(width: 2),
        Container(
          width: 24,
          height: 24,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            color: R.colors.mainTextColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
                color: R.colors.reversedTextColor.withOpacity(0.2), width: 1),
          ),
          child: Text(
            minutes,
            style: TextStyle(
                color: R.colors.reversedTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(width: 2),
        Text(':',
            style: TextStyle(
                color: R.colors.reversedTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w600)),
        const SizedBox(width: 2),
        Container(
          width: 24,
          height: 24,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            color: R.colors.mainTextColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
                color: R.colors.reversedTextColor.withOpacity(0.2), width: 1),
          ),
          child: Text(
            seconds,
            style: TextStyle(
                color: R.colors.reversedTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(width: 4),
        Text(K.vip_box_time_prefix,
            style: TextStyle(
                color: R.colors.reversedTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w600)),
      ],
    );
  }

  String _getTimeStr(time) {
    if (time < 10) {
      return '0$time';
    }
    return time.toString();
  }
}

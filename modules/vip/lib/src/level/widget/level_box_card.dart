import 'package:vip/k.dart';
import 'dart:async';
import 'dart:ui';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/src/level/level_api.dart';
import 'package:vip/src/level/model/card_bean.dart';
import 'package:vip/src/level/widget/welfare_dialog.dart';
import 'package:shared/a.dart' as BaseA;

typedef RefreshMainData = Function();

class LevelBoxCard extends StatefulWidget {
  final CardDetailItem item;

  final double marginEnd;

  final double marginStart;

  final int index;

  final bool isVip;

  final int initPage;

  final double width;

  final double height;

  // 当前用户所在宝箱的id，
  final int currentCardId;

  final RefreshMainData? refresh;

  final CardData cardData;

  final double pageValue;

  const LevelBoxCard(
      {super.key,
      required this.item,
      this.marginEnd = 6.0,
      this.marginStart = 6.0,
      required this.index,
      required this.isVip,
      required this.initPage,
      required this.width,
      required this.height,
      required this.currentCardId,
      required this.cardData,
      required this.pageValue,
      this.refresh});

  @override
  _LevelBoxCardState createState() => _LevelBoxCardState();
}

class _LevelBoxCardState extends State<LevelBoxCard>
    with AutomaticKeepAliveClientMixin<LevelBoxCard> {
  final double _scaleFactor = 0.92;

  bool isExpanded = true;

  int _timeLeft = 0;

  static const _period = Duration(seconds: 1);

  Timer? _timer;

  List<ShopMailCommodity>? _replaceCommodity;
  bool _replaceOnPayed = false;

  int _initLeftTime = 0;

  // iOS webview（PlatformView）会把前一个页面的BackdropFilter效果透过来
  // 该控件所在的页面push了其他页面需要隐藏，其他页面pop到该页面再展示
  bool showBackdropFilter = true;
  Timer? showBackdropFilterTimer;

  @override
  void initState() {
    super.initState();

    eventCenter.addListener(
        EventConstant.EventWelfareReplace, _onReplaceMessageReceived);
    eventCenter.addListener("Navigator.Route.Push", _onNavigatorChanged);
    eventCenter.addListener("Navigator.Page.Pop", _onNavigatorChanged);
    _initLeftTime = widget.item.openTimeLeft;
    _timeLeft = _initLeftTime;
  }

  @override
  void didUpdateWidget(covariant LevelBoxCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_initLeftTime != widget.item.openTimeLeft) {
      setState(() {
        _initLeftTime = widget.item.openTimeLeft;
        _timeLeft = _initLeftTime;
      });
    }
  }

  @override
  void dispose() {
    eventCenter.removeListener(
        EventConstant.EventWelfareReplace, _onReplaceMessageReceived);
    eventCenter.removeListener("Navigator.Route.Push", _onNavigatorChanged);
    eventCenter.removeListener("Navigator.Page.Pop", _onNavigatorChanged);
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }

  _onNavigatorChanged(String type, dynamic data) {
    // iOS webview（PlatformView）会把前一个页面的BackdropFilter效果透过来
    if (data is String) {
      if (type == "Navigator.Route.Push" && data == 'MyLevelScreen') {
        cancelTimer();
        if (mounted) {
          setState(() {
            showBackdropFilter = false;
          });
        }
      } else if (type == "Navigator.Page.Pop" && data == 'MyLevelScreen') {
        if (showBackdropFilter == false && showBackdropFilterTimer == null) {
          showBackdropFilterTimer =
              Timer(const Duration(milliseconds: 500), () {
            cancelTimer();
            if (mounted) {
              setState(() {
                showBackdropFilter = true;
              });
            }
          });
        }
      }
    }
  }

  void cancelTimer() {
    showBackdropFilterTimer?.cancel();
    showBackdropFilterTimer = null;
  }

  // 处在当前档位
  bool get _isCurrent => widget.item.cardId == widget.currentCardId;

  // 处在过去档位
  bool get _isPrevious => widget.item.cardId < widget.currentCardId;

  // 处在未来档位
  bool get _isNext => widget.item.cardId > widget.currentCardId;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _buildBoxItem(widget.index);
  }

  Widget _buildBoxItem(int index) {
    Matrix4 matrix4 = Matrix4.identity();
    if (index == widget.pageValue.floor()) {
      //当前的item
      var currScale = 1 - (widget.pageValue - index) * (1 - _scaleFactor);
      var currTrans = widget.height * (1 - currScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    } else if (index == widget.pageValue.floor() + 1) {
      //右边的item
      var currScale =
          _scaleFactor + (widget.pageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = widget.height * (1 - currScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    } else if (index == widget.pageValue.floor() - 1) {
      //左边
      var currScale = 1 - (widget.pageValue - index) * (1 - _scaleFactor);
      var currTrans = widget.height * (1 - currScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    } else {
      //其他，不在屏幕显示的item
      matrix4 = Matrix4.diagonal3Values(1.0, _scaleFactor, 1.0)
        ..setTranslationRaw(0.0, widget.height * (1 - _scaleFactor) / 2, 0.0);
    }

    return Transform(
      transform: matrix4,
      child: SizedBox(
        height: widget.height + 20,
        child: Stack(
          children: [
            if (showBackdropFilter)
              PositionedDirectional(
                  bottom: 16, start: 20, child: _buildShadow()),
            if (showBackdropFilter)
              PositionedDirectional(
                  bottom: 0, start: 10, child: _buildImageFilter()),
            _buildCard(),
          ],
        ),
      ),
    );
  }

  Container _buildCard() {
    double boxWidth = Util.width * 0.38;

    Map<String, dynamic> map = _getBtnText();
    String btnText = Util.parseStr(map['text']) ?? '';
    GestureTapCallback? onTap = map['onTap'];
    List<Color> colors = map['colors'];
    String icon = Util.parseStr(map['icon']) ?? '';

    String? tipsText = _getTipsText();

    return Container(
      margin: EdgeInsetsDirectional.only(
          end: widget.marginEnd, start: widget.marginStart),
      width: widget.width,
      height: widget.height,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          PositionedDirectional(
            top: 0,
            bottom: 0,
            start: 0,
            end: 0,
            child: CachedNetworkImage(
              imageUrl: widget.item.cardBg,
              fit: BoxFit.fill,
            ),
          ),
          PositionedDirectional(top: 0, start: 0, child: _buildNameImg()),
          PositionedDirectional(
            top: 0,
            child: CachedNetworkImage(
                imageUrl: widget.item.cardBoxImg,
                width: boxWidth,
                height: boxWidth),
          ),
          PositionedDirectional(
            top: boxWidth - (!Util.isStringEmpty(tipsText) ? 15 : 0),
            child: Column(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: onTap,
                    child: _buildMainButton(colors, btnText, icon),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                if (!Util.isStringEmpty(tipsText))
                  Text(
                    tipsText!,
                    style: TextStyle(
                        color: Util.parseColor(widget.item.cardTextColor),
                        fontSize: 13),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildMainButton(List<Color> colors, String btnText, String icon) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      height: 44,
      constraints: const BoxConstraints(minWidth: 200),
      decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              btnText,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            if (!Util.isStringEmpty(icon)) ...[
              const SizedBox(
                width: 14,
              ),
              R.img(icon,
                  color: Colors.white,
                  width: 20,
                  height: 20,
                  package: ComponentManager.MANAGER_VIP)
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildNameImg() {
    return CachedNetworkImage(
      imageUrl: widget.item.cardTagImg,
      width: 80,
      height: 23,
    );
  }

  Widget _buildShadow() {
    return Container(
      width: widget.width - 40,
      height: widget.height / 2,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        // color: endColor.withOpacity(0.7),
        gradient: LinearGradient(
          begin: AlignmentDirectional.bottomStart,
          end: AlignmentDirectional.topEnd,
          colors: [
            (Util.parseColor(widget.item.shadowColor) ?? Colors.transparent)
                .withOpacity(0.3),
            (Util.parseColor(widget.item.shadowColor) ?? Colors.transparent)
                .withOpacity(0.3)
          ],
        ),
      ),
    );
  }

  Widget _buildImageFilter() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
        child: Container(
          width: widget.width - 20,
          height: widget.height / 2 + 30,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            color: (Util.parseColor(widget.item.cardTextColor) ??
                    Colors.transparent)
                .withOpacity(0.0),
          ),
        ),
      ),
    );
  }

  Map<String, dynamic> _getBtnText() {
    String text = '';
    GestureTapCallback? onTap;
    List<Color> colors = [const Color(0xFFFFDE77), const Color(0xFFFF973A)];
    String? icon;
    CardDetailItem item = widget.item;
    if (_isCurrent) {
      if (item.unOpenNum > 0) {
        // 当前档位有未开启的l
        //text = '立即开启${item.unOpenNum}个';
        text = K.vip_open_now_count(['${item.unOpenNum}']);
        onTap = _openNow;
      } else if (_timeLeft > 0) {
        // // 当前档位下次开启时间
        Map<String, int> map = Utility.timeDistanceV2(_timeLeft);
        String hour = _formatTimeStr(Util.parseInt(map['hour']));
        String min = _formatTimeStr(Util.parseInt(map['min']));
        String sec = _formatTimeStr(Util.parseInt(map['sec']));
        //text = '$hour:$min:$sec后可开启';
        text = K.vip_time_diff_can_open([hour, min, sec]);
        onTap = _unlockBox;
        icon = 'vip_ic_note.svg';
        colors = [const Color(0xFFFFB2C3), const Color(0xFFFF5F7D)];
        _initTimer();
      } else {
        text = K.vip_get_precious_box;
        onTap = _buyBox;
      }
    } else if (_isPrevious) {
      if (item.unOpenNum > 0) {
        text = K.vip_open_now_count(['${item.unOpenNum}']);
        onTap = _openNow;
      } else {
        text = K.vip_receive_over;
        colors = [Colors.white.withOpacity(0.4), Colors.white.withOpacity(0.4)];
        onTap = () {};
      }
    } else if (_isNext) {
      text = widget.isVip
          ? K.vip_vip_update_can_receive(['${item.needLevel}', item.cardName])
          : K.vip_popular_update_can_receive(
              ['${item.needLevel}', item.cardName]);
      onTap = _openIntroductionPage;
      colors = [const Color(0xFFFFD0A5), const Color(0xFFFF5E3A)];
    }
    return {'text': text, 'onTap': onTap, 'colors': colors, 'icon': icon};
  }

  //立即开启
  void _openNow() async {
    LotteryBoxResp resp = await LevelApi.getLotteryBox(widget.item.cardId,
        widget.isVip ? 'vip' : 'popular', widget.item.unOpenNum);
    if (resp.success == true) {
      await WelfareDialog.showWelfareDialog(
          title: K.vip_congratulations_you,
          content: K.vip_welfare_get_content,
          items: resp.data!.list,
          barrierDismissible: false);
      if (widget.refresh != null) {
        widget.refresh!();
      }

      if (_isCurrent && widget.cardData.info!.regotNum > 0) {
        String name = widget.cardData.list
            .firstWhere(
                (element) => element.cardId == widget.cardData.info!.cardId)
            .cardName;

        _showDialog(
            title: K.vip_regot_open_box,
            tips: K.vip_regot_open_box_desc(
                [widget.cardData.info!.regotNum.toString(), name]),
            btn1Text: K.vip_regot_open_box_buy_new([
              MoneyConfig.originPrice1(widget.cardData.info!.regotPrice),
              widget.cardData.info!.regotNum.toString(),
              name
            ]),
            btn1Tap: () {
              Navigator.of(context).pop();
              regotPay();
            },
            btn2Text: K.vip_give_up_get,
            btn2Tap: () {
              LevelApi.giveupRegot(widget.cardData.info!.cardId,
                  widget.isVip ? 'vip' : 'popular');
              Navigator.of(context).pop();
            },
            btn2Colors: [const Color(0xFFD9DDE6), const Color(0xFFBFC2C8)]);
      }
    } else {
      Fluttertoast.showToast(msg: resp.msg, gravity: ToastGravity.CENTER);
    }
  }

  // 解锁宝箱
  void _unlockBox() {
    Map<String, int> map = Utility.timeDistanceV2(_timeLeft);
    String hour = _formatTimeStr(Util.parseInt(map['hour']));
    String min = _formatTimeStr(Util.parseInt(map['min']));
    String sec = _formatTimeStr(Util.parseInt(map['sec']));

    int level = widget.cardData.info!.nextLevel;
    int count = widget.cardData.info!.ungetCardNum;

    String name = widget.cardData.list
        .firstWhere((element) => element.cardId == widget.cardData.info!.cardId)
        .cardName;

    //String text = '$hour:$min:$sec之后解锁下一个宝箱，立即升级到xx级即可立即解锁x个x宝箱';
    String text =
        K.vip_un_lock_box_tips([hour, min, sec, '$level', '$count', name]);

    _showDialog(
        title: K.vip_unlock_box,
        tips: text,
        btn1Text: K.vip_confirm_know,
        btn1Tap: () {
          Navigator.of(context).pop();
        });
  }

  // 获取宝箱
  void _buyBox() {
    /// 当前级别
    String price = MoneyConfig.originPrice1(widget.cardData.info!.renewalPrice);
    String name = widget.cardData.list
        .firstWhere((element) => element.cardId == widget.cardData.info!.cardId)
        .cardName;

    /// 下一个级别
    String num = widget.cardData.info!.nextCardNum.toString();
    String level = widget.cardData.info!.nextLevel.toString();
    String boxName = widget.cardData.list
        .firstWhere(
            (element) => element.cardId == widget.cardData.info!.nextCardId)
        .cardName;

    _showDialog(
        title: K.vip_get_precious_box,
        tips: K.vip_buy_box_tips_new([price, name, level, num, boxName]),
        btn1Text: K.vip_buy_now,
        btn1Tap: () {
          Navigator.of(context).pop();
          renewal();
        },
        btn2Text: K.vip_go_update_level,
        btn2Tap: () {
          Navigator.of(context).pop();
          _openIntroductionPage();
        },
        btn2Colors: [const Color(0xFFFFB2C3), const Color(0xFFFF5F7D)]);
  }

  // 续费
  void renewal() async {
    IPayManager payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    SheetCallback? result = await payManager.showRechargeSheet(
        context, widget.cardData.info!.renewalPrice);
    if (result == null ||
        result.reason == SheetCloseReason.Active ||
        result.value?.key == IPayManager.pTRecharge) {
      return;
    }

    payManager.pay(
      context,
      key: 'benefit-card-renewal',
      type: result.value?.key ?? '',
      refer: 'benefit-card-renewal',
      args: {
        'money': widget.cardData.info!.renewalPrice,
        'type': 'benefit-card',
        'params': {
          'op_type': 'renewal',
          'card_id': '${widget.cardData.info!.cardId}',
          'card_type': widget.isVip ? 'vip' : 'popular',
          'card_version': '${widget.cardData.info!.version}',
          'uid': Session.uid,
        }
      },
      onPayed: () {
        //_loadData();
        widget.refresh?.call();

        Tracker.instance.track(TrackEvent.renew_card, properties: {
          'type': widget.isVip ? 'vip' : 'popularity',
          'user_level': widget.cardData.info!.level,
          'card_level':
              BaseA.A.vip_welfare_card_array[widget.cardData.info!.cardId - 1],
        });
      },
      onError: (bool isErrorCatch) {},
    );
  }

  void regotPay() async {
    // 支付
    IPayManager payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    SheetCallback? result = await payManager.showRechargeSheet(
        context, widget.cardData.info!.regotPrice);
    if (result == null ||
        result.reason == SheetCloseReason.Active ||
        result.value?.key == IPayManager.pTRecharge) {
      return;
    }

    _replaceOnPayed = false;
    _replaceCommodity = null;

    payManager.pay(
      context,
      key: 'benefit-card-regot',
      type: result.value?.key ?? '',
      refer: 'benefit-card-regot',
      args: {
        'money': widget.cardData.info!.regotPrice,
        'type': 'benefit-card',
        'params': {
          'op_type': 'regot',
          'card_id': '${widget.cardData.info!.cardId}',
          'card_type': widget.isVip ? 'vip' : 'popular',
          'card_version': '${widget.cardData.info!.version}',
          'uid': Session.uid,
          'date': widget.cardData.info!.regotDates,
        }
      },
      onPayed: () {
        Tracker.instance.track(TrackEvent.make_up_welfare, properties: {
          'type': widget.isVip ? 'vip' : 'popularity',
          'user_level': widget.cardData.info!.level,
          'card_level':
              BaseA.A.vip_welfare_card_array[widget.cardData.info!.cardId - 1],
        });

        // 补领成功后处理,刷新界面，弹窗监听socket
        if (mounted) {
          widget.refresh?.call();
          setState(() {
            _replaceOnPayed = true;
            if (_replaceCommodity != null) {
              showReplaceDialog();
            }
            //data.dayGotStatus = 1;
          });
        }
      },
      onError: (bool isErrorCatch) {},
    );
  }

  void _onReplaceMessageReceived(String name, dynamic value) async {
    try {
      Map<String, dynamic> data = Map<String, dynamic>.from(value as Map);
      String? cardType = Util.parseStr(data['card_type']);
      String? msg = Util.parseStr(data['msg']);

      if (cardType == (widget.isVip ? 'vip' : 'popular')) {
        if (msg != null && msg.isNotEmpty) {
          Fluttertoast.showToast(msg: msg);
        } else {
          _replaceCommodity = Util.parseList(data['list'],
              (e) => ShopMailCommodity.fromJson(Map<String, dynamic>.from(e)));

          if (_replaceOnPayed) {
            showReplaceDialog();
          }
        }
      }
    } catch (e) {
      Log.d(e);
    }
  }

  void showReplaceDialog() {
    if (_replaceCommodity == null || _replaceCommodity!.isEmpty) {
      return;
    }
    WelfareDialog.showWelfareDialog(
      title: K.vip_welfare_get_title,
      content: K.vip_welfare_get_content,
      confirm: K.vip_confirm_know,
      items: _replaceCommodity,
      confirmPress: null,
    );

    _replaceCommodity = null;
  }

  void _showDialog(
      {required String title,
      required String tips,
      required String btn1Text,
      String? btn2Text,
      required GestureTapCallback btn1Tap,
      GestureTapCallback? btn2Tap,
      List<Color>? btn2Colors}) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => Center(
              child: Container(
                width: Util.width - 64,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadiusDirectional.all(Radius.circular(12))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                          color: Color(0xFF313131),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding:
                          const EdgeInsetsDirectional.only(start: 24, end: 24),
                      child: Text(
                        tips,
                        style: TextStyle(
                            color: const Color(0xFF313131).withOpacity(0.6),
                            fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    GestureDetector(
                      onTap: btn1Tap,
                      child: Container(
                        height: 48,
                        width: 232,
                        decoration: const ShapeDecoration(
                            shape: StadiumBorder(),
                            gradient: LinearGradient(
                                colors: [Color(0xFFFFDE77), Color(0xFFFF973A)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                        child: Center(
                          child: Text(
                            btn1Text,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    if (!Util.isStringEmpty(btn2Text)) ...[
                      const SizedBox(
                        height: 12,
                      ),
                      GestureDetector(
                        onTap: btn2Tap,
                        child: Container(
                          height: 48,
                          width: 232,
                          decoration: ShapeDecoration(
                              shape: const StadiumBorder(),
                              gradient: LinearGradient(
                                  colors: Util.isCollectionEmpty(btn2Colors)
                                      ? [
                                          const Color(0xFFFFDE77),
                                          const Color(0xFFFF973A)
                                        ]
                                      : btn2Colors!,
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)),
                          child: Center(
                            child: Text(
                              btn2Text!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      )
                    ],
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ));
  }

  void _openIntroductionPage() {
    String url = widget.isVip ? 'vipQA' : 'popularityQA';
    BaseWebviewScreen.show(context,
        url: Util.getPageUrlQA(url), title: K.explain);
  }

  String _formatTimeStr(int n) {
    return n < 10 ? '0$n' : '$n';
  }

  void _initTimer() {
    _timer ??= Timer.periodic(_period, _onTimer);
  }

  void _onTimer(Timer timer) {
    if (mounted) {
      _timeLeft = _timeLeft - 1;
      if (_timeLeft == 0) {
        _timer!.cancel();
        if (widget.refresh != null) {
          widget.refresh!();
        }
      }
      setState(() {});
    }
  }

  String? _getTipsText() {
    int num = widget.item.lockedNum;
    return num > 0
        ? K.vip_unlock_count_left(['$num', widget.item.cardName])
        : null;
  }

  @override
  bool get wantKeepAlive => true;
}

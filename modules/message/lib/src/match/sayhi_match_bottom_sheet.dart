import 'package:shared/shared.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:message/src/api/api.dart';
import 'package:message/src/widget/sayhi_toast.dart';
import 'package:message/src/model/nearby_match_request_list_data.dart';

import '../../k.dart';

class SayhiMatchBottomSheet extends StatefulWidget {
  final int remainNum;
  final int notificationCount;
  final bool hideTitle;
  final bool hideBg;
  final Color? centerTextColor;
  final Color? userNameColor;
  final double? deltaHeight;

  const SayhiMatchBottomSheet({
    super.key,
    this.remainNum = 0,
    this.notificationCount = 0,
    this.hideTitle = false,
    this.hideBg = false,
    this.centerTextColor,
    this.userNameColor,
    this.deltaHeight,
  });

  @override
  _SayhiMatchBottomSheetState createState() => _SayhiMatchBottomSheetState();

  static Future<void> show(
      BuildContext context, int remainNum, int newMatchRequestNum) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(20),
            topEnd: Radius.circular(20),
          ),
        ),
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return SayhiMatchBottomSheet(
              remainNum: remainNum, notificationCount: newMatchRequestNum);
        });
  }
}

class _SayhiMatchBottomSheetState extends State<SayhiMatchBottomSheet>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;
  late AnimationController _controller4;
  late AnimationController _controller5;
  late AnimationController _controller6;
  late AnimationController _controller7;
  late AnimationController _controller8;
  late AnimationController _controller9;
  late AnimationController _controller10;
  late AnimationController _controller11;
  late AnimationController _controller12;
  late AnimationController _persistScaleAnimController;
  late AnimationController _clickScaleUpAnimController;
  late AnimationController _clickScaleDownAnimController;
  late AnimationController _rotateAnimController;
  late CurvedAnimation curve8;
  late CurvedAnimation curve9;
  late Animation<double> _moveAnimation1;
  late Animation<double> _moveAnimation2X;
  late Animation<double> _moveAnimation2Y;
  late Animation<double> _moveAnimation3X;
  late Animation<double> _moveAnimation3Y;
  late Animation<double> _moveAnimation4;
  late Animation<double> _moveAnimation5X;
  late Animation<double> _moveAnimation5Y;
  late Animation<double> _moveAnimation6X;
  late Animation<double> _moveAnimation6Y;
  late Animation<double> _dotAnimation1;
  late Animation<double> _dotAnimation2X;
  late Animation<double> _dotAnimation2Y;
  late Animation<double> _dotAnimation3X;
  late Animation<double> _dotAnimation3Y;
  late Animation<double> _dotAnimation4;
  late Animation<double> _dotAnimation5X;
  late Animation<double> _dotAnimation5Y;
  late Animation<double> _dotAnimation6X;
  late Animation<double> _dotAnimation6Y;
  late Animation<double> _alphaAnimation;

  late Animation<double> _persistScaleAnimation;
  late Animation<double> _rotateAnimation;
  Animation<double>? _clickScaleUpAnimation;
  Animation<double>? _clickScaleDownAnimation;

  List<SayhiMatchModel> datas = [];
  final List<int> _selectedUids = [];
  final List<int> _viewUids = [];
  double _rotation = 0;

  int _remainNum = 0;

  int _page = 1;

  static double headContainerWidth = 117.0;
  static double deltaHeight = 40 * Util.ratio;

  // int _notificationCount; //海外打招呼界面右上角有匹配的请求数显示 快乐星球没有

  bool _showTeammateFirstGuide = false; //皮队友首次时显示点击打招呼的向导动画

  @override
  void initState() {
    super.initState();

    _remainNum = widget.remainNum;
    // _notificationCount = widget.notificationCount;
    deltaHeight = widget.deltaHeight ?? deltaHeight;
    _initAnimation();
    _persistScaleAnimController.forward();
    _load();
  }

  void _load() async {
    try {
      SayhiMatchRsp rsp = await Api.getMatchedUsers(_page);

      // Log.d('SayhiMatchRsp' + rsp.data.length.toString());
      if (rsp.success == false) {
        return;
      }

      datas = rsp.data ?? [];
      _remainNum = rsp.remainTime;
      eventCenter.emit('sayhi.match.remain.refresh', _remainNum);
      if (datas.length >= 6) {
        _selectedUids.clear();
        _viewUids.clear();

        for (int i = 0; i < datas.length; i++) {
          int uid = datas[i].uid;

          _selectedUids.add(uid);
          _viewUids.add(uid);

          Tracker.instance.track(TrackEvent.match_exposure, properties: {
            'to_uid': uid,
            'position': i,
          });
        }

        _page++;

        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          _playInitialHeadAnim();
        });
      }
    } catch (e) {
      Log.d(e.toString());
    }
  }

  void _initAnimation() {
    _controller1 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 280));
    _controller2 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 280));
    _controller3 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 280));
    _controller4 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 280));
    _controller5 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 280));
    _controller6 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 280));
    _controller7 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _controller8 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _controller9 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _controller10 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _controller11 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _controller12 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _clickScaleDownAnimController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    _clickScaleUpAnimController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _persistScaleAnimController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _rotateAnimController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));

    final CurvedAnimation curve1 =
        CurvedAnimation(parent: _controller1, curve: Curves.easeOutBack);
    final CurvedAnimation curve2 =
        CurvedAnimation(parent: _controller2, curve: Curves.easeOutBack);
    final CurvedAnimation curve3 =
        CurvedAnimation(parent: _controller3, curve: Curves.easeOutBack);
    final CurvedAnimation curve4 =
        CurvedAnimation(parent: _controller4, curve: Curves.easeOutBack);
    final CurvedAnimation curve5 =
        CurvedAnimation(parent: _controller5, curve: Curves.easeOutBack);
    final CurvedAnimation curve6 =
        CurvedAnimation(parent: _controller6, curve: Curves.easeOutBack);
    final CurvedAnimation curve7 = CurvedAnimation(
        parent: _persistScaleAnimController, curve: Curves.easeOutQuad);
    final CurvedAnimation curve10 = CurvedAnimation(
        parent: _rotateAnimController, curve: Curves.easeOutQuad);
    final CurvedAnimation curve11 =
        CurvedAnimation(parent: _controller7, curve: Curves.easeOutCubic);
    final CurvedAnimation curve12 =
        CurvedAnimation(parent: _controller8, curve: Curves.easeOutCubic);
    final CurvedAnimation curve13 =
        CurvedAnimation(parent: _controller9, curve: Curves.easeOutCubic);
    final CurvedAnimation curve14 =
        CurvedAnimation(parent: _controller10, curve: Curves.easeOutCubic);
    final CurvedAnimation curve15 =
        CurvedAnimation(parent: _controller11, curve: Curves.easeOutCubic);
    final CurvedAnimation curve16 =
        CurvedAnimation(parent: _controller12, curve: Curves.easeOutCubic);
    curve8 = CurvedAnimation(
        parent: _clickScaleDownAnimController, curve: Curves.easeOutQuad);
    curve9 = CurvedAnimation(
        parent: _clickScaleUpAnimController, curve: Curves.easeOutQuad);

    _alphaAnimation = Tween(begin: 0.0, end: 1.0).animate(curve1)
      ..addListener(() {
        _refresh();
      });
    _moveAnimation1 = Tween(begin: 250.0 + deltaHeight, end: 85.0 + deltaHeight)
        .animate(curve1)
      ..addListener(() {
        _refresh();
      });
    _moveAnimation2Y =
        Tween(begin: 250.0 + deltaHeight, end: 160.0 + deltaHeight)
            .animate(curve2)
          ..addListener(() {
            _refresh();
          });
    _moveAnimation2X = Tween(
            begin: Util.width / 2 - headContainerWidth / 2,
            end: Util.width / 2 - 195 < 5.0 ? 5.0 : Util.width / 2 - 195)
        .animate(curve2)
      ..addListener(() {
        _refresh();
      });
    _moveAnimation3Y =
        Tween(begin: 250.0 + deltaHeight, end: 330.0 + deltaHeight)
            .animate(curve3)
          ..addListener(() {
            _refresh();
          });
    _moveAnimation3X = Tween(
            begin: Util.width / 2 - headContainerWidth / 2,
            end: Util.width / 2 - 195 < 5.0 ? 5.0 : Util.width / 2 - 195)
        .animate(curve3)
      ..addListener(() {
        _refresh();
      });
    _moveAnimation4 =
        Tween(begin: 250.0 + deltaHeight, end: 395.0 + deltaHeight)
            .animate(curve4)
          ..addListener(() {
            _refresh();
          });
    _moveAnimation5Y =
        Tween(begin: 250.0 + deltaHeight, end: 330.0 + deltaHeight)
            .animate(curve5)
          ..addListener(() {
            _refresh();
          });
    _moveAnimation5X = Tween(
            begin: Util.width / 2 - headContainerWidth / 2,
            end: Util.width / 2 - 195 < 5.0 ? 5.0 : Util.width / 2 - 195)
        .animate(curve5)
      ..addListener(() {
        _refresh();
      });
    _moveAnimation6Y =
        Tween(begin: 250.0 + deltaHeight, end: 160.0 + deltaHeight)
            .animate(curve6)
          ..addListener(() {
            _refresh();
          });
    _moveAnimation6X = Tween(
            begin: Util.width / 2 - headContainerWidth / 2,
            end: Util.width / 2 - 195 < 5.0 ? 5.0 : Util.width / 2 - 195)
        .animate(curve6)
      ..addListener(() {
        _refresh();
      });
    _dotAnimation1 = Tween(begin: 310.0 + deltaHeight, end: 124.0 + deltaHeight)
        .animate(curve11)
      ..addListener(() {
        _refresh();
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller7.reset();
        }
      });
    _dotAnimation2Y =
        Tween(begin: 310.0 + deltaHeight, end: 200.0 + deltaHeight)
            .animate(curve12)
          ..addListener(() {
            _refresh();
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller8.reset();
            }
          });
    _dotAnimation2X =
        Tween(begin: Util.width / 2 - 6, end: Util.width / 2 - 143)
            .animate(curve12)
          ..addListener(() {
            _refresh();
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller8.reset();
            }
          });
    _dotAnimation3Y =
        Tween(begin: 310.0 + deltaHeight, end: 366.0 + deltaHeight)
            .animate(curve13)
          ..addListener(() {
            _refresh();
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller9.reset();
            }
          });
    _dotAnimation3X =
        Tween(begin: Util.width / 2 - 6, end: Util.width / 2 - 143)
            .animate(curve13)
          ..addListener(() {
            _refresh();
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller9.reset();
            }
          });
    _dotAnimation4 = Tween(begin: 310.0 + deltaHeight, end: 434.0 + deltaHeight)
        .animate(curve14)
      ..addListener(() {
        _refresh();
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller10.reset();
        }
      });
    _dotAnimation5Y =
        Tween(begin: 310.0 + deltaHeight, end: 370.0 + deltaHeight)
            .animate(curve15)
          ..addListener(() {
            _refresh();
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller11.reset();
            }
          });
    _dotAnimation5X =
        Tween(begin: Util.width / 2 - 6, end: Util.width / 2 - 143)
            .animate(curve15)
          ..addListener(() {
            _refresh();
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller11.reset();
            }
          });
    _dotAnimation6Y =
        Tween(begin: 310.0 + deltaHeight, end: 200.0 + deltaHeight)
            .animate(curve16)
          ..addListener(() {
            _refresh();
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller12.reset();
            }
          });
    _dotAnimation6X =
        Tween(begin: Util.width / 2 - 6, end: Util.width / 2 - 143)
            .animate(curve16)
          ..addListener(() {
            _refresh();
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller12.reset();
            }
          });

    _persistScaleAnimation = Tween(begin: 0.9, end: 1.0).animate(curve7)
      ..addListener(() {
        _refresh();
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _persistScaleAnimController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _persistScaleAnimController.forward();
        }
      });
    _rotateAnimation = Tween(end: 0.0, begin: math.pi / 2).animate(curve10)
      ..addListener(() {
        if (mounted) {
          setState(() {
            _rotation = _rotateAnimation.value;
          });
        }
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _rotateAnimController.reset();
          _rotation = 0.0;
        }
      });
  }

  void _playInitialHeadAnim() {
    Future.delayed(const Duration(milliseconds: 300), () {
      _controller1.forward();
    });
    Future.delayed(const Duration(milliseconds: 330), () {
      _controller2.forward();
    });
    Future.delayed(const Duration(milliseconds: 360), () {
      _controller3.forward();
    });
    Future.delayed(const Duration(milliseconds: 390), () {
      _controller4.forward();
    });
    Future.delayed(const Duration(milliseconds: 420), () {
      _controller5.forward();
    });
    Future.delayed(const Duration(milliseconds: 450), () {
      _controller6.forward();
    });
  }

  @override
  void dispose() {
    SayhiToast.hide();

    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _clickScaleDownAnimController.dispose();
    _clickScaleUpAnimController.dispose();
    _persistScaleAnimController.dispose();
    super.dispose();
  }

  _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    double bodyHeight = Util.isOnlyIphoneX
        ? (609 * Util.ratio + Util.iphoneXBottom)
        : 609 * Util.ratio;

    return SizedBox(
      width: Util.width,
      height: bodyHeight,
      child: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, _remainNum);
          return true;
        },
        child: Stack(
          children: [
            if (widget.hideBg == false)
              R.img('sayhi_match_bg.webp',
                  package: ComponentManager.MANAGER_MESSAGE,
                  width: Util.width,
                  height: bodyHeight,
                  fit: BoxFit.fill),
            if (widget.hideTitle == false)
              PositionedDirectional(
                top: 18,
                start: 14,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context, _remainNum);
                  },
                  child: R.img('sayhi_match_close.webp',
                      package: ComponentManager.MANAGER_MESSAGE,
                      width: 28,
                      height: 28),
                ),
              ),
            if (widget.hideTitle == false)
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 16),
                child: Container(
                  width: Util.width,
                  alignment: AlignmentDirectional.center,
                  child: Column(
                    children: [
                      Text(
                        K.msg_sayhi_match,
                        style: TextStyle(
                            color: widget.userNameColor ?? Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            PositionedDirectional(
                top: 8,
                child: Container(
                  width: Util.width,
                  height: 43,
                  alignment: AlignmentDirectional.center,
                  child: const Column(
                    children: [
                      Text('', style: TextStyle()),
                      SizedBox(height: 2),
                      Text('', style: TextStyle()),
                    ],
                  ),
                )),
            if (datas.length >= 6) ...[
              PositionedDirectional(
                  top: _moveAnimation1.value,
                  start: (Util.width - headContainerWidth) / 2,
                  child: _buildUserHead(datas[0])),
              PositionedDirectional(
                  top: _moveAnimation2Y.value,
                  end: _moveAnimation2X.value,
                  child: _buildUserHead(datas[1])),
              PositionedDirectional(
                  top: _moveAnimation3Y.value,
                  end: _moveAnimation3X.value,
                  child: _buildUserHead(datas[2])),
              PositionedDirectional(
                  top: _moveAnimation4.value,
                  start: (Util.width - headContainerWidth) / 2,
                  child: _buildUserHead(datas[3])),
              PositionedDirectional(
                  top: _moveAnimation5Y.value,
                  start: _moveAnimation5X.value,
                  child: _buildUserHead(datas[4])),
              PositionedDirectional(
                  top: _moveAnimation6Y.value,
                  start: _moveAnimation6X.value,
                  child: _buildUserHead(datas[5])),
            ],
            PositionedDirectional(
                top: 242 + deltaHeight,
                child: Container(
                  height: 132,
                  width: Util.width,
                  alignment: AlignmentDirectional.center,
                  child: GestureDetector(
                    onTap: () async {
                      if (_showTeammateFirstGuide) {
                        Config.set(
                            'show_teammate_first_click_match_guide', '0');
                        setState(() {
                          _showTeammateFirstGuide = false;
                        });
                      }

                      if (_remainNum == 0) {
                        Fluttertoast.showToast(
                            msg: K.msg_match_time_limit,
                            gravity: ToastGravity.CENTER);
                        return;
                      }

                      if (datas.length < 6) {
                        _load();
                        return;
                      }
                      ILoginManager loginManager = ComponentManager.instance
                          .getManager(ComponentManager.MANAGER_LOGIN);
                      await loginManager.showCompleteInfoWidget(context);

                      try {
                        BaseResponse response = await Api.matchBatchSend(
                            viewuids: (_viewUids.isNotEmpty
                                ? _viewUids.join(',')
                                : ''),
                            touids: (_selectedUids.isNotEmpty
                                ? _selectedUids.join(',')
                                : ''));
                        if (response.success == true) {
                          if (_selectedUids.isNotEmpty) {
                            Session.setSayhiMatchBrowseUids(_selectedUids);
                            SayhiToast.showToast(msg: K.msg_sayhi_has_sent);

                            for (var e in _selectedUids) {
                              int index = _viewUids.indexOf(e);

                              Tracker.instance
                                  .track(TrackEvent.match_click, properties: {
                                'to_uid': e,
                                'position': index,
                              });
                            }
                          }

                          SayhiMatchRsp sayhiMatchRsp =
                              await Api.getMatchedUsers(_page);

                          if (sayhiMatchRsp.success == true) {
                            _remainNum = sayhiMatchRsp.remainTime;
                            eventCenter.emit(
                                'sayhi.match.remain.refresh', _remainNum);
                            List<SayhiMatchModel> newDatas =
                                sayhiMatchRsp.data ?? [];
                            _selectedUids.clear();
                            _viewUids.clear();

                            for (int i = 0; i < newDatas.length; i++) {
                              int uid = newDatas[i].uid;

                              _selectedUids.add(uid);
                              _viewUids.add(uid);

                              Tracker.instance.track(TrackEvent.match_exposure,
                                  properties: {
                                    'to_uid': uid,
                                    'position': i,
                                  });
                            }

                            datas = newDatas;
                            _page++;
                            _playClickAnim();
                          } else {
                            if (mounted) setState(() {});
                          }
                        } else {
                          Fluttertoast.showToast(
                              msg: response.msg, gravity: ToastGravity.CENTER);
                        }
                      } catch (e) {
                        Fluttertoast.showToast(
                            msg: e.toString(), gravity: ToastGravity.CENTER);
                      }
                    },
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Container(
                          padding: EdgeInsetsDirectional.only(
                              top: _getSayhiButtonSize(45.0),
                              start: 40.0,
                              end: 40.0,
                              bottom: 0.0),
                          width: _getSayhiButtonSize(132.0),
                          height: _getSayhiButtonSize(132.0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(R.imagePath(
                                  "sayhi_big_icon.webp",
                                  package: ComponentManager.MANAGER_MESSAGE)),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              K.msg_sayhi_match_remain_num(
                                  [_remainNum.toString()]),
                              style: TextStyle(
                                  color: widget.centerTextColor ??
                                      const Color(0XFFFF6AA1),
                                  fontSize: 11.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            if (_controller7.isAnimating)
              PositionedDirectional(
                  top: _dotAnimation1.value,
                  start: (Util.width - 12) / 2,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color(0xFFFFED4F),
                    ),
                  )),
            if (_controller8.isAnimating)
              PositionedDirectional(
                  top: _dotAnimation2Y.value,
                  end: _dotAnimation2X.value,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color(0xFF9EA8FF),
                    ),
                  )),
            if (_controller9.isAnimating)
              PositionedDirectional(
                  top: _dotAnimation3Y.value,
                  end: _dotAnimation3X.value,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color(0xFFFF88CF),
                    ),
                  )),
            if (_controller10.isAnimating)
              PositionedDirectional(
                  top: _dotAnimation4.value,
                  start: (Util.width - 12) / 2,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color(0xFF9DFF82),
                    ),
                  )),
            if (_controller11.isAnimating)
              PositionedDirectional(
                  top: _dotAnimation5Y.value,
                  start: _dotAnimation5X.value,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color(0xFFFFD080),
                    ),
                  )),
            if (_controller12.isAnimating)
              PositionedDirectional(
                  top: _dotAnimation6Y.value,
                  start: _dotAnimation6X.value,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color(0xFF90E2FF),
                    ),
                  )),
            if (_showTeammateFirstGuide)
              PositionedDirectional(
                top: 242 + deltaHeight,
                start: Util.width / 2 - 66,
                child: IgnorePointer(
                  child: Container(
                    width: 132,
                    height: 148,
                    alignment: AlignmentDirectional.bottomEnd,
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: MultiframeImage.asset(
                        'home/match_first_guide.webp',
                        loop: true,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  double _getSayhiButtonSize(double size) {
    if (_clickScaleUpAnimation != null &&
        _clickScaleUpAnimController.isAnimating) {
      return _clickScaleUpAnimation!.value * size;
    } else if (_clickScaleDownAnimation != null &&
        _clickScaleDownAnimController.isAnimating) {
      return _clickScaleDownAnimation!.value * size;
    }
    return size * _persistScaleAnimation.value;
  }

  double _buildOpacity() {
    if (_alphaAnimation.value > 1.0) {
      return 1.0;
    }

    if (_alphaAnimation.value < 0.0) {
      return 0.0;
    }
    return _alphaAnimation.value;
  }

  Widget _buildUserHead(SayhiMatchModel data) {
    bool selected = _selectedUids.contains(data.uid);

    return Opacity(
      opacity: _buildOpacity(),
      child: Container(
        width: headContainerWidth,
        alignment: AlignmentDirectional.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    IPersonalDataManager manager = ComponentManager.instance
                        .getManager(ComponentManager.MANAGER_PERSONALDATA);
                    manager.openImageScreen(context, data.uid,
                        fromSayHiMatch: true,
                        refer: const PageRefer('/sayhi_match_bottom_sheet'));
                  },
                  child: Transform(
                    transform: Matrix4.rotationY(_getRotation()),
                    alignment: AlignmentDirectional.center,
                    child: Container(
                      height: 92,
                      width: 92,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(46),
                      ),
                      child: CommonAvatar(
                        path: data.head,
                        size: 84,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                if (!_rotateAnimController.isAnimating && data.rid > 0)
                  PositionedDirectional(
                      end: 6,
                      bottom: 6,
                      child: Container(
                        width: 18,
                        height: 18,
                        alignment: AlignmentDirectional.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          gradient: const LinearGradient(
                            colors: [Color(0XFF17D9E2), Color(0XFF4FF47E)],
                            begin: AlignmentDirectional.centerStart,
                            end: AlignmentDirectional.centerEnd,
                          ),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: R.img('avatar_in_room.webp',
                            package: ComponentManager.MANAGER_BASE_CORE,
                            width: 8,
                            height: 8),
                      )),
              ],
            ),
            if (!_rotateAnimController.isAnimating)
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  setState(() {
                    if (selected) {
                      _selectedUids.remove(data.uid);
                    } else {
                      _selectedUids.add(data.uid);
                    }
                    setState(() {});
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 0),
                  child: SizedBox(
                    width: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        R.img(
                            selected
                                ? 'sayhi_match_select.webp'
                                : 'sayhi_match_unselect.webp',
                            package: ComponentManager.MANAGER_MESSAGE,
                            width: 14,
                            height: 14),
                        const SizedBox(
                          width: 4,
                        ),
                        Flexible(
                          child: Text(
                            data.name ?? '',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              color: widget.userNameColor ?? Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (!_rotateAnimController.isAnimating)
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  setState(() {
                    if (selected) {
                      _selectedUids.remove(data.uid);
                    } else {
                      _selectedUids.add(data.uid);
                    }
                    setState(() {});
                  });
                },
                child: Container(
                  height: 40,
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      R.img('sayhi_match_location.webp',
                          package: ComponentManager.MANAGER_MESSAGE,
                          width: 15,
                          height: 15),
                      Text(
                        data.distance ?? '',
                        style: TextStyle(
                            color: (widget.userNameColor ?? Colors.white)
                                .withOpacity(0.6),
                            fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  double _getRotation() {
    return _rotation;
  }

  void _playClickAnim() {
    if (!mounted) return;
    _persistScaleAnimController.stop();
    _clickScaleDownAnimation =
        Tween(begin: _persistScaleAnimation.value, end: 0.5).animate(curve8)
          ..addListener(() {
            _refresh();
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _clickScaleUpAnimation =
                  Tween(begin: 0.5, end: 1.0).animate(curve9)
                    ..addListener(() {
                      _refresh();
                    })
                    ..addStatusListener((status) {
                      if (status == AnimationStatus.completed) {
                        _persistScaleAnimController.forward();
                        _clickScaleUpAnimController.reset();
                        _clickScaleDownAnimController.reset();
                      }
                    });
              _clickScaleUpAnimController.forward();

              _playDotAnimation();
            }
          });
    _clickScaleDownAnimController.forward();
    setState(() {
      _rotation = math.pi / 2;
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _rotateAnimController.forward();
    });
  }

  void _playDotAnimation() {
    _controller7.forward();
    _controller8.forward();
    _controller9.forward();
    _controller10.forward();
    _controller11.forward();
    _controller12.forward();
  }
}

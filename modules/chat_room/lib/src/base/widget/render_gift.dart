import 'dart:async';

import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/model/public_screen_enhancement_model.dart';
import 'package:chat_room/src/base/widget/controller_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/shared.dart';

class RenderGift extends StatefulWidget {
  final ChatRoomData room;
  final double? size;
  final bool? isStatic;

  const RenderGift({Key? key, required this.room, this.size, this.isStatic}) : super(key: key);

  @override
  _RenderGiftState createState() => _RenderGiftState();
}

class _RenderGiftState extends State<RenderGift> with TickerProviderStateMixin {
  final GlobalKey _key = GlobalKey();
  final IGiftManager _giftManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);

  bool _isHeart = true; //默认提示赠送小心心，false的时候是棒棒糖
  bool _hasShowGift = false;
  bool _hasSendGift = false; //本次进房是否送成功过礼物

  bool _showedNewerComingGiftTips = false; // 是否显示过萌新驾到tips
  late AnimationController _controller;
  late Animation<double> _animation;
  late AnimationController _heartController;
  late Animation<double> _heartAnimation;

  int _giftType = 1; //0 默认的，1,默认图标缩小，2小心心，棒棒糖放大 3,小心心，棒棒糖动画 同时上面文字动画显示出来

  Timer? _timer30;
  Timer? _timer5;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener('Gift.SendSuccess', _onSendGiftSuccess);
    eventCenter.addListener('Gift.click.close', _clickCloseGift);
    _initHeartGift();
    _initController();

    _showNewerComingGiftGuideTips();
  }

  void _initController() {
    _controller = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    _animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _controller.addStatusListener(_onAniStatus);

    _heartController = AnimationController(duration: const Duration(milliseconds: 5000), vsync: this);
    _heartAnimation = TweenSequence([TweenSequenceItem(tween: ConstantTween<double>(1.0), weight: 100)]).animate(_heartController);
    _heartController.addStatusListener(_onHeartAniStatus);
  }

  void _onAniStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      if (_giftType == 1 && !_hasShowGift) {
        // 进入第二阶段，小心心放大
        _onGiftImageChange(2);
      }
    } else if (status == AnimationStatus.dismissed) {
      if (_giftType == 2) {
        // 进入第三阶段
        _onGiftImageChange(3);
      }
    }
  }

  void _onHeartAniStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _hasShowGift = true;
      _onGiftImageChange(1);
      eventCenter.emit(
        'gift.show.guide',
        {
          'isShow': false,
          'isHeart': _isHeart,
          'offSize': null,
        },
      );
    }
  }

  /// 赠送小心心礼物
  _initHeartGift() {
    int res = Config.getInt('room.sendHeart.gift', 0);
    DateTime dateTime = DateTime.now();
    int day = dateTime.day;
    if (res == day) {
      return;
    }
    if (widget.room.limitTimes != null) {
      int heartTime = widget.room.limitTimes?.heart ?? 0;
      int curTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      if (curTime < heartTime) {
        /// 30秒后显示送小心心
        _timer30?.cancel();
        _timer30 = Timer(const Duration(seconds: 30), () {
          if (!mounted) return;
          Config.set('room.sendHeart.gift', '$day');
          if (_hasSendGift) return;
          _onGiftImageChange(1);
        });
      }
    }
  }

  Offset _getSizes() {
    if (_key.currentContext?.findRenderObject() != null) {
      final RenderBox renderBoxRed = _key.currentContext!.findRenderObject() as RenderBox;
      Offset offSize = renderBoxRed.localToGlobal(const Offset(0, 0));
      return offSize;
    }

    return Offset.zero;
  }

  void _showGuide() {
    Offset off = _getSizes();
    eventCenter.emit(
      'gift.show.guide',
      {
        'isShow': true,
        'isHeart': _isHeart,
        'offSize': off,
      },
    );
  }

  @override
  void dispose() {
    _timer30?.cancel();
    _timer5?.cancel();

    _controller.removeStatusListener(_onAniStatus);
    _controller.dispose();

    _heartController.removeStatusListener(_onHeartAniStatus);
    _heartController.dispose();
    eventCenter.removeListener('Gift.SendSuccess', _onSendGiftSuccess);
    eventCenter.removeListener('Gift.click.close', _clickCloseGift);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: _key,
      child: _getContent(),
    );
  }

  double get _size => widget.size ?? 32;

  Widget _getContent() {
    Log.d('_giftType = $_giftType');
    if (_giftType == 0) return _renderGift();
    if (_giftType == 1) {
      return ScaleTransition(
        scale: _animation,
        child: _renderGift(),
      );
    }
    if (_giftType == 2) {
      return ScaleTransition(
        scale: _animation,
        child: _renderGiftGuide(_isHeart, Colors.white12),
      );
    }

    if (_giftType == 3) {
      return Container(
        width: _size,
        height: _size,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.12),
        ),
        child: _renderGiftGuide(_isHeart, Colors.transparent),
      );
    }

    return const SizedBox.shrink();
  }

  /// 送礼引导图标，包括了棒棒糖或者小心心
  Widget _renderGiftGuide(bool isHeart, Color backgroundColor) {
    // 后台下发的giftIcon，
    String giftUrl = '';
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ScaleTransition(
          scale: _heartAnimation,
          child: ControllerIconButton(
            buttonText: isHeart ? 'gift_heart' : 'gift_lollipop',
            isNewStyle: true,
            normalIcon: isHeart ? 'room_heart.png' : 'room_lollipop.png',
            normalIconUrl: giftUrl,
            backgroundColor: backgroundColor,
            type: 'gift',
            iconShowRedPoint: false,
            onClick: (BuildContext context, bool selected) async {
              _sendHeartOrLollipop(isHeart ? 'heart' : 'lollipop');
            },
            onOpenBag: (BuildContext context) async {
              await _giftManager.showBagTabOnRoomGiftPanel(context, room: widget.room);
            },
          ),
        ),
      ],
    );
  }

  /// 默认礼物图标
  Widget _renderGift() {
    // 后台下发的giftIcon，首充
    String? giftUrl = widget.room.firstPayGift?.firstPayEntryShow == true ? widget.room.firstPayGift!.firstPayEntryIcon : null;
    Log.d('firstPayGift = $giftUrl');
    return ControllerIconButton(
      buttonText: 'gift',
      isNewStyle: true,
      isStatic: widget.isStatic,
      offset: 8,
      normalIcon:
          AppConfig.showGiftPack ? RoomAssets.chat_room$controller_ic_first_charge_webp : RoomAssets.chat_room$controller_ic_gift_webp,
      normalIconUrl: giftUrl,
      type: 'gift',
      onClick: (BuildContext context, bool selected) async {
        BubbleTips.hide();

        if (!Session.isLogined) {
          Fluttertoast.showToast(msg: K.room_dropped_relogin);
          return;
        }

        if (_showedNewerComingGiftTips) {
          await _giftManager.showBagTabOnRoomGiftPanel(context, room: widget.room, defaultId: NewbieComingId);
          return;
        }

        await _giftManager.showRoomGiftPanel(context, room: widget.room, mysteryPositions: []);
      },
      onOpenBag: (BuildContext context) async {
        await _giftManager.showBagTabOnRoomGiftPanel(context, room: widget.room);
      },
    );
  }

  /// 点击赠送小心心礼物或者棒棒糖
  void _sendHeartOrLollipop(String giftStr) async {
    Tracker.instance.track(TrackEvent.room_public_guide_click, properties: {
      'type': giftStr == 'heart' ? 'send_coin_gift' : 'send_normal_gift',
    });

    String url = '${System.domain}room/rcmdContent?rid=${widget.room.rid}&type=$giftStr&package=${Constant.packageName}';
    try {
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      Map res = response.value();
      Log.d('_sendHeartOrLollipop url = $url,res = $res');
      if (res['success'] == true) {
        PublicScreenEnhancementModel model = PublicScreenEnhancementModel.fromJson(res as Map<String, dynamic>);
        _sendGift(model.data?.cid ?? -1);
      }
    } catch (e) {
      _sendGift(-1);
      Log.d(e);
    }
  }

  /// 弹出礼物面板
  _sendGift(int cid) async {
    // 房间礼物面板
    IGiftManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
    List<int> mysteryPositions = [];
    await manager.showRoomGiftPanel(context, room: widget.room, defaultId: cid, mysteryPositions: mysteryPositions);
    _clickCloseGiftingGuide();
  }

  /// 点击消失
  _clickCloseGiftingGuide() {
    if (!mounted) return;
    _onGiftImageChange(0);
    if (_isHeart) {
      /// 当前关闭的是小心心，5秒后显示棒棒糖
      _timer5?.cancel();
      _timer5 = Timer(const Duration(seconds: 5), () {
        if (!mounted) return;
        _isHeart = false;
        _hasShowGift = false;
        _onGiftImageChange(1);

        Tracker.instance.track(TrackEvent.room_public_guide_show, properties: {
          'type': 'send_normal_gift',
        });
      });
    }
  }

  _clickCloseGift(String type, dynamic data) {
    _clickCloseGiftingGuide();
  }

  _onSendGiftSuccess(String type, dynamic data) {
    _hasSendGift = true;
  }

  _onGiftImageChange(int type) {
    _giftType = type;
    if (mounted) {
      if (_giftType == 0) {
        _controller.reset();
        _heartController.reset();
      }
      if (_giftType == 1) {
        if (_hasShowGift) {
          _controller.value = 1;
          _controller.reverse();
        } else {
          _controller.forward();
        }
      } else if (_giftType == 2) {
        _hasShowGift = true;
        _controller.reverse();
      } else if (_giftType == 3) {
        _showGuide();
        _heartController.forward();
      }
      setState(() {});
    }
  }

  /// 萌新驾到礼物赠送tips
  _showNewerComingGiftGuideTips() async {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted && widget.room.newbieGifts != null && widget.room.newbieGifts!.isNotEmpty) {
        Map? map = widget.room.newbieGifts!.firstWhereOrNull((element) => Util.parseInt(element['cid']) == NewbieComingId);

        if (map == null) return;

        int giftNum = Util.parseInt(map['num']);

        if (giftNum <= 0) return;

        String tipKey = 'room_newber_coming_gift_guide_${Utility.getToday()}';

        if (!TipsHelp.showTip(tipKey)) {
          //今日已弹过气泡
          return;
        }

        BubbleTips.hide();

        if (_key.currentContext?.findRenderObject() == null) {
          return;
        }

        RenderBox box = _key.currentContext?.findRenderObject() as RenderBox;
        Offset off = box.localToGlobal(Offset.zero);

        String content = '你还有 $giftNum 个萌新驾到未使用，点击背包赠送吧～🎉';
        double contentWidth = 210;

        double width = contentWidth;
        double height = 64.0;
        double bottom = Util.height - off.dy + box.size.height;
        double right = 16.0;
        double left = Util.width - width - right;
        double arrStartPosition = off.dx - left + 2;

        _showedNewerComingGiftTips = true;

        BubbleTips.showTips(context, content, width, height, BubbleDirection.bottom, arrStartPosition, bottom, left, right,
            duration: const Duration(seconds: 5),
            msgColor: Colors.white,
            gradientColors: [
              const Color(0xff10C8FF),
              const Color(0xff00DCA5),
            ]);

        TipsHelp.setTip(tipKey);
      }
    });
  }
}

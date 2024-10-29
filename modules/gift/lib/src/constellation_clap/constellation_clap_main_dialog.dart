import 'dart:io';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:gift/assets.dart';
import 'package:gift/src/constellation_clap/constellation_clap_repo.dart';
import 'package:gift/src/constellation_clap/constellation_clap_result_dialog.dart';
import 'package:gift/src/constellation_clap/pb/generated/zodiac.pb.dart';
import 'package:gift/src/constellation_clap/resource_manager.dart';

/// 星座拍拍主弹窗
class ConstellationClapMainDialog extends StatefulWidget {
  final ZodiacPopupData data;

  const ConstellationClapMainDialog(this.data, {super.key});

  static Future show(BuildContext context, {ZodiacPopupData? data}) async {
    await ResourceManager.precache();
    if (data == null) {
      final res = await ConstellationClapRepo.mainDialog();
      if (res.success && res.data.state == 2) {
        data = res.data;
      } else {
        Fluttertoast.showCenter(msg: res.message);
        return;
      }
    }

    return DialogTransition.scaleShow(
      context: context,
      barrierDismissible: false,
      builder: (context) => ConstellationClapMainDialog(data!),
    );
  }

  @override
  _ConstellationClapMainDialogState createState() =>
      _ConstellationClapMainDialogState();
}

enum _ClapState {
  init, //初始
  speed1, //点击拍后缓慢加速
  speed2, //缓慢加速后匀速加速
  slow, //拍到前的减速动画
  select, //拍到播放选中目标头像
}

class _ConstellationClapMainDialogState
    extends State<ConstellationClapMainDialog> with TickerProviderStateMixin {
  late AnimationController _pointerController;
  late Animation<double> _pointerAnim;

  AnimationController? _speedController;
  Animation<double>? _speedAnim;

  AnimationController? _speed2Controller;
  Animation<double>? _speed2Anim;

  AnimationController? _slowController;
  Animation<double>? _slowAnim;

  late AnimationController _wheelController;
  late Animation<double> _wheelAnim;

  late AnimationController _textController;
  late Animation<double> _textAnim;

  late AnimationController _lightCircleController;
  late Animation<double> _lightCircleAnim;

  _ClapState _clapState = _ClapState.init;

  final int _speedMinTime = 2000; //加速动画最少2秒
  int _speedStartTime = 0; //加速动画开始时的时间戳
  double _speedOffset = 0; //加速动画启动时的动画偏移

  int _destIndex = 0; //选中的目标主播，在弹窗时接口已经给了

  late ZodiacPaiResultData _resultData;

  @override
  void initState() {
    super.initState();
    Tracker.instance.track(TrackEvent.paipai_exposure, properties: {
      'uid': Session.uid,
      'gids': widget.data.popup.zodiacs.map((e) => e.spokesman.uid).join(',')
    });
    int index = widget.data.popup.zodiacs.indexWhere(
        (element) => element.spokesman.uid == widget.data.popup.toUid);
    if (index >= 0) {
      _destIndex = index;
    }
    _pointerController = AnimationController(
        duration: const Duration(milliseconds: 2600), vsync: this);
    _pointerAnim = Tween<double>(begin: 0, end: 1).animate(_pointerController);
    _pointerController.repeat();

    _wheelController = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);
    _wheelAnim = Tween<double>(begin: 0, end: -1).animate(_wheelController);
    _wheelController.repeat();

    _textController = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);
    _textAnim = Tween<double>(begin: 0, end: -1).animate(_textController);
    _textController.repeat();

    _lightCircleController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    _lightCircleAnim =
        Tween<double>(begin: 0, end: 1).animate(_lightCircleController);
    _lightCircleController.repeat();
  }

  @override
  void dispose() {
    _lightCircleController.dispose();
    _textController.dispose();
    _wheelController.dispose();
    _pointerController.dispose();
    _speedController?.dispose();
    _speed2Controller?.dispose();
    _slowController?.dispose();
    super.dispose();
  }

  Animation<double> _getActivePointerAnim() {
    if (_clapState == _ClapState.speed1) {
      return _speedAnim!;
    } else if (_clapState == _ClapState.speed2) {
      return _speed2Anim!;
    } else if (_clapState == _ClapState.slow ||
        _clapState == _ClapState.select) {
      return _slowAnim!;
    } else {
      return _pointerAnim;
    }
  }

  void _startSpeed() {
    _stopSpeed();
    _speedStartTime = DateTime.now().millisecondsSinceEpoch;
    _speedOffset = _pointerAnim.value;

    _speedController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    _speedAnim = Tween<double>(begin: _speedOffset, end: 1 + _speedOffset)
        .animate(
            CurvedAnimation(parent: _speedController!, curve: Curves.easeIn));
    _speedController!.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        _startSpeed2();
      }
    });
    _speedController!.forward();

    _clapState = _ClapState.speed1;
    _textController.stop();
    refresh();
  }

  void _stopSpeed() {
    _speedController?.dispose();
    _speedController = null;
  }

  void _startSpeed2() {
    _stopSpeed2();
    _speed2Controller = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
    _speed2Anim = Tween<double>(begin: _speedOffset, end: 1 + _speedOffset)
        .animate(_speed2Controller!);
    _speed2Controller!.repeat();
    _clapState = _ClapState.speed2;
    refresh();
  }

  void _stopSpeed2() {
    _speed2Controller?.dispose();
    _speed2Controller = null;
  }

  Future<void> _startSlow() async {
    if (mounted) {
      _stopSlow();

      int curr = DateTime.now().millisecondsSinceEpoch;
      if (curr - _speedStartTime < _speedMinTime) {
        await Future.delayed(
            Duration(milliseconds: _speedMinTime - curr + _speedStartTime));
      }

      const double offset = 0.25;
      int destIndex = _destIndex;
      double destPos = destIndex / 12 - offset + 1 / 24;

      double oldPos = _speed2Controller!.value + _speedOffset - 1;
      while (destPos - oldPos < 0.5) {
        destPos += 1;
      }
      _slowController = AnimationController(
          duration: const Duration(milliseconds: 1000), vsync: this);
      _slowAnim = Tween<double>(begin: oldPos, end: destPos).animate(
          CurvedAnimation(parent: _slowController!, curve: Curves.decelerate));
      _slowController!.addStatusListener((status) {
        if (status == AnimationStatus.completed && mounted) {
          _clapState = _ClapState.select;
          refresh();
        }
      });
      _slowController!.forward();

      _clapState = _ClapState.slow;
      refresh();
    }
  }

  void _stopSlow() {
    _slowController?.dispose();
    _slowController = null;
  }

  Future<void> _reset() async {
    _stopSpeed();
    _stopSpeed2();
    _clapState = _ClapState.init;
    refresh();
    _textController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    String text = widget.data.popup.topText;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              CachedNetworkImage(
                imageUrl: Util.getRemoteImgUrl(ResourceManager.bgMainDialog),
                width: 279.3.dp,
                height: 488.dp,
                fit: BoxFit.fill,
              ),
              PositionedDirectional(
                top: 116.dp,
                child: RotationTransition(
                  turns: _lightCircleAnim,
                  child: R.img(
                      Assets.gift$constellation_clap_ic_light_circle_webp,
                      width: 279.3.dp,
                      height: 293.3.dp),
                ),
              ),
              PositionedDirectional(
                top: 138.dp,
                child: R.img(Assets.gift$constellation_clap_ic_big_wheel_webp,
                    width: 243.dp, height: 242.dp),
              ),
              PositionedDirectional(
                top: 133.dp,
                child: MultiframeImage.file(
                  File(ResourceManager.animLight ?? ''),
                  width: 256.dp,
                  height: 256.dp,
                  loop: true,
                ),
              ),
              Container(
                width: 279.3.dp,
                height: 488.dp,
                padding: EdgeInsetsDirectional.only(top: 70.dp),
                child: Column(
                  children: [
                    Container(
                      height: 72.dp,
                      margin: EdgeInsets.symmetric(horizontal: 35.dp),
                      alignment: AlignmentDirectional.bottomCenter,
                      child: Text(text,
                          style: TextStyle(
                              fontSize: 10.dp,
                              color: Colors.white,
                              fontStyle: FontStyle.italic)),
                    ),
                    SizedBox(height: 10.dp),
                    _buildTurntable(),
                    SizedBox(height: 24.dp),
                    _buildClap(),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.dp),
          _buildCloseBtn(),
        ],
      ),
    );
  }

  String _parseUserIcon(int index) {
    if (index >= 0 && index < widget.data.popup.zodiacs.length) {
      return widget.data.popup.zodiacs[index].spokesman.icon;
    }
    return '';
  }

  Widget _buildTurntable() {
    return SizedBox(
      width: 220.dp,
      height: 220.dp,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          RotationTransition(
            turns: _wheelAnim,
            child: R.img(Assets.gift$constellation_clap_ic_center_wheel_webp,
                width: 105.dp, height: 105.dp),
          ),
          if (_clapState != _ClapState.init)
            RotationTransition(
              turns: _getActivePointerAnim(),
              child: Row(
                children: [
                  SizedBox(width: 98.dp),
                  R.img(Assets.gift$constellation_clap_ic_pointer_light_webp,
                      width: 114.5.dp, height: 73.dp),
                ],
              ),
            ),
          PositionedDirectional(
            start: 108.dp,
            top: 11.5.dp,
            child: _buildUser(0),
          ),
          PositionedDirectional(
            start: 143.5.dp,
            top: 31.5.dp,
            child: _buildUser(1),
          ),
          PositionedDirectional(
            start: 163.5.dp,
            top: 67.dp,
            child: _buildUser(2),
          ),
          PositionedDirectional(
            start: 163.5.dp,
            top: 108.dp,
            child: _buildUser(3),
          ),
          PositionedDirectional(
            start: 143.5.dp,
            top: 143.dp,
            child: _buildUser(4),
          ),
          PositionedDirectional(
            start: 108.dp,
            top: 162.5.dp,
            child: _buildUser(5),
          ),
          PositionedDirectional(
            start: 67.5.dp,
            top: 163.dp,
            child: _buildUser(6),
          ),
          PositionedDirectional(
            start: 32.5.dp,
            top: 143.dp,
            child: _buildUser(7),
          ),
          PositionedDirectional(
            start: 12.5.dp,
            top: 108.dp,
            child: _buildUser(8),
          ),
          PositionedDirectional(
            start: 12.dp,
            top: 67.dp,
            child: _buildUser(9),
          ),
          PositionedDirectional(
            start: 32.5.dp,
            top: 32.dp,
            child: _buildUser(10),
          ),
          PositionedDirectional(
            start: 67.dp,
            top: 11.5.dp,
            child: _buildUser(11),
          ),
          if (_clapState == _ClapState.select)
            RotationTransition(
              turns: _getActivePointerAnim(),
              child: Row(
                children: [
                  SizedBox(width: 159.dp),
                  MultiframeImage.file(
                    File(ResourceManager.animSelect ?? ''),
                    width: 59.3.dp,
                    height: 59.3.dp,
                    onComplete: () {
                      Navigator.pop(context);
                      ConstellationClapResultDialog.show(System.context,
                          data: _resultData);
                    },
                  ),
                ],
              ),
            ),
          RotationTransition(
            turns: _getActivePointerAnim(),
            child: Row(
              children: [
                SizedBox(width: 66.dp),
                R.img(Assets.gift$constellation_clap_ic_wheel_pointer_webp,
                    width: 117.5.dp, height: 107.5.dp),
              ],
            ),
          ),
          RotationTransition(
            turns: _textAnim,
            child: R.img(
                Assets.gift$constellation_clap_constellation_text_circle_webp,
                width: 85.3.dp,
                height: 85.dp),
          ),
          CommonAvatar(
            path: widget.data.popup.me.icon,
            shape: BoxShape.circle,
            size: 49.dp,
          ),
        ],
      ),
    );
  }

  Widget _buildUser(int index) {
    String icon = _parseUserIcon(index);
    bool mark = icon.isNotEmpty && widget.data.popup.zodiacs[index].marked == 1;
    double scale =
        _clapState == _ClapState.select && index == _destIndex ? 1.3 : 1;
    return SizedBox(
      width: 43.5.dp,
      height: 43.5.dp,
      child: Stack(
        alignment: AlignmentDirectional.center,
        clipBehavior: Clip.none,
        children: [
          PositionedDirectional(
            child: R.img(Assets.gift$constellation_clap_bg_head_shadow_webp,
                width: 43.5.dp * scale, height: 43.5.dp * scale),
          ),
          PositionedDirectional(
            child: CommonAvatar(
              path: icon,
              shape: BoxShape.circle,
              size: 33.dp * scale,
            ),
          ),
          if (mark)
            PositionedDirectional(
              top: -2,
              end: 0,
              child: Container(
                width: 30.dp * scale,
                height: 21.3.dp * scale,
                alignment: AlignmentDirectional.center,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            Assets.gift$constellation_clap_bg_name_webp),
                        fit: BoxFit.fill)),
                child: Text('代言人',
                    style:
                        TextStyle(fontSize: 7.dp * scale, color: Colors.white)),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCloseBtn() {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: R.img(Assets.gift$constellation_clap_ic_close_webp,
          width: 46.dp, height: 46.dp),
    );
  }

  Widget _buildClap() {
    return Container(
      width: 136.dp,
      height: 59.dp,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.gift$constellation_clap_btn_clap_webp),
              fit: BoxFit.fill)),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (_clapState != _ClapState.init) {
                return;
              }
              _startSpeed();
              if (_payOk) {
                _requestResult();
              } else {
                _payForClap();
              }
            },
            child: Container(
              width: 136.dp,
              height: 35.dp,
              margin: EdgeInsetsDirectional.only(top: 11.dp),
            ),
          ),
          PositionedDirectional(
            end: -10.dp,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                R.img(Assets.gift$constellation_clap_bg_clap_price_webp,
                    width: 56.dp, height: 26.6.dp),
                Transform.rotate(
                  angle: 0.23,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(bottom: 1.5.dp),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        R.img(MoneyConfig.moneyIcon,
                            width: 14.dp, height: 14.dp, wholePath: true),
                        NumText(
                          '${widget.data.popup.price}',
                          style: TextStyle(
                              fontSize: 14.dp,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          PositionedDirectional(
            bottom: -2.dp,
            child: Text(widget.data.popup.bottomText,
                style:
                    TextStyle(fontSize: 8.dp, color: const Color(0xFFF4E5C0))),
          ),
        ],
      ),
    );
  }

  Future _payForClap() async {
    if (_requesting) {
      return;
    }
    _requesting = true;
    int price = widget.data.popup.price;

    /// 先判断是否余额不足
    IPayManager payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    SheetCallback? result =
        await payManager.showRechargeSheet(System.context, price);
    if (result == null || result.reason == SheetCloseReason.Active) {
      _requesting = false;
      _reset();
      return;
    }

    payManager.pay(System.context,
        key: 'constellation_clap',
        type: result.value?.key ?? '',
        refer: 'constellation_clap',
        args: {
          'money': price,
          'type': 'slp-consume',
          'params': {
            'consume_type': 'zodiac_pai',
            'to_uid': widget.data.popup.toUid,
          },
        },
        showLoading: false, onPayed: () {
      _payOk = true;
      _requesting = false;
      _requestResult();
    }, onError: (_) {
      _requesting = false;
      _reset();
    });
  }

  bool _requesting = false;
  bool _payOk = false;

  Future<void> _requestResult() async {
    if (_requesting) {
      return;
    }
    _requesting = true;
    final res = await ConstellationClapRepo.resultDialog();
    _requesting = false;
    if (res.success) {
      _resultData = res.data;
      _startSlow();
    } else {
      Fluttertoast.showToast(msg: res.message);
      _reset();
    }
  }
}

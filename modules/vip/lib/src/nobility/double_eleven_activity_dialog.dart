import 'package:vip/k.dart';
import 'package:shared/shared.dart';
import 'package:shared/widget/custom_count_down_widget.dart';
import 'package:flutter/material.dart';
import 'package:vip/assets.dart';
import 'package:vip/src/nobility/model/pb/generated/slp_nobility_activity.pb.dart';
import 'package:vip/src/nobility/model/pb/slp_title_repo.dart';
import 'package:get/get.dart';

class DoubleElevenActivityDialog extends StatefulWidget {
  const DoubleElevenActivityDialog({super.key});

//避免重复弹窗
  static bool _showing = false;

  static show(BuildContext context) async {
    if (_showing) return;
    _showing = true;
    await showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.7),
        builder: (BuildContext context) {
          return const DoubleElevenActivityDialog();
        });
    _showing = false;
    eventCenter.emit(EventConstant.EventActivityDataUpdate);
  }

  @override
  State<DoubleElevenActivityDialog> createState() =>
      _DoubleElevenActivityDialogState();
}

class _DoubleElevenActivityDialogState extends State<DoubleElevenActivityDialog>
    with TickerProviderStateMixin {
  //是否可以购买，默认可以
  final _buttonDisable = false.obs;

  RespGiftBagDetail? _respActivityData;

  Animation<double>? _animation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _loadData();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _animation = Tween(begin: 0.6, end: 1.0).animate(
        CurvedAnimation(parent: _animationController!, curve: Curves.linear));
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: Loading());
    }
    return _buildBody();
  }

  bool _isLoading = false;

  Future<void> _loadData() async {
    _isLoading = true;
    _respActivityData = await SlpTitleRepo.getNobleActivityData(2);
    if (!mounted) return;
    _isLoading = false;
    if (_respActivityData?.success ?? false) {
      setState(() {});
      _animationController?.forward();
    } else {
      Navigator.maybePop(context);
      Fluttertoast.showToast(msg: _respActivityData?.msg ?? '');
    }
  }

  Widget _buildBody() {
    return Center(
      child: ScaleTransition(
        scale: _animation!,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            R.img(
              Assets.vip$double_eleven_activity_bg_webp,
              width: 280.dp,
              fit: BoxFit.fitHeight,
            ),
            PositionedDirectional(
              top: -14.dp,
              child: R.img(Assets.vip$double_eleven_activity_icon_webp,
                  width: 280.dp, fit: BoxFit.fitWidth),
            ),
            PositionedDirectional(
              top: 146.dp,
              child: Row(
                children: [
                  Text(
                    K.double_eleven_des,
                    style: TextStyle(
                      fontSize: 12.dp,
                      color: const Color(0xffFFF3D6),
                    ),
                  ),
                  SizedBox(width: 2.dp),
                  _buildCountDownWidget(_respActivityData!.elevenData.left),
                ],
              ),
            ),
            PositionedDirectional(
              top: 184.dp,
              start: 0,
              end: 0,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 15.dp, end: 15.dp),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: (_respActivityData!.elevenData.rewards.map((e) {
                      return _buildGiftItem(e.icon, e.name);
                    })).toList()),
              ),
            ),
            PositionedDirectional(
              top: 300.dp,
              child: Obx(() {
                return InkWell(
                  onTap: () async {
                    if (_buttonDisable.value) return;
                    _pay();
                  },
                  child: R.img(
                    _buttonDisable.value
                        ? Assets.vip$noble_nobility_activity_buy_disable_webp
                        : Assets.vip$double_eleven_activity_buy_webp,
                    width: 212.dp,
                    height: 45.dp,
                  ),
                );
              }),
            ),
            PositionedDirectional(
              top: 286.dp,
              end: 20.dp,
              child: R.img(
                Assets.vip$double_eleven_activity_price_webp,
                width: 58.dp,
                height: 26.dp,
              ),
            ),
            PositionedDirectional(
              bottom: -20.dp,
              child: GestureDetector(
                onTap: () {
                  Navigator.maybePop(context);
                },
                behavior: HitTestBehavior.opaque,
                child: R.img(Assets.vip$noble_nobility_activity_close_webp,
                    width: 48.dp, height: 48.dp),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGiftItem(String giftUrl, String name) {
    return Column(
      children: [
        Container(
          width: 60.dp,
          height: 60.dp,
          padding: EdgeInsetsDirectional.all(5.dp),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.dp),
            gradient: const LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              colors: [Color(0xFFFFFED6), Color(0xFFD6FFED)],
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: Util.getRemoteImgUrl(giftUrl),
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          width: 60.dp,
          child: Text(
            name,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12.dp,
              color: const Color(0xffFFF3D6),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCountDownWidget(int time) {
    return CustomCountDownWidget(
      counter: time,
      customChild: (int hour, int min, int second) {
        if (hour <= 0 && min <= 0 && second <= 0) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            _buttonDisable.value = true;
          });
        }
        return Stack(
          alignment: Alignment.center,
          children: [
            R.img(Assets.vip$double_eleven_activity_time_bg_webp,
                width: 68, height: 16),
            PositionedDirectional(
                start: 0,
                top: 0,
                bottom: 0,
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: NumText(
                    hour < 10 ? '0$hour' : hour.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      height: 1.2,
                      color: Color(0xff2B635E),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            PositionedDirectional(
                top: 0,
                bottom: 0,
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: NumText(
                    min < 10 ? '0$min' : min.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      height: 1.2,
                      color: Color(0xff2B635E),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            PositionedDirectional(
                end: 0,
                top: 0,
                bottom: 0,
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: NumText(
                    second < 10 ? '0$second' : second.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      height: 1.2,
                      color: Color(0xff2B635E),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
          ],
        );
      },
    );
  }

  Future<void> _pay() async {
    IPayManager payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    SheetCallback? result =
        await payManager.showRechargeSheet(context, 1111); // 价格是钻
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }

    if (result.value?.key == IPayManager.pTRecharge) {
      return;
    }
    payManager.pay(context,
        key: 'gift-bag',
        type: result.value?.key ?? '',
        args: {
          'money': 1111,
          'type': 'gift-bag',
          'params': {'type': '0'}
        },
        onPayed: () {
          Fluttertoast.showCenter(msg: K.buy_success);
          Navigator.of(context).pop();
          eventCenter.emit(EventConstant.EventActivityBuySuccess, {'type': 2});
        },
        onError: (_) => Fluttertoast.showCenter(msg: K.buy_fail));
  }
}

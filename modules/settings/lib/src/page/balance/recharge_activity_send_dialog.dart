import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:settings/assets.dart';
import 'package:settings/k.dart';
import 'package:settings/src/model/pb/generated/pay.pb.dart';
import 'package:settings/src/page/api/settings_repo.dart';
import 'package:settings/src/page/balance/chargePannel.dart';
import 'package:shared/shared.dart';
import 'package:shared/widget/custom_count_down_widget.dart';

import '../juveniles/juveniles_mode.dart';

///限时充值大放送的活动弹窗
class RechargeActivitySendDialog extends StatefulWidget {
  final String? refer;

  const RechargeActivitySendDialog({super.key, this.refer});

  @override
  State<RechargeActivitySendDialog> createState() => _RechargeActivitySendDialogState();

  //避免重复弹窗
  static bool _showing = false;

  static show(BuildContext context) async {
    if (_showing) return;
    _showing = true;
    await showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.7),
        builder: (BuildContext context) {
          return const RechargeActivitySendDialog();
        });
    _showing = false;
  }
}

class _RechargeActivitySendDialogState extends State<RechargeActivitySendDialog> with TickerProviderStateMixin {
  TabController? _tabController;
  final _currentIndex = 0.obs;
  ResPayTimeLimitProduct? _respActivityData;
  IPayManager? _payManager;

  @override
  void initState() {
    super.initState();
    _payManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    _loadData();

    ///打开埋点
    Tracker.instance.track(TrackEvent.recharge_pop_exposure, properties: {'uid': Session.uid});
  }

  @override
  void dispose() {
    _tabController?.dispose();

    ///关闭埋点
    Tracker.instance.track(TrackEvent.close_float_window, properties: {'uid': Session.uid});
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
    _respActivityData = await SettingRepo.getRechargeLimitTimeProduct();
    _isLoading = false;
    if (_respActivityData?.success ?? false) {
      _currentIndex.value = _respActivityData!.data.selectIndex;
      _tabController = TabController(length: _respActivityData?.data.list.length ?? 0, initialIndex: _currentIndex.value, vsync: this);
      _tabController?.addListener(() {
        if (_currentIndex.value != _tabController?.index) {
          _currentIndex.value = _tabController?.index ?? 0;
        }
      });
      if (mounted) {
        setState(() {});
      }
    } else {
      if (mounted) {
        Navigator.maybePop(context);
        Fluttertoast.showToast(msg: _respActivityData?.msg ?? '');
      }
    }
  }

  Widget _buildBody() {
    return Center(
      child: SizedBox(
        width: 280.dp,
        height: 419.dp + 48.dp,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            PositionedDirectional(
              top: 0,
              child: R.img(
                Assets.settings$balance_rechange_activity_bg_webp,
                width: 280.dp,
                fit: BoxFit.fitHeight,
              ),
            ),
            PositionedDirectional(
              top: 66.dp,
              start: 59.dp,
              child: _buildCountDownWidget(_respActivityData!.data.leftTime),
            ),
            PositionedDirectional(top: 121.dp, child: _buildContentWidget()),
            PositionedDirectional(
              bottom: 0,
              child: GestureDetector(
                onTap: () {
                  if (mounted) {
                    Navigator.maybePop(context);
                    eventCenter.emit(EventConstant.EventRechargeActivityClose);
                  }
                },
                child: R.img(
                  Assets.settings$dialog_close_webp,
                  width: 48.dp,
                  height: 48.dp,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCountDownWidget(int time) {
    return CustomCountDownWidget(
      counter: time,
      customChild: (int hour, int min, int second) {
        if (hour <= 0 && min <= 0 && second <= 0) {
          if (mounted) {
            Navigator.maybePop(context);
          }
        }
        return Stack(
          alignment: Alignment.center,
          children: [
            R.img(Assets.settings$balance_rechange_activity_count_down_bg_webp, width: 68, height: 16),
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
                      color: Color(0xff007063),
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
                      color: Color(0xff007063),
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
                      color: Color(0xff007063),
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

  Widget _buildContentWidget() {
    return Container(
      width: 272.dp,
      height: 263.dp,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.dp),
          gradient: const LinearGradient(
            colors: [Color(0xffFFFEDC), Color(0xffFCF4F2)],
          )),
      child: Obx(() {
        return _buildProductDetailWidget();
      }),
    );
  }

  Widget _buildProductDetailWidget() {
    List<Widget> tabs = [];
    List<Widget> tabPages = [];
    for (int i = 0; i < (_respActivityData?.data.list.length ?? 0); i++) {
      PayTimeLimitProduct productData = _respActivityData!.data.list[i];
      tabs.add(Tab(
        child: SizedBox(
          width: 272.dp / 3,
          height: 44.dp,
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (i == _currentIndex.value)
                Container(
                  width: 272.dp / 3,
                  height: 44.dp,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [const Color(0xffDBFFED), const Color(0xffC0F0EA).withOpacity(0)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      border: GradientBoxBorder(
                        gradient: LinearGradient(
                            colors: [const Color(0xFF00E2D5), const Color(0xff00C1AB).withOpacity(0)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        width: 1,
                      ),
                      borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(16.dp), topEnd: Radius.circular(16.dp))),
                ),
              NumText(
                (productData.money ~/ 100).toString() + K.setting_balance_yuan,
                style: _currentIndex.value == i
                    ? const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xff007063))
                    : TextStyle(fontSize: 16, color: const Color(0xff007063).withOpacity(0.7)),
              ),
            ],
          ),
        ),
      ));

      tabPages.add(_tabPageWidget(productData));
    }

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CommonTabBar(
          tabs: tabs,
          controller: _tabController,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(18),
          ),
          marginStart: 0,
          labelPadding: const EdgeInsetsDirectional.all(0),
        ),
        SizedBox(
          height: 12.dp,
        ),
        SizedBox(
          height: 105.dp,
          child: TabBarView(
            controller: _tabController,
            children: tabPages,
          ),
        ),
        const Spacer(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 2),
              child: Text(
                K.recharge_activity_cz([(_respActivityData!.data.list[_currentIndex.value].money ~/ 100).toString()]),
                style: TextStyle(
                  fontSize: 12.dp,
                  color: const Color(0xffFF1A51),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            GradientText(
              _respActivityData!.data.list[_currentIndex.value].giveMoney.toString(),
              gradient: const LinearGradient(colors: [Color(0xffFF1A51), Color(0xffFF82D6)]),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.dp,
                  color: const Color(0xffFF1A51),
                  fontFamily: Util.numFontFamily,
                  package: ComponentManager.MANAGER_BASE_CORE),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 2),
              child: Text(
                K.recharge_activity_fl,
                style: TextStyle(
                  fontSize: 12.dp,
                  color: const Color(0xffFF82D6),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 2.dp,
        ),
        GestureDetector(
          onTap: _submit,
          behavior: HitTestBehavior.opaque,
          child: R.img(Assets.settings$balance_rechange_activity_button_webp, width: 212.dp, height: 45.dp),
        ),
        SizedBox(
          height: 18.dp,
        ),
      ],
    );
  }

  Widget _tabPageWidget(PayTimeLimitProduct productData) {
    return ListView.builder(
      padding: EdgeInsetsDirectional.only(start: 22.dp, end: 22.dp),
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: productData.awards.length,
      itemBuilder: (BuildContext context, int index) {
        return _productItem(productData.awards[index]);
      },
    );
  }

  Widget _productItem(PayTimeLimitProductAward item) {
    return Column(
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(start: 8.dp, end: 8.dp),
          width: 60.dp,
          height: 14.dp,
          decoration: BoxDecoration(
            color: const Color(0xffEBF8F2),
            border: GradientBoxBorder(
              gradient: LinearGradient(
                  colors: [const Color(0xFFC0F0EA), const Color(0xffC0F0EA).withOpacity(0)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              width: 0.5,
            ),
            borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(10.dp), topEnd: Radius.circular(10.dp)),
          ),
          alignment: Alignment.center,
          child: Text(
            item.title,
            maxLines: 1,
            style: TextStyle(fontSize: 8.dp, color: const Color(0xff007063).withOpacity(0.7)),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(start: 8.dp, end: 8.dp),
          width: 60.dp,
          height: 56.dp,
          decoration: BoxDecoration(
            color: const Color(0xffCDF7EC),
            borderRadius: BorderRadiusDirectional.only(bottomStart: Radius.circular(10.dp), bottomEnd: Radius.circular(10.dp)),
          ),
          alignment: Alignment.center,
          child: CachedNetworkImage(
            imageUrl: Util.recombineUrl(Util.getRemoteImgUrl(item.icon)),
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: 4.dp,
        ),
        SizedBox(
          width: 76.dp,
          child: Text(
            item.name,
            maxLines: 2,
            style: TextStyle(fontSize: 11.dp, fontWeight: FontWeight.w600, color: const Color(0xff007063)),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  final bool _useIap = (Platform.isIOS) || Util.isLocale;
  String? trackPType; //埋点需要的充值方式
  final String _key = 'recharge';

  void _submit() async {
    Tracker.instance.track(TrackEvent.click_btn_recharge);

    if (Session.lockGoods) {
      Toast.showCenter(context, K.setting_server_unreach);
      return;
    }

    if (JuvenilesMode.isActive()) {
      Toast.showCenter(context, K.setting_cant_charge_minor_mode);
      return;
    }

    if (_useIap) {
      int pid = _respActivityData!.data.list[_currentIndex.value].id;
      String? iapPrefix = _payManager?.getIAPConfig().iapPrefix;

      String pId = '${iapPrefix ?? ''}.$pid';
      Log.d("_submit=====>$pId");
      trackPType = 'iap';

      _payManager?.pay(
        context,
        key: _key,
        type: 'iap',
        refer: 'recharge_activity',
        args: {},
        canUseCoin: false,
        onError: _onPayError,
        productId: pId,
        onPayed: _onPayed,
      );
    } else {
      String? type;
      if (Util.isOnlyXiaomiZf()) {
        type = 'xiaomi';
      } else {
        type = await ChargePanel.show(context, platforms: _respActivityData!.data.platforms);
      }
      if (type == null) return;
      trackPType = type;

      _payManager?.pay(
        context,
        key: _key,
        type: type,
        refer: widget.refer,
        args: {
          // 小米zf存在汇率关系，创建订单的时候传最终用户得到的星球币
          'money': type == 'xiaomi'
              ? _respActivityData!.data.list[_currentIndex.value].money
              : _respActivityData!.data.list[_currentIndex.value].real,
          'type': 'recharge',
          'params': {'type': 'recharge'},
        },
        onError: _onPayError,
        canUseCoin: false,
        onPayed: _onPayed,
      );
    }
  }

  void _onPayed() async {
    //刷新首充信息
    _refreshFirstPay();

    // Tracker.instance.track(TrackEvent.recharge_success, properties: {
    //   'dateline': DateTime.now().millisecondsSinceEpoch,
    //   Constant.iapPT1 + Constant.iapPTy + Constant.iap0 + Constant.iapPTT + Constant.iapPT4: trackPType,
    //   'recharge_money': _respActivityData!.data.list[_currentIndex.value].real,
    //   'uid': Session.uid,
    //   'refer': widget.refer ?? '',
    // });

    if (Platform.isIOS) {
      //ios ModalRoute.of(context).isCurrent短时间内为false
      await Future.delayed(const Duration(milliseconds: 300));
    }
    if (ModalRoute.of(context)?.isCurrent ?? false) {
      Navigator.of(context).pop(true);
    }
    eventCenter.emit(EventConstant.EventRechargeActivitySuccess);

    // 充值成功后异步到账，这里给个toast提示
    Fluttertoast.showToast(msg: K.pay_charge_balance_sync, gravity: ToastGravity.CENTER);
  }

  void _onPayError(bool isErrorCatch) {}

  void _refreshFirstPay() async {
    try {
      String url = "${System.domain}account/getSettings";

      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      Map res = response.value();

      if (res['success'] != null && res['success'] == true) {
        if (res['data'] != null && res['data']['first_pay'] != null) {
          Session.setValue('first_pay', '${res['data']['first_pay']}');
        }
      }
    } catch (e) {
      Log.d(e);
    }
  }
}

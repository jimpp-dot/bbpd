import 'dart:async';
import 'dart:io';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:settings/k.dart';
import 'package:settings/src/page/balance/banner/banner_repo.dart';
import '../../../assets.dart';
import '../juveniles/juveniles_mode.dart';
import 'chargePannel.dart';
import 'package:shared/src/pbModel/generated/banner_center.pb.dart';

const String GIAP_PRODUCT_PREFIX = 'com.ly.bbpd.coin';

final PayDataAndroid = [
  //{'money': 1 * 100, 'real': 1 * 100},
  {'money': 6 * 100, 'real': 6 * 100},
  {'money': 30 * 100, 'real': 30 * 100},
  {'money': 50 * 100, 'real': 50 * 100},
  {'money': 100 * 100, 'real': 100 * 100},
  {'money': 200 * 100, 'real': 200 * 100},
  {'money': 500 * 100, 'real': 500 * 100},
  {'money': 1000 * 100, 'real': 1000 * 100},
  {'money': 2000 * 100, 'real': 2000 * 100},
  {'money': 5000 * 100, 'real': 5000 * 100},
  {'money': 10000 * 100, 'real': 10000 * 100},
];

// 小米zf
const PayDataXiaomi = [
  {'money': 0.8 * 100, 'real': 1 * 100},
  {'money': 6 * 100, 'real': 7.5 * 100},
  {'money': 30 * 100, 'real': 37.5 * 100},
  {'money': 50 * 100, 'real': 62.5 * 100},
  {'money': 100 * 100, 'real': 125 * 100},
  {'money': 200 * 100, 'real': 250 * 100},
  {'money': 500 * 100, 'real': 625 * 100},
  {'money': 1000 * 100, 'real': 1250 * 100},
  {'money': 2000 * 100, 'real': 2500 * 100},
];

/// 充值页面
class RechargeScreen extends StatefulWidget {
  /// 余额充值，所需要的refer
  final String refer;

  const RechargeScreen(this.refer, {Key? key}) : super(key: key);

  @override
  _RechargeScreenState createState() {
    return _RechargeScreenState();
  }

  static Future show(BuildContext context, {String refer = ''}) {
    Tracker.instance.track(
      TrackEvent.view_recharge_page,
      properties: {'refer': refer},
    );
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => RechargeScreen(refer),
      settings: const RouteSettings(name: '/recharge'),
    ));
  }
}

class _RechargeScreenState extends State<RechargeScreen> {
  List<RechargeBanner>? _bannerList;
  int balance = 0;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    ResRechargeBanner rsp = await BannerRepo.getBannerList();
    if (rsp.success == true) {
      _bannerList = rsp.data;
      if (mounted) setState(() {});
    }
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: 20,
        end: 20,
        top: 16,
        bottom: Util.iphoneXBottom,
      ),
      child: Column(
        children: <Widget>[
          Container(
            alignment: AlignmentDirectional.centerStart,
            margin: const EdgeInsets.only(bottom: 12),
            child: Text(
              K.setting_choose_charge_money,
              style: TextStyle(
                fontSize: 15.0,
                color: R.colors.mainTextColor,
              ),
            ),
          ),
          Expanded(
              child: RechargeWidget(
            refer: widget.refer,
            callback: _onData,
          )),
        ],
      ),
    );
  }

  _onData(int money) {
    if (mounted) {
      setState(() {
        balance = money;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            _buildTopBar(),
            if (!Util.isCollectionEmpty(_bannerList)) _buildActivitySwiper(),
            Expanded(child: _buildBody()),
          ],
        ),
      ).withCommonBg(),
    );
  }

  Widget _buildActivitySwiper() {
    double width = Util.width - 40;
    double height = width * 85 / 334;
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsetsDirectional.only(top: 12),
      child: Swiper(
        key: ValueKey(_bannerList?.length),
        itemCount: _bannerList?.length ?? 0,
        index: 0,
        pagination: (_bannerList?.length ?? 0) > 1
            ? SwiperPagination(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(bottom: 6),
                builder: DotSwiperPaginationBuilder(
                  space: 4,
                  activeColor: Colors.white,
                  color: Colors.white.withOpacity(0.6),
                  size: 6,
                  activeSize: 6,
                ),
              )
            : null,
        autoplay: (_bannerList?.length ?? 0) > 1,
        loop: (_bannerList?.length ?? 0) > 1,
        autoplayDelay: 3000,
        autoplayDisableOnInteraction: true,
        onTap: _onBannerClick,
        itemBuilder: (BuildContext context, int index) {
          return CachedNetworkImage(
            imageUrl: Util.parseIcon(_bannerList?[index].bannerUrl),
            width: width,
            height: height,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  void _onBannerClick(int index) {
    Tracker.instance.track(TrackEvent.click,
        properties: {'click_page': 'package_center_banner'});
    SchemeUrlHelper.instance()
        .checkSchemeUrlAndGo(System.context, _bannerList?[index].jumpTo);
  }

  Widget _buildTopBar() => SizedBox(
        height: 172.dp,
        width: Util.width,
        child: Stack(
          children: [
            Positioned.fill(
              child: Stack(
                children: [
                  // PositionedDirectional(
                  //   start: 0,
                  //   end: 0,
                  //   top: 0,
                  //   bottom: 4,
                  //   child: R.img(
                  //       darkMode ? Assets.settings$recharge_bg_dark_webp : Assets.settings$recharge_bg_light_webp,
                  //       package: ComponentManager.MANAGER_SETTINGS,
                  //       fit: BoxFit.cover),
                  // ),
                  PositionedDirectional(
                    bottom: 0,
                    child: Container(
                      width: Util.width - 40,
                      height: 72,
                      margin:
                          const EdgeInsetsDirectional.only(start: 20, end: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: R.colors.mainBgColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            offset: const Offset(0, 4),
                            blurRadius: 8,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      alignment: AlignmentDirectional.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            MoneyConfig.moneyIcon,
                            width: 28,
                            height: 28,
                          ),
                          const SizedBox(width: 4),
                          NumText(
                            '$balance',
                            style: TextStyle(
                              fontSize: 28,
                              color: R.colors.mainTextColor,
                              fontWeight: FontWeight.w800,
                              fontFamily: Util.numFontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BaseAppBar(
              MoneyConfig.isDiamond()
                  ? K.setting_charge_balance_diamond
                  : K.setting_charge_balance,
              backgroundColor: Colors.transparent,
              titleColor: Colors.white,
              backColor: Colors.white,
            ),
          ],
        ),
      );
}

typedef OnRechargeData = Function(int money);

class RechargeWidget extends StatefulWidget {
  final String? refer;
  final int totalPrice;
  // 全屏充值，需要回传余额和活动banner
  final OnRechargeData? callback;
  // 支付弹窗，充值成功需要刷新上一个页面的余额（或者直接支付了）
  final bool isPaySheet;

  const RechargeWidget(
      {this.refer,
      this.totalPrice = 0,
      this.callback,
      this.isPaySheet = false,
      Key? key})
      : super(key: key);

  @override
  _RechargeState createState() {
    return _RechargeState();
  }
}

class _RechargeState extends State<RechargeWidget> {
  bool _loading = true;
  final bool _useIap = (Platform.isIOS) || Util.isLocale;
  int _currentIndex = 0;
  List<Map>? _payData;
  IPayManager? _payManager;
  String? _resError;

  final String _key = 'recharge';

  String? trackPType; //埋点需要的充值方式

  bool needServerPayData = false;
  ScrollController? controller;
  late double itemWidth;

  String? aliKa;
  String? miniId; // 微信小程序id

  /// zhi * fu * bao ka文案
  /// 服务端下发类型
  List<String>? platforms;

  @override
  void initState() {
    super.initState();

    _payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);

    itemWidth = (Util.width - 40 - (2 * 8)) / 3;

    if (_useIap) {
      /// 后台下发充值商品，防止风险用户刷单（充值后，再通过苹果退款）
      needServerPayData = true;
    } else {
      /// 服务端取充值Map
      needServerPayData = true;
    }

    _loadData();
  }

  @override
  void dispose() {
    _payManager?.dispose(_key);
    super.dispose();
  }

  void _loadData() async {
    int money = 0;
    try {
      bool isSuccess = false;
      Map res;
      _resError = null;
      final response = await BaseApi.requestChargeProduct();
      res = response.response as Map;
      isSuccess = res == null ? false : res['success'];
      _resError =
          response.error != null ? response.error.toString() : res['msg'];

      if (isSuccess) {
        int needVerify = Util.parseInt(res['need_verify'], 0);
        int needVerifyNew = Util.parseInt(res['need_verify_new'], 0);
        if (Utility.isNeedVerify(needVerify, needVerifyNew)) {
          ILoginManager loginManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_LOGIN);

          /// 开始实名认证
          bool success = await loginManager.openAuthDialog(context,
              type: needVerify, newType: needVerifyNew, refer: 'recharge');
          if (!success) {
            /// 实名认证不通过，关闭当前界面
            Navigator.of(context).pop();
            return;
          }
        }
        final data = res['data'];
        money = Util.parseInt(res['money']);
        if (needServerPayData && data is List) {
          _payData = [];
          for (var element in data) {
            _payData?.add(element);
          }
        }
        aliKa = Util.parseStr(res['ka']);
        miniId = Util.parseStr(res['mini_id']);
        if (res['platforms'] != null && res['platforms'] is List) {
          platforms = (res['platforms'] as List)
              .map((e) => Util.parseStr(e) ?? '')
              .toList();
        }
      }
    } catch (e) {
      Log.d(e.toString());
    }

    if (needServerPayData) {
      // 未获取成功，用默认值
      if (_payData == null || _payData!.isEmpty) {
        if (Platform.isIOS) {
          // iOS不再保存默认值
          _payData = [];
        } else {
          _payData = PayDataAndroid;
        }
      }
    }

    for (int i = 0; i < (_payData?.length ?? 0); i++) {
      if (Util.parseInt(_payData?[i]['money']) >= (widget.totalPrice - money)) {
        _currentIndex = i;
        break;
      }
    }

    // 有初始选中的金额，需要自适应默认GridView滑动距离
    int scrollIndex = 0;
    if (_currentIndex < 2 * 3) {
      // 选中金额在前两行内不用滚动
      scrollIndex = 0;
    } else {
      scrollIndex = (_currentIndex - 2 * 3) ~/ 3 + 1;
    }

    double initialScrollOffset = scrollIndex * 96.0;

    controller = ScrollController(initialScrollOffset: initialScrollOffset);

    if (mounted) {
      if (widget.callback != null) {
        widget.callback!(money);
      }
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_resError != null) {
      return Center(
          child: ErrorData(error: _resError, onTap: () => _loadData()));
    }

    if (_payData == null || _payData!.isEmpty) {
      return const EmptyWidget();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: GridView.count(
            padding: EdgeInsets.zero,
            controller: controller,
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: itemWidth / 96,
            physics: const AlwaysScrollableScrollPhysics(),
            children: _buildItems(),
          ),
        ),
        _buildButton(),
      ],
    );
  }

  Widget _buildButton() {
    if (_payData == null || _payData!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 14.0, top: 16.0),
      child: GestureDetector(
        onTap: () => submitDebounce.call(() => _submit()),
        child: Container(
          height: 56.0,
          width: Util.width - 20,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: R.colors.mainBrandGradientColors),
            borderRadius: BorderRadius.circular(28),
          ),
          alignment: AlignmentDirectional.center,
          child: Text(
            Session.lockGoods
                ? K.setting_server_unreach
                : K.setting_p_few([
                    Util.isLocale
                        ? ''
                        : Util.removeDecimalZeroFormat(
                            _payData?[_currentIndex]['real'] / 100)
                  ]),
            style: TextStyle(
                fontSize: 16.0,
                color: R.colors.brightTextColor,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  final Debounce submitDebounce =
      Debounce(duration: const Duration(milliseconds: 1000));
  void _submit() async {
    Tracker.instance.track(TrackEvent.click_btn_recharge);

    if(Platform.isIOS){
      Fluttertoast.showToast(msg:'IOS暂时无法充值，请联系客服咨询充值方式', gravity: ToastGravity.CENTER);
      return;
    }


    if (Session.lockGoods) {
      Toast.showCenter(context, K.setting_server_unreach);
      return;
    }

    if (JuvenilesMode.isActive()) {
      Toast.showCenter(context, K.setting_cant_charge_minor_mode);
      return;
    }

    if (_useIap) {
      int pid = _payData?[_currentIndex]['id'];
      String? iapPrefix = _payManager?.getIAPConfig().iapPrefix;

      String pId =
          '${Platform.isAndroid ? GIAP_PRODUCT_PREFIX : iapPrefix ?? ''}.$pid';
      Log.d("_submit=====>$pId");
      trackPType = 'iap';

      _payManager?.pay(
        context,
        key: _key,
        type: 'iap',
        refer: widget.refer,
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
        type = await ChargePanel.show(context, platforms: platforms);
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
              ? Util.parseInt(_payData?[_currentIndex]['money'])
              : Util.parseInt(_payData?[_currentIndex]['real']),
          'type': 'recharge',
          'params': {'type': 'recharge'},
          'extra': {'mini_id': miniId},
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

    Tracker.instance.track(TrackEvent.recharge_success, properties: {
      'dateline': DateTime.now().millisecondsSinceEpoch,
      Constant.iapPT1 +
          Constant.iapPTy +
          Constant.iap0 +
          Constant.iapPTT +
          Constant.iapPT4: trackPType,
      'recharge_money': Util.parseInt(_payData?[_currentIndex]['real']),
      'uid': Session.uid,
      'refer': widget.refer ?? '',
    });

    if (Platform.isIOS) {
      //ios ModalRoute.of(context).isCurrent短时间内为false
      await Future.delayed(const Duration(milliseconds: 300));
    }
    if (ModalRoute.of(context)?.isCurrent ?? false) {
      if (widget.isPaySheet) {
        Navigator.of(context).pop(
          SheetCallback(SheetCloseReason.Result, -1,
              const SheetItem('', IPayManager.pTRecharge)),
        );
      } else {
        Navigator.of(context).pop(true);
      }
    }

    // 充值成功后异步到账，这里给个toast提示
    Fluttertoast.showToast(
        msg: K.pay_charge_balance_sync, gravity: ToastGravity.CENTER);
  }

  List<Widget> _buildItems() {
    if (_payData == null || _payData!.isEmpty) {
      return [];
    }

    List<Widget> widgets = [];

    for (int i = 0; i < _payData!.length; i++) {
      Map item = _payData![i];
      bool selected = _currentIndex == i;

      int money = Util.parseInt(item['money']); // 得到数额
      int real = Util.parseInt(item['real']); // 充值数额

      widgets.add(
        GestureDetector(
          onTap: () {
            _currentIndex = i;
            refresh();
          },
          child: _buildItem(selected, money, real),
        ),
      );
    }
    return widgets;
  }

  Widget _buildItem(bool selected, int money, int real) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        width: constraints.maxWidth,
        height: constraints.maxHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: selected
              ? R.colors.chargeBorderColor.withOpacity(0.06)
              : R.colors.mainBgColor,
          border: selected
              ? Border.all(
                  color: R.colors.chargeBorderColor,
                  width: 1,
                  style: BorderStyle.solid)
              : null,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                MoneyConfig.moneyIcon,
                width: 28.0,
                height: 28.0,
              ),
              NumText(
                MoneyConfig.moneyNum(money, fractionDigits: 2),
                style: TextStyle(
                    color: R.colors.mainTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    fontFamily: Util.numFontFamily,
                    package: ComponentManager.MANAGER_BASE_CORE),
              ),
              const SizedBox(height: 4),
              Text(
                '¥ ${(real / 100).toStringAsFixed(2)}',
                style: TextStyle(color: R.colors.thirdTextColor, fontSize: 13),
              ),
            ],
          ),
        ),
      );
    });
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

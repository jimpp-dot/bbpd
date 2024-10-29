import 'dart:io';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../../k.dart';

const BeanExchangeData = [
  {'bean': 1 * 100, 'real': 1 * 100},
  {'bean': 6 * 100, 'real': 6 * 100},
  {'bean': 30 * 100, 'real': 30 * 100},
  {'bean': 50 * 100, 'real': 50 * 100},
  {'bean': 100 * 100, 'real': 100 * 100},
  {'bean': 300 * 100, 'real': 300 * 100},
  {'bean': 500 * 100, 'real': 500 * 100},
  {'bean': 800 * 100, 'real': 800 * 100},
  {'bean': 1000 * 100, 'real': 1000 * 100},
];

class ExchangeBeanScreen extends StatefulWidget {
  final String? refer;

  const ExchangeBeanScreen({super.key, this.refer});

  @override
  _ExchangeBeanScreenState createState() {
    return _ExchangeBeanScreenState();
  }

  static Future show(BuildContext context, {String? refer}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ExchangeBeanScreen(
        refer: refer,
      ),
      settings: const RouteSettings(name: '/exchange_bean'),
    ));
  }
}

class _ExchangeBeanScreenState extends State<ExchangeBeanScreen>
    with WidgetsBindingObserver {
  int _currentIndex = 0;
  late List<Map> _payData;
  IPayManager? _payManager;
  final String _key = 'exchange';

  int _totalMoney = 0;

  @override
  void initState() {
    super.initState();
    _payData = BeanExchangeData;

    _payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);

    WidgetsBinding.instance.addObserver(this);

    eventCenter.removeListener("Navigator.Page.Pop", _onNavigatorChanged);
    eventCenter.addListener("Navigator.Page.Pop", _onNavigatorChanged);

    _initMoney();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _payManager?.dispose(_key);
    eventCenter.removeListener("Navigator.Page.Pop", _onNavigatorChanged);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (Platform.isAndroid) {
        _payManager?.dispose(_key);
      }
    }
  }

  void _initMoney() {
    Map money = Session.getMap('_money', {});

    int money0 = money['money'] ?? 0;
    int moneyIncome = money[Constant.pMC] ?? 0;
    int moneyCharm = money[Constant.pMCB] ?? 0;

    _totalMoney = money0 + moneyCharm + moneyIncome;

    _load();
  }

  _onNavigatorChanged(String type, dynamic data) {
    Log.d("DEBUG: ExchangeBeanScreen._onNavigatorChanged, $type =====> $data");
    if (data is String) {
      if (type == "Navigator.Page.Pop" && data == '/exchange_bean') {
        Log.d('_onNavigatorChanged back to exchange_bean');
        _load();
      }
    }
  }

  // 拉取余额
  void _load() async {
    try {
      String url = "${System.domain}account/money/?type=all";
      Map<String, String> post = {
        'v': '10',
      };
      XhrResponse response = await Xhr.postJson(url, post, throwOnError: true);
      Map res = response.response as Map;

      if (!mounted) return;

      int money = res['money'] ?? 0;
      int moneyIncome = res['m_c'] ?? 0;
      int moneyCharm = res['m_c_b'] ?? 0;
      _totalMoney = money + moneyCharm + moneyIncome;

      Log.d("ExchangeBeanScreen, _totalMoney: $_totalMoney");
    } catch (e) {
      Log.d(e);
    }
  }

  // 去充值
  void _goRecharge() async {
    ISettingManager settingManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    await settingManager.openRechargeScreen(context,
        refer: widget.refer ?? 'bean');
  }

  Future<bool> isMoneyEnough() async {
    if (_totalMoney < _payData[_currentIndex]['real']) {
      // 余额不足
      bool? confirm = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return ConfirmDialog(
              title: K.setting_exchange_recharge_dialog_title,
              positiveButton: PositiveButton(
                text: K.setting_go_recharge,
              ),
            );
          });
      if (confirm != null && confirm == true) {
        _goRecharge();
      }
      return false;
    }

    return true;
  }

  /// 过滤器 将.2f格式化的字符串，去除小数点末尾0
  String removeSuffix(String num) {
    List<String> strs = num.split('.');

    if (strs.length == 2) {
      String decimal = strs[1];
      if (decimal == '00') {
        return strs[0];
      } else if (decimal.endsWith('0')) {
        return num.substring(0, num.length - 1);
      }
    }

    return num;
  }

  void _submit() async {
    eventCenter.emit(EventConstant.EventBeanExchange);

    bool enoughMoney = await isMoneyEnough();
    if (!enoughMoney) {
      // 余额不足
      if (widget.refer == 'home_page_card_bean') {
        Tracker.instance.track(TrackEvent.homepage, properties: {
          'click_ppcard': 'convert_bean_fail',
        });
      }
      return;
    }

    String banbanMoney =
        MoneyConfig.moneyNum(Util.parseInt(_payData[_currentIndex]['real']));

    bool? confirm = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return ConfirmDialog(
            title: K.setting_exchange_dialog_title,
            contentBuilder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.only(top: 12),
                child: RichText(
                  text: TextSpan(
                      text: K.setting_exchange_use,
                      style: TextStyle(
                        color: R.color.secondTextColor,
                        fontSize: 14,
                        fontFamily: Util.fontFamily,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' $banbanMoney ',
                          style: TextStyle(
                              color: R.color.thirdBrightColor, fontSize: 14),
                        ),
                        TextSpan(
                          text: MoneyConfig.moneyName + K.setting_exchange,
                          style: TextStyle(
                            color: R.color.secondTextColor,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text:
                              ' ${_payData[_currentIndex]['bean'].toStringAsFixed(0)} ',
                          style: TextStyle(
                              color: R.color.thirdBrightColor, fontSize: 14),
                        ),
                        TextSpan(
                          text: K.settings_gold_bean,
                          style: TextStyle(
                            color: R.color.secondTextColor,
                            fontSize: 14,
                          ),
                        ),
                      ]),
                ),
              );
            },
            positiveButton: PositiveButton(
              text: K.setting_exchange,
            ),
          );
        });

    if (confirm == true) {
      _payManager?.pay(
        context,
        key: _key,
        type: 'available',
        refer: 'bean',
        args: {
          'money': _payData[_currentIndex]['real'].toInt(),
          'type': 'exchange_bean',
          'params': {
            'type': 'exchange_bean',
          }
        },
        canUseCoin: false,
        onPayed: _onExchanged,
        onError: _onExchangeError,
      );
    }
  }

  void _onExchanged() {
    Navigator.of(context).pop(true);
  }

  List<Widget> _buildItems() {
    List<Widget> widgets = [];

    for (int i = 0; i < _payData.length; i++) {
      Map item = _payData[i];
      bool selected = _currentIndex == i;
      Color borderColor = R.color.secondBgColor;
      if (selected) {
        borderColor = R.color.mainBrandColor;
      }

      String money = item['bean'].toStringAsFixed(0); // 充值数额

      widgets.add(
        InkWell(
          onTap: () {
            setState(() {
              _currentIndex = i;
            });
          },
          child: Ink(
            height: 48,
            decoration: BoxDecoration(
              color: R.color.secondBgColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
              border: Border.all(
                color: borderColor,
                width: selected ? 3.0 : 1.0,
                style: BorderStyle.solid,
              ),
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 3.0),
                    child: R.img(
                      MoneyConfig.goldBeanIcon,
                      width: 21.0,
                    ),
                  ),
                  NumText(
                    money,
                    style: TextStyle(
                      color: R.color.mainTextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return widgets;
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 18,
        end: 18,
        top: 16,
      ),
      child: Column(
        children: <Widget>[
          Container(
            alignment: AlignmentDirectional.centerStart,
            margin: const EdgeInsets.only(bottom: 12),
            child: Text(
              K.setting_choose_exchange_gold,
              style: TextStyle(
                fontSize: 15.0,
                color: R.color.secondTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 2.27,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: _buildItems(),
          ),
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(top: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${MoneyConfig.basePrice(100)}${K.setting_exchange_bean_rate}',
                      style: TextStyle(
                          fontSize: 13, color: R.color.mainBrandColor),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.setting_exchange_bean_title),
      body: _buildBody(),
      bottomNavigationBar: BottomButton.of(
        title: K.setting_exchange,
        onTap: _submit,
      ),
    );
  }

  void _onExchangeError(bool isErrorCatch) {}
}

import 'package:settings/k.dart';
import 'dart:io';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:settings/src/model/Wallet.dart';
import '../statementScreen.dart';

/// 钱包
class BalanceScreen extends StatefulWidget {
  final String? refer;

  const BalanceScreen({
    Key? key,
    this.refer,
  }) : super(key: key);

  @override
  _BalanceScreenState createState() => _BalanceScreenState();

  static void show(BuildContext context, {String? refer}) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BalanceScreen(refer: refer),
      settings: const RouteSettings(name: '/balance'),
    ));
  }
}

class _BalanceScreenState extends State<BalanceScreen>
    with WidgetsBindingObserver {
  WalletRequest? _walletRequest;
  Wallet? _wallet;
  IPayManager? _payManager;

  @override
  void initState() {
    super.initState();
    _wallet = Wallet();
    _walletRequest = WalletRequest();

    _payManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_PAY);
    _refresh();

    WidgetsBinding.instance.addObserver(this);

    eventCenter.addListener(
        EventConstant.WebsocketEventMessage, _refreshBalance);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    eventCenter.removeListener(
        EventConstant.WebsocketEventMessage, _refreshBalance);
    _payManager?.dispose(widget.key.toString());
    super.dispose();
  }

  void _refreshBalance(String event, dynamic data) {
    String name = data is Map ? data['name'] : null;
    if (name == 'onBalanceChanged' && mounted) {
      _refresh();
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (Platform.isAndroid) {
        _payManager?.dispose(widget.key.toString());
      }
      _refresh();
    }
  }

  void _refresh() async {
    Wallet? wallet = await _walletRequest?.loadWalletInfo();
    if (mounted && wallet != null) {
      setState(() {
        _wallet = wallet;
      });
    }
  }

  /// 跳转到充值中心
  void _forwardRechargeCenter() async {
    ISettingManager settingManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    bool payed = await settingManager.openRechargeScreen(context,
        refer: widget.refer ?? 'coin');
    if (payed) {
      _refresh();
    }
  }

  /// 钱
  Widget _buildMoney() {
    // 有欠款时，显示欠款
    int available = (_wallet?.available ?? 0) +
        (_wallet?.moneyOrder ?? 0) +
        (_wallet?.moneyIncome ?? 0) +
        (_wallet?.moneyCharm ?? 0);
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
          colors: [Color(0xFF27252D), Color(0xFF27252D)],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      height: 96,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            MoneyConfig.moneyName4,
            style: TextStyle(
              color: R.colors.chargeBorderColor,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: <Widget>[
              R.img(
                MoneyConfig.moneyIcon,
                width: 28,
                height: 28,
                fit: BoxFit.contain,
                wholePath: true,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 8),
                  child: NumText(
                    MoneyConfig.moneyNum(available, fractionDigits: 2),
                    style: TextStyle(
                        fontSize: 22,
                        color: R.colors.mainTextColor,
                        fontWeight: FontWeight.w600,
                        fontFamily: Util.numFontFamily,
                        package: ComponentManager.MANAGER_BASE_CORE),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async => _forwardRechargeCenter(),
                child: Container(
                  height: 29,
                  constraints: const BoxConstraints(minWidth: 58),
                  padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: R.colors.mainBrandGradientColors),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    K.setting_charge,
                    style: TextStyle(
                        color: R.colors.brightTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        height: 1),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 1),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_walletRequest?.loading ?? false) {
      return const Loading();
    }

    if (_walletRequest?.errorMessage != null) {
      return ErrorData(
        error: _walletRequest?.errorMessage,
        onTap: _refresh,
      );
    }
    return Container(
      color: R.colors.homeSecondBgColor,
      margin: const EdgeInsets.all(16),
      child: _buildMoney(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backgroundColor: Colors.transparent,
        backColor: R.colors.mainTextColor,
        title: Text(
          K.balance_screen_title,
          style: TextStyle(
            color: R.colors.mainTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: <Widget>[
          InkWell(
            onTap: () => StatementScreen.show(context),
            child: Container(
              padding: const EdgeInsetsDirectional.only(end: 16, start: 16),
              alignment: Alignment.center,
              child: Text(
                K.balance_screen_action,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: R.colors.secondTextColor,
                ),
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.transparent,
      body: _buildBody(),
    ).withCommonBg();
  }
}

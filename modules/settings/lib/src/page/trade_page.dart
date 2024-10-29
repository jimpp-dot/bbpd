import 'package:shared/shared.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings/src/page/account/account_money_model.dart';
import 'package:settings/src/trade_resp.dart';
import '../../k.dart';

/// 交易/金币Page UI
class TradePage extends StatefulWidget {
  final String type;

  const TradePage(this.type, {super.key});

  @override
  State<StatefulWidget> createState() {
    return TradePageState();
  }
}

class TradePageState extends State<TradePage> {
  bool _loading = false;
  bool _error = false;
  List<TradeData>? _dataList;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    if (mounted) {
      setState(() {
        _loading = true;
      });
    }
    TradeResponse resp = await getTradeList(widget.type);
    if (resp.success == true) {
      if (mounted) {
        setState(() {
          _loading = false;
          _dataList = resp.dataList;
          _error = false;
        });
      }
    } else {
      if (mounted) {
        setState(() {
          _loading = false;
          _error = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: R.color.secondBgColor,
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading && (_dataList == null || _dataList!.isEmpty)) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }
    if (_error) {
      return ErrorData(
        error: K.setting_something_went_wrong,
        onTap: () {
          _loadData();
        },
      );
    }
    if (_dataList == null || _dataList!.isEmpty) {
      return EmptyWidget(
        desc: K.setting_no_data,
        onTap: () {
          _loadData();
        },
      );
    }
    return RefreshIndicatorFactory.of(
      onRefresh: () async {
        _loadData();
      },
      child: ListView.builder(
        itemCount: _dataList?.length,
        itemBuilder: buildItem,
        padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 24),
      ),
    );
  }

  Widget buildItem(BuildContext context, int index) {
    TradeData data = _dataList![index];
    String pre = '';
    switch (data.operation) {
      case 'pay':
        pre = '+';
        break;

      case 'consume':
        pre = '-';
        break;

      case 'income':
        pre = '+';
        break;

      case 'ca' 'sh':
        pre = '-';
        break;

      case 'change':
        pre = '->';
        break;

      case 'refund':
        pre = '->';
        break;

      case 'subsidy':
        pre = '+';
        break;

      case 'income-lock':
        pre = '+';
        break;

      case 'income-unlock':
        pre = '->';
        break;

      case 'income-back':
        pre = '-';
        break;

      case 'back':
        pre = '+';
        break;

      case 'return':
        pre = '+';
        break;

      case 'collect':
        if (data.tradeReason != null &&
            data.tradeReason!.type != null &&
            data.tradeReason!.type == 'collect_in') {
          pre = '+';
        } else {
          pre = '-';
        }
        break;

      case 'confiscate':
        pre = '-';
        break;

      case 'ca' 'sh-back':
        pre = '+';
        break;

      case 'punish':
        pre = '-';
        break;

      case 'punish-back':
        pre = '+';
        break;

      case 'give':
        pre = '+';
        break;

      // 从这里开始是金币相关的
      case 'sign-add':
        pre = '+';
        break;

      case 'mission-add':
        pre = '+';
        break;

      case 'contribute':
        pre = '+';
        break;

      case 'sign-repair':
        pre = '-';
        break;
    }
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 12,
        ),
        Container(
          height: widget.type == 'coin' ? 72 : 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.white),
          child: Stack(
            children: <Widget>[
              PositionedDirectional(
                top: 12,
                child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
                    child: LimitedBox(
                      maxWidth: MediaQuery.of(context).size.width - 56,
                      child: Text(
                        data.subject ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: R.color.mainTextColor),
                      ),
                    )),
              ),
              PositionedDirectional(
                bottom: 6,
                child: Container(
                  width: Util.width - 40,
                  padding: const EdgeInsetsDirectional.only(start: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        _getDateline(data.dateline),
                        style: TextStyle(
                          fontSize: 11,
                          color: R.color.thirdTextColor,
                        ),
                      ),
                      const Spacer(),
                      _renderMoneyCount(pre, data),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _renderMoneyCount(String pre, TradeData data) {
    List<Widget> res = [];
    //金币页面单独处理
    if (widget.type == 'coin') {
      _assembleWidget(res, pre, data.coin, CurrencyType.Money);
      return Row(
        children: res,
      );
    }
    if (data.money == 0) {
      return Container();
    }
    if (data.tradeReason != null) {
      //支出
      if (data.tradeReason!.orderAccount > 0) {
        _assembleWidget(
            res, pre, data.tradeReason!.orderAccount / 100, CurrencyType.Money);
      }
      if (data.tradeReason!.orderAppleAccount > 0) {
        _assembleWidget(res, pre, data.tradeReason!.orderAppleAccount / 100,
            CurrencyType.Money);
      }
      if (data.tradeReason!.giftAccount > 0) {
        _assembleWidget(
            res, pre, data.tradeReason!.giftAccount / 100, CurrencyType.Money);
      }
      if (data.tradeReason!.giftAppleAccount > 0) {
        _assembleWidget(res, pre, data.tradeReason!.giftAppleAccount / 100,
            CurrencyType.Money);
      }
      if (data.tradeReason!.incomeAccount > 0) {
        _assembleWidget(res, pre, data.tradeReason!.incomeAccount / 100,
            CurrencyType.Money);
      }
      if (data.tradeReason!.charmAccount > 0) {
        _assembleWidget(
            res, pre, data.tradeReason!.charmAccount / 100, CurrencyType.Charm);
      }
      if (data.tradeReason!.coinPay > 0) {
        _assembleWidget(
            res, pre, data.tradeReason!.coinPay, CurrencyType.GoldCoin);
      }
      if (data.tradeReason!.coinIncomePay > 0) {
        _assembleWidget(
            res, pre, data.tradeReason!.coinIncomePay, CurrencyType.GoldCoin);
      }
      if (res.isNotEmpty) {
        return Row(
          children: res,
        );
      }

      //收入
      if (data.tradeReason!.orderAccountIn > 0) {
        _assembleWidget(res, pre, data.tradeReason!.orderAccountIn / 100,
            CurrencyType.Money);
      }
      if (data.tradeReason!.orderAppleAccountIn > 0) {
        _assembleWidget(res, pre, data.tradeReason!.orderAppleAccountIn / 100,
            CurrencyType.Money);
      }
      if (data.tradeReason!.giftAccountIn > 0) {
        _assembleWidget(res, pre, data.tradeReason!.giftAccountIn / 100,
            CurrencyType.Money);
      }
      if (data.tradeReason!.giftAccountAppleIn > 0) {
        _assembleWidget(res, pre, data.tradeReason!.giftAccountAppleIn / 100,
            CurrencyType.Money);
      }
      if (data.tradeReason!.incomeAccountIn > 0) {
        _assembleWidget(res, pre, data.tradeReason!.incomeAccountIn / 100,
            CurrencyType.Money);
      }
      if (data.tradeReason!.charmAccountIn > 0) {
        _assembleWidget(res, pre, data.tradeReason!.charmAccountIn / 100,
            CurrencyType.Charm);
      }
      if (res.isNotEmpty) {
        return Row(
          children: res,
        );
      }
    }

    bool isCharm = false;
    if (pre == '+') {
      isCharm = true;
      if (data.operation == 'pay' || data.operation == 'subsidy') {
        isCharm = false;
      }
    }
    _assembleWidget(res, pre, data.money / 100,
        isCharm ? CurrencyType.Charm : CurrencyType.Money);
    return Row(
      children: res,
    );
  }

  void _assembleWidget(List<Widget> res, String pre, double showMoney,
      CurrencyType currencyType) {
    bool isPositive = pre == '+';
    String? currencyWidgetPath;
    String showMoneyStr = showMoney.toStringAsFixed(2);
    switch (currencyType) {
      case CurrencyType.Money:
        currencyWidgetPath = MoneyConfig.moneyIcon;
        showMoneyStr = MoneyConfig.moneyNum(Util.parseInt(showMoney * 100));
        break;
      case CurrencyType.Charm:
        currencyWidgetPath = MoneyConfig.moneyCharmIcon;
        showMoneyStr = MoneyConfig.moneyNum(Util.parseInt(showMoney * 100));
        break;
      case CurrencyType.GoldCoin:
        currencyWidgetPath = R.imagePath('ic_gold_coin.png',
            package: ComponentManager.MANAGER_SETTINGS);
        break;
    }
    res.add(NumText(
      "$pre$showMoneyStr",
      style: TextStyle(
          fontSize: 18,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w700,
          color:
              isPositive ? R.color.fourthBrightColor : R.color.mainTextColor),
    ));
    res.add(const SizedBox(
      width: 4,
    ));
    res.add(R.img(currencyWidgetPath,
        width: 20, height: 20, fit: BoxFit.contain, wholePath: true));
    res.add(const SizedBox(
      width: 8,
    ));
  }

  String _getDateline(int dateline) {
    return formatDate(DateTime.fromMillisecondsSinceEpoch(dateline * 1000),
        [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn]);
  }

  static Future<TradeResponse> getTradeList(String type) async {
    String url = '${System.domain}account/money/?type=$type&v=1';
    try {
      XhrResponse response = await Xhr.getJson(
        url,
        throwOnError: false,
      );
      if (response.error != null) {
        Log.d(response.error.toString());
        return TradeResponse(msg: response.error.toString(), success: false);
      }
      try {
        return TradeResponse.fromJson(response.value() as Map<String, dynamic>);
      } catch (e) {
        Log.d(e);
        return TradeResponse(
            msg: R.array('xhr_error_type_array')[6], success: false);
      }
    } catch (e) {
      Log.d(e);
      return TradeResponse(msg: e.toString(), success: false);
    }
  }
}

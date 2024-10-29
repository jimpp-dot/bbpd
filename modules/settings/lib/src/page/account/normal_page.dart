import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../../assets.dart';
import '../../../k.dart';
import 'account_money_helper.dart';
import 'account_money_model.dart';
import 'account_money_repository.dart';
import 'on_remove.dart';

/// 交易、提现
class NormalPage extends StatefulWidget {
  final String? type;
  final Function? onReady;

  const NormalPage({Key? key, this.type, this.onReady}) : super(key: key);

  @override
  _NormalPageState createState() => _NormalPageState();
}

class _NormalPageState extends State<NormalPage> implements OnRemove {
  bool _loading = true;
  List _data = [];
  final Map<int, ValueKey<int>> _keys = {};

  @override
  initState() {
    super.initState();
    _load();
    eventCenter.addListener(
        EventConstant.WebsocketEventMessage, _refreshBalance);
  }

  @override
  void dispose() {
    eventCenter.removeListener(
        EventConstant.WebsocketEventMessage, _refreshBalance);
    super.dispose();
  }

  void _refreshBalance(String event, dynamic data) {
    String name = data is Map ? data['name'] : null;
    if (name == 'onBalanceChanged' && mounted) {
      _load();
    }
  }

  Future<void> _load() async {
    try {
      String url = "${System.domain}account/money/?type=${widget.type}&v=1";
      XhrResponse response = await Xhr.getJson(url, throwOnError: true);
      Map res = response.response as Map;
      if (!mounted) return;
      setState(() {
        if (res['success'] != true || res['data'] == null) {
          _loading = false;
          _keys.clear();
        } else {
          _data = res['data'];
          _loading = false;
          _keys.clear();
          for (var value in _data) {
            Map data = value;
            _keys[Util.parseInt(data['id'])] =
                ValueKey(Util.parseInt(data['id']));
          }
        }
      });
      if (widget.onReady != null) {
        widget.onReady!(res['money'], res['money_lock'], res['money_ca' 'sh'],
            res['money_debts'], res['parent']);
      }
    } catch (e) {
      Log.d(e.toString());
      if (!mounted) return;
      setState(() {
        _loading = false;
        _keys.clear();
      });
    }
  }

  _onRemove(int id, int dateline) async {
    await AccountMoneyRepository.moneyLogRemove(id, dateline);
    if (!mounted) return;
    await _load();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Loading();
    }
    if (_data.isEmpty) {
      return Center(
        child: Text(
          K.setting_no_data,
          style: R.textStyle.body1,
        ),
      );
    }
    return RefreshIndicatorFactory.of(
      child: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (BuildContext context, int index) {
          Map value = _data.elementAt(index) as Map;
          double money = Util.parseDouble(value['money']);

          Pair<String, String> pair = AccountMoneyHelper.getPreAndType(value);
          String pre = pair.first;
          String type = pair.second;
          int id = Util.parseInt(value['id']);
          return InkWell(
            key: _keys[id],
            onTap: null,
            onLongPress: () async {
              await AccountMoneyHelper.removeItem(
                  this, id, Util.parseInt(value['dateline'], 0));
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: R.color.dividerColor,
                    width: 0.5,
                  ),
                ),
              ),
              margin: const EdgeInsetsDirectional.only(start: 20.0, end: 20.0),
              padding: const EdgeInsetsDirectional.only(
                top: 12.0,
                bottom: 12.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          value['subject'],
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: R.color.mainTextColor,
                          ),
                        ),
                      ),
                      if (money > 0) const SizedBox(width: 20),
                      _renderReason(value['op'], pre, money,
                          AccountMoneyHelper.getReason(value))
                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        type,
                        style: TextStyle(
                          fontSize: 13.0,
                          color: R.color.mainTextColor.withOpacity(0.6),
                        ),
                      ),
                      Text(
                        AccountMoneyHelper.getDateline(
                            Util.parseInt(value['dateline'])),
                        style: TextStyle(
                          fontSize: 13.0,
                          color: R.color.mainTextColor.withOpacity(0.6),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
      onRefresh: _load,
    );
  }

  Widget _renderReason(String op, String pre, double money, Map? reason) {
    List<Widget> res = [];

    // 支出
    if (reason != null &&
        (reason.containsKey('_use_o') || // 下单账户
            reason.containsKey('_use_o_b') || // 下单账户-苹果内购充值
            reason.containsKey('_use_a') || // 打赏账户
            reason.containsKey('_use_b') || // 打赏账户-苹果内购充值
            reason.containsKey('_use_c') || // 收入账户
            reason.containsKey('_use_c_b') || // 魅力值账户
            reason.containsKey('_use_g') || // 金币消费
            reason.containsKey('_gain_g') || // 金币收入
            reason.containsKey('_use_cp') // 金豆消费
        )) {
      if (MoneyConfig.isDiamond()) {
        int money = Util.parseInt(reason['_use_o'], 0) +
            Util.parseInt(reason['_use_o_b'], 0) +
            Util.parseInt(reason['_use_a'], 0) +
            Util.parseInt(reason['_use_b'], 0) +
            Util.parseInt(reason['_use_c'], 0) +
            Util.parseInt(reason['_use_c_b'], 0);
        if (money > 0) {
          _assembleWidget(res, pre, money, CurrencyType.Money);
        }
      } else {
        if (reason.containsKey('_use_o') &&
            Util.parseInt(reason['_use_o'].toString()) > 0) {
          _assembleWidget(res, pre, reason['_use_o'], CurrencyType.Money);
        }
        if (reason.containsKey('_use_o_b') &&
            Util.parseInt(reason['_use_o_b'].toString()) > 0) {
          _assembleWidget(res, pre, reason['_use_o_b'], CurrencyType.Money);
        }
        if (reason.containsKey('_use_a') &&
            Util.parseInt(reason['_use_a'].toString()) > 0) {
          _assembleWidget(res, pre, reason['_use_a'], CurrencyType.Money);
        }
        if (reason.containsKey('_use_b') &&
            Util.parseInt(reason['_use_b'].toString()) > 0) {
          _assembleWidget(res, pre, reason['_use_b'], CurrencyType.Money);
        }
        if (reason.containsKey('_use_c') &&
            Util.parseInt(reason['_use_c'].toString()) > 0) {
          _assembleWidget(res, pre, reason['_use_c'], CurrencyType.Money);
        }
        if (reason.containsKey('_use_c_b') &&
            Util.parseInt(reason['_use_c_b'].toString()) > 0) {
          _assembleWidget(res, pre, reason['_use_c_b'], CurrencyType.Charm);
        }
      }

      if (reason.containsKey('_use_g') &&
          Util.parseInt(reason['_use_g'].toString()) > 0) {
        _assembleWidget(res, pre, reason['_use_g'], CurrencyType.GoldCoin);
      }

      if (reason.containsKey('_gain_g') &&
          Util.parseInt(reason['_gain_g'].toString()) > 0) {
        _assembleWidget(res, pre, reason['_gain_g'], CurrencyType.GoldCoin);
      }

      if (reason.containsKey('_use_cp') &&
          Util.parseInt(reason['_use_cp'].toString()) > 0) {
        _assembleWidget(res, pre, reason['_use_cp'], CurrencyType.GoldBean);
      }

      if (res.isNotEmpty) return Row(children: res);
    }

    // 收入
    if (reason != null &&
        (reason.containsKey('_in_o') || // 下单账户
            reason.containsKey('_in_o_b') || // 下单账户-苹果内购充值
            reason.containsKey('_in_a') || // 打赏账户
            reason.containsKey('_in_b') || // 打赏账户-苹果内购充值
            reason.containsKey('_in_c') || // 收入账户
            reason.containsKey('_in_c_b') || // 魅力值账户
            reason.containsKey('_gain_cp') // 金豆账户
        )) {
      if (reason.containsKey('_in_o') &&
          Util.parseInt(reason['_in_o'].toString()) > 0) {
        _assembleWidget(res, pre, reason['_in_o'], CurrencyType.Money);
      }
      if (reason.containsKey('_in_o_b') &&
          Util.parseInt(reason['_in_o_b'].toString()) > 0) {
        _assembleWidget(res, pre, reason['_in_o_b'], CurrencyType.Money);
      }
      if (reason.containsKey('_in_a') &&
          Util.parseInt(reason['_in_a'].toString()) > 0) {
        _assembleWidget(res, pre, reason['_in_a'], CurrencyType.Money);
      }
      if (reason.containsKey('_in_b') &&
          Util.parseInt(reason['_in_b'].toString()) > 0) {
        _assembleWidget(res, pre, reason['_in_b'], CurrencyType.Money);
      }
      if (reason.containsKey('_in_c') &&
          Util.parseInt(reason['_in_c'].toString()) > 0) {
        _assembleWidget(res, '+', reason['_in_c'], CurrencyType.Charm);
      }
      if (reason.containsKey('_in_c_b') &&
          Util.parseInt(reason['_in_c_b'].toString()) > 0) {
        _assembleWidget(res, '+', reason['_in_c_b'], CurrencyType.Charm);
      }
      if (reason.containsKey('_gain_cp') &&
          Util.parseInt(reason['_gain_cp'].toString()) > 0) {
        _assembleWidget(res, pre, reason['_gain_cp'], CurrencyType.GoldBean);
      }

      if (res.isNotEmpty) return Row(children: res);
    }

    bool isCharm = false;
    if (pre == '+') {
      isCharm = true;
      if (op == 'pay' || op == 'subsidy') {
        isCharm = false;
      }
    }
    _assembleWidget(
        res, pre, money, isCharm ? CurrencyType.Charm : CurrencyType.Money);
    return Row(children: res);
  }

  _assembleWidget(
      List<Widget> res, String pre, dynamic money, CurrencyType currencyType) {
    double showMoney;
    if (currencyType == CurrencyType.GoldCoin ||
        currencyType == CurrencyType.GoldBean) {
      showMoney = Util.parseDouble(money, 0);
    } else {
      showMoney = Util.parseInt(money, 0) / 100;
    }
    if (res.isNotEmpty) res.add(const SizedBox(width: 6.0));

    String currencyWidgetPath;
    String showMoneyStr = Util.removeDecimalZeroFormat(showMoney);
    switch (currencyType) {
      case CurrencyType.Money:
        currencyWidgetPath = MoneyConfig.moneyIcon;
        showMoneyStr = MoneyConfig.moneyNum(Util.parseInt(showMoney * 100),
            fractionDigits: 2);
        break;
      case CurrencyType.Charm:
        currencyWidgetPath = MoneyConfig.moneyCharmIcon;
        showMoneyStr = MoneyConfig.moneyNum(Util.parseInt(showMoney * 100),
            fractionDigits: 2);
        break;
      case CurrencyType.GoldCoin:
        currencyWidgetPath = R.imagePath(Assets.settings$ic_gold_coin_png,
            package: ComponentManager.MANAGER_SETTINGS);
        break;
      case CurrencyType.GoldBean:
        currencyWidgetPath = MoneyConfig.goldBeanIcon;
        break;
    }

    res.add(NumText("$pre$showMoneyStr",
        style: TextStyle(
            fontSize: 18.0,
            color: R.color.mainTextColor,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic)));
    res.add(const SizedBox(width: 2));
    res.add(R.img(currencyWidgetPath,
        width: 20, height: 20, fit: BoxFit.contain, wholePath: true));
  }

  @override
  Future<void> onRemove(int id, int dateline) {
    return _onRemove(id, dateline);
  }
}

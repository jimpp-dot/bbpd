import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../../assets.dart';
import '../../../k.dart';
import 'account_money_helper.dart';

/// 金币 or 碎片
class GoldCoinPage extends StatefulWidget {
  final String? type;

  const GoldCoinPage({Key? key, this.type}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GoldCoinPageState();
  }
}

class _GoldCoinPageState extends State<GoldCoinPage> {
  bool _loading = true;
  List _data = [];

  @override
  void initState() {
    super.initState();
    _load();
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
        } else {
          _data = res['data'];
          _loading = false;
        }
      });
    } catch (e) {
      Log.d(e.toString());
      if (!mounted) return;
      setState(() {
        _loading = false;
      });
    }
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
          int money = widget.type == 'piece'
              ? Util.parseInt(value['num'])
              : Util.parseInt(value['coin']);
          return InkWell(
            onTap: null,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: R.color.dividerColor, width: 0.5),
                ),
              ),
              margin: const EdgeInsetsDirectional.only(start: 20.0, end: 20.0),
              padding:
                  const EdgeInsetsDirectional.only(top: 12.0, bottom: 12.0),
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
                      _assembleWidget(
                          AccountMoneyHelper.getGoldPre(value['op']),
                          money,
                          value),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
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

  Widget _assembleWidget(String pre, dynamic money, Map value) {
    List<Widget> res = [];
    int showMoney = Util.parseInt(money, 0);

    /// bool isPositive = pre == '+';
    res.add(NumText(
      "$pre$showMoney",
      style: TextStyle(
          fontSize: 18.0,
          color: R.color.mainTextColor,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic),
    ));
    res.add(const SizedBox(width: 2));
    if (widget.type == 'piece') {
      res.add(CachedNetworkImage(
          imageUrl: value['piece_icon'] ?? '',
          width: 20,
          height: 20,
          fit: BoxFit.contain));
    } else {
      res.add(R.img(Assets.settings$ic_gold_coin_png,
          width: 20,
          height: 20,
          fit: BoxFit.contain,
          package: ComponentManager.MANAGER_SETTINGS));
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: res,
    );
  }
}

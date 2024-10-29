import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../../k.dart';
import 'account_money_helper.dart';
import 'account_money_repository.dart';
import 'on_remove.dart';

/// 锁定
class LockPage extends StatefulWidget {
  final String? type;

  const LockPage({super.key, this.type});

  @override
  _LockPageState createState() => _LockPageState();
}

class _LockPageState extends State<LockPage> implements OnRemove {
  bool _loading = true;
  List _data = [];
  final Map<int, ValueKey<int>> _keys = {};

  @override
  initState() {
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
        _data = res['data'];
        _loading = false;
        _keys.clear();
        for (var value in _data) {
          Map data = value;
          int id = Util.parseInt(data['id']);
          _keys[id] = ValueKey<int>(id);
        }
      });
    } catch (e) {}
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
            double money = Util.parseInt(value['money']) / 100;

            int id = Util.parseInt(value['id']);
            String msg = value['type'] == 'income'
                ? K.setting_from_redpackage_info([value['uname']])
                : K.setting_to_redpackage_info([value['toname']]);
            return InkWell(
              key: _keys[id],
              onLongPress: () async {
                await AccountMoneyHelper.removeItem(
                    this, id, Util.parseInt(value['dateline'], 0));
              },
              onTap: () {
                _onTapPacket(value);
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
                margin:
                    const EdgeInsetsDirectional.only(start: 20.0, end: 20.0),
                padding:
                    const EdgeInsetsDirectional.only(top: 12.0, bottom: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            msg,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: R.color.mainTextColor,
                            ),
                          ),
                        ),
                        if (money > 0) const SizedBox(width: 20),
                        _renderReason(value['type'], money),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          K.setting_locking,
                          style: TextStyle(
                              fontSize: 13.0,
                              color: R.color.mainTextColor.withOpacity(0.6)),
                        ),
                        Text(
                          AccountMoneyHelper.getDateline(
                              Util.parseInt(value['dateline'])),
                          style: TextStyle(
                              fontSize: 13.0,
                              color: R.color.mainTextColor.withOpacity(0.6)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
        onRefresh: _load);
  }

  Widget _renderReason(String type, double money) {
    if (money == 0) {
      return Container();
    }

    String pre = '';
    if (type == 'income') {
      pre = '+';
    } else if (type == 'consume') {
      pre = '-';
    }
    List<Widget> res = [];
    res.add(NumText(
      "$pre${MoneyConfig.moneyNum(Util.parseInt(money * 100), fractionDigits: 2)}",
      style: TextStyle(
        fontSize: 18.0,
        color: R.color.mainTextColor,
        fontWeight: FontWeight.w500,
      ),
    ));
    res.add(const SizedBox(width: 2));
    res.add(Image.asset(MoneyConfig.moneyIcon, width: 20, height: 20));
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: res);
  }

  void _onTapPacket(Map value) async {
    String type = value['type'];
//    int money = Util.parseInt(value['money']);
    String id = value['id'];
    String op = 'confirm';
    if (type == 'income') {
      op = 'cancel';
    } else if (type == 'consume') {
      op = 'confirm';
    }

    //底部弹出操作菜单
    List<SheetItem> res = [];
    if (op == 'cancel') {
      res.add(SheetItem(K.setting_return_redpackage, 'cancel'));
    } else if (op == 'confirm') {
      res.add(SheetItem(K.setting_complete_redpackage, 'confirm'));
    }

    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(title: K.setting_do_operate, data: res);
        });

    Log.d('_PackageItemState._onTapPacket');
    if (result != null) {
      _sentAction(op, id);
    }
  }

  _sentAction(String op, String id) async {
    await AccountMoneyRepository.doMoneyAction(this, op, id);
    if (!mounted) return;
    await _load();
  }

  @override
  Future<void> onRemove(int id, int dateline) {
    return _onRemove(id, dateline);
  }
}

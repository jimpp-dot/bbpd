import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../k.dart';

/// 订单收入统计
class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StatisticsPageState();
  }
}

class _StatisticsPageState extends State<StatisticsPage> {
  final DateFormat _dateFormat = DateFormat('yyyy.MM.dd');

  bool _loading = true;
  List _data = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      String url = "${System.domain}order/ordersum";
      DateTime now = DateTime.now();
      int year = now.year;
      int month = now.month;
      if (month == 1) {
        year = year - 1;
        month = 12;
      } else {
        month = month - 1;
      }
      int start = DateTime(year, month, 1).millisecondsSinceEpoch ~/ 1000;
      XhrResponse response = await Xhr.postJson(
          url,
          {
            'start': start.toString(),
          },
          throwOnError: true);
      _loading = false;
      if (!mounted) return;
      Map res = response.response as Map;
      if (res['success'] == true) {
        setState(() {
          _data = res['data'] ?? [];
          _data.sort((a, b) {
            return Util.parseInt(b['date']).compareTo(Util.parseInt(a['date']));
          });
        });
      }
    } catch (e) {
      Log.d(e.toString());
      _loading = false;
    }
  }

  /// 本月每天的收入
  List<Widget> _getCurMonthDays() {
    var now = DateTime.now();
    int year = now.year;
    int month = now.month;

    List<Widget> widgets = [];
    for (var map in _data) {
      int timestamp = Util.parseInt(map['date']);
      int income = Util.parseInt(map['income']);
      if (timestamp > 0) {
        timestamp = timestamp * 1000; // second => millisecond
        DateTime dt = DateTime.fromMillisecondsSinceEpoch(timestamp);
        if (year == dt.year && month == dt.month) {
          widgets.add(_dayItem(_dateFormat.format(dt), income));
        }
      }
    }
    return widgets;
  }

  /// 上个月每天的收入
  List<Widget> _getLastMonthDays() {
    var now = DateTime.now();
    int year = now.year;
    int month = now.month;
    if (month == 1) {
      year = year - 1;
      month = 12;
    } else {
      month = month - 1;
    }

    List<Widget> widgets = [];
    for (var map in _data) {
      int timestamp = Util.parseInt(map['date']);
      int income = Util.parseInt(map['income']);
      if (timestamp > 0) {
        timestamp = timestamp * 1000; // second => millisecond
        DateTime dt = DateTime.fromMillisecondsSinceEpoch(timestamp);
        if (year == dt.year && month == dt.month) {
          widgets.add(_dayItem(_dateFormat.format(dt), income));
        }
      }
    }
    return widgets;
  }

  Widget _dayItem(String date, int income) {
    return Container(
      height: 71,
      margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: R.color.dividerColor,
          ),
        ),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text(
                  K.setting_day_order_complete,
                  style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 16,
                  ),
                ),
              ),
              NumText(
                '+${MoneyConfig.moneyNum(income, fractionDigits: 2)}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: R.color.mainTextColor,
                ),
              ),
              const SizedBox(width: 2),
              Image.asset(
                MoneyConfig.moneyIcon,
                width: 20,
                height: 20,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: TextStyle(
              fontSize: 13,
              color: R.color.mainTextColor.withOpacity(0.6),
            ),
          )
        ],
      ),
    );
  }

  Widget _monthItem(String title, double total) {
    return Container(
      height: 40,
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: R.color.mainTextColor,
                fontSize: 16,
              ),
            ),
          ),
          NumText(
            '+${MoneyConfig.moneyNum(Util.parseInt(total * 100), fractionDigits: 2)}',
            style: TextStyle(
                color: R.color.mainBrandColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic),
          ),
          const SizedBox(width: 2),
          Image.asset(
            MoneyConfig.moneyIcon,
            width: 20,
            height: 20,
          ),
        ],
      ),
    );
  }

  /// 计算当月的总收入
  double _calcCurMonth() {
    var now = DateTime.now();
    int year = now.year;
    int month = now.month;
    return _calcMonthTotal(year, month);
  }

  /// 计算上个月的总收入
  double _calcLastMonth() {
    var now = DateTime.now();
    int year = now.year;
    int month = now.month;
    if (month == 1) {
      year = year - 1;
      month = 12;
    } else {
      month = month - 1;
    }

    return _calcMonthTotal(year, month);
  }

  /// 计算月收入
  double _calcMonthTotal(int year, int month) {
    int total = 0;
    for (var map in _data) {
      int timestamp = Util.parseInt(map['date']);
      if (timestamp > 0) {
        timestamp = timestamp * 1000; // second => millisecond
        DateTime dt = DateTime.fromMillisecondsSinceEpoch(timestamp);
        if (year == dt.year && month == dt.month) {
          total += Util.parseInt(map['income']);
        }
      }
    }
    return total == 0 ? 0 : (total / 100);
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

    List<Widget> widgets = [];
    widgets.add(_monthItem(K.setting_cur_month_income, _calcCurMonth()));
    widgets.addAll(_getCurMonthDays());
    widgets.add(_monthItem(K.setting_pre_month_income, _calcLastMonth()));
    widgets.addAll(_getLastMonthDays());

    return RefreshIndicatorFactory.of(
      onRefresh: _load,
      child: ListView(
        children: widgets,
      ),
    );
  }
}

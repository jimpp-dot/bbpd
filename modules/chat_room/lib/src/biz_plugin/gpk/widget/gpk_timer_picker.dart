import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';

/// 显示分组pk的时间选择器
/// [minSecond] 最小显示的秒数，取值[0,60);
/// [secondList] 基本显示的秒列表;
/// [minuteList] 基本显示的分钟列表;
Future<GPKTimerResult?> showTimerPickerPopup(
    {required BuildContext context,
    required final int minSecond,
    String? title,
    List<int>? secondList,
    List<int>? minuteList}) async {
  if (secondList == null) {
    var retVal = <int>[];
    for (var i = 0, step = 5; i <= 60; i = i + step) {
      retVal.add(i);
    }
    secondList = retVal;
  }

  if (minuteList == null) {
    var mList = <int>[];
    for (var i = 0, step = 1; i <= 30; i = i + step) {
      mList.add(i);
      if (i >= 10) {
        step = 5;
      }
    }
    minuteList = mList;
  }

  return await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return _GPKTimerPicker(
          title: title,
          minSecond: minSecond,
          secondList: secondList!,
          minuteList: minuteList!,
        );
      });
}

/// 时间选择器，提供两列
class _GPKTimerPicker extends StatefulWidget {
  final int minSecond;
  final String? title;
  final List<int> secondList;
  final List<int> minuteList;

  /// [minSecond] [0~60)
  const _GPKTimerPicker(
      {this.title,
      this.minSecond = 1,
      required this.secondList,
      required this.minuteList});

  @override
  _GPKTimerPickerState createState() => _GPKTimerPickerState();
}

class GPKTimerResult {
  int minute = 0;
  int second = 0;

  @override
  String toString() {
    return 'GPKTimerResult{minute: $minute, second: $second}';
  }
}

class _GPKTimerPickerState extends State<_GPKTimerPicker> {
  late List<int> _minutes;

  /// 大于等于一分钟显示的秒数
  late List<int> _secondsGreater1M;

  /// 小于一分钟显示的秒数
  late List<int> _secondsLess1M;

  /// 当前是否大于等于1分钟
  bool _greater1M = true;

  late FixedExtentScrollController _minuteScrollController;
  late FixedExtentScrollController _secondScrollController;

  @override
  void initState() {
    super.initState();
    _minutes = widget.minuteList;

    _secondsGreater1M = widget.secondList;
    _secondsLess1M =
        widget.secondList.where((e) => e >= widget.minSecond).toList();

    _minuteScrollController = FixedExtentScrollController(initialItem: 1);
    _secondScrollController = FixedExtentScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _minuteScrollController.dispose();
    _secondScrollController.dispose();
  }

  _getSecondsList() {
    return _greater1M ? _secondsGreater1M : _secondsLess1M;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: R.color.mainBgColor,
      height: 300,
      child: Column(
        children: [
          _buildTitle(context),
          Divider(
            height: 1,
            color: R.color.dividerColor,
          ),
          Expanded(child: _buildTimerPicker(context)),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                K.cancel,
                style: TextStyle(color: R.color.secondTextColor, fontSize: 16),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                widget.title ?? K.room_pls_select,
                style: TextStyle(color: R.color.mainTextColor, fontSize: 18),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _handleConfirm();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                K.room_confirm,
                style: TextStyle(color: R.color.mainTextColor, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimerPicker(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CupertinoPicker(
            itemExtent: 30,
            squeeze: 1.2,
            useMagnifier: true,
            magnification: 1.2,
            scrollController: _minuteScrollController,
            onSelectedItemChanged: (position) {
              var m = _minutes[position];
              Log.d(tag: 'gpk', 'gpk timer picker minute->$m');

              var old = _greater1M;
              // 分钟大于1分钟时
              if (m >= 1) {
                _greater1M = true;
              } else {
                _greater1M = false;
              }

              if (old != _greater1M) {
                _refresh();
                _secondScrollController.jumpToItem(0);
              }
            },
            children: _buildTimerItem(_minutes, K.room_unit_minute),
          ),
        ),
        Expanded(
          child: CupertinoPicker(
            itemExtent: 30,
            squeeze: 1.2,
            useMagnifier: true,
            magnification: 1.2,
            scrollController: _secondScrollController,
            onSelectedItemChanged: (position) {
              var s = _getSecondsList()[position];
              Log.d(tag: 'gpk', 'gpk timer picker second->$s');
            },
            children: _buildTimerItem(_getSecondsList(), K.room_unit_second),
          ),
        )
      ],
    );
  }

  List<Widget> _buildTimerItem(List<int> list, String unit) {
    return list
        .map((e) => Text(
              '$e$unit',
              style: TextStyle(color: R.color.mainTextColor),
            ))
        .toList();
  }

  _refresh() {
    if (mounted) setState(() {});
  }

  void _handleConfirm() {
    var result = GPKTimerResult();
    result.minute = _minutes[_minuteScrollController.selectedItem];
    result.second = _getSecondsList()[_secondScrollController.selectedItem];

    Navigator.pop(context, result);
  }
}

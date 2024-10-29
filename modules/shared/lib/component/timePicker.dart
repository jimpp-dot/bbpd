import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:shared/k.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';

typedef TimePickerCallBack = Function(int day, int hour, int minute);

class TimePicker extends StatefulWidget {
  final int time;
  final TimePickerCallBack submit;

  const TimePicker({super.key, required this.time, required this.submit});

  @override
  _State createState() => _State();
}

class _State extends State<TimePicker> {
  final List _dayList = R.array('day_list_array');
  final List _hourList = [];
  List _miniteList = [];
  int _dayIndex = 0;
  int _hourIndex = 0;
  int _miniteIndex = 0;
  final List _pickerData = [];
  bool _ready = false;
  Picker? _picker;
  PickerDataAdapter<String>? psAdapter;

  @override
  void initState() {
    super.initState();

    if (widget.time >= 0) {
      DateTime now = DateTime.now();
      DateTime todayStart = DateTime(now.year, now.month, now.day, 0, 0, 0);
      int diff =
          (now.millisecondsSinceEpoch - todayStart.millisecondsSinceEpoch) ~/
              (1000 * 86400);
      if (diff < 1) {
        _dayIndex = 0;
      } else if (diff < 2) {
        _dayIndex = 1;
      } else {
        _dayIndex = 2;
      }
    }

    _initHour();
    _ready = true;
  }

  void _initHour() {
    int hour = 0;
    DateTime orderTime =
        DateTime.fromMicrosecondsSinceEpoch(widget.time * 1000000);
    DateTime now = DateTime.now();
    _hourList.clear();
    if (_dayIndex == 0) {
      _hourList.add(K.base_now);
      hour = now.hour;
      int minite = now.minute;
      if (minite >= 30) hour++;
    }

    int countIndex = 0;
    for (int i = hour; i < 24; i++) {
      _hourList.add(i.toString());

      if (_ready == false && widget.time > 0 && orderTime.hour == i) {
        _hourIndex = countIndex + (_dayIndex == 0 ? 1 : 0);
      }
      countIndex++;
    }

    _initMin();
  }

  void _initMin() {
    _miniteList.clear();
    if (_dayIndex == 0 && _hourIndex == 0) {
      _miniteList = [''];
    } else {
      int hour = Util.parseInt(_hourList[_hourIndex]);
      DateTime now = DateTime.now();

      int begin = 0;
      if (_dayIndex == 0 && _hourIndex == 1 && hour == now.hour) {
        begin = (now.minute / 15).ceil();
        if (begin * 15 - now.minute <= 5) {
          begin++;
        }
      } else if (hour - now.hour == 1) {
        if (now.minute >= 55) {
          begin = 1;
        }
      } else if (_dayIndex == 1 && _hourIndex == 0) {
        if (now.minute >= 55) {
          begin = 1;
        }
      }

      Log.d('zzzzzzzzzz$begin');

      int countIndex = 0;
      DateTime orderTime =
          DateTime.fromMicrosecondsSinceEpoch(widget.time * 1000000);

      for (var i = begin; i < 4; i++) {
        _miniteList.add((i * 15).toString());
        if (_ready == false && widget.time > 0 && orderTime.minute == i * 15) {
          _miniteIndex = countIndex;
        }
        countIndex++;
      }
    }

    _pickerData.clear();
    _pickerData.add(_dayList);
    _pickerData.add(_hourList);
    _pickerData.add(_miniteList);

    Log.d(jsonEncode(_pickerData));

    psAdapter = PickerDataAdapter<String>(
      pickerdata: _pickerData,
      isArray: true,
    );

    if (_picker == null) {
      _picker = Picker(
          hideHeader: true,
          adapter: psAdapter!,
          backgroundColor: R.color.mainBgColor,
          containerColor: R.color.mainBgColor,
          itemExtent: 40,
          textStyle: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 17,
              fontFamily: Util.fontFamily),
//          selectTextStyle: TextStyle(color: R.color.mainBrandColor, fontSize: 16),
          selecteds: [_dayIndex, _hourIndex, _miniteIndex],
          onConfirm: (Picker picker, List value) {
            setState(() {
              _dayIndex = value[0] ?? 0;
              _hourIndex = value[1] ?? 0;
              _miniteIndex = value.length >= 3 ? value[2] : 0;
            });

            _initHour();
          },
          onSelect: (Picker picker, int index, List value) {
            setState(() {
              _dayIndex = value[0] ?? 0;
              _hourIndex = value[1] ?? 0;
              _miniteIndex = value.length >= 3 ? value[2] : 0;
            });

            _initHour();
          });
    } else {
      _picker!.adapter = psAdapter!;
      _picker!.adapter.notifyDataChanged();
    }

    setState(() {});
  }

  Widget _renderBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14.0),
              child: Text(
                K.cancel,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: R.color.secondTextColor,
                ),
              ),
            )),
        InkWell(
          onTap: () {
            Navigator.of(context).pop();

            if (_dayIndex == 0 && _hourIndex == 0) {
              DateTime orderTime = DateTime.fromMicrosecondsSinceEpoch(
                  Utility.getLastOrderTime() * 1000000);

              widget.submit(0, orderTime.hour, orderTime.minute);
            } else {
              int day = _dayIndex;
              int hour = _dayIndex == 0 && _hourIndex == 0
                  ? 0
                  : Util.parseInt(_hourList[_hourIndex]);
              int minite = _miniteList.isNotEmpty
                  ? Util.parseInt(_miniteList[_miniteIndex])
                  : 0;
              widget.submit(day, hour, minite);
            }
          },
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14.0),
            child: Text(
              K.confirm,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: R.color.mainBrandColor,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _renderHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text(
              K.base_time,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: R.color.secondTextColor,
              ),
            ),
          ),
          Expanded(
            child: Text(
              K.base_hour,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: R.color.secondTextColor,
              ),
            ),
          ),
          Expanded(
            child: Text(
              K.base_minute,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: R.color.secondTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: R.color.mainBgColor,
        height: 260.0 + Util.iphoneXBottom,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(bottom: Util.iphoneXBottom),
        child: DefaultTextStyle(
          style: TextStyle(fontFamily: Util.fontFamily),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _renderBtn(),
              Container(
                height: 0.5,
                color: R.color.dividerColor,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 18.0,
                    right: 18.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _renderHeader(),
                      if (_picker != null) _picker!.makePicker(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

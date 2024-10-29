import 'package:shared/k.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:shared/shared.dart';

typedef TimeNumPickerCallBack = Function(
    int day, int hour, int minute, int num);

class TimeNumPicker extends StatefulWidget {
  final int time;
  final String unit;
  final TimeNumPickerCallBack submit;

  const TimeNumPicker(
      {super.key,
      required this.time,
      required this.unit,
      required this.submit});

  @override
  _State createState() => _State();
}

class _State extends State<TimeNumPicker> {
  final List _dayList = R.array('day_list_array');
  final List _hourList = [];
  List _miniteList = [];
  int _dayIndex = 0;
  int _hourIndex = 0;
  int _miniteIndex = 0;
  final List _pickerData = [];
  bool _ready = false;
  Picker? ps;
  Picker? pe;
  final List _numList = [];
  int _numIndex = 0;
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

    if (ps == null) {
      ps = Picker(
          hideHeader: true,
          adapter: psAdapter!,
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
//			ps = new Picker(
//				hideHeader: true,
//				adapter: psAdapter,
//				onConfirm: (Picker picker, List value) {
//					setState(() {
//						_dayIndex = value[0] ?? 0;
//						_hourIndex = value[1] ?? 0;
//						_miniteIndex = value.length >= 3 ? value[2] : 0;
//					});
//
//					_initHour();
//				},
//				onSelect: (Picker picker, int index, List value) {
//					setState(() {
//						_dayIndex = value[0] ?? 0;
//						_hourIndex = value[1] ?? 0;
//						_miniteIndex = value.length >= 3 ? value[2] : 0;
//					});
//
//					_initHour();
//				}
//			);
//
//			Log.d(ps.adapter.toString());
      ps!.adapter = psAdapter!;
      ps!.adapter.notifyDataChanged();
    }

    List tmp = [];
    for (int i = 1; i < 24; i++) {
      tmp.add('$i次 ${widget.unit}/次');
    }
    _numList.add(tmp);

    pe ??= Picker(
        hideHeader: true,
        adapter: PickerDataAdapter<String>(
          pickerdata: _numList,
          isArray: true,
        ),
        onConfirm: (Picker picker, List value) {
          setState(() {
            _numIndex = value[0] ?? 0;
          });

          _initHour();
        },
        onSelect: (Picker picker, int index, List value) {
          setState(() {
            _numIndex = value[0] ?? 0;
          });
        });

    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _renderBtn() {
    return Row(
      children: <Widget>[
        InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: const EdgeInsets.only(
                  left: 18.0, right: 18.0, top: 4.0, bottom: 4.0),
              child: Text(
                K.cancel,
                textScaleFactor: 1.0,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Color(0xFF491100),
                ),
              ),
            )),
        Expanded(child: Container()),
        InkWell(
          onTap: () {
            Navigator.of(context).pop();

            if (_dayIndex == 0 && _hourIndex == 0) {
              int num = _numIndex + 1;
              DateTime orderTime = DateTime.fromMicrosecondsSinceEpoch(
                  Utility.getLastOrderTime() * 1000000);

              widget.submit(0, orderTime.hour, orderTime.minute, num);
            } else {
              int day = _dayIndex;
              int hour = _dayIndex == 0 && _hourIndex == 0
                  ? 0
                  : Util.parseInt(_hourList[_hourIndex]);
              int minite = _miniteList.isNotEmpty
                  ? Util.parseInt(_miniteList[_miniteIndex])
                  : 0;
              int num = _numIndex + 1;
              widget.submit(day, hour, minite, num);
            }
          },
          child: Container(
            padding: const EdgeInsets.only(
                left: 18.0, right: 18.0, top: 4.0, bottom: 4.0),
            child: Text(
              K.confirm,
              textScaleFactor: 1.0,
              style: const TextStyle(
                fontSize: 14.0,
                color: Color(0xFF491100),
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
                textAlign: TextAlign.start,
                textScaleFactor: 1.0,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Color(0xFFaaaaaa),
                ),
              ),
            ),
            Expanded(
              child: Text(
                K.base_hour,
                textAlign: TextAlign.center,
                textScaleFactor: 1.0,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Color(0xFFaaaaaa),
                ),
              ),
            ),
            Expanded(
              child: Text(
                K.base_minute,
                textAlign: TextAlign.center,
                textScaleFactor: 1.0,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Color(0xFFaaaaaa),
                ),
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            height: 380.0 + Util.iphoneXBottom,
            alignment: AlignmentDirectional.centerStart,
            child: DefaultTextStyle(
              style: TextStyle(fontFamily: Util.fontFamily),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _renderBtn(),
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
                            if (ps != null) ps!.makePicker(),
                            Text(
                              K.base_order_receiving,
                              textAlign: TextAlign.start,
                              textScaleFactor: 1.0,
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Color(0xFFaaaaaa),
                              ),
                            ),
                            if (pe != null) pe!.makePicker()
                          ],
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ));
  }
}

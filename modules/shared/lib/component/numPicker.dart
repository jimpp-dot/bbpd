import 'package:shared/shared.dart';
import 'package:shared/k.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';

typedef NumPickerCallBack = Function(int num);

class NumPicker extends StatefulWidget {
  final int? num;
  final String unit;
  final NumPickerCallBack submit;

  const NumPicker(
      {super.key, this.num, required this.unit, required this.submit});

  @override
  _State createState() => _State();
}

class _State extends State<NumPicker> {
  Picker? _picker;
  late PickerDataAdapter<String> peAdapter;
  final List _numList = [];
  int _numIndex = 0;

  @override
  void initState() {
    super.initState();
    _initNum();
  }

  void _initNum() {
    List tmp = [];
    for (int i = 0; i < 24; i++) {
      tmp.add('${i + 1}${K.base_order_unit}${widget.unit})');
      if (widget.num == (i + 1)) {
        _numIndex = i;
      }
    }
    _numList.add(tmp);

    peAdapter = PickerDataAdapter<String>(
      pickerdata: _numList,
      isArray: true,
    );

    _picker ??= Picker(
        hideHeader: true,
        itemExtent: 48,
        backgroundColor: R.color.mainBgColor,
        containerColor: R.color.mainBgColor,
        textStyle: TextStyle(color: R.color.secondTextColor, fontSize: 16),
        adapter: peAdapter,
        selecteds: [_numIndex],
        onConfirm: (Picker picker, List value) {
          setState(() {
            _numIndex = value[0] ?? 0;
          });
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
                color: R.color.secondTextColor,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pop();

            int num = _numIndex + 1;
            widget.submit(num);
          },
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14.0),
            child: Text(
              K.confirm,
              style: TextStyle(
                fontSize: 16.0,
                color: R.color.mainBrandColor,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.topCenter,
        height: 240 + Util.iphoneXBottom,
        padding: EdgeInsets.only(bottom: Util.iphoneXBottom),
        color: R.color.mainBgColor,
        child: DefaultTextStyle(
          style: TextStyle(fontFamily: Util.fontFamily),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _renderBtn(),
              Container(height: 0.5, color: R.color.dividerColor),
              Container(
                padding:
                    const EdgeInsets.only(left: 18.0, right: 18.0, top: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      K.base_order_receiving,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 14.0, color: R.color.secondTextColor),
                    ),
                    _picker!.makePicker()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

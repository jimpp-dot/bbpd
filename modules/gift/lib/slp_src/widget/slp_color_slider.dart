import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class SlpColorSlider extends StatefulWidget {
  final double value;
  final Function(double)? valueChange;
  final Function(double)? valueChangeEnd;
  final double margin;
  final double itemW;
  const SlpColorSlider(
      {this.value = 0,
      this.valueChange,
      this.valueChangeEnd,
      this.margin = 16,
      this.itemW = 20,
      Key? key})
      : super(key: key);

  @override
  _SlpColorSliderState createState() => _SlpColorSliderState();
}

class _SlpColorSliderState extends State<SlpColorSlider> {
  double _centerX = 0;
  double _progress = 0;
  double _totalWidth = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _progress = widget.value;
    _totalWidth = Util.width - widget.margin * 2 - widget.itemW;
    _centerX = widget.margin + widget.itemW / 2.0 + _progress * _totalWidth;
    Log.d(
        '_buildprogress:$_progress  value:${widget.value}  _centerX:$_centerX');
    return Stack(
      children: [
        Container(
          alignment: AlignmentDirectional.center,
          margin: EdgeInsetsDirectional.only(
              start: widget.itemW / 2 + widget.margin,
              end: widget.itemW / 2 + widget.margin,
              top: 4,
              bottom: 4),
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: AlignmentDirectional.centerStart,
                  end: AlignmentDirectional.centerEnd,
                  colors: [
                    Color.fromRGBO(255, 0, 0, 1),
                    Color.fromRGBO(255, 255, 0, 1),
                    Color.fromRGBO(0, 255, 0, 1),
                    Color.fromRGBO(0, 255, 255, 1),
                    Color.fromRGBO(0, 0, 255, 1),
                    Color.fromRGBO(255, 0, 255, 1),
                    Color.fromRGBO(255, 0, 0, 1),
                  ]),
              borderRadius: BorderRadius.circular(6)),
          height: 12,
        ),
        PositionedDirectional(
          start: _centerX - widget.itemW / 2,
          top: 0,
          bottom: 0,
          width: widget.itemW,
          child: GestureDetector(
            onPanUpdate: (DragUpdateDetails e) {
              setState(() {
                _centerX = min(
                    max(widget.margin + widget.itemW / 2.0,
                        e.globalPosition.dx),
                    widget.margin + _totalWidth + widget.itemW / 2.0);
                _progress =
                    (_centerX - widget.itemW / 2 - widget.margin) / _totalWidth;
              });
              if (widget.valueChange != null) {
                widget.valueChange!(_progress);
              }
            },
            onPanEnd: (DragEndDetails e) {
              setState(() {
                _progress =
                    (_centerX - widget.itemW / 2 - widget.margin) / _totalWidth;
              });
              if (widget.valueChangeEnd != null) {
                widget.valueChangeEnd!(_progress);
              }
              Log.d('onPanEnd:$_progress');
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 3, color: Colors.white),
                  color: _colorWithHue(360 * _progress)),
            ),
          ),
        )
      ],
    );
  }

  Color _colorWithHue(double hue) {
    int H = Util.parseInt(hue);
    H = H % 360;
    double r = 0, g = 0, b = 0;
    double s = 1.0;
    double v = 1.0;
    int i = H ~/ 60 % 6;
    double f = H / 60.0 - i;
    double p = v * (1 - s);
    double q = v * (1 - f * s);
    double t = v * (1 - (1 - f) * s);
    // Log.d('colorWithHue:$H i:$i f:$f p:$p q:$q  t:$t');
    switch (i) {
      case 0:
        r = v;
        g = t;
        b = p;
        break;
      case 1:
        r = q;
        g = v;
        b = p;
        break;
      case 2:
        r = p;
        g = v;
        b = t;
        break;
      case 3:
        r = p;
        g = q;
        b = v;
        break;
      case 4:
        r = t;
        g = p;
        b = v;
        break;
      case 5:
        r = v;
        g = p;
        b = q;
        break;
    }
    // Log.d('colorWithHue:r:$r g:$g b:$b');
    return Color.fromRGBO(Util.parseInt(r * 255), Util.parseInt(g * 255),
        Util.parseInt(b * 255), 1);
  }
}

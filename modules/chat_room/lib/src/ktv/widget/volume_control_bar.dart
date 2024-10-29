import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../model/sound_type.dart';

typedef OnVolumeChanged = void Function(double value, SoundType soundType);

class VolumeControlBar extends StatefulWidget {
  final SoundType soundType;
  final OnVolumeChanged? onVolumeChanged;
  final double initVolume;

  const VolumeControlBar(
      {super.key,
      this.onVolumeChanged,
      this.soundType = SoundType.voice,
      this.initVolume = 0.8});

  @override
  _VolumeControlBarState createState() => _VolumeControlBarState();
}

class _VolumeControlBarState extends State<VolumeControlBar> {
  double _progress = 0;

  set progress(double value) {
    _progress = value;
    if (widget.onVolumeChanged != null) {
      widget.onVolumeChanged!(value, widget.soundType);
    }
  }

  double _dx = 0.0;

  double _initProgress = 0;
  double _startX = 0.0;

  double _width = 0.0;

  final GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _progress = widget.initVolume;
  }

  @override
  Widget build(BuildContext context) {
    double circleDiameter = 12.0 * 2;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      _width = constraints.constrainWidth();
      return SizedBox(
        key: _globalKey,
        height: circleDiameter,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.centerStart,
          children: <Widget>[
            //最底下的背景条
            Container(
              height: 2,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(1),
              ),
            ),
            //中间的进度条
            FractionallySizedBox(
              widthFactor: _progress,
              child: Container(
                height: 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ),
            //控制圆球
            SizedBox(
              height: circleDiameter,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onHorizontalDragDown: (details) {
                  Log.d('_VolumeControllBarState.build onHorizontalDragDown');
                  _startX = details.globalPosition.dx;

                  if (_globalKey.currentContext == null) return;

                  RenderBox renderBox = _globalKey.currentContext!
                      .findRenderObject() as RenderBox;
                  Offset offset = renderBox.localToGlobal(Offset.zero);

                  progress = (_startX - offset.dx) / _width;
                  _initProgress = _progress;

                  refresh();
                },
                onHorizontalDragStart: (details) {
                  Log.d('_VolumeControllBarState.build onHorizontalDragStart');
                },
                onHorizontalDragUpdate: (details) {
                  Log.d('_VolumeControllBarState.build onHorizontalDragUpdate');
                  _dx = details.globalPosition.dx - _startX;
                  double value = _initProgress + _dx / _width;
                  if (value < 0) value = 0;
                  if (value > 1) value = 1;
                  progress = value;
                  Log.d(
                      '_VolumeControllBarState._buildControllCircle move progress = $_progress');
                  refresh();
                },
                onHorizontalDragEnd: (details) {
                  Log.d('_VolumeControllBarState.build onHorizontalDragEnd');
                  refresh();
                },
                onHorizontalDragCancel: () {
                  Log.d('_VolumeControllBarState.build onHorizontalDragCancel');
                },
                onTap: () {
                  Log.d('_VolumeControllBarState.build onTap');
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    PositionedDirectional(
                      start: _getCircleStart(
                          circleDiameter, constraints.constrainWidth()),
                      child: _buildControlCircle(circleDiameter),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildControlCircle(double circleDiameter) {
    return Container(
      width: circleDiameter,
      height: circleDiameter,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
      ),
      alignment: AlignmentDirectional.center,
      child: Container(
        width: circleDiameter / 2,
        height: circleDiameter / 2,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
      ),
    );
  }

  double _getCircleStart(double circleDiameter, double constrainWidth) {
    double minStart = -circleDiameter / 2;
    double maxEnd = constrainWidth - circleDiameter / 2;
    double start = minStart + _progress * constrainWidth;
    if (start < minStart) start = minStart;
    if (start > maxEnd) start = maxEnd;
    return start;
  }
}

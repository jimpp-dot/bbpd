import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 惩罚-贴纸条
class PunishPaperWidget extends StatefulWidget {
  final double size;
  final int? count;

  const PunishPaperWidget({Key? key, required this.size, this.count})
      : super(key: key);

  @override
  _PunishPaperWidgetState createState() => _PunishPaperWidgetState();
}

class _PunishPaperWidgetState extends State<PunishPaperWidget> {
  final List<Offset> _offsetLst = [];
  double pWidth = 0, pHeight = 0; // 贴纸的宽、高

  @override
  void initState() {
    super.initState();
    _calculatePaperSize();
    _load();
  }

  @override
  void didUpdateWidget(covariant PunishPaperWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.size != oldWidget.size || widget.count != oldWidget.count) {
      if (widget.size != oldWidget.size) {
        _calculatePaperSize();
      }
      _load();
    }
  }

  /// 根据麦位的大小计算纸条的大小
  _calculatePaperSize() {
    pHeight = widget.size * 0.6;
    pWidth = pHeight * 19 / 32;
  }

  @override
  Widget build(BuildContext context) {
    if (_offsetLst.isEmpty) {
      return const SizedBox.shrink();
    }
    List<Widget> list = [];
    for (Offset offset in _offsetLst) {
      list.add(
        PositionedDirectional(
          start: offset.dx,
          top: offset.dy,
          child: R.img('punish/room_punish_stick.png',
              package: ComponentManager.MANAGER_BASE_ROOM,
              width: pWidth,
              height: pHeight),
        ),
      );
    }
    return IgnorePointer(
      child: SizedBox(
        width: widget.size * 1.1,
        height: widget.size * 1.1,
        child: Stack(
          clipBehavior: Clip.none,
          children: list,
        ),
      ),
    );
  }

  /// 计算纸条的位置
  _load() async {
    if (widget.count == null || widget.count == 0) {
      _offsetLst.clear();
    } else {
      int length = widget.count!;
      List leftList = await _randomLeft(widget.size, pWidth, length);
      List topList = await _randomTop(widget.size, pHeight, length);
      _offsetLst.clear();
      for (int i = 0; i < length; i++) {
        _offsetLst.add(Offset(leftList[i], topList[i]));
      }
    }
    refresh();
  }

  /// 随机计算纸条的左边距
  /// [width] 纸条能显示的区域宽度
  /// [pWidth] 纸条的宽度
  Future<List<double>> _randomLeft(
      double width, double pWidth, int length) async {
    List<double> result = [];

    // 将总宽度按纸条的一半宽度等分，每个纸条随机取一份，不能重复
    int divideNum = (width * 2 ~/ pWidth);
    List<int> divideList = [];
    for (int i = 0; i < divideNum; i++) {
      divideList.add(i);
    }
    List tempList = [];

    while (result.length < length) {
      if (tempList.isEmpty) {
        tempList = List.from(divideList);
        tempList.shuffle();
      }

      /// 取第一个
      int random = tempList.removeAt(0);
      result.add(random * pWidth / 2);
    }
    return result;
  }

  /// 随机计算纸条的上边距
  Future<List<double>> _randomTop(
      double size, double pHeight, int length) async {
    List<double> result = [];
    double divideGap = 1.dp;
    // 按总高度三分之一，除以divideGap进行等分，每个纸条取一份，可以重复
    int divideNum = (size / 3) ~/ divideGap;
    while (result.length < length) {
      int random = Random().nextInt(divideNum);
      result.add(random * divideGap);
    }
    return result;
  }
}

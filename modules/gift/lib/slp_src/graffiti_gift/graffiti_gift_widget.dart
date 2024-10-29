import 'package:gift/assets.dart';
import 'package:gift/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart' hide Image;

import 'graffiti_gift_mixin.dart';
import 'graffiti_painter.dart';

/// 涂鸦控件
class GraffitiGiftWidget extends StatefulWidget {
  final String? icon;
  final List<List<Offset>> srcList;
  final ValueSetter<Offset> onPointAdded;

  const GraffitiGiftWidget(
      {super.key,
      required this.icon,
      required this.srcList,
      required this.onPointAdded});

  @override
  State<GraffitiGiftWidget> createState() => _GraffitiGiftWidgetState();
}

class _GraffitiGiftWidgetState extends State<GraffitiGiftWidget>
    with GraffitiGiftMixin {
  /// 最大涂鸦礼物数量
  final int _maxGraffitiPointNum = 100;

  @override
  String? get icon => widget.icon;

  @override
  bool needUpdate(GraffitiGiftWidget oldWidget) => oldWidget.icon != icon;

  @override
  void onImageLoaded(bool success) {
    if (success) {
      refresh();
    }
  }

  List<Offset> get _points {
    List<Offset> list = [];
    for (var item in widget.srcList) {
      list.addAll(item);
    }
    return list;
  }

  /// 是否超过最大数量限制
  bool get _isOverMaxLimitNum => _points.length >= _maxGraffitiPointNum;

  @override
  Widget build(BuildContext context) {
    if (image == null) return Center(child: _buildPlaceHolder());
    List<Offset> points = _points;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onPanStart: (details) =>
          _onAddPoint(details.globalPosition, isFirstAdd: true),
      onPanUpdate: _isOverMaxLimitNum
          ? null
          : (details) => _onAddPoint(details.globalPosition),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          if (points.isEmpty) _buildPlaceHolder(),
          CustomPaint(
            painter: GraffitiPainter(
                list: points, image: image!, showSize: imageShowSize),
            child: const SizedBox.expand(),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceHolder() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        R.img(Assets.gift$graffiti_gift_tip_icon_webp, width: 90, height: 90),
        const SizedBox(height: 16),
        Text(
          K.graffiti_gift_draw_tip,
          style: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  /// 添加涂鸦点位
  void _onAddPoint(Offset oriPoint, {bool isFirstAdd = false}) {
    if (_isOverMaxLimitNum) {
      Fluttertoast.showCenter(
          msg: K.graffiti_gift_draw_num_tip(['$_maxGraffitiPointNum']));
      return;
    }
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    // 涂鸦控件尺寸
    Offset sizeOffset = Offset(renderBox.size.width, renderBox.size.height);

    // 将屏幕坐标系的点转在该控件的坐标点
    Offset localPosition = renderBox.globalToLocal(oriPoint);
    if (localPosition.dx < imageShowSize / 2 ||
        localPosition.dx > sizeOffset.dx - imageShowSize / 2 ||
        localPosition.dy < imageShowSize / 2 ||
        localPosition.dy > sizeOffset.dy - imageShowSize / 2) {
      return;
    }
    if (isFirstAdd) {
      // 当前笔画添加的第一个点,需要新创建List保存当前笔画
      widget.srcList.add([localPosition]);
    } else {
      // 找到当前笔画的List,并判断当前点位是否符合加入条件,加入条件为到上一个点位的距离>=imageSize
      List<Offset> lastPoints = widget.srcList.last;
      if ((lastPoints.last - localPosition).distanceSquared <
          imageShowSize * imageShowSize) {
        return;
      }
      lastPoints.add(localPosition);
    }
    widget.onPointAdded.call(sizeOffset);
    refresh();
  }
}

import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../assets.dart';

class GiftNumSelectWidget extends StatefulWidget {
  final Map data;
  final int selectCount;
  final Offset offset; //箭头位置
  final double extraEnd;
  const GiftNumSelectWidget(
      this.data, this.selectCount, this.offset, this.extraEnd,
      {super.key});
  @override
  _GiftNumSelectWidgetState createState() => _GiftNumSelectWidgetState();
  static Future<int?> show(
      BuildContext buildContext, Map data, int selectCount, Offset offset,
      {double extraEnd = 0}) {
    return showDialog(
        context: buildContext,
        useSafeArea: false,
        barrierColor: Colors.transparent,
        builder: (buildContext) {
          return GiftNumSelectWidget(data, selectCount, offset, extraEnd);
        });
  }
}

class _GiftNumSelectWidgetState extends State<GiftNumSelectWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;
  List<int>? countList;
  int _selectCount = 0;
  @override
  void initState() {
    super.initState();
    countList = widget.data.keys.toList().map((e) => Util.parseInt(e)).toList();
    countList?.sort((a, b) => b.compareTo(a));
    _selectCount = widget.selectCount;
    controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: const ElasticOutCurve(0.8)))
        .animate(controller!)
      ..addListener(() {});

    animation!.addStatusListener((status) {
      Log.d(status.toString());
      if (status == AnimationStatus.completed) {
      } else if (status == AnimationStatus.dismissed) {
        Navigator.of(context).pop();
      }
    });
    controller!.forward();
  }

  @override
  void dispose() {
    controller?.dispose();
    controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double ratio = min(Util.ratio, 1);
    return GestureDetector(
      onTap: () {
        if (mounted) {
          setState(() {});
          controller?.reverse();
        }
      },
      child: Container(
        color: Colors.black.withOpacity(0.12),
        child: ScaleTransition(
          scale: animation!,
          alignment: Alignment(widget.offset.dx * 2 / Util.width - 1,
              widget.offset.dy * 2 / Util.height - 1),
          child: FadeTransition(
            opacity: animation!,
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                PositionedDirectional(
                    bottom: Util.height - widget.offset.dy + 5,
                    end: 60 * (ratio - 1) + 16 * ratio + widget.extraEnd,
                    width: 120,
                    height: 28.0 * (countList?.length ?? 0) + 8,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white),
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                        child: ListView.builder(
                          padding: EdgeInsetsDirectional.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: countList?.length ?? 0,
                          itemBuilder: _buildItem,
                        ),
                      ),
                    )),
                PositionedDirectional(
                    bottom: Util.height - widget.offset.dy,
                    end: Util.width - widget.offset.dx - 5,
                    width: 12,
                    height: 5,
                    // child: Container(color: Colors.red,),
                    child: R.img(Assets.ic_down_arrow_png,
                        width: 12,
                        height: 5,
                        package: ComponentManager.MANAGER_GIFT))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    int count = 0;
    if (countList?.isNotEmpty == true) {
      count = countList![index];
    }
    String title = widget.data[count] ?? widget.data['$count'];
    bool selected = false;
    if (_selectCount == count) {
      selected = true;
    }
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop(count);
        },
        child: Container(
          width: 112,
          height: 28,
          decoration: selected
              ? BoxDecoration(
                  color: R.color.mainBrandColor.withOpacity(0.16),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: R.color.mainBrandColor))
              : null,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 8),
                  child: Text(
                    '$count',
                    style: R.textStyle.medium12
                        .copyWith(color: const Color(0xFF313131)),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  title,
                  style: R.textStyle.regular12.copyWith(
                      color: const Color(0xFF313131).withOpacity(0.6)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

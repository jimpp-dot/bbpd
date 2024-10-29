import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class VindicateGiftNumSelectMenu extends StatefulWidget {
  final Map data;
  final int selectCount;
  final Offset offset; //箭头位置
  final Rect position;
  const VindicateGiftNumSelectMenu(
      this.data, this.selectCount, this.position, this.offset,
      {Key? key})
      : super(key: key);
  @override
  _VindicateGiftNumSelectMenuState createState() =>
      _VindicateGiftNumSelectMenuState();
  static Future<int?> show(BuildContext buildContext, Map data, int selectCount,
      Rect position, Offset offset) {
    return showDialog(
        context: buildContext,
        useSafeArea: false,
        barrierColor: Colors.transparent,
        builder: (buildContext) {
          return VindicateGiftNumSelectMenu(
              data, selectCount, position, offset);
        });
  }
}

class _VindicateGiftNumSelectMenuState extends State<VindicateGiftNumSelectMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late List<int> countList;
  late int _selectCount;
  @override
  void initState() {
    super.initState();
    countList = widget.data.keys.toList().map((e) => Util.parseInt(e)).toList();
    countList.sort((a, b) => b.compareTo(a));
    _selectCount = widget.selectCount;
    controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: const ElasticOutCurve(0.8)))
        .animate(controller)
      ..addListener(() {});

    animation.addStatusListener((status) {
      Log.d(status.toString());
      if (status == AnimationStatus.completed) {
      } else if (status == AnimationStatus.dismissed) {
        Navigator.of(context).pop();
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double ratio = min(Util.ratio, 1);
    return GestureDetector(
      onTap: () {
        if (mounted) {
          setState(() {});
          controller.reverse();
        }
      },
      child: Container(
        color: Colors.black.withOpacity(0.12),
        child: ScaleTransition(
          scale: animation,
          alignment: Alignment(widget.position.left * 2 / Util.width - 1,
              widget.position.top * 2 / Util.height - 1),
          child: FadeTransition(
            opacity: animation,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                PositionedDirectional(
                    bottom: Util.height - widget.position.top + 10,
                    start: widget.position.left -
                        (120 - widget.position.width) / 2.0,
                    // end: 60 * (ratio - 1) + 16 * ratio,
                    width: 120,
                    height: 28.0 * countList.length + 8,
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
                          itemCount: countList.length,
                          itemBuilder: _buildItem,
                        ),
                      ),
                    )),
                PositionedDirectional(
                    bottom: Util.height - widget.position.top + 5,
                    start: widget.position.left -
                        (120 - widget.position.width) / 2.0 +
                        54,
                    // end: Util.width - widget.position.left - 5,
                    width: 12,
                    height: 5,
                    // child: Container(color: Colors.red,),
                    child: R.img('ic_down_arrow.png',
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
    int count = countList[index];
    String title = widget.data['$count'];
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
              ? (BoxDecoration(
                  color: const Color(0xFF9E48F4).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8)))
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
                        .copyWith(color: const Color(0xFF202020)),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  title,
                  style: (selected
                      ? R.textStyle.medium12
                          .copyWith(color: const Color(0xFF202020))
                      : R.textStyle.regular12.copyWith(
                          color: const Color(0xFF202020).withOpacity(0.6))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

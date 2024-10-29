import 'dart:math';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../assets.dart';

class TaskSelectWidget extends StatefulWidget {
  final Map data;
  final Object selectKey;
  final Offset offset; //箭头位置
  const TaskSelectWidget(this.data, this.selectKey, this.offset, {super.key});

  @override
  _TaskSelectWidgetState createState() => _TaskSelectWidgetState();
  static Future show(
      BuildContext buildContext, Map data, Object selectKey, Offset offset) {
    return showDialog(
        context: buildContext,
        useSafeArea: false,
        barrierColor: Colors.transparent,
        builder: (buildContext) {
          return TaskSelectWidget(data, selectKey, offset);
        });
  }
}

class _TaskSelectWidgetState extends State<TaskSelectWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;
  List? _taskKeyList;
  Object _selectKey = 0;

  @override
  void initState() {
    super.initState();
    _taskKeyList = widget.data.keys.toList();
    _selectKey = widget.selectKey;
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
    controller!.dispose();
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
          controller!.reverse();
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
                    end: 60 * (ratio - 1) + 16 * ratio,
                    width: 120,
                    height: 28.0 * _taskKeyList!.length + 8,
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
                          itemCount: _taskKeyList!.length,
                          itemBuilder: _buildItem,
                        ),
                      ),
                    )),
                PositionedDirectional(
                    bottom: Util.height - widget.offset.dy,
                    end: Util.width - widget.offset.dx - 5,
                    width: 12,
                    height: 5,
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
    Object key = _taskKeyList![index];
    String title = widget.data[key];
    bool selected = key == _selectKey;
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop(key);
        },
        child: Container(
          width: 112,
          height: 28,
          decoration: selected
              ? BoxDecoration(
                  color: R.color.mainBrandColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: R.color.mainBrandColor))
              : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color:
                      const Color(0xFF202020).withOpacity(selected ? 1 : 0.6),
                  fontWeight: selected ? FontWeight.w500 : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

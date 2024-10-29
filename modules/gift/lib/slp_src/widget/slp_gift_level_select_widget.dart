import 'dart:math';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../assets.dart';

/// 幸运蛋，选择level控件
class SlpGiftLevelSelectWidget extends StatefulWidget {
  final List<LuckyEggLevel> data;
  final int selectLevel;
  final Offset offset; //箭头位置
  const SlpGiftLevelSelectWidget(this.data, this.selectLevel, this.offset,
      {super.key});

  @override
  _SlpGiftLevelSelectWidgetState createState() {
    return _SlpGiftLevelSelectWidgetState();
  }

  static Future<int?> show(BuildContext buildContext, List<LuckyEggLevel> data,
      int selectLevel, Offset offset) {
    return showDialog(
        context: buildContext,
        useSafeArea: false,
        barrierColor: Colors.transparent,
        builder: (buildContext) {
          return SlpGiftLevelSelectWidget(data, selectLevel, offset);
        });
  }
}

class _SlpGiftLevelSelectWidgetState extends State<SlpGiftLevelSelectWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late int _selectLevel;
  @override
  void initState() {
    super.initState();
    _selectLevel = widget.selectLevel;
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
          alignment: Alignment(widget.offset.dx * 2 / Util.width - 1,
              widget.offset.dy * 2 / Util.height - 1),
          child: FadeTransition(
            opacity: animation,
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                PositionedDirectional(
                    bottom: Util.height - widget.offset.dy + 5,
                    end: 60 * (ratio - 1) + 16 * ratio,
                    width: 120,
                    height: 28.0 * widget.data.length + 8,
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
                          itemCount: widget.data.length,
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
    /// 倒序
    int invertOrder = widget.data.length - 1 - index;
    int level = widget.data[invertOrder].level;
    String title = widget.data[invertOrder].levelName;
    bool selected = false;
    if (_selectLevel == level) {
      selected = true;
    }
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop(level);
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
          alignment: AlignmentDirectional.center,
          child: Text(
            title,
            style: R.textStyle.regular12
                .copyWith(color: const Color(0xFF313131).withOpacity(0.6)),
          ),
        ),
      ),
    );
  }
}

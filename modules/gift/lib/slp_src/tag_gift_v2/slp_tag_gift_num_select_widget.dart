import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class SlpTagGiftNumSelectWidget extends StatefulWidget {
  final List<BbGiftPanelChooseNumConfig> data;
  final int selectCount;
  final Rect position;
  final Offset offset; //箭头位置
  const SlpTagGiftNumSelectWidget(
      this.data, this.selectCount, this.position, this.offset,
      {super.key});
  @override
  _SlpTagGiftNumSelectWidgetState createState() =>
      _SlpTagGiftNumSelectWidgetState();
  static Future<int?> show(
      BuildContext buildContext,
      List<BbGiftPanelChooseNumConfig> data,
      int selectCount,
      Rect position,
      Offset offset) {
    return showDialog<int>(
        context: buildContext,
        useSafeArea: false,
        barrierColor: Colors.transparent,
        builder: (buildContext) {
          return SlpTagGiftNumSelectWidget(data, selectCount, position, offset);
        });
  }
}

class _SlpTagGiftNumSelectWidgetState extends State<SlpTagGiftNumSelectWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final List<BbGiftPanelChooseNumConfig> _sortedList = [];
  late int _selectCount;

  @override
  void initState() {
    super.initState();
    _sortedList.addAll(widget.data);
    _sortedList.sort((a, b) => b.num - a.num);
    _selectCount = widget.selectCount;
    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: const ElasticOutCurve(0.8)))
        .animate(_controller);
    _animation.addStatusListener((status) {
      Log.d(status.toString());
      if (status == AnimationStatus.completed) {
      } else if (status == AnimationStatus.dismissed) {
        Navigator.of(context).pop();
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = 105;
    return GestureDetector(
      onTap: () {
        if (mounted) {
          setState(() {});
          _controller.reverse();
        }
      },
      child: Container(
        color: Colors.black.withOpacity(0.12),
        child: ScaleTransition(
          scale: _animation,
          alignment: Alignment(widget.position.left * 2 / Util.width - 1,
              widget.position.top * 2 / Util.height - 1),
          child: FadeTransition(
            opacity: _animation,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                PositionedDirectional(
                    bottom: Util.height - widget.position.top + 10,
                    start: widget.position.left -
                        (width - widget.position.width) / 2.0,
                    width: width,
                    height: 28.0 * _sortedList.length + 8,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white),
                        padding: const EdgeInsetsDirectional.all(4),
                        child: ListView.builder(
                          padding: EdgeInsetsDirectional.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: _sortedList.length,
                          itemBuilder: _buildItem,
                        ),
                      ),
                    )),
                PositionedDirectional(
                    bottom: Util.height - widget.position.top + 5,
                    start: widget.position.left -
                        (width - widget.position.width) / 2.0 +
                        54,
                    width: 12,
                    height: 5,
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
    int count = _sortedList[index].num;
    String title = _sortedList[index].desc;
    bool selected = false;
    if (_selectCount == count) {
      selected = true;
    }
    Color textColor = selected
        ? Colors.white.withOpacity(0.9)
        : Colors.black.withOpacity(0.5);
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop(count);
        },
        child: Container(
          width: 97,
          height: 28,
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: selected
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(colors: [
                    Color(0xFF7D2EE6),
                    Color(0xFFFF6BB3),
                    Color(0xFFFFC4CF)
                  ]),
                )
              : null,
          child: Row(
            children: [
              NumText('$count',
                  style: TextStyle(
                      fontSize: 12,
                      color: textColor,
                      fontWeight: FontWeight.bold)),
              const Spacer(),
              Text(title,
                  style: TextStyle(
                      fontSize: 12,
                      color: textColor,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}

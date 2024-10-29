import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class ConfessV2GiftNumSelectMenu extends StatefulWidget {
  final Map data;
  final int selectCount;
  final Offset offset; //箭头位置
  final Rect position;

  const ConfessV2GiftNumSelectMenu(
      this.data, this.selectCount, this.position, this.offset,
      {super.key});

  @override
  _ConfessV2GiftNumSelectMenuState createState() =>
      _ConfessV2GiftNumSelectMenuState();

  static Future<int?> show(BuildContext buildContext, Map data, int selectCount,
      Rect position, Offset offset) {
    return showDialog(
        context: buildContext,
        useSafeArea: false,
        barrierColor: Colors.transparent,
        builder: (buildContext) {
          return ConfessV2GiftNumSelectMenu(
              data, selectCount, position, offset);
        });
  }
}

class _ConfessV2GiftNumSelectMenuState extends State<ConfessV2GiftNumSelectMenu>
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
    double width = 105;
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
                        (width - widget.position.width) / 2.0,
                    width: width,
                    height: 28.0 * countList.length + 8,
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
                          itemCount: countList.length,
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
    int count = countList[index];
    String title = widget.data['$count'];
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

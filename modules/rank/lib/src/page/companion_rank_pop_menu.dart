import 'package:rank/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';

class CompanionRankPopMenu extends StatefulWidget {
  final Offset offset; //箭头位置
  final Rect position;

  const CompanionRankPopMenu(this.position, this.offset, {super.key});

  @override
  _CompanionRankPopMenuState createState() => _CompanionRankPopMenuState();

  static Future<int?> show(
      BuildContext buildContext, Rect position, Offset offset) {
    return showDialog(
      context: buildContext,
      useSafeArea: false,
      barrierColor: Colors.transparent,
      builder: (buildContext) {
        return CompanionRankPopMenu(position, offset);
      },
    );
  }
}

class _CompanionRankPopMenuState extends State<CompanionRankPopMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final List<String> _menuList = [K.rank_board_desc, K.rank_board_recover];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: const ElasticOutCurve(0.8)))
        .animate(_controller);
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
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
    double width = 98, height = 90;
    return GestureDetector(
      onTap: () {
        if (mounted) {
          setState(() {});
          _controller.reverse();
        }
      },
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
                  bottom: Util.height - widget.position.bottom - height,
                  start: widget.position.left - 62,
                  width: width,
                  height: height,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: width,
                      height: height,
                      padding: const EdgeInsetsDirectional.only(top: 11.5),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  Assets.rank$rank_bg_companion_rank_menu_webp),
                              fit: BoxFit.fill)),
                      child: ListView.builder(
                        padding: EdgeInsetsDirectional.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: _menuList.length,
                        itemBuilder: _buildItem,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    String text = _menuList[index];
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).pop(index);
      },
      child: Container(
        width: 70,
        height: 32,
        margin: const EdgeInsets.symmetric(horizontal: 14),
        alignment: AlignmentDirectional.center,
        child: Text(text, style: R.textStyle.regular14),
      ),
    );
  }
}

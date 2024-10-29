import 'package:chat/k.dart';
import 'package:shared/shared.dart';
import 'package:chat/src/model/intimate_msg_open.dart';
import 'package:flutter/material.dart';

class IntimateIntroPop extends StatefulWidget {
  final Offset offset;
  final double btnWidth;
  final List<IntimateColorText> tipList;

  const IntimateIntroPop(this.offset, this.btnWidth, this.tipList, {super.key});

  @override
  _IntimateIntroPopState createState() => _IntimateIntroPopState();

  static Future show(BuildContext buildContext, Offset offset, double btnWidth,
      List<IntimateColorText> tipList) {
    return showDialog(
        context: buildContext,
        useSafeArea: false,
        barrierColor: Colors.transparent,
        builder: (buildContext) {
          return IntimateIntroPop(offset, btnWidth, tipList);
        });
  }
}

class _IntimateIntroPopState extends State<IntimateIntroPop>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
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
          child: FadeTransition(
            opacity: animation,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                PositionedDirectional(
                  bottom: Util.height - widget.offset.dy + 5,
                  start: widget.offset.dx - (280 - widget.btnWidth) / 2,
                  child: GestureDetector(
                    onTap: () {},
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 280,
                          height: 124,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0, 4),
                                  blurRadius: 8,
                                  color: const Color(0xFF202020)
                                      .withOpacity(0.08)),
                            ],
                          ),
                        ),
                        PositionedDirectional(
                          end: 0,
                          bottom: -2,
                          child: R.img(
                            'intimate_interact/msg_intro_peach.png',
                            width: 112,
                            height: 88,
                            package: ComponentManager.MANAGER_GIFT,
                          ),
                        ),
                        Container(
                          width: 280,
                          height: 124,
                          padding: const EdgeInsetsDirectional.only(
                              start: 16, end: 16, top: 16),
                          child: Column(
                            children: [
                              Text(
                                K.chat_intimate_pop_title,
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF202020),
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 12),
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    children: widget.tipList
                                        .map((e) => TextSpan(
                                            text: e.text ?? '',
                                            style: TextStyle(color: e.color)))
                                        .toList(),
                                  ),
                                  style: const TextStyle(
                                      fontSize: 13, color: Color(0xFF202020)),
                                  maxLines: 3,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/k.dart';

class BottomTipsWidget extends StatefulWidget {
  final VoidCallback? callback;
  final int sex;
  final String? msg;
  const BottomTipsWidget(this.sex, {super.key, this.msg, this.callback});
  @override
  _BottomTipsWidgetState createState() => _BottomTipsWidgetState();
}

class _BottomTipsWidgetState extends State<BottomTipsWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {});

    animation.addStatusListener((status) {
      Log.d(status.toString());
      if (status == AnimationStatus.completed) {
        if (widget.callback != null) {
          Future.delayed(const Duration(seconds: 4), () {
            if (mounted) {
              controller.reverse();
              setState(() {});
            }
          });
        }
      } else if (status == AnimationStatus.dismissed) {
        if (widget.callback != null) {
          widget.callback!();
        }
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
    String sexStr = Util.getSexDesc(widget.sex);
    return ScaleTransition(
      scale: animation,
      alignment: Alignment.bottomCenter,
      child: FadeTransition(
        opacity: animation,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 164,
              alignment: AlignmentDirectional.center,
              padding: const EdgeInsetsDirectional.fromSTEB(12, 10, 12, 10),
              decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: R.color.mainBrandGradientColors),
                borderRadius:
                    const BorderRadiusDirectional.all(Radius.circular(16)),
              ),
              child: Text(
                (widget.msg != null && widget.msg?.isNotEmpty == true)
                    ? widget.msg!
                    : K.personal_in_room_to_chat([sexStr, sexStr]),
                style: R.textStyle.medium14.copyWith(color: Colors.black),
              ),
            ),
            R.img('triangleImage.png',
                package: ComponentManager.MANAGER_PERSONALDATA,
                width: 16,
                height: 8,
                color: R.color.mainBrandColor)
          ],
        ),
      ),
    );
  }
}

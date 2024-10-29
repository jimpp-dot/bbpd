import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:message/k.dart';

/// 今日缘分：引导
class FateDialogGuide extends StatelessWidget {
  final double marginTop;
  const FateDialogGuide({super.key, required this.marginTop});
  static Future<void> show(BuildContext context, {required double marginTop}) {
    return Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return FateDialogGuide(
            marginTop: marginTop,
          );
        },
        settings: const RouteSettings(name: '/FateDialogGuide'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width,
      height: Util.height,
      color: Colors.black.withOpacity(0.5),
      child: Column(
        children: [
          SizedBox(
            height: marginTop,
          ),
          buildOptionTips(),
          const SizedBox(
            height: 37,
          ),
          buildButton(context),
          const Spacer(),
          Text(
            K.msg_fate_guide_text_3,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            K.msg_fate_guide_text_4,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            K.msg_fate_guide_text_5,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }

  Widget buildButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.maybePop(context);
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 130,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(24),
          border: Border.all(color: Colors.white, width: 1),
          color: Colors.black.withOpacity(0.3),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          K.msg_fate_guide_button,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            height: 1.1,
          ),
        ),
      ),
    );
  }

  Widget buildOptionTips() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        R.img(
          'ic_fate_guide_left.webp',
          width: 84,
          height: 31,
          package: ComponentManager.MANAGER_MESSAGE,
        ),
        const SizedBox(
          width: 9,
        ),
        SizedBox(
          width: 120,
          height: 72,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 6,
              ),
              Text(
                K.msg_fate_guide_text_1,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                K.msg_fate_guide_text_2,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 9,
        ),
        R.img(
          'ic_fate_guide_right.webp',
          width: 84,
          height: 31,
          package: ComponentManager.MANAGER_MESSAGE,
        ),
      ],
    );
  }
}

class FateDialogGuide2 extends StatelessWidget {
  final double marginTop;
  const FateDialogGuide2({super.key, required this.marginTop});
  static Future<int?> show(BuildContext context,
      {required double marginTop}) async {
    return await Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return FateDialogGuide2(
            marginTop: marginTop,
          );
        },
        settings: const RouteSettings(name: '/FateDialogGuide2'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width,
      height: Util.height,
      color: Colors.black.withOpacity(0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: marginTop),
          const SizedBox(height: 40),
          Text(
            K.msg_fate_guide_text_6,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 37),
          GestureDetector(
            onTap: () {
              Navigator.of(context).maybePop(1);
            },
            child: Container(
              width: 130,
              height: 48,
              decoration: const ShapeDecoration(
                color: Color(0x4D000000),
                shape: StadiumBorder(
                    side: BorderSide(color: Colors.white, width: 1)),
              ),
              alignment: AlignmentDirectional.center,
              child: Text(
                K.msg_fate_guide_text_7,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.of(context).maybePop(0);
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: R.img(
                'ic_close.svg',
                width: 24,
                height: 24,
                color: Colors.white,
                package: ComponentManager.MANAGER_MESSAGE,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

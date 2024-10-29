import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:chat_room/k.dart';

class WeddingNextModel {
  WeddingNextModel(
      {required this.onTapYes,
      required this.onTapNo,
      required this.content,
      required this.duration});

  final Function onTapYes;
  final Function onTapNo;
  final String content;
  int duration;
}

class WeddingNextDialog extends StatelessWidget {
  const WeddingNextDialog({super.key, required this.model});

  final WeddingNextModel model;

  Function get onTapYes => model.onTapYes;

  Function get onTapNo => model.onTapNo;

  String get content => model.content;

  static void show(BuildContext context,
      {required Function onTapYes,
      required Function onTapNo,
      required String content,
      int duration = 60}) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => WeddingNextDialog(
        model: WeddingNextModel(
            onTapNo: onTapNo,
            onTapYes: onTapYes,
            content: content,
            duration: duration),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Center(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                alignment: AlignmentDirectional.topCenter,
                transform: Matrix4.translationValues(0.0, -92.0, 0.0),
                child: R.img(
                  'wedding_dialog_light.png',
                  width: 254,
                  height: 148,
                  package: ComponentManager.MANAGER_BASE_ROOM,
                ),
              ),
            ),
            _buildContent(context),
            Positioned.fill(
              child: Container(
                alignment: AlignmentDirectional.topCenter,
                transform: Matrix4.translationValues(0.0, -39.0, 0.0),
                child: R.img(
                  'wedding_dialog_heart.png',
                  width: 128,
                  height: 101,
                  package: ComponentManager.MANAGER_BASE_ROOM,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    double btnWidth = math.min(126.0, (Util.width - 20 * 3) / 2);
    return Container(
      width: double.infinity,
      height: 182 * Util.ratio,
      margin: EdgeInsetsDirectional.only(
          start: 31 * Util.ratio, end: 31 * Util.ratio),
      alignment: AlignmentDirectional.bottomCenter,
      decoration: const BoxDecoration(
        color: Color(0xFFFFF6F5),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsetsDirectional.only(start: 24, end: 24),
            height: 23,
            alignment: AlignmentDirectional.center,
            child: Text(
              content.isNotEmpty ? content : K.room_wedding_next_title,
              style: const TextStyle(
                  color: Color(0xFF202020),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCancel(context, btnWidth),
              _buildSure(context, btnWidth),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  GestureDetector _buildSure(BuildContext context, double btnWidth) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        onTapYes();
      },
      child: Container(
        width: btnWidth,
        height: 48,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(R.imagePath("marry/love_letter_btn_positive.webp",
              package: ComponentManager.MANAGER_PERSONALDATA)),
          fit: BoxFit.fill,
        )),
        alignment: AlignmentDirectional.center,
        child: Text(
          K.sure,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  GestureDetector _buildCancel(BuildContext context, double btnWidth) {
    const cancelColor = Color(0xFFF74869);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        onTapNo();
      },
      child: Container(
        width: btnWidth,
        height: 48,
        decoration: const ShapeDecoration(
          shape: StadiumBorder(
            side: BorderSide(color: cancelColor, width: 1),
          ),
        ),
        alignment: AlignmentDirectional.center,
        child: TimerWidget(
          onTick: () {
            model.duration -= 1;
            if (model.duration <= 0) {
              Navigator.of(context).pop();
              onTapNo(context);
            }
          },
          stop: const Duration(seconds: 60),
          builder: (context) {
            return Text(
              '${K.cancel}(${model.duration})',
              style: const TextStyle(color: cancelColor, fontSize: 16),
            );
          },
        ),
      ),
    );
  }
}

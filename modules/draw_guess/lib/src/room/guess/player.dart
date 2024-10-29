import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';

import 'package:flutter/material.dart';

import 'data.dart';
import 'draw_something.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/widget/user_icon.dart';

/// 房间内玩家坑位，对UserIcon进行封装
class Player extends StatelessWidget {
  final UserIcon userIcon;

  const Player({
    super.key,
    required this.userIcon,
  });

  Widget _topIndicator() {
    GuessConfigData? guessConfigData =
        userIcon.room.config?.configExpendData as GuessConfigData?;
    GuessPositionData? guessPositionData =
        userIcon.position.positionExpendData as GuessPositionData?;
    if (guessPositionData?.role == Role.drawer) {
      if (guessConfigData?.state == GameGuessState.choose) {
        return TopIndicator(
            waiting: true, waitingText: R.string('room_choosing_word'));
      } else if (guessConfigData?.state == GameGuessState.drawing) {
        return TopIndicator(
            waiting: true, waitingText: R.string('room_drawing'));
      } else {
        // 展示空白占位
        return const TopIndicator();
      }
    } else if (guessPositionData?.guessText != null) {
      return TopIndicator(
          guessRight: guessPositionData?.guessRight ?? false,
          guessText: guessPositionData?.guessText);
    } else {
      // 展示空白占位
      return const TopIndicator();
    }
  }

  @override
  Widget build(BuildContext context) {
    GuessConfigData? guessConfigData =
        userIcon.room.config?.configExpendData as GuessConfigData?;
    GuessPositionData? guessPositionData =
        userIcon.position.positionExpendData as GuessPositionData?;

    return Container(
      padding: const EdgeInsets.only(left: 2, right: 2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: _topIndicator(),
          ),
          SizedBox.fromSize(
            size: Size(userIcon.size, userIcon.size),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                userIcon,
                // 总分统计
                Visibility(
                  visible: guessConfigData?.state != GameGuessState.wait &&
                      guessConfigData?.state != GameGuessState.end &&
                      (guessPositionData?.originId ?? 0) > 0,
                  child: PositionedDirectional(
                    top: 0,
                    end: 0,
                    width: 16,
                    height: 16,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFFF7242),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${guessPositionData?.score}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: _buildName(
                userIcon.position.name, userIcon.position.titleNew ?? 0),
          ),
        ],
      ),
    );
  }

  Widget _buildName(String name, int titleNew) {
    return Text(
      name,
      style: const TextStyle(color: Colors.white, fontSize: 12.0),
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class TopIndicator extends StatelessWidget {
  final bool waiting; // 等待状态
  final String? waitingText; // 等待时的文案 绘画中/选词中
  final bool guessRight; // 擦对了？
  final String? guessText; // 猜的答案

  const TopIndicator({
    super.key,
    this.waiting = false,
    this.waitingText,
    this.guessRight = false,
    this.guessText,
  });

  @override
  Widget build(BuildContext context) {
    if (waiting) {
      Color bgColor = const Color(0xFF05BCFF);
      return SizedBox(
        height: 22,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.all(2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  R.img(RoomAssets.chat_room$guess_ic_indicator_drawing_png,
                      width: 10, height: 10),
                  const SizedBox(width: 2),
                  Text(
                    waitingText ?? R.string('room_drawing'),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 6,
              height: 4,
              child: CustomPaint(
                size: Size.infinite,
                painter: ArrowPainter(bgColor),
              ),
            ),
          ],
        ),
      );
    } else if (!Util.isStringEmpty(guessText)) {
      if (guessRight) {
        Color bgColor = const Color(0xFF27D077);
        return SizedBox(
          height: 22,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.all(2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    R.img(RoomAssets.chat_room$guess_ic_indicator_score_png,
                        width: 10, height: 10),
                    const SizedBox(width: 2),
                    Text(
                      guessText!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 6,
                height: 4,
                child: CustomPaint(
                  size: Size.infinite,
                  painter: ArrowPainter(bgColor),
                ),
              ),
            ],
          ),
        );
      } else {
        Color bgColor = const Color(0xFFD03B27);
        return SizedBox(
          height: 22,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.all(2),
                child: Text(
                  guessText!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: 6,
                height: 4,
                child: CustomPaint(
                  size: Size.infinite,
                  painter: ArrowPainter(bgColor),
                ),
              ),
            ],
          ),
        );
      }
    }
    return const SizedBox(height: 22);
  }
}

/// 顶部指示条的向下箭头
class ArrowPainter extends CustomPainter {
  final Color color;

  const ArrowPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height));
    Paint paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..strokeJoin = StrokeJoin.round
      ..color = color;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

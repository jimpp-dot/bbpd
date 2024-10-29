import 'package:draw_guess/assets.dart';
import 'package:draw_guess/k.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:draw_guess/src/room/queue/guess_queue_config.dart';

/// 画猜接龙选择模式界面
class GuessQueueChooseModeWidget extends StatefulWidget {
  const GuessQueueChooseModeWidget({super.key});

  @override
  _GuessQueueChooseModeWidgetState createState() =>
      _GuessQueueChooseModeWidgetState();

  static Future<String?> show(BuildContext context) async {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 1.0,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {},
          child: const GuessQueueChooseModeWidget(),
        );
      },
    );
  }
}

class _GuessQueueChooseModeWidgetState
    extends State<GuessQueueChooseModeWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        borderRadius: const BorderRadiusDirectional.only(
            topStart: Radius.circular(16), topEnd: Radius.circular(16)),
      ),
      padding: EdgeInsetsDirectional.only(
          start: 16, end: 15, bottom: 12 + Util.iphoneXBottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 8, bottom: 12),
            child: Container(
              width: 90,
              height: 5,
              decoration: BoxDecoration(
                color: R.color.thirdTextColor,
                borderRadius: const BorderRadius.all(Radius.circular(2.5)),
              ),
            ),
          ),
          Stack(
            children: [
              _buildMode(0),
              Container(
                width: 60,
                height: 26,
                alignment: AlignmentDirectional.center,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(12),
                    bottomEnd: Radius.circular(12),
                  ),
                  gradient: LinearGradient(
                    colors: [Color(0XFFFFBC2C), Color(0XFFFFAB42)],
                  ),
                ),
                child: Text(
                  K.guess_queue_mode_new,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildMode(1),
        ],
      ),
    );
  }

  // 选择模式 type 0 接龙 1 竞猜
  Widget _buildMode(int type) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _chooseMode(type);
      },
      child: Container(
        height: (Util.width - 15 - 16) * 120.0 / 397.0,
        alignment: AlignmentDirectional.centerStart,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              type == 0
                  ? Assets.draw_guess$guess_queue_mode_queue_webp
                  : Assets.draw_guess$guess_queue_mode_guess_webp,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YouSheText(
                type == 0 ? K.guess_queue_mode_queue : K.guess_queue_mode_guess,
                style: const TextStyle(fontSize: 40, color: Colors.white),
              ),
              Text(
                type == 0
                    ? K.guess_queue_mode_queue_title
                    : K.guess_queue_mode_guess_title,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  // 选择模式 type 0 接龙 1 竞猜
  void _chooseMode(int type) {
    String str = type == 0 ? MODE_GUESS_QUEUE : MODE_GUESS_NORMAL;
    Navigator.of(context).pop(str);
  }
}

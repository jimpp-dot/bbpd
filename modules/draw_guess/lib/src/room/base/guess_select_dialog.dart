import 'package:shared/shared.dart';
import 'package:draw_guess/assets.dart';
import 'package:draw_guess/k.dart';
import 'package:flutter/material.dart';
import 'package:draw_guess/src/room/queue/guess_queue_config.dart';

/// 你画我猜/画猜接龙选择弹框，并返回对应的匹配type
class GuessSelectDialog extends StatelessWidget {
  const GuessSelectDialog({super.key});

  static Future<String> show(BuildContext context) async {
    return await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => const GuessSelectDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> res = [];

    res.add(_buildTop(context));
    res.add(const SizedBox(height: 13.0));
    res.add(
      _buildItem(
        context,
        MODE_GUESS_NORMAL,
        K.guess_mode_guess,
        K.guess_queue_mode_guess_title,
        Assets.draw_guess$guess_queue_mode_guess_webp,
      ),
    );
    res.add(const SizedBox(height: 12.0));
    res.add(
      _buildItem(
        context,
        MODE_GUESS_QUEUE,
        K.guess_mode_queue,
        K.guess_queue_mode_queue_title,
        Assets.draw_guess$guess_queue_mode_queue_webp,
        tag: K.guess_queue_mode_new,
      ),
    );
    res.add(const SizedBox(height: 21.0)); //35-14

    return Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        width: 320,
        height: 279,
        child: Stack(
          children: [
            Container(
              width: 320,
              height: 279,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: const Color(0xffFFFFFF),
              ),
              child: Stack(
                children: [
                  PositionedDirectional(
                    top: 0,
                    start: 0,
                    child: Container(
                      width: 132,
                      height: 132,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(24.0)),
                      ),
                      child: R.img(
                        "wolf_select_bg.webp",
                        width: 132,
                        height: 132,
                        package: ComponentManager.MANAGER_WERE_WOLF,
                      ),
                    ),
                  ),
                  Container(
                    width: 320,
                    height: 355,
                    alignment: AlignmentDirectional.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: res,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTop(BuildContext context) {
    return SizedBox(
      width: 295.0, //287+4+4
      height: 29.0,
      child: Row(
        children: [
          const SizedBox(width: 24.0),
          Expanded(
            child: Container(
              alignment: AlignmentDirectional.center,
              child: Text(
                K.guess_start_match,
                style: const TextStyle(
                  color: Color(0xff313131),
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: SizedBox(
              width: 24.0,
              height: 24.0,
              child: R.img(
                'wolf_select_delete_icon.webp',
                width: 24,
                height: 24,
                package: ComponentManager.MANAGER_WERE_WOLF,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, String type, String title,
      String subTitle, String bg,
      {String? tag}) {
    return InkWell(
      onTap: () => Navigator.of(context).pop(type),
      child: Container(
        width: 287.0,
        height: 88.0,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(14.0)),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(14.0)),
              child: R.img(
                bg,
                width: 287.0,
                height: 88.0,
                package: ComponentManager.MANAGER_DRAW_GUESS,
              ),
            ),
            Container(
              width: 287.0,
              height: 88.0,
              alignment: AlignmentDirectional.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(subTitle,
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 13))
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
            if (tag?.isNotEmpty ?? false)
              PositionedDirectional(
                top: 0,
                start: 0,
                child: Container(
                  height: 18.0,
                  alignment: AlignmentDirectional.center,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(12),
                      bottomEnd: Radius.circular(12),
                    ),
                    gradient: LinearGradient(
                      colors: [Color(0xFFFFBC2C), Color(0xFFFFAB42)],
                      begin: AlignmentDirectional.topCenter,
                      end: AlignmentDirectional.bottomCenter,
                    ),
                  ),
                  padding:
                      const EdgeInsetsDirectional.only(start: 6.0, end: 6.0),
                  child: Text(
                    tag!,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

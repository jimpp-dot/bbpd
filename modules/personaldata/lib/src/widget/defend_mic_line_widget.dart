import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class DefendMicLineWidget extends StatelessWidget {
  final int level;

  /// 关系等级
  final int position;

  /// 关系类型
  final int category;
  final double width;
  const DefendMicLineWidget(
      {super.key,
      this.width = 0,
      this.position = 0,
      this.level = 0,
      this.category = 0});

  @override
  Widget build(BuildContext context) {
    double ratio = width / 32;

    return SizedBox(
      width: width,
      height: 14 * ratio,
      child: Stack(
        children: [
          PositionedDirectional(
            top: 3 * ratio,
            child: R.img(
              getImgWave(),
              width: width,
              height: 8 * ratio,
              package: ComponentManager.MANAGER_PERSONALDATA,
            ),
          ),
          PositionedDirectional(
            start: 9 * ratio,
            child: Container(
              width: 14 * ratio,
              height: 14 * ratio,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    R.imagePath(getImgIcon(),
                        package: ComponentManager.MANAGER_PERSONALDATA),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Text(
                '$level',
                style: TextStyle(
                  fontSize: 8 * ratio,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 1.1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getImgWave() {
    return 'defend/ic_defend_mic_line_normal.webp';
  }

  String getImgIcon() {
    if (category == 1) {
      /// cp类
      return 'defend/ic_defend_mic_normal_1.webp';
    } else if (category == 2) {
      /// 知己类
      return 'defend/ic_defend_mic_normal_2.webp';
    } else if (category == 3) {
      /// 兄弟类
      return 'defend/ic_defend_mic_normal_3.webp';
    } else if (category == 4) {
      /// 队友类
      return 'defend/ic_defend_mic_normal_4.webp';
    }

    return 'defend/ic_defend_mic_normal_1.webp';
  }
}

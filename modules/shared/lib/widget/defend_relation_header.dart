import 'package:shared/model/defend_bean.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class DefendRelationHeader extends StatelessWidget {
  final DefendRelationModel? defendRelationModel;
  final double iconSize;
  final bool showBorderIcon;

  const DefendRelationHeader(
      {super.key,
      this.defendRelationModel,
      this.iconSize = 44,
      this.showBorderIcon = false});

  @override
  Widget build(BuildContext context) {
    if (!showBorderIcon) {
      return SizedBox(
        height: iconSize + 2,
        width: iconSize + 2,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            PositionedDirectional(
              start: 1,
              bottom: 2,
              child: CommonAvatar(
                path: defendRelationModel?.icon ?? '',
                shape: BoxShape.circle,
                size: iconSize,
              ),
            ),
            if (Util.validStr(defendRelationModel?.title))
              PositionedDirectional(
                bottom: 0,
                child: LimitedBox(
                  maxWidth: iconSize + 2,
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF67A8), Color(0xFFFFAB8F)],
                      ),
                    ),
                    child: Text(
                      defendRelationModel?.title ?? '',
                      style: R.textStyle.medium12
                          .copyWith(fontSize: 9, color: Colors.white),
                      maxLines: 1,
                    ),
                  ),
                ),
              )
          ],
        ),
      );
    }
    double ratio = iconSize / 68.0;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        PositionedDirectional(
          width: iconSize - 4,
          height: iconSize - 4,
          child: CommonAvatar(
            path: defendRelationModel?.icon ?? Session.icon,
            shape: BoxShape.circle,
            size: iconSize,
          ),
        ),
        SizedBox(
          height: iconSize,
          width: iconSize,
          child: (defendRelationModel?.position ?? 0) > 0
              ? R.img(defendIconPath(),
                  package: ComponentManager.MANAGER_PERSONALDATA)
              : const SizedBox(),
        ),
        if (Util.validStr(defendRelationModel?.title))
          PositionedDirectional(
            bottom: 0,
            child: LimitedBox(
              maxWidth: iconSize / 2,
              child: Container(
                alignment: AlignmentDirectional.center,
                child: Text(
                  defendRelationModel?.title ?? '',
                  style: R.textStyle.medium12
                      .copyWith(fontSize: 10 * ratio, color: Colors.white),
                  maxLines: 1,
                ),
              ),
            ),
          )
      ],
    );
  }

  // 1CP, 2小宝贝, 3知己, 4守卫, 5队友, 6跟班, 7闺蜜, 8兄弟, 9师傅, 10挚友
  // 11保镖, 12拜把子, 13姐妹花, 14小尾巴, 15陪伴, 16基友, 17红颜, 18小可爱, 19臭宝, 20好基友
  // 21乖宝, 22独宠, 23海尔兄弟, 24小树洞, 25羁绊, 26饲养员-干饭人, 27大怨种-小克星, 28粘人精, 29小奶包, 30臭乞丐
  // 31讨厌鬼, 32吞金兽-百宝箱, 33霸总-娇妻, 34骑士-公主, 35游戏搭子, 36前任, 37心动男嘉宾-心动女嘉宾。
  String defendIconPath() {
    int index = 1;
    int? position = defendRelationModel?.position;
    if (position != null) {
      if (position == 23) {
        /// 海尔兄弟框
        index = 23;
      } else if (position == 24) {
        /// 小树洞框
        index = 24;
      } else if (position == 25) {
        /// 羁绊框
        index = 25;
      } else if ([1, 2, 22, 10, 28, 31, 26, 27, 33, 32, 34, 37, 21, 19, 15, 17]
          .contains(position)) {
        /// CP框
        index = 1;
        // } else if ([].contains(position)) {
        //   /// 闺蜜框
        //   index = 7;
      } else if ([3, 5, 35, 4, 6, 14, 29, 9].contains(position)) {
        /// 知己框
        index = 3;
        // } else if ([].contains(position)) {
        //   /// 小宝贝框
        //   index = 2;
        // } else if ([].contains(position)) {
        //   /// 守卫框
        //   index = 4;
      } else if ([8, 7, 13, 18, 11, 12, 16, 20].contains(position)) {
        /// 兄弟框
        index = 8;
        // } else if ([].contains(position)) {
        //   /// 队友框
        //   index = 5;
      } else if ([36, 30].contains(position)) {
        /// 跟班框
        index = 6;
      }
    }
    return 'defend/icon_defend_$index.webp';
  }
}

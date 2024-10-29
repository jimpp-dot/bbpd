import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';
import 'package:rank/src/model/pb/generated/gift_week.pb.dart';

/// 用户排行item
class UserRankItem extends StatelessWidget {
  final RankList data;

  final int index;

  /// 最大展示名次，默认50
  final int maxShowNum;

  final double? height;

  final Color? bgColor;

  final int? currRankType;

  const UserRankItem({
    super.key,
    required this.data,
    required this.index,
    this.maxShowNum = 50,
    this.height,
    this.bgColor,
    this.currRankType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          Positioned.fill(
            child: ColoredBox(
              color: bgColor ?? Colors.transparent,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 10, end: 12),
            child: Center(
              child: Row(
                children: [
                  if (_showRankByType(currRankType)) _buildRankIcon(),
                  // SizedBox(width: 11,),
                  Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0x1AFFFFFF), width: 1),
                      borderRadius: BorderRadiusDirectional.circular(48),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0.5),
                      child: CommonAvatar(
                        size: 48,
                        path: Util.parseIcon(data.icon),
                        borderRadius: BorderRadiusDirectional.circular(48),
                        onTap: () {
                          /// 跳转个人主页
                          IPersonalDataManager personalDataManager =
                              ComponentManager.instance.getManager(
                                  ComponentManager.MANAGER_PERSONALDATA);
                          personalDataManager.openImageScreen(
                            System.context,
                            data.uid,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Text(
                      data.name,
                      overflow: TextOverflow.ellipsis,
                      style: R.textStyle.medium14
                          .copyWith(color: const Color(0xFFFFAD7A)),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  if (_showRankScoreByType(currRankType))
                    Container(
                      constraints: const BoxConstraints(
                        minWidth: 50,
                      ),
                      child: Text(
                        '${data.giftNum}',
                        textAlign: TextAlign.end,
                        style: R.textStyle.medium12
                            .copyWith(color: const Color(0xFFCC3F06)),
                      ),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRankIcon() {
    Widget widget;

    String? imgName;
    String? rankNum;
    if (index <= 2) {
      imgName = Assets.gift_week_rankx_webp(index + 1);
    } else {
      rankNum = '${index + 1}';
      if (index > maxShowNum - 1) {
        rankNum = '$maxShowNum+';
      }
    }
    if (imgName != null) {
      widget = Container(
        width: 30,
        alignment: AlignmentDirectional.centerStart,
        margin: const EdgeInsetsDirectional.only(end: 8),
        child: R.img(imgName,
            width: 20, height: 18, package: ComponentManager.MANAGER_RANK),
      );
    } else if (rankNum != null) {
      widget = Container(
        margin: const EdgeInsetsDirectional.only(start: 6, end: 0),
        width: 30,
        height: 18,
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          rankNum,
          style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xFFCC3F06)),
        ),
      );
    } else {
      widget = const SizedBox.shrink();
    }

    return widget;
  }
}

bool _showRankByType(int? rankType) {
  if (rankType == 1) {
    return showRankByKey(giftWeekStarLiveKey);
  }
  if (rankType == 2) {
    return showRankByKey(giftWeekStarPlatformKey);
  }
  if (rankType == 3) {
    return showRankByKey(giftWeekStarBigwigKey);
  }
  return false;
}

bool _showRankScoreByType(int? rankType) {
  if (rankType == 1) {
    return showRankScoreByKey(giftWeekStarLiveKey);
  }
  if (rankType == 2) {
    return showRankScoreByKey(giftWeekStarPlatformKey);
  }
  if (rankType == 3) {
    return showRankScoreByKey(giftWeekStarBigwigKey);
  }
  return false;
}

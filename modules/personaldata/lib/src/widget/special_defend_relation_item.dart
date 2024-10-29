import 'package:intl/intl.dart';
import 'package:shared/shared.dart';
import 'package:shared/model/models.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/k.dart';

import '../page/defend_relation_detail_screen.dart';

/// 特殊的守护关系Item（目前主要是CP/羁绊在使用）

class SpecialDefendRelationItem extends StatelessWidget {
  final DefendRelationModel? item;
  final int uid;
  final VoidCallback? refresh;

  const SpecialDefendRelationItem(
      {Key? key, required this.item, required this.uid, this.refresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 108,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onItemTap,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: getBorderColor(item?.category ?? 0), width: 1),
                gradient: LinearGradient(
                  begin: AlignmentDirectional.bottomCenter,
                  end: AlignmentDirectional.topCenter,
                  colors: getBodyBgColors(item?.category ?? 0),
                ),
                image: Util.validStr(item?.cardBg)
                    ? DecorationImage(
                        image: NetworkImage(
                            Util.getRemoteImgUrl(item?.cardBg ?? '')),
                        fit: BoxFit.fill,
                      )
                    : null,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IgnorePointer(
                          child: SizedBox(
                            width: 100,
                            height: 54,
                            child: Stack(
                              alignment: AlignmentDirectional.bottomCenter,
                              children: [
                                PositionedDirectional(
                                  start: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: ClipOval(
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        width: 54,
                                        height: 54,
                                        color: Colors.white,
                                        alignment: AlignmentDirectional.center,
                                        child: CommonAvatar(
                                            path: item?.meIcon,
                                            size: 50,
                                            shape: BoxShape.circle),
                                      ),
                                    ),
                                  ),
                                ),
                                PositionedDirectional(
                                  end: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: ClipOval(
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        width: 54,
                                        height: 54,
                                        color: Colors.white,
                                        alignment: AlignmentDirectional.center,
                                        child: CommonAvatar(
                                            path: item?.icon,
                                            size: 50,
                                            shape: BoxShape.circle),
                                      ),
                                    ),
                                  ),
                                ),
                                IgnorePointer(
                                  child: (item?.position ?? 0) > 0
                                      ? R.img(
                                          defendIconPath(item?.position ?? 0),
                                          width: defendIconWidth(
                                              item?.position ?? 0),
                                          height: defendIconHeight(
                                              item?.position ?? 0),
                                          package: ComponentManager
                                              .MANAGER_PERSONALDATA,
                                        )
                                      : Container(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        SizedBox(
                          width: 150,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  (item?.meName ?? '').safeSubstring(0, 6),
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      color: R.color.mainTextColor,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                '&',
                                style: TextStyle(
                                    color: R.color.mainTextColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  (item?.name ?? '').safeSubstring(0, 6),
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: R.color.mainTextColor,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lv.${item?.level ?? 0} ${item?.title ?? ''}',
                            style: TextStyle(
                                color: getTitleColor(
                                    item?.position ?? 0, item?.category ?? 0),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if ((item?.level ?? 0) >= 2 &&
                                  (item?.level ?? 0) <= 6) ...[
                                R.img(
                                  'defend/ic_defend_level_${item?.level ?? 0}_new.webp',
                                  width: 28,
                                  height: 18,
                                  package:
                                      ComponentManager.MANAGER_PERSONALDATA,
                                ),
                                const SizedBox(width: 4),
                              ],
                              Text(
                                K.personal_defend_core,
                                style: TextStyle(
                                    color:
                                        R.color.mainTextColor.withOpacity(0.8),
                                    fontSize: 13),
                              ),
                              Text(
                                Util.numberToSizeString(
                                    Util.parseInt(item?.defendValue)),
                                style: TextStyle(
                                    color: R.color.mainTextColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            _formatStartTime(item?.startTime ?? 0),
                            style: TextStyle(
                                color: R.color.unionRankText1.withOpacity(0.9),
                                fontSize: 11),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  void onItemTap() async {
    if (uid == Session.uid) {
      /// 自己点击卡片，进关系详情
      bool? needRefresh = await DefendRelationDetailScreen.show(
          System.context, item?.id ?? '',
          showBottom: true);
      if (needRefresh == true && refresh != null) {
        refresh!();
      }
    } else if (item?.uid == Session.uid) {
      /// TODO 点击他人与自己守护关系的卡片，暂时不响应，后续看进关系详情会不会有问题
    } else if ((item?.uid ?? 0) > 0) {
      await DefendRelationDetailScreen.show(System.context, item?.id ?? '',
          showBottom: false);
    }
  }

  String _formatStartTime(int startTime) {
    DateTime startDateTime =
        DateTime.fromMicrosecondsSinceEpoch(startTime * 1000000);
    Duration difference = DateTime.now().difference(startDateTime);
    int days = difference.inDays;
    String startDateTime0 = DateFormat('yyyy.MM.dd').format(startDateTime);
    return startDateTime0 +
        (days >= 0
            ? K.personaldata_distance_now_days(['${days > 0 ? days : 1}'])
            : '');
  }

  static Color getBorderColor(int category) {
    if (category == 1) {
      /// cp类
      return const Color(0xFFFFD1E2);
    } else if (category == 2) {
      /// 知己类
      return const Color(0xFFFEDACF);
    } else if (category == 3) {
      /// 兄弟类
      return const Color(0xFFD8D1FE);
    } else if (category == 4) {
      /// 队友类
      return const Color(0xFFD1FEDE);
    }

    return const Color(0xFFFFD1E2);
  }

  /// 1CP 2小宝贝 3知己 4守卫 5队友 6跟班 7闺蜜 8兄弟
  /// 新增 23海尔兄弟 24小树洞 25羁绊
  static Color getTitleColor(int position, int category) {
    if (position == 1) {
      return const Color(0xFFDC26BC);
    } else if (position == 25) {
      return const Color(0xFFDF4F29);
    } else {
      return getTopTextColor(category);
    }
  }

  static Color getTopTextColor(int category) {
    List<Color> baseColor = getBaseColor(category);
    return baseColor[2];
  }

  static List<Color> getBodyBgColors(int category) {
    List<Color> baseColor = getBaseColor(category);
    return [baseColor[0].withOpacity(0.2), baseColor[1].withOpacity(0.2)];
  }

  static List<Color> getBaseColor(int category) {
    if (category == 1) {
      /// cp类
      return [
        const Color(0xFFFF8CC3),
        const Color(0xFFFFC0D6),
        const Color(0xFFB50040)
      ];
    } else if (category == 2) {
      /// 知己类
      return [
        const Color(0xFFE88E74),
        const Color(0xFFFFD1C2),
        const Color(0xFFC02800)
      ];
    } else if (category == 3) {
      /// 兄弟类
      return [
        const Color(0xFF8574E8),
        const Color(0xFFCAC2FF),
        const Color(0xFF4A00C0)
      ];
    } else if (category == 4) {
      /// 队友类
      return [
        const Color(0xFF80E98E),
        const Color(0xFFC0FFD3),
        const Color(0xFF00B55F)
      ];
    }

    return [
      const Color(0xFFFF8CC3),
      const Color(0xFFFFC0D6),
      const Color(0xFFB50040)
    ];
  }

  String defendIconPath(int position) {
    int index = 1;
    if (position == 1) {
      /// CP
      index = 1;
    } else if (position == 25) {
      /// 羁绊
      index = 25;
    }
    return 'defend/icon_defend_${index}_new.webp';
  }

  double defendIconWidth(int position) {
    double width = 48;
    if (position == 1) {
      /// CP
      width = 48;
    } else if (position == 25) {
      /// 羁绊
      width = 58;
    }
    return width;
  }

  double defendIconHeight(int position) {
    double height = 17;
    if (position == 1) {
      /// CP
      height = 17;
    } else if (position == 25) {
      /// 羁绊
      height = 20;
    }
    return height;
  }
}

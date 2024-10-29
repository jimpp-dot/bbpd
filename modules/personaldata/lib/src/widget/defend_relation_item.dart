import 'package:personaldata/k.dart';
import 'package:shared/shared.dart';
import 'package:shared/model/defend_bean.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/achievement_wall/api/achievement_wall_repo.dart';
import 'package:personaldata/src/achievement_wall/model/pb/generated/slp_achieve.pb.dart';
import 'package:personaldata/src/page/defend_relation_detail_screen.dart';

import 'defend_accessory_detail.dart';

/// 守护新卡片
class DefendRelationItem extends StatelessWidget {
  final DefendRelationModel? item;
  final int uid;
  final double ratio;
  final VoidCallback? refresh;
  final VoidCallback? onTap;

  const DefendRelationItem(
      {super.key,
      this.item,
      this.uid = 0,
      this.ratio = 0,
      this.refresh,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemTap,
      child: item == null
          ? buildEmptyItem()
          : Stack(
              children: [
                Container(
                  width: 102 * ratio,
                  height: 158 * ratio,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(12),
                    border: Border.all(
                        color: getBorderColor(item?.category ?? 0), width: 1),
                  ),
                ),
                hasAccessory()
                    ? Stack(
                        children: [
                          buildCard(),
                          ...buildAccessorys(context),
                        ],
                      )
                    : buildCard(),
              ],
            ),
    );
  }

  /// 是否有挂饰
  bool hasAccessory() {
    return Util.validList(item?.widget);
  }

  List<Widget> buildAccessorys(BuildContext context) {
    List<Widget> widgets = [];

    /// 左右各最多挂一个挂饰
    DefendAccessory? accessoryLeft = item?.widget?.firstWhereOrNull((element) {
      return element.widgetArea == 1;
    });
    if (accessoryLeft != null) {
      widgets.add(PositionedDirectional(
        top: 0,
        start: 0,
        child: buildAccessory(context, accessoryLeft),
      ));
    }

    DefendAccessory? accessoryRight = item?.widget?.firstWhereOrNull((element) {
      return element.widgetArea == 2;
    });
    if (accessoryRight != null) {
      widgets.add(PositionedDirectional(
        top: 0,
        end: 0,
        child: buildAccessory(context, accessoryRight),
      ));
    }

    return widgets;
  }

  Widget buildAccessory(BuildContext context, DefendAccessory accessory) {
    return GestureDetector(
      onTap: () {
        DefendAccessoryDetail.show(context, accessory);
      },
      child: CachedNetworkImage(
        imageUrl: Util.getRemoteImgUrl(accessory.widgetImg ?? ''),
        width: 22 * ratio,
        height: 79 * ratio,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget buildCard() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildTop(),
        buildBody(),
      ],
    );
  }

  Widget buildTop() {
    return Stack(
      children: [
        Container(
          width: 102 * ratio,
          height: 30 * ratio,
          padding: const EdgeInsetsDirectional.only(start: 3, end: 3),
          decoration: BoxDecoration(
            borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(12), topEnd: Radius.circular(12)),
            gradient: LinearGradient(
              begin: AlignmentDirectional.centerStart,
              end: AlignmentDirectional.centerEnd,
              colors: getTopBgColors(item?.category ?? 0),
            ),
            image: Util.validStr(item?.cardTop)
                ? DecorationImage(
                    image:
                        NetworkImage(Util.getRemoteImgUrl(item?.cardTop ?? '')),
                    fit: BoxFit.fill,
                  )
                : null,
          ),
          alignment: AlignmentDirectional.center,
          child: Text(
            item?.title ?? '',
            style: TextStyle(
              fontSize: 13 * ratio,
              color: getTopTextColor(item?.category ?? 0),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if ((item?.level ?? 0) >= 2 && (item?.level ?? 0) <= 6)
          R.img(
            'defend/ic_defend_level_${item!.level}.webp',
            width: 28,
            height: 18,
            package: ComponentManager.MANAGER_PERSONALDATA,
          ),
      ],
    );
  }

  Widget buildBody() {
    return Container(
      width: 102 * ratio,
      height: 128 * ratio,
      padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadiusDirectional.only(
            bottomStart: Radius.circular(12), bottomEnd: Radius.circular(12)),
        gradient: LinearGradient(
          begin: AlignmentDirectional.bottomCenter,
          end: AlignmentDirectional.topCenter,
          colors: getBodyBgColors(item?.category ?? 0),
        ),
        image: Util.validStr(item?.cardBg)
            ? DecorationImage(
                image: NetworkImage(Util.getRemoteImgUrl(item?.cardBg ?? '')),
                fit: BoxFit.fill,
              )
            : null,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 7 * ratio,
          ),
          DefendRelationHeader(
            defendRelationModel: item,
            iconSize: 58 * ratio,
            showBorderIcon: true,
          ),
          SizedBox(
            height: 2 * ratio,
          ),
          Text(
            item?.name ?? '',
            style: TextStyle(
              fontSize: 11 * ratio,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF202020),
              height: 1.2,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 4 * ratio,
          ),
          Text(
            K.personal_defend_core +
                Util.numberToSizeString(Util.parseInt(item?.defendValue)),
            style: TextStyle(
              fontSize: 11 * ratio,
              color: const Color(0xE6202020),
              height: 1.2,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 4 * ratio,
          ),
          Text(
            _formatStartTime(item?.startTime ?? 0),
            style: TextStyle(
              fontSize: 10 * ratio,
              color: const Color(0xB3202020),
              height: 1.2,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  String _formatStartTime(int startTime) {
    DateTime startDateTime =
        DateTime.fromMicrosecondsSinceEpoch(startTime * 1000000);
    Duration difference = DateTime.now().difference(startDateTime);
    int days = difference.inDays;
    return days >= 0
        ? K.personaldata_distance_now_days(['${days > 0 ? days : 1}'])
        : '';
  }

  Widget buildEmptyItem() {
    return Container(
      width: 102 * ratio,
      height: 148 * ratio,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(12),
        border: Border.all(color: const Color(0xFFF4F4F4), width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 41 * ratio,
          ),
          Container(
            width: 52 * ratio,
            height: 52 * ratio,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: R.color.mainTextColor.withOpacity(0.1), width: 1),
            ),
            alignment: AlignmentDirectional.center,
            child: R.img(
              'ic_defend_add.png',
              width: 24,
              height: 24,
              package: ComponentManager.MANAGER_PERSONALDATA,
            ),
          ),
          SizedBox(
            height: 4 * ratio,
          ),
          Text(
            K.personal_invite_defend_relation,
            style: TextStyle(
              fontSize: 11 * ratio,
              color: R.color.secondTextColor,
            ),
          ),
        ],
      ),
    );
  }

  void onItemTap() async {
    if (onTap != null) {
      onTap!();
      return;
    }

    if (item == null) {
      ResGetRedirect rsp = await AchievementWallRepo.getRedirectPath(2);
      if (rsp.success && rsp.data.redirect.isNotEmpty) {
        SchemeUrlHelper.instance().jump(rsp.data.redirect);
      } else {
        Fluttertoast.showToast(msg: rsp.msg);
      }

      /// 空卡片，开通守护
      // IPersonalDataManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
      // manager.openUserDefendBuyShowModalBottomSheet(System.context, uid: uid).then((value) {
      //   if (value == true) {
      //     /// 上一级页面刷新
      //     if (refresh != null) {
      //       refresh!();
      //     }
      //   }
      // });
    } else if (uid == Session.uid) {
      /// 自己点击卡片，进关系详情
      bool? needRefresh = await DefendRelationDetailScreen.show(
          System.context, item?.id ?? '',
          showBottom: true);
      if (needRefresh == true && refresh != null) {
        refresh!();
      }
    } else if (item?.uid == Session.uid) {
      /// TODO 点击他人与自己守护关系的卡片，暂时不响应，后续看进关系详情会不会有问题
    } else if (item?.uid != null && item!.uid > 0) {
      await DefendRelationDetailScreen.show(System.context, item?.id ?? '',
          showBottom: false);
    }
  }

  static List<Color> getTopBgColors(int category) {
    List<Color> baseColor = getBaseColor(category);
    return [baseColor[0].withOpacity(0.6), baseColor[1].withOpacity(0.6)];
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
}

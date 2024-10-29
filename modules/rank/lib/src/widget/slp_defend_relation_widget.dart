import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:shared/shared.dart';
import 'package:shared/model/defend_bean.dart';
import 'package:flutter/material.dart';

/// 守护关系Widget
class SlpDefendRelationWidget extends StatelessWidget {
  final List<DefendRelationModel>? items;
  final int uid;
  final bool? showSecretGarden;
  final bool? showDefendManager;
  final bool? showIntimateCard;
  final VoidCallback? refresh;

  SlpDefendRelationWidget(
      {super.key,
      this.items,
      required this.uid,
      this.refresh,
      this.showSecretGarden,
      this.showDefendManager,
      this.showIntimateCard});

  final IPersonalDataManager _personalDataManager = ComponentManager.instance
      .getManager(ComponentManager.MANAGER_PERSONALDATA);

  /// 横屏（CP、羁绊），最多展示2个
  List<DefendRelationModel> specialItems() {
    if (!Util.validList(items)) return [];
    List<DefendRelationModel> aitems = List.from(items!);
    aitems.retainWhere((element) => element.layout == 1);
    return aitems.take(2).toList();
  }

  /// 竖屏（除去CP、羁绊的其它所有关系）
  List<DefendRelationModel> otherItems() {
    if (!Util.validList(items)) return [];
    List<DefendRelationModel> aitems = List.from(items!);
    aitems.retainWhere((element) => element.layout != 1);
    return aitems;
  }

  List<DefendRelationModel> get _specialItems => specialItems();

  List<DefendRelationModel> get _otherItems => otherItems();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        /// 所有守护关系页入口
        IPersonalDataManager manager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        bool? needRefresh =
            await manager.openAllDefendRelationScreen(System.context, uid);
        if (needRefresh == true && refresh != null) {
          refresh!();
        }
      },
      child: Container(
        width: Util.width - 24,
        height: getHeight(),
        padding: const EdgeInsetsDirectional.only(top: 12, start: 12, end: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(18),
          color: R.color.mainBgColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTop(),
            const SizedBox(
              height: 10,
            ),
            if (Util.validList(_specialItems)) ...[
              for (DefendRelationModel element in _specialItems)
                _personalDataManager.getSpecialDefendItem(
                    item: element, uid: uid, refresh: refresh),
            ],
            buildBody(),
            if (Session.uid == uid && Util.validList(getUpgradeTips())) ...[
              const SizedBox(
                height: 12,
              ),
              buildTips(),
            ],
          ],
        ),
      ),
    );
  }

  Widget buildTips() {
    return Container(
      width: Util.width - 24 - 24,
      height: 34,
      decoration: BoxDecoration(
        color: R.color.mainBrandColor.withOpacity(0.1),
        borderRadius: BorderRadiusDirectional.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 8),
          R.img(
            Assets.ic_defend_upgrade_tips_webp,
            width: 20,
            height: 20,
            package: ComponentManager.MANAGER_RANK,
          ),
          const SizedBox(width: 8),
          Container(
            constraints: BoxConstraints(
              maxWidth: Util.width - 48 - 220,
            ),
            child: Text(
              getUpgradeTips().join('、'),
              style: TextStyle(
                fontSize: 13,
                color: R.color.mainTextColor,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            K.rank_defend_upgrade_tips,
            style: TextStyle(
              fontSize: 13,
              color: R.color.mainTextColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTop() {
    return Row(
      children: [
        Text(
          K.rank_defend_relation,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: R.color.mainTextColor,
          ),
        ),
        if (Session.uid == uid && showDefendManager == true) ...[
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () async {
              /// 关系管理页入口
              IPersonalDataManager manager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_PERSONALDATA);
              await manager.openDefendManagerScreen(System.context);
              if (refresh != null) {
                refresh!();
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: R.color.mainBrandColor.withOpacity(0.1),
                borderRadius: BorderRadiusDirectional.circular(17),
              ),
              padding: const EdgeInsetsDirectional.only(
                  start: 12, end: 12, top: 6, bottom: 6),
              child: Text(
                K.rank_defend_manage,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: R.color.mainTextColor,
                ),
              ),
            ),
          ),
        ],
        if (showSecretGarden == true) ...[
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () async {
              /// 秘密花园入口
              IPersonalDataManager manager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_PERSONALDATA);
              await manager.openDefendSecretGardenScreen(System.context, uid);
              if (Session.uid == uid && refresh != null) {
                refresh!();
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: R.color.mainBrandColor.withOpacity(0.1),
                borderRadius: BorderRadiusDirectional.circular(17),
              ),
              padding: const EdgeInsetsDirectional.only(
                  start: 12, end: 12, top: 6, bottom: 6),
              child: Text(
                K.rank_defend_garden,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: R.color.mainTextColor,
                ),
              ),
            ),
          ),
        ],
        if (Session.uid == uid && showIntimateCard == true) ...[
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () async {
              /// 亲密卡入口
              IPersonalDataManager manager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_PERSONALDATA);
              manager.openIntimacyCardPage(System.context);

              Tracker.instance.track(TrackEvent.click_intimate_card,
                  properties: {'uid': Session.uid});
            },
            child: Container(
              decoration: BoxDecoration(
                color: R.color.mainBrandColor.withOpacity(0.1),
                borderRadius: BorderRadiusDirectional.circular(17),
              ),
              padding: const EdgeInsetsDirectional.only(
                  start: 12, end: 12, top: 6, bottom: 6),
              child: Text(
                K.intimacy_card_text,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: R.color.mainTextColor,
                ),
              ),
            ),
          ),
        ],
        const Spacer(),
        Container(
          width: 36,
          height: 28,
          alignment: AlignmentDirectional.center,
          padding: const EdgeInsetsDirectional.only(start: 20),
          child: R.img(
            Assets.ic_next_svg,
            width: 16,
            height: 16,
            color: R.color.mainTextColor.withOpacity(0.3),
            package: ComponentManager.MANAGER_RANK,
          ),
        ),
      ],
    );
  }

  Widget buildBody() {
    return SizedBox(
      height: getGridHeight(),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 8,
        crossAxisSpacing: 10,
        crossAxisCount: 3,
        childAspectRatio: 102 / 158,
        children: buildList(),
      ),
    );
  }

  List<Widget> buildList() {
    List<Widget> widgets = [];
    double itemRatio = ratio;
    IPersonalDataManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    if (_otherItems.isEmpty) {
      widgets.add(manager.getDefendItem(
          item: null, uid: uid, ratio: itemRatio, refresh: refresh));
    } else {
      int showNum = getShowCardNum();
      for (int i = 0; i < showNum; i++) {
        if (_otherItems.length > i) {
          widgets.add(manager.getDefendItem(
              item: _otherItems[i],
              uid: uid,
              ratio: itemRatio,
              refresh: refresh));
        } else {
          widgets.add(manager.getDefendItem(
              item: null, uid: uid, ratio: itemRatio, refresh: refresh));
        }
      }
    }

    return widgets;
  }

  int getShowCardNum() {
    if (_otherItems.isEmpty) {
      return 1;
    } else if (_otherItems.length >= 3) {
      return 3;
    } else {
      return _otherItems.length + 1;
    }
  }

  /// 守护关系卡片高度
  double getHeight() {
    return 50 +
        20 +
        getGridHeight() +
        ((Session.uid == uid && Util.validList(getUpgradeTips())) ? 46 : 0) +
        (Util.validList(_specialItems) ? _specialItems.length * 108 : 0);
  }

  double getGridHeight() {
    return getShowCardNum() <= 3 ? 158 * ratio : (158 * 2 * ratio + 8);
  }

  double get ratio {
    return (Util.width - 24 - 24 - 20) / 3 / 102;
  }

  List<String>? tips;

  List<String> getUpgradeTips() {
    if (tips != null) {
      return tips!;
    }

    tips = [];
    int now = DateTime.now().millisecondsSinceEpoch;
    for (var element in _otherItems) {
      int time = Config.getInt('defend_upgrade_tips_${element.position}', 0);
      if (!tips!.contains(element.title) &&
          (time <= 0 ||
              (isCircleRelation(element.position ?? 0) &&
                  (now - time > 14 * 24 * 60 * 60 * 1000)))) {
        /// 永久开放关系，每个关系类型仅提醒一次
        /// 限时开放关系类型：14天重置一次提醒
        tips!.add(element.title ?? '');
        Config.set('defend_upgrade_tips_${element.position}', '$now');
      }
    }

    return tips!;
  }

  /// 限时开放关系类型（14天重置一次提醒）
  bool isCircleRelation(int position) {
    return 1 == position ||
        22 == position ||
        18 == position ||
        7 == position ||
        17 == position ||
        3 == position ||
        25 == position ||
        2 == position ||
        13 == position ||
        15 == position;
  }
}

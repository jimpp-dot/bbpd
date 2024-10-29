import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/k.dart';
import 'package:personaldata/src/glory_center/page/glory_center_dialog.dart';

import '../../../assets.dart';
import '../../achievement_wall/api/achievement_wall_repo.dart';
import '../../api/api.dart';
import '../model/glory_center_repo.dart';
import '../model/pb/generated/slp_glory.pb.dart';
import 'appreciator_tag_widget.dart';

class GloryCenterTabWidget extends StatefulWidget {
  final int uid;
  final GloryCenterCateItem cateTab;

  const GloryCenterTabWidget({super.key, required this.uid, required this.cateTab});

  @override
  State<GloryCenterTabWidget> createState() => _GloryCenterTabWidgetState();
}

class _GloryCenterTabWidgetState extends State<GloryCenterTabWidget> with TickerProviderStateMixin {
  // final List<String> _tabs = [K.personal_cr_get, K.personaldata_all];
  final List<String> _tabs = [K.personaldata_all];
  final List<Widget> _pages = [];
  late ExtendedTabController _pageController;
  int _segmentSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // if (widget.cateTab.showAll) {
    //   for (int i = 0; i < _tabs.length; i++) {
    //     _pages.add(
    //       KeepAliveWrapper(
    //         child: GloryCenterTabItemView(
    //           uid: widget.uid,
    //           tab: i + 1,
    //           cateTab: widget.cateTab,
    //         ),
    //       ),
    //     );
    //   }
    // } else {
    //   _pages.add(
    //     KeepAliveWrapper(
    //       child: GloryCenterTabItemView(
    //         uid: widget.uid,
    //         tab: 0,
    //         cateTab: widget.cateTab,
    //       ),
    //     ),
    //   );
    // }
    _pages.add(
      KeepAliveWrapper(
        child: GloryCenterTabItemView(
          uid: widget.uid,
          tab: 2,
          cateTab: widget.cateTab,
        ),
      ),
    );

    _pageController = ExtendedTabController(
      initialIndex: _segmentSelectedIndex,
      length: _pages.length,
      vsync: this,
    );
    _pageController.addListener(() {
      _segmentSelectedIndex = _pageController.index;
      refresh();
    });
  }

  void _switchPage(int index) {
    setState(() {
      _segmentSelectedIndex = index;
      _pageController.animateTo(
        _segmentSelectedIndex,
        curve: Curves.ease,
        duration: const Duration(milliseconds: 200),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (_pages.length > 1)
          Container(
            width: 70.0 * _pages.length,
            height: 32,
            margin: const EdgeInsetsDirectional.only(top: 12, bottom: 20),
            padding: const EdgeInsetsDirectional.all(2),
            decoration: BoxDecoration(
              color: R.color.secondBgColor,
              borderRadius: const BorderRadius.all(Radius.circular(19.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [for (int i = 0; i < _pages.length; i++) _buildTabItem(i)],
            ),
          ),
        Expanded(
          child: TabBarView(
            physics: const ClampingScrollPhysics(),
            controller: _pageController,
            children: _pages,
          ),
        ),
      ],
    );
  }

  Widget _buildTabItem(int index) {
    String tab = _tabs[index];
    return GestureDetector(
      onTap: () {
        _switchPage(index);
      },
      child: Container(
        width: 64,
        height: 28,
        decoration: BoxDecoration(
          color: _segmentSelectedIndex == index ? Colors.white : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(17.0)),
        ),
        child: Center(
          child: Text(
            tab,
            style: const TextStyle(
                // color: R.color.mainTextColor
                //     .withOpacity(_segmentSelectedIndex == index ? 1 : 0.5),
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

class GloryCenterTabItemView extends StatefulWidget {
  final int uid;
  final GloryCenterCateItem cateTab;
  final int tab;

  const GloryCenterTabItemView({super.key, required this.uid, required this.tab, required this.cateTab});

  @override
  State<GloryCenterTabItemView> createState() => _GloryCenterTabItemViewState();
}

class _GloryCenterTabItemViewState extends State<GloryCenterTabItemView> {
  List<GloryCenterWearableBadge>? _wearableBadges;
  bool _loading = true;
  String? _errMsg;

  List<GloryCenterWearableBadge>? _UnGetList;
  List<GloryCenterWearableBadge>? _GetList;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future _loadData({bool force = false}) async {
    ResGloryList resp = await GloryCenterRepo.getProfileGloryList(uid: widget.uid, tab: widget.tab, cateId: widget.cateTab.id);
    if (!mounted) return;

    if (resp.success) {
      refresh(() {
        _loading = false;
        _errMsg = null;
        _wearableBadges = resp.data;
        _GetList = _wearableBadges!.where((element) => element.effective == true).toList();
        _UnGetList = _wearableBadges!.where((element) => element.effective == false).toList();
      });
    } else {
      refresh(() {
        _loading = false;
        _errMsg = Util.validStr(resp.msg) ? resp.msg : BaseK.K.base_net_error;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }
    if (Util.validStr(_errMsg)) {
      return ErrorData(
        error: _errMsg,
        onTap: () {
          _loadData();
        },
      );
    }
    if (Util.isCollectionEmpty(_wearableBadges)) {
      return EmptyWidget(
        desc: K.personaldata_glory_center_empty,
        onTap: () {
          _loadData();
        },
      );
    }
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: (_GetList?.length ?? 0) > 0
              ? Container(
                  padding: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 16),
                  child: text14("已获得", textColor: Colors.white),
                )
              : const SizedBox.shrink(),
        ),
        SliverGrid.builder(
          itemCount: Util.parseInt(_GetList?.length),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 12, crossAxisSpacing: 10, crossAxisCount: 3, childAspectRatio: 106 / 97
              // childAspectRatio: 104 / 108,
              ),
          itemBuilder: (context, index) => _buildItemWidget(context, index, _GetList),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 0),
            child: text14("未获得", textColor: Colors.white),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsetsDirectional.only(start: 10, end: 10, top: 10),
          sliver: SliverGrid.builder(
            itemCount: Util.parseInt(_UnGetList?.length),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 12, crossAxisSpacing: 10, crossAxisCount: 3, childAspectRatio: 106 / 97
                // mainAxisExtent: 108 + 12,
                // childAspectRatio: 104 / 108,
                ),
            itemBuilder: (context, index) => _buildItemWidget(context, index, _UnGetList),
          ),
        ),
      ],
    );
  }

  Widget _buildItemWidget(BuildContext context, int index, List<GloryCenterWearableBadge>? list) {
    GloryCenterWearableBadge wearableBadge = list![index];
    bool isEffective = wearableBadge.effective ?? false;
    return GestureDetector(
      onTap: () {
        GloryCenterDialog.show(context, widget.uid, widget.cateTab.id, wearableBadge, wearCallback: (bool isWear) async {
          if (isWear) {
            // 取消穿戴
            NormalNull resp;
            if (widget.cateTab.id == 2) {
              //麦位标签
              resp = await GloryCenterRepo.takeOffMicBadge(wearableBadge.badgeId);
            } else if (widget.cateTab.id == 3) {
              //成就勋章
              resp = await AchievementWallRepo.takeOffBadge(wearableBadge.badgeId);
            } else {
              resp = await GloryCenterRepo.profileTakeOffBadge(wearableBadge.badgeId);
            }
            if (resp.success) {
              Navigator.of(context).pop();
              Fluttertoast.showCenter(msg: K.personaldata_cancel_wear_success);
              eventCenter.emit(EventConstant.EventProfileBadgeDataChanged);
              _loadData(force: true);
            } else {
              Fluttertoast.showCenter(msg: Util.validStr(resp.msg) ? resp.msg : K.personaldata_cancel_wear_failure);
            }
          } else {
            // 穿戴
            bool success = false;
            String msg = '';
            if (widget.cateTab.id == 2) {
              //麦位标签
              NormalNull resp = await GloryCenterRepo.wearMicBadge(wearableBadge.badgeId);
              success = resp.success;
              msg = resp.msg;
            } else if (widget.cateTab.id == 3) {
              //成就勋章
              NormalNull resp = await AchievementWallRepo.wearBadge(wearableBadge.badgeId);
              success = resp.success;
              msg = resp.msg;
            } else {
              HomeProfileWearBadgeResp resp = await Api.wearActivityBadge(wearableBadge.badgeId);
              success = resp.success;
              msg = resp.msg;
            }

            if (success) {
              Navigator.of(context).pop();
              Fluttertoast.showCenter(msg: K.personaldata_wear_success);
              eventCenter.emit(EventConstant.EventProfileBadgeDataChanged);
              _loadData(force: true);
            } else {
              Fluttertoast.showCenter(msg: Util.validStr(msg) ? msg : K.personaldata_wear_failure);
            }
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF22202B),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(4),
                alignment: AlignmentDirectional.center,
                decoration: isEffective
                    ? BoxDecoration(
                        image: DecorationImage(
                        image: (R.img(Assets.ryItemBg, package: Assets.package) as Image).image,
                        fit: BoxFit.fitWidth,
                      ))
                    : commonBoxDecorationWithParams([const Color(0xFF2E2B3A), const Color(0xFF2E2B3A)], 10),
                child: ((widget.cateTab.id == 2)
                        ? _renderMicIcon(wearableBadge)
                        : ((widget.cateTab.id == 3) ? _renderAchieveIcon(wearableBadge) : _renderBadgeIcon(wearableBadge)))
                    .withColorFiltered(isEffective == false),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              wearableBadge.title,
              style: TextStyle(color: isEffective ? const Color(0xFFFFFFFF) : const Color(0xFFFFFFFF).withOpacity(0.6), fontSize: 14.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  /// 荣誉标签icon
  Widget _renderBadgeIcon(GloryCenterWearableBadge wearableBadge, {bool isEffective = false}) {
    return Util.validStr(wearableBadge.icon) && Util.validStr(wearableBadge.additionName)
        ? wearableBadge.giftBadgeType == 3
            ? AppreciatorTagWidget(icon: wearableBadge.icon, label: wearableBadge.additionName, scale: 1.2)
            : GiftKingOrStarWithGiftNameTag(
                name: wearableBadge.additionName,
                icon: wearableBadge.icon,
                color: Colors.white,
                shadowColor: (wearableBadge.badgeId == 119 || wearableBadge.giftBadgeType == 2) ? const Color(0xffDD0020) : null,
                awakeGift: wearableBadge.awakeGift,
              )
        : ActivityBadgeWidget(icon: wearableBadge.icon, isMask: isEffective);
  }

  /// 麦位标签icon
  Widget _renderMicIcon(GloryCenterWearableBadge wearableBadge, {bool isEffective = false}) {
    return ActivityBadgeWidget(
      icon: wearableBadge.icon,
      height: 14,
      isMask: isEffective,
    );
  }

  /// 成就勋章icon
  Widget _renderAchieveIcon(GloryCenterWearableBadge wearableBadge, {bool isEffective = false}) {
    return ActivityBadgeWidget(icon: wearableBadge.icon, height: 44, isMask: isEffective);
  }
}

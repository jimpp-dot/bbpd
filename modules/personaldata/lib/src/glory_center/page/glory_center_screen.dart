import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/assets.dart';
import 'package:personaldata/k.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:personaldata/src/glory_center/widget/glory_center_tab_widget.dart';
import 'package:personaldata/src/glory_center/widget/appreciator_tag_widget.dart';
import 'package:get/get.dart';

import '../model/glory_center_repo.dart';
import '../model/pb/generated/slp_glory.pb.dart';

/// 我/TA的荣誉中心

class GloryCenterScreen extends StatefulWidget {
  final int uid;

  const GloryCenterScreen(this.uid, {Key? key}) : super(key: key);

  static Future show(BuildContext context, int uid) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GloryCenterScreen(uid),
        settings: const RouteSettings(name: '/GloryCenterScreen'),
      ),
    );
  }

  @override
  State<GloryCenterScreen> createState() => _GloryCenterScreenState();
}

class _GloryCenterScreenState extends State<GloryCenterScreen>
    with BaseScreenStateMixin, AutomaticKeepAliveClientMixin<GloryCenterScreen>, TickerProviderStateMixin {
  final List<Widget> _tabsWidget = [];
  final List<Widget> _pagesWidget = [];
  ExtendedTabController? _tabController;
  GloryCenterCate? _data;
  final List<CommonTagData> _commonTags = []; // 通用标签
  final ISettingManager _settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
  final ValueNotifier<bool> _controller = ValueNotifier<bool>(false);
  final RxInt _badgeNum = 0.obs; // 勋章数量

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _loadData();
    _controller.addListener(() async {
      bool value = _controller.value;

      /// 设置荣誉展示开关
      /// 传参   setting_type   3
      /// on    1-关闭开关，隐藏展示，0-打开开关，公开展示
      NormalNull resp = await _settingManager.setGeneralSetting(3, value ? 0 : 1);
      if (resp.success && mounted) {
        setState(() {
          _data?.user.showGlory = (value ? 1 : 0);
        });
      } else {
        Fluttertoast.showToast(msg: resp.msg, gravity: ToastGravity.CENTER);
      }
    });
    eventCenter.addListener(EventConstant.EventProfileBadgeDataChanged, onBadgeChange);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _controller.dispose();
    eventCenter.removeListener(EventConstant.EventProfileBadgeDataChanged, onBadgeChange);
    super.dispose();
  }

  void onBadgeChange(String type, dynamic data) async {
    if (type == EventConstant.EventProfileBadgeDataChanged) {
      _loadData();
    }
  }

  Future _loadData() async {
    ResGloryCenterCate resp = await GloryCenterRepo.getProfileGlory(uid: widget.uid);
    if (resp.success && resp.hasData()) {
      if (!mounted) return;
      Log.d("GloryCenterScreen:${resp.data}");
      _data = resp.data;
      _controller.value = Util.parseInt(_data?.user.showGlory) == 1;
      _initTabs(_data!.cateList);
      await _checkCommonTagData();
      setScreenReady();
    } else {
      setScreenError(errorMsg: resp.msg);
    }
  }

  void _initTabs(List<GloryCenterCateItem> tabList) {
    if (!mounted) return;
    int lastInitialIndex = 0;
    if (_tabController != null) {
      lastInitialIndex = _tabController!.index;
      _tabController?.dispose();
    }
    _tabController =
        ExtendedTabController(initialIndex: lastInitialIndex.clamp(0, tabList.length - 1), length: tabList.length, vsync: this);
    _tabsWidget.clear();
    _pagesWidget.clear();
    for (var e in tabList) {
      _tabsWidget.add(Tab(child: Text(e.name)));
      _pagesWidget.add(GloryCenterTabWidget(uid: widget.uid, cateTab: e));
    }
  }

  Future<void> _checkCommonTagData() async {
    /// 个人页标签List
    if (Util.validList(_data?.platformBadges.tags)) {
      _commonTags.clear();
      for (int i = 0; i < (_data?.platformBadges.tags.length ?? 0); i++) {
        String tagString = _data?.platformBadges.tags[i] ?? '';
        if (!Util.validStr(tagString)) {
          continue;
        }
        List<String> data = tagString.split(',');
        if (data.isEmpty) {
          continue;
        }

        int tagId = Util.parseInt(data[0], 0);
        if (tagId == 0) {
          continue;
        }
        String label = data.length > 1 ? data[1] : '';
        CommonTagData? tagData = await TagDataUtil.getCommonTagData(tagId, label);
        if (tagData != null) {
          _commonTags.add(tagData);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      width: Util.width,
      height: Util.height,
      child: Stack(
        children: [
          Positioned(
              top: 0,
              child: Image.asset(
                Assets.acBadgeTopBg,
                width: Util.width,
                height: 200,
                fit: BoxFit.fitWidth,
              )),
          Positioned.fill(
              child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _renderTitle(),
              Expanded(child: buildStatusContent()),
            ],
          ))
        ],
      ),
    );
  }

  @override
  Widget buildContent() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _renderUserInfo(),
        // 勋章悬浮卡片
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 20, end: 20, bottom: 7),
          child: _renderTagList(),
        ),
        _renderTabs(),
        Expanded(
          child: TabBarView(
            physics: const ClampingScrollPhysics(),
            controller: _tabController,
            children: _pagesWidget,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).padding.bottom + 20)
      ],
    );
  }

  Widget _renderTitle() {
    return BaseAppBar.custom(
      backgroundColor: Colors.transparent,
      //systemOverlayStyle: SystemUiOverlayStyle.dark,
      //iconTheme: Theme.of(context).iconTheme.copyWith(color: R.color.mainBgColor),
      //elevation: 0.0,
      title: const Text(
        "荣誉中心",
        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
      ),
      leading: IconButton(
          padding: const EdgeInsets.all(0.0),
          icon: Container(
            width: 36.0,
            height: 36.0,
            margin: const EdgeInsetsDirectional.only(start: 8.0, top: 2),
            alignment: Alignment.center,
            child: Center(
              child: R.img(
                Assets.personaldata$ic_titlebar_profile_back_svg,
                width: 24,
                height: 24,
                color: Colors.white,
              ),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      actions: <Widget>[
        IconButton(
          icon: R.img(Assets.personaldata$ic_title_info_webp,
              package: ComponentManager.MANAGER_PERSONALDATA, width: 24, height: 24, color: Colors.white),
          onPressed: () {
            BaseWebviewScreen.show(context, url: Util.getHelpUrlWithQStr('k74'));
          },
        ),
      ],
    );
  }

  /// 头像、昵称、拥有勋章
  Widget _renderUserInfo() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 10, start: 32, end: 20, bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 62,
            height: 62,
            margin: const EdgeInsetsDirectional.only(top: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            alignment: AlignmentDirectional.center,
            child: CommonAvatar(path: _data?.user.userIcon ?? '', size: 60, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  _data?.user.userName ?? '',
                  style: const TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(
                          () => NumText(
                            '${_badgeNum.value} ',
                            style: TextStyle(color: R.color.mainBrandColor, fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          K.personaldata_have_medal,
                          style: const TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Container(
                          width: 1,
                          height: 16,
                          color: Colors.white.withOpacity(0.1),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        NumText(
                          '${_data!.totalMicTag} ',
                          style: TextStyle(height: 1, color: R.color.mainBrandColor, fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          K.personaldata_have_tag,
                          style: TextStyle(height: 1, color: Colors.white.withOpacity(0.8), fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                if (widget.uid == Session.uid)
                  Row(
                    children: [
                      Text(
                        K.personaldata_show_glory,
                        style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12),
                      ),
                      const SizedBox(width: 6),
                      AdvancedSwitch(
                        activeColor: R.color.mainBrandColor,
                        inactiveColor: Colors.grey.withOpacity(0.5),
                        thumb: Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            // border: Border.all(color: Color(0xFFFFD782), width: 1.0),
                            color: const Color(0xFFFFF0D0),
                          ),
                        ),
                        width: 30,
                        height: 18,
                        controller: _controller,
                      ),
                    ],
                  )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _renderTabs() {
    return Container(
      height: 44,
      alignment: AlignmentDirectional.centerStart,
      child: CommonTabBar(
        tabs: _tabsWidget,
        isScrollable: true,
        controller: _tabController,
        labelColor: R.color.mainTextColor,
        unselectedLabelColor: R.color.secondTextColor,
        labelStyle: TextStyle(color: R.color.mainTextColor, fontSize: 16, fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(color: R.color.secondTextColor, fontSize: 14),
        indicator: const BoxDecoration(),
        marginStart: 6,
        marginEnd: 6,
        labelPadding: const EdgeInsetsDirectional.only(start: 10, end: 10),
        tabItemAlign: const Alignment(0, 0.2),
      ),
    );
  }

  /// 用户标签
  Widget _renderTagList() {
    List<Widget> tags = [];

    // 通用标签
    tags.addAll(_generalTagList(true));

    // 人气等级标签
    if (Util.parseInt(_data?.platformBadges.popularityLevel) > 0) {
      tags.add(UserPopularity(popularityLevel: _data?.platformBadges.popularityLevel));
    }

    // VIP等级标签
    if (Util.parseInt(_data?.platformBadges.vipLevel) > 0) {
      tags.add(UserVipWidget(vip: _data?.platformBadges.vipLevel));
    }

    // KA神壕标签
    if (Util.parseBool(_data?.platformBadges.kaWhiteIcon)) tags.add(const KaTagWidget());

    // 爵位标签
    if (!NobilityUtil.titleIsInvalid(_data?.platformBadges.title ?? 0)) {
      tags.add(UserNobilityWidget(titleNew: _data?.platformBadges.title));
    }

    // 小闹钟标签
    if (ChatUtil.isCanShowAlarmLabel(_data?.platformBadges.littleAlarm ?? '')) {
      tags.add(TextLabelWidget.smallAlarmLabel(_data?.platformBadges.littleAlarm));
    }

    // 明星歌手标签
    int starSinger = Util.parseInt(_data?.platformBadges.starSinger);
    if (starSinger > 0 && starSinger <= 7) {
      tags.add(UserStarSingerWidget(level: _data?.platformBadges.starSinger, height: 26));
    }

    // 明星用户加V标签（黄V/红V）
    if (_data?.platformBadges.starVerifyTag == 1 || _data?.platformBadges.starVerifyTag == 2 || _data?.platformBadges.starVerifyTag == 3) {
      tags.add(UserStarVerifyWidget(starVerifyTag: _data?.platformBadges.starVerifyTag));
    }

    // 七夕勋章标签
    int sevenLoveTag = Util.parseInt(_data?.platformBadges.sevenLoveTag);
    if (sevenLoveTag > 0 && sevenLoveTag <= 3) {
      tags.add(SevenLoveWidget(rank: Util.parseInt(_data?.platformBadges.sevenLoveTag)));
    }

    // 通用标签
    tags.addAll(_generalTagList(false));

    // 勋章标签
    if (Util.validList(_data?.effectList)) {
      tags.addAll(_data?.effectList.where((element) => element.effective).map((e) {
            if ((e.badgeId == 118 || e.badgeId == 119 || e.giftBadgeType == 1 || e.giftBadgeType == 2) &&
                Util.validStr(e.additionName) &&
                Util.validStr(e.icon)) {
              return GiftKingOrStarWithGiftNameTag(
                name: e.additionName,
                icon: e.icon,
                color: Colors.white,
                //(e.badgeId == 119 || e.giftBadgeType == 2) ? const Color(0xFFf8cf62) : Colors.white,
                width: 67,
                height: 26,
                fontSize: 8,
                shadowColor: (e.badgeId == 119 || e.giftBadgeType == 2) ? const Color(0xffDD0020) : null,
                awakeGift: e.awakeGift,
              );
            } else if (e.giftBadgeType == 3) {
              return AppreciatorTagWidget(icon: e.icon, label: e.additionName);
            } else {
              return ActivityBadgeWidget(icon: e.icon);
            }
          }).toList() ??
          []);
    }

    /// 麦位标签 不显示
    // if (Util.validList(_data?.micTagList)) {
    //   _tags.addAll(_data?.micTagList.map(
    //         (e) {
    //           return ActivityBadgeWidget(icon: e, height: 20);
    //         },
    //       ).toList() ??
    //       []);
    // }

    // 勋章数量不算麦位标签
    _badgeNum.value = tags.length;

    // final decoration = BoxDecoration(
    //   color: Colors.white,
    //   borderRadius: BorderRadius.circular(16.0),
    //   boxShadow: const [
    //     BoxShadow(color: Color(0x0D000000), offset: Offset(0, 0), blurRadius: 20, spreadRadius: 6),
    //   ],
    // );

    final decoration = BoxDecoration(
        image: const DecorationImage(
            image: AssetImage(
              Assets.acBadgeBg,
            ),
            fit: BoxFit.fitWidth));

    if (Util.validList(tags)) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        constraints: const BoxConstraints(
          maxHeight: 160,
        ),
        decoration: decoration,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 13),
          child: Wrap(
            alignment: WrapAlignment.start,
            spacing: 4.0,
            runSpacing: 8.0,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: tags,
          ),
        ),
      );
    } else {
      return Container(
        width: double.infinity,
        height: 68,
        padding: EdgeInsets.all(8.dp),
        decoration: decoration,
        child: Row(
          children: [
            Image.asset(
              Assets.acBadgeIconGrey,
              width: 30.dp,
              height: 30.dp,
              fit: BoxFit.fill,
            ),
            SizedBox(
              width: 4.dp,
            ),
            Text(
              "暂无荣誉勋章",
              style: TextStyle(fontSize: 12.dp, color: Colors.white.withOpacity(0.5)),
            )
          ],
        ),
      );
    }
  }

  List<Widget> _generalTagList(bool front) {
    List<Widget> widgets = [];

    if (_commonTags.isNotEmpty) {
      Log.d(tag: "generalTag", "total length:${_commonTags.length}");
      for (int i = 0; i < _commonTags.length; i++) {
        if (front && _commonTags[i].location == 0) {
          Log.d(tag: "generalTag", "add to front:${_commonTags[i].toString()}");
          widgets.add(CommonTagWidget(
            data: _commonTags[i],
            inProfilePage: true,
            needMarginEnd: false,
          ));
        } else if (!front && _commonTags[i].location == 1) {
          Log.d(tag: "generalTag", "add to end:${_commonTags[i].toString()}");
          widgets.add(CommonTagWidget(
            data: _commonTags[i],
            inProfilePage: true,
            needMarginEnd: false,
          ));
        }
      }
    }
    return widgets;
  }
}

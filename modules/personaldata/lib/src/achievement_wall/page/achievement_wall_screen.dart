import 'dart:math';
import 'dart:ui';

import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/k.dart';
import 'package:personaldata/src/achievement_wall/page/skin_preview_page.dart';
import 'package:personaldata/src/achievement_wall/widget/achieve_desc_dialog.dart';

import '../../../assets.dart';
import '../api/achievement_wall_repo.dart';
import '../model/pb/generated/slp_achieve.pb.dart';
import 'achievement_wall_rank_screen.dart';
import '../model/skin_config.dart';
import 'medal_list_page.dart';

///成就墙主页
class AchievementWallScreen extends StatefulWidget {
  /// 被查看用户id
  final int uid;

  const AchievementWallScreen({Key? key, required this.uid}) : super(key: key);

  @override
  State<AchievementWallScreen> createState() => _AchievementWallScreenState();

  static Future show(BuildContext context, {required int uid}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AchievementWallScreen(uid: uid),
        settings: const RouteSettings(name: '/AchievementWallScreen'),
      ),
    );
  }
}

class _AchievementWallScreenState extends BaseScreenState<AchievementWallScreen>
    with TickerProviderStateMixin<AchievementWallScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [];
  final List<AchieveBadgeTab> _tabs = [];
  ExtendedTabController? _tabController;
  AchieveWallData? data;
  bool _isSelf = true;
  int _realSkinId = 0; // 用户真实的皮肤ID
  @override
  void initState() {
    super.initState();
    _isSelf = (Session.uid == widget.uid);
    Tracker.instance.track(TrackEvent.achievement_page_show,
        properties: {'uid': widget.uid});
    eventCenter.addListener(EventConstant.EventAchieveSkinChange, _onEvent);
    SkinConfig.resetSkin();
    _loadData();
  }

  void _loadData() {
    AchievementWallRepo.getAchieveWall(uid: widget.uid).then((rsp) {
      if (rsp.success && rsp.hasData()) {
        data = rsp.data;
        _realSkinId = data?.user.skinId ?? 0;
        _tabs.clear();
        _tabs.addAll(data!.tab);
        if (!Util.isCollectionEmpty(data!.tab)) {
          _pages.clear();
          for (int i = 0; i < data!.tab.length; i++) {
            AchieveBadgeTab tab = data!.tab[i];
            _pages.add(
              MedalListPage(
                uid: widget.uid,
                cateId: tab.category,
                achieveWallData: _currentIndex == i ? data : null,
              ),
            );
          }
          _tabController?.removeListener(_onIndexChange);
          _tabController =
              ExtendedTabController(length: _tabs.length, vsync: this);
          _tabController?.addListener(_onIndexChange);
          setScreenReady();
        } else {
          setScreenEmpty(emptyMsgColor: Colors.white);
        }
      } else {
        setScreenError(errorMsg: rsp.msg, errorMsgColor: Colors.white);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
    SkinConfig.resetSkin();
    eventCenter.removeListener(EventConstant.EventAchieveSkinChange, _onEvent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF1D1D2B), body: buildStatusContent());
  }

  @override
  Widget buildContent() {
    return Container(
        color:
            SkinConfig.configs[SkinConfig.previewId ?? _realSkinId].mainColor,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            _buildHeader(),
            SizedBox(
                height: kToolbarHeight + 40.dp,
                child: BaseAppBar.custom(
                  backgroundColor: Colors.transparent,
                  statusBrightness: Brightness.dark,
                  leading: const BackButton(color: Colors.white),
                  actions: <Widget>[
                    _isSelf
                        ? GestureDetector(
                            onTap: () async {
                              bool? saved = await SkinPreviewPage.show(context,
                                  skinId: data?.user.skinId ?? 0,
                                  userAchieveNum: data?.user.achieveNum ?? 0,
                                  skinList: data?.skinList ?? []);
                              if (saved == true) {
                                _loadData();
                                return;
                              }
                              if (SkinConfig.previewId != null) {
                                SkinConfig.resetSkin();
                                eventCenter
                                    .emit(EventConstant.EventAchieveSkinChange);
                              }
                            },
                            child: Padding(
                              padding: EdgeInsetsDirectional.only(end: 16.dp),
                              child: R.img(
                                  Assets
                                      .personaldata$achievement_wall_ic_skin_webp,
                                  width: 24.dp),
                            ),
                          )
                        : const SizedBox.shrink()
                  ],
                )),
            _buildSubPages(),
          ],
        ));
  }

  Widget _buildHeader() {
    List<Widget> rankWidgets = [];
    for (int i = data!.user.level.length - 1; i >= 0; i--) {
      rankWidgets.add(_buildUserMedal(
          data?.user.level[i].icon ?? "", data?.user.level[i].num ?? 0));
    }
    return Container(
      alignment: AlignmentDirectional.topCenter,
      width: Util.width,
      height: 300.dp,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  SkinConfig.configs[SkinConfig.previewId ?? _realSkinId].bg),
              fit: BoxFit.fitWidth)),
      child: Stack(
        children: [
          PositionedDirectional(
              top: kToolbarHeight + 40.dp,
              start: 21.dp,
              child: Row(
                children: [
                  CommonAvatar(
                    path: data?.user.icon,
                    shape: BoxShape.circle,
                    size: 40.dp,
                  ),
                  SizedBox(width: 4.dp),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 130.dp,
                          child: Text(data?.user.name ?? "",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold))),
                      SizedBox(height: 6.dp),
                      if (rankWidgets.isNotEmpty) Row(children: rankWidgets)
                    ],
                  )
                ],
              )),
          PositionedDirectional(
              bottom: 70.dp,
              start: 21.dp,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      R.img(
                          SkinConfig
                              .configs[SkinConfig.previewId ?? _realSkinId]
                              .text,
                          height: 25.dp),
                      SizedBox(width: 8.dp),
                      Text(
                        "${data?.unlockNum ?? 0}",
                        style: TextStyle(
                            color: SkinConfig
                                .configs[SkinConfig.previewId ?? _realSkinId]
                                .textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                            fontFamily: Util.numFontFamily,
                            package: ComponentManager.MANAGER_BASE_CORE),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.5.dp),
                  if (_isSelf)
                    GestureDetector(
                        onTap: () {
                          if (_isSelf) {
                            AchievementWallRankScreen.show(context);
                          }
                        },
                        child: Row(children: [
                          Text(K.achieve_rank(["${data?.friendRank}"]),
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal)),
                          R.img(
                            BaseAssets.shared$icon_next_svg,
                            width: 16,
                            height: 16,
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ])),
                ],
              )),
          PositionedDirectional(
              end: 43.dp,
              bottom: 56.dp,
              width: 130.dp,
              height: 28.dp,
              child: GestureDetector(
                onTap: () {
                  AchieveDescDialog.show(context);
                },
                child: ClipRRect(
                  borderRadius: BorderRadiusDirectional.circular(18.dp),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
                    child: Container(
                      height: 28.dp,
                      alignment: AlignmentDirectional.center,
                      padding: EdgeInsetsDirectional.only(
                          start: 7.dp, end: 7.dp, top: 2.dp, bottom: 2.dp),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadiusDirectional.circular(18.dp),
                        border: Border.all(
                            color: SkinConfig
                                .configs[SkinConfig.previewId ?? _realSkinId]
                                .textColor
                                .withOpacity(0.3),
                            width: 0.5.dp),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          R.img(
                              Assets.personaldata$achievement_wall_ic_deco_webp,
                              width: 9.5.dp,
                              color: SkinConfig
                                  .configs[SkinConfig.previewId ?? _realSkinId]
                                  .textColor),
                          Expanded(
                              flex: 1,
                              child: GradientText(
                                  K.achieve_num(
                                      ["${data?.user.achieveNum ?? 0}"]),
                                  gradient: SkinConfig
                                      .configs[
                                          SkinConfig.previewId ?? _realSkinId]
                                      .gradient,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 14.dp,
                                      fontWeight: FontWeight.w900))),
                          Transform(
                              alignment: AlignmentDirectional.center,
                              transform: Matrix4.rotationY(pi),
                              child: R.img(
                                  Assets
                                      .personaldata$achievement_wall_ic_deco_webp,
                                  width: 9.5.dp,
                                  color: SkinConfig
                                      .configs[
                                          SkinConfig.previewId ?? _realSkinId]
                                      .textColor))
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildUserMedal(String icon, int num) {
    return Row(
      children: [
        R.img(Util.getRemoteImgUrl(icon), width: 16.dp),
        SizedBox(width: 3.dp),
        Text("$num",
            style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontFamily: Util.numFontFamily,
                package: ComponentManager.MANAGER_BASE_CORE)),
        SizedBox(width: 6.dp)
      ],
    );
  }

  Widget _buildSubPages() {
    List<Widget> tabList = _tabs.map((e) => Tab(text: e.name)).toList();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 260.dp),
        CommonTabBar(
          tabs: tabList,
          marginStart: 16.dp,
          isScrollable: true,
          labelStyle:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
          unselectedLabelStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          labelColor: Colors.white.withOpacity(0.9),
          unselectedLabelColor: Colors.white.withOpacity(0.7),
          controller: _tabController,
          indicator: const BoxDecoration(),
          indicatorWeight: 0,
        ),
        Expanded(
            child: TabBarView(
          controller: _tabController,
          children: _pages,
        )),
      ],
    );
  }

  void _onEvent(String type, dynamic data) {
    if (type == EventConstant.EventAchieveSkinChange) {
      refresh();
    }
  }

  void _onIndexChange() {
    _currentIndex = _tabController?.index ?? 0;
  }
}

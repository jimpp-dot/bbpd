import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../k.dart';
import '../model/pb/generated/slp_anchor.pb.dart';
import 'anchor_task_detail_tab_page.dart';
import 'anchor_task_info_widget.dart';
import 'anchor_task_user_modify.dart';
import 'anchor_task_user_sub_page.dart';

class AnchorTaskScreen extends StatefulWidget {
  /// 是否为任务平台助手，助手页不需要顶部的详细信息，只需要下面的几个流量Tab
  final bool isAide;
  final bool isFullScreen;

  const AnchorTaskScreen({super.key, this.isAide = false, this.isFullScreen = true});

  @override
  AnchorTaskState createState() {
    return AnchorTaskState();
  }

  static Future show(BuildContext context, {bool isAide = false, bool isFullScreen = true}) {
    if (isFullScreen == true) {
      return Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AnchorTaskScreen(isAide: isAide, isFullScreen: isFullScreen),
        settings: const RouteSettings(name: '/AnchorTaskScreen'),
      ));
    } else {
      return displayModalBottomSheet(
        context: context,
        maxHeightRatio: 0.67,
        defineBarrierColor: Colors.transparent,
        builder: (context) {
          return ClipRRect(
            borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(14),
              topEnd: Radius.circular(14),
            ).resolve(Directionality.of(context)),
            child: GestureDetector(
              onTap: () {
                /// do nothing
              },
              child: AnchorTaskScreen(
                isAide: isAide,
                isFullScreen: isFullScreen,
              ),
            ),
          );
        },
      );
    }
  }
}

class AnchorTaskState extends State<AnchorTaskScreen> with TickerProviderStateMixin {
  bool loading = true;
  String error = '';
  TabController? _tabController;
  late ResAnchorCenter data;
  final List<Widget> _tabs = [];
  final List<Widget> _tabWidgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  void loadData() async {
    String url = 'go/yy/anchor/index?type=1';
    try {
      XhrResponse response = await Xhr.get('${System.domain}$url', throwOnError: true, pb: true);
      data = ResAnchorCenter.fromBuffer(response.bodyBytes);
    } catch (e) {
      data = ResAnchorCenter(success: false, msg: e.toString());
    }
    if (data.success == false && Util.validStr(data.msg)) {
      if (mounted) {
        setState(() {
          loading = false;
          error = data.msg;
        });
      }
      return;
    }
    if (Util.validList(data.data.anchorTab)) {
      _tabController = TabController(initialIndex: 0, length: data.data.anchorTab.length, vsync: this);
      for (int i = 0; i < data.data.anchorTab.length; i++) {
        Tab tab = Tab(
          child: Text(data.data.anchorTab[i].name),
        );
        _tabs.add(tab);
        _tabWidgets.add(AnchorTaskUserSubPage(
          filter: data.data.anchorTab[i].filter,
          anchorSubFilter: data.data.anchorTab[i].anchorSubFilter,
          showDateFilter: data.data.anchorTab[i].showDateFilter,
        ));
      }
    }
    loading = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isAide == true) {
      /// 任务台助手页
      return Scaffold(
        backgroundColor: R.color.mainBgColor,
        appBar: BaseAppBar.custom(
          title: Text(
            K.profile_anchor_task_title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: buildAideBody(),
      );
    }
    return Scaffold(
      appBar: BaseAppBar.custom(
        title: Text(
          K.profile_anchor_task_title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: buildActions(),
      ),
      body: buildBody(),
    );
  }

  Widget buildAideBody() {
    if (loading) {
      return const Loading();
    } else if (Util.validStr(error)) {
      return ErrorData(
        error: error,
        onTap: loadData,
      );
    }
    if (Util.isCollectionEmpty(_tabs)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildAideTop(),
        ],
      );
    }
    return ExtendedNestedScrollView(
      onlyOneScrollInBody: true,
      pinnedHeaderSliverHeightBuilder: () {
        /// 通过pinnedHeaderSliverHeightBuilder， 使AnchorTaskUserSubPage中的标签(renderTab)也吸顶,
        /// 此处返回renderTab的高度
        return 44;
      },
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverToBoxAdapter(child: buildAideTop()),
          // 一级tab pinned（吸顶）
          SliverPersistentHeader(
            pinned: true,
            delegate: CustomSliverPersistentHeaderDelegate(buildTabBar(), 44),
          ),
        ];
      },
      body: buildTabBarView(),
    );
  }

  Widget buildAideTop() {
    double width = (Util.width - 16 - 8 - 16) / 2;
    if (width > 186) {
      width = 186;
    }
    double height = width * 72 / 168;
    return Row(
      children: [
        const SizedBox(width: 16),
        GestureDetector(
          onTap: () {
            /// 主页
            AnchorTaskScreen.show(context);
          },
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(R.imagePath('ic_anchor_task_main.webp', package: ComponentManager.MANAGER_PROFILE)),
              ),
            ),
            alignment: AlignmentDirectional.centerStart,
            padding: const EdgeInsetsDirectional.only(start: 16),
            child: Text(
              K.profile_anchor_task_main,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF518EFF),
                height: 1.2,
              ),
            ),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            /// 任务详情
            AnchorTaskDetailTabPage.show(context);
          },
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(R.imagePath('ic_anchor_task_list.webp', package: ComponentManager.MANAGER_PROFILE)),
              ),
            ),
            alignment: AlignmentDirectional.centerStart,
            padding: const EdgeInsetsDirectional.only(start: 16),
            child: Text(
              K.profile_anchor_task_list,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF518EFF),
                height: 1.2,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  List<Widget> buildActions() {
    return [
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          /// 人员变更
          AnchorTaskUserModify.show(context);
        },
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 16, end: 8, top: 11, bottom: 11),
          child: R.img(
            'ic_anchor_task_modify.webp',
            width: 24,
            height: 24,
            package: ComponentManager.MANAGER_PROFILE,
          ),
        ),
      ),
    ];
  }

  Widget buildBody() {
    if (loading) {
      return const Loading();
    } else if (Util.validStr(error)) {
      return ErrorData(
        error: error,
        onTap: loadData,
      );
    }
    if (Util.isCollectionEmpty(_tabs)) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        alignment: AlignmentDirectional.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AnchorTaskInfoWidget(info: data.data.anchorInfo),
            if (Util.validStr(data.data.bannerInfo.bannerText)) buildBanner(),
          ],
        ),
      );
    }
    return ExtendedNestedScrollView(
      onlyOneScrollInBody: true,
      pinnedHeaderSliverHeightBuilder: () {
        /// 通过pinnedHeaderSliverHeightBuilder， 使AnchorTaskUserSubPage中的标签(renderTab)也吸顶,
        /// 此处返回renderTab的高度
        return 44;
      },
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverToBoxAdapter(child: AnchorTaskInfoWidget(info: data.data.anchorInfo)),
          if (Util.validStr(data.data.bannerInfo.bannerText)) SliverToBoxAdapter(child: buildBanner()),
          SliverToBoxAdapter(child: buildSubTitle()),
          // 一级tab pinned（吸顶）
          SliverPersistentHeader(
            pinned: true,
            delegate: CustomSliverPersistentHeaderDelegate(buildTabBar(), 44),
          ),
        ];
      },
      body: buildTabBarView(),
    );
  }

  Widget buildSubTitle() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 16, bottom: 8),
      child: Row(
        children: [
          const Spacer(),
          Container(
            width: 32,
            height: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(2),
              gradient: const LinearGradient(colors: [Color(0x00FFE03D), Color(0x80FFD057)]),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            K.profile_anchor_task_subtitle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: R.color.mainTextColor,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 32,
            height: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(2),
              gradient: const LinearGradient(colors: [Color(0x80FFD057), Color(0x00FFE03D)]),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget buildBanner() {
    return GestureDetector(
      onTap: () {
        if (Util.validStr(data.data.bannerInfo.bannerUrl)) {
          BaseWebviewScreen.show(context, url: data.data.bannerInfo.bannerUrl);
          Tracker.instance.track(TrackEvent.click, properties: {
            'click_page': 'gsPlatformActivityButton',
          });
        }
      },
      child: Container(
        margin: const EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 8),
        padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(26),
          gradient: const LinearGradient(colors: [Color(0xFFFFE776), Color(0xFFF9599F)]),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          data.data.bannerInfo.bannerText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildTabBar() {
    return Container(
      color: R.color.mainBgColor,
      child: CommonTabBar(
        tabs: _tabs,
        isScrollable: true,
        labelColor: R.color.mainTextColor,
        controller: _tabController,
        unselectedLabelColor: R.color.secondTextColor,
        labelStyle: TextStyle(color: R.color.mainTextColor, fontSize: 18, fontWeight: FontWeight.w500),
        unselectedLabelStyle: TextStyle(color: R.color.secondTextColor, fontSize: 16, fontWeight: FontWeight.w500),
        indicator: CommonUnderlineTabIndicator(
            borderSide: BorderSide(width: 3.0, color: R.color.mainBrandColor),
            insets: const EdgeInsetsDirectional.only(bottom: 0),
            wantWidth: 16,
            draggingWidth: 12.0),
        indicatorWeight: 0,
        marginStart: 10,
        marginEnd: 60,
        labelPadding: const EdgeInsetsDirectional.only(start: 10, end: 10),
      ),
    );
  }

  Widget buildTabBarView() {
    if (!Util.validList(_tabWidgets)) {
      return const SizedBox.shrink();
    }
    return TabBarView(
      controller: _tabController,
      children: _tabWidgets,
    );
  }
}

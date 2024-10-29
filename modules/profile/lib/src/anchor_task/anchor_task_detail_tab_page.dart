import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../k.dart';
import '../model/pb/generated/slp_anchor.pb.dart';
import 'anchor_task_detail_sub_page.dart';
import 'anchor_task_history_page.dart';

/// 任务详情TAB页
class AnchorTaskDetailTabPage extends StatefulWidget {
  const AnchorTaskDetailTabPage({super.key});

  @override
  AnchorTaskDetailTabState createState() {
    return AnchorTaskDetailTabState();
  }

  static Future show(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const AnchorTaskDetailTabPage(),
      settings: const RouteSettings(name: '/AnchorTaskDetailTabPage'),
    ));
  }
}

class AnchorTaskDetailTabState extends State<AnchorTaskDetailTabPage>
    with TickerProviderStateMixin<AnchorTaskDetailTabPage> {
  bool loading = true;
  String error = '';
  late TabController _tabController;
  late ResAnchorCenter data;
  final List<Widget> _tabs = [];
  final List<Widget> _tabWidgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    String url = 'go/yy/anchor/index?type=2';
    try {
      XhrResponse response =
          await Xhr.get('${System.domain}$url', throwOnError: true, pb: true);
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
      safeRun(() {
        _tabController = TabController(
            initialIndex: 0, length: data.data.anchorTab.length, vsync: this);
      });
      for (int i = 0; i < data.data.anchorTab.length; i++) {
        Tab tab = Tab(
          child: Text(data.data.anchorTab[i].name),
        );
        _tabs.add(tab);
        _tabWidgets.add(AnchorTaskDetailSubPage(
          filter: data.data.anchorTab[i].filter,
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
    return Scaffold(
      appBar: BaseAppBar(
        K.profile_anchor_task_detail,
        actionTitle: K.profile_anchor_task_history,
        onPressed: () {
          AnchorTaskHistoryPage.show(context);
        },
      ),
      body: buildBody(),
    );
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTabBar(),
        Expanded(
          child: buildTabBarView(),
        ),
      ],
    );
  }

  Widget buildTabBar() {
    if (!Util.validList(_tabs)) {
      return const SizedBox(
        height: 44,
      );
    }
    return Container(
      height: 44,
      color: R.color.mainBgColor,
      child: CommonTabBar(
        tabs: _tabs,
        isScrollable: true,
        labelColor: R.color.mainTextColor,
        controller: _tabController,
        unselectedLabelColor: R.color.secondTextColor,
        labelStyle: TextStyle(
            color: R.color.mainTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w500),
        unselectedLabelStyle: TextStyle(
            color: R.color.secondTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w500),
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

import 'package:shared/shared.dart';
import 'package:shared/widget/explain_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vip/k.dart';
import 'package:vip/src/vip_mall/api.dart';
import 'package:vip/src/vip_mall/pb/generated/vip_commodity.pb.dart';

import '../widget/bag_button.dart';
import 'guild_mall_sub_page.dart';
import 'guild_score_detail_screen.dart';

/// 公会商城
///
class GuildMallPage extends StatefulWidget {
  final String title;

  const GuildMallPage(this.title, {super.key});

  static Future show(BuildContext context, String title) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GuildMallPage(title),
        settings: const RouteSettings(name: '/GuildMallPage'),
      ),
    );
  }

  @override
  State<GuildMallPage> createState() => _GuildMallPageState();
}

class _GuildMallPageState extends State<GuildMallPage>
    with TickerProviderStateMixin<GuildMallPage> {
  String? _error;
  bool _isLoading = true;
  List<BrokerShopTabItem> _tabList = [];
  TabController? _tabController;
  GlobalKey? _tabViewGlobalKey;

  int _myScore = 0;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener('Vip.BuyPanel.Payed', _onRefresh);
    _loadData();
  }

  @override
  void dispose() {
    eventCenter.removeListener('Vip.BuyPanel.Payed', _onRefresh);
    super.dispose();
  }

  void _onRefresh(type, data) {
    if (!mounted) return;
    _loadData();
  }

  _loadData() async {
    ResBrokerShopIndex rsp = await Api.getGuildMallTabInfo();
    if (rsp.success) {
      _tabList = rsp.data.tab;
      _myScore = rsp.data.score;
      safeRun(() {
        _tabController = TabController(length: _tabList.length, vsync: this);
      });
    } else {
      _error = rsp.msg;
      Fluttertoast.showToast(msg: rsp.msg);
    }
    _isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }

  _reload() {
    if (mounted) {
      setState(() {
        _isLoading = true;
        _error = null;
      });
    }
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.mainBgColor,
      appBar: _buildAppBar(),
      body: Container(
        color: R.color.secondBgColor,
        child: _renderBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return BaseAppBar.custom(
      title: Text(
        widget.title,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: R.color.mainTextColor),
      ),
      actions: <Widget>[
        const BagButton(from: 'GuildMallPage'),
        ExplainButton(onTap: _onExplainTap),
      ],
    );
  }

  void _onExplainTap() {
    String url = Util.getHelpUrlWithQStr('k138');
    BaseWebviewScreen.show(context, url: url, title: K.explain);
  }

  Widget _renderBody() {
    if (_isLoading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }
    if (_error != null) {
      return ErrorData(error: _error, onTap: _reload);
    }

    if (_tabList.isEmpty) {
      return EmptyWidget(onTap: _reload);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: R.color.mainBgColor,
          width: MediaQuery.of(context).size.width,
          child: _renderTab(),
        ),
        Expanded(
          child: ExtendedTabBarView(
            key: _tabViewGlobalKey,
            controller: _tabController,
            children: _tabList.map((e) => GuildMallSubPage(e.type)).toList(),
          ),
        ),
        _MyScoreWidget(_myScore),
      ],
    );
  }

  Widget _renderTab() {
    double tabHeight = 44;
    List<Widget> tabs = [];

    for (int i = 0; i < _tabList.length; i++) {
      tabs.add(Tab(
        child: Container(
          height: tabHeight,
          alignment: AlignmentDirectional.center,
          child: Text(_tabList[i].name),
        ),
      ));
    }
    return SizedBox(
      height: tabHeight,
      child: CommonTabBar(
        tabs: tabs,
        isScrollable: true,
        controller: _tabController,
        labelStyle: TextStyle(
            color: R.color.mainTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(
            color: R.color.secondTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w600),
        indicator: CommonUnderlineTabIndicator(
          borderSide: BorderSide(width: 3.0, color: R.color.mainBrandColor),
          insets: const EdgeInsetsDirectional.only(bottom: 4),
          wantWidth: 16,
          draggingWidth: 12.0,
        ),
        indicatorWeight: 0,
        marginStart: 8,
        marginEnd: 60,
        labelPadding: const EdgeInsetsDirectional.only(start: 12, end: 12),
      ),
    );
  }
}

class _MyScoreWidget extends StatelessWidget {
  final int score;

  const _MyScoreWidget(this.score, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80 + Util.iphoneXBottom,
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        borderRadius:
            const BorderRadiusDirectional.vertical(top: Radius.circular(16)),
      ),
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 30),
      alignment: AlignmentDirectional.topCenter,
      child: Row(
        children: [
          Text(
            K.vip_my_score,
            style: TextStyle(
                color: R.color.mainTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          Text(
            '$score',
            style: const TextStyle(
                color: Color(0xFFFCA252),
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          InkWell(
            onTap: () => GuildScoreDetailScreen.show(context),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  K.vip_check_score_detail,
                  style:
                      TextStyle(color: R.color.secondTextColor, fontSize: 11),
                ),
                R.img('ic_next.svg',
                    width: 12, package: ComponentManager.MANAGER_VIP),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

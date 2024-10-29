import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/src/anchor_zone/task_page.dart';
import 'package:vip/src/anchor_zone/welfare_model.dart';
import 'package:vip/src/anchor_zone/welfare_page.dart';
import 'package:vip/src/anchor_zone/welfare_repository.dart';
import '../../k.dart';
import 'fan_group_integral_widget.dart';
import 'package:shared/util/color_constant.dart';

/// 主播专区福利
class AnchorZoneWelfareScreen extends StatefulWidget {
  final int groupId;

  const AnchorZoneWelfareScreen(this.groupId, {super.key});

  @override
  _AnchorZoneWelfareScreenState createState() =>
      _AnchorZoneWelfareScreenState();

  static Future<dynamic> launch(BuildContext context, int groupId) {
    return Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AnchorZoneWelfareScreen(groupId)));
  }
}

class _AnchorZoneWelfareScreenState extends State<AnchorZoneWelfareScreen>
    with
        TickerProviderStateMixin<AnchorZoneWelfareScreen>,
        AutomaticKeepAliveClientMixin<AnchorZoneWelfareScreen> {
  TabController? _tabController;
  late ValueNotifier<int> _curTabIndex;
  final List<String> _tabTexts = [K.vip_welfare, K.vip_task];
  WelfareInfo? _welfareInfo;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _curTabIndex = ValueNotifier<int>(0);
    safeRun(
      () => _tabController = ExtendedTabController(
          initialIndex: 0, length: _tabTexts.length, vsync: this)
        ..addListener(() => _curTabIndex.value = _tabController!.index),
    );
    _loadFromNetwork();
  }

  void _loadFromNetwork() async {
    WelfareInfo? info =
        await WelfareRepository.loadWelfareFromNetwork(widget.groupId);
    if (!mounted) return;
    setState(() {
      _welfareInfo = info;
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        backgroundColor: const Color(0XFF7B66FF),
        appBar: _appBar(),
        body: _welfareInfo == null ? const Loading(label: '') : _body());
  }

  /// 标题栏
  PreferredSizeWidget _appBar() {
    return BaseAppBar.custom(
        statusBrightness: Brightness.dark,
        backgroundColor: const Color(0XFF7B66FF),
        leading: BackButton(
            color: Colors.white, onPressed: () => Navigator.pop(context)),
        title: Text(
          _welfareInfo?.info?.groupName ?? '',
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),

        /// elevation: 0,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.more_horiz, color: Colors.white),
              onPressed: _showBottomSheet)
        ]);
  }

  void _showBottomSheet() async {
    List<SheetItem> sheets = [];
    sheets.add(SheetItem(K.vip_welfare_statement, 'welfare_statement'));
    if (_welfareInfo?.info?.isAnchor ?? true) {
    } else {
      sheets.add(SheetItem(K.vip_quit_group, 'quit_group'));
    }
    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(title: K.vip_select_action, data: sheets);
        });
    String? key = result?.value?.key;
    if (key?.isNotEmpty == true) {
      switch (key) {
        case 'welfare_statement':
          _welfareStatement();
          break;
        case 'quit_group':
          _showQuitGroupAlertDialog();
          break;
        default:
          break;
      }
    }
  }

  void _welfareStatement() {
    String? url = _welfareInfo?.info?.descUrl;
    if (url?.isEmpty ?? true) return;
    BaseWebviewScreen.show(context, url: url!);
  }

  void _showQuitGroupAlertDialog() async {
    bool? result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmDialog(content: K.vip_confirm_quit_fans_group);
      },
    );
    if ((result ?? false) == true) {
      _quitGroup();
    }
  }

  void _quitGroup() async {
    if (_welfareInfo?.info?.isAnchor ?? true) return;
    DataRsp rsp = await WelfareRepository.quitGroup(widget.groupId);
    if (rsp.success == true) {
      Navigator.of(context).pop();
      eventCenter.emit(
          EventConstant.EventJoinFansGroupChanged, 'quit_fans_group');
      return;
    }
    if (rsp.msg?.isNotEmpty ?? false) {
      Fluttertoast.showToast(msg: rsp.msg);
    }
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FanGroupIntegralWidget(_welfareInfo?.info),
        _tabs(),
        Expanded(
          child: _pages(),
        ),
      ],
    );
  }

  /// 构建每一个tab
  Widget _tabs() {
    List<Tab> tabs = [];
    for (var e in _tabTexts) {
      tabs.add(Tab(icon: null, child: Text(e)));
    }

    return CommonTabBar(
        controller: _tabController,
        tabs: tabs,
        isScrollable: true,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white.withOpacity(0.6),
        labelStyle: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 16,
            fontWeight: FontWeight.w600),
        indicator: const CommonUnderlineTabIndicator(
            borderSide: BorderSide(width: 3.0, color: Colors.white),
            insets: EdgeInsetsDirectional.only(bottom: 4),
            wantWidth: 16,
            draggingWidth: 12.0),
        indicatorWeight: 0,
        marginStart: 8,
        marginEnd: 60,
        labelPadding: const EdgeInsetsDirectional.only(start: 12, end: 12));
  }

  /// 构建每一个tab对应的页面
  Widget _pages() {
    List<Widget> pages = [];
    pages.add(WelfarePage(
        _welfareInfo?.info?.statement ?? '', _welfareInfo?.welfares));
    pages.add(TaskPage(_welfareInfo?.tasks));
    return Container(
        margin: const EdgeInsetsDirectional.only(
            start: 20, end: 20, top: 8, bottom: 34),
        decoration: BoxDecoration(
          color: const Color(0XFF6327DD),
          border: Border.all(
              width: 2.0,
              color: ColorConstant.welfareContributeTextColor.withOpacity(0.2)),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: TabBarView(
            physics: const ClampingScrollPhysics(),
            controller: _tabController,
            children: pages,
          ),
        ));
  }
}

import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/src/horn/global_horn_square_panel.dart';
import 'package:flutter/material.dart';

import '../protobuf/generated/horn.pb.dart';
import 'api/api.dart';
import 'global_horn_tab.dart';
import 'horn_publish_list_tab.dart';
import '../../k.dart';

/// 全服喇叭面板
class GlobalHornPanel extends StatefulWidget {
  final int hornId;

  const GlobalHornPanel({super.key, this.hornId = 0});

  @override
  State<GlobalHornPanel> createState() => _GlobalHornPanelState();

  static Future show(BuildContext context, {int hornId = 0}) async {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 1,
      defineBarrierColor: Colors.black45,
      disableTapDismissible: true,
      builder: (BuildContext context) {
        return GlobalHornPanel(hornId: hornId);
      },
    );
  }
}

class _GlobalHornPanelState extends State<GlobalHornPanel>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  final _tabs = [K.horn_tab1, K.horn_tab2];

  final TextStyle _tabStyle =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);

  late final TabController _tabController;

  bool _loading = true;
  String _err = '';

  List<HornConfig> _configList = [];
  String _ruleUrl = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(_onTabChanged);
    eventCenter.addListener(EventConstant.EventGlobalHorn, _onEvent);
    WidgetsBinding.instance.addObserver(this);
    Tracker.instance.track(TrackEvent.global_horn_exposure,
        properties: {'uid': Session.uid});
    _loadConfig();
  }

  _loadConfig() async {
    final res = await Api.getConfig();
    _loading = false;
    if (res.success) {
      _configList = res.data;
      _ruleUrl = res.ruleUrl;
    } else {
      _err = res.msg;
    }
    refresh();
  }

  void _reload() {
    _loading = true;
    _err = '';
    refresh();
    _loadConfig();
  }

  void _onEvent(String type, dynamic data) {
    if (type == EventConstant.EventGlobalHorn) {
      // 提交喊话时触发，此时需要切换到我发布的tab
      _tabController.index = 1;
    }
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging && _tabController.index == 0) {
      // 每次切换到全服喇叭tab时，更新数据
      _loadConfig();
    }
  }

  @override
  void dispose() {
    eventCenter.removeListener(EventConstant.EventGlobalHorn, _onEvent);
    WidgetsBinding.instance.removeObserver(this);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double keyboardH = MediaQuery.of(context).viewInsets.bottom;
    double bottomPadding = 48 + (Util.isIphoneX ? 40 : 20);
    int len = _configList.length;
    if (keyboardH > bottomPadding) {
      if (len < 3) {
        keyboardH = len == 1 ? 54 : 158;
      } else {
        keyboardH -= bottomPadding;
      }
    }
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Container(
        width: Util.width,
        height: 551,
        margin: EdgeInsetsDirectional.only(bottom: keyboardH),
        child: Stack(
          children: [
            PositionedDirectional(
              top: 10,
              child: Container(
                width: Util.width,
                height: 32,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color(0xFF2D3764),
                    Color(0xFF8B98C7),
                    Color(0xFF2D3764)
                  ]),
                  borderRadius: BorderRadiusDirectional.circular(16),
                ),
              ),
            ),
            PositionedDirectional(
              top: 11,
              child: Container(
                width: Util.width,
                height: 538,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1F2139), Color(0xFF121320)],
                    begin: AlignmentDirectional.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                  ),
                  borderRadius: BorderRadiusDirectional.horizontal(
                      start: Radius.circular(16), end: Radius.circular(16)),
                ),
              ),
            ),
            PositionedDirectional(
              top: 0,
              start: 0,
              end: 0,
              child: R.img(RoomAssets.chat_room$ic_global_horn_high_light_webp,
                  width: 195, height: 20),
            ),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (_loading) {
      return const Loading();
    } else if (_err.isNotEmpty) {
      return ErrorData(error: _err, onTap: _reload, fontColor: Colors.white);
    } else if (_configList.isEmpty) {
      return const EmptyWidget(textColor: Colors.white);
    }
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 14),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                if (_ruleUrl.isNotEmpty) {
                  BaseWebviewScreen.show(context, url: _ruleUrl);
                }
              },
              child: R.img(
                BaseAssets.shared$titlebar_ic_titlebar_question_svg,
                color: Colors.white,
                width: 24,
                height: 24,
                package: ComponentManager.MANAGER_BASE_CORE,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              flex: 1,
              child: _buildTabBar(),
            ),
            GestureDetector(
              onTap: () async {
                var result = await GlobalHornSquarePanel.show(context);
                if (result == true && _tabController.index == 1) {
                  _tabController.index = 0;
                }
              },
              child: Container(
                width: 48,
                height: 28,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(16),
                    color: Colors.white.withOpacity(0.2)),
                alignment: AlignmentDirectional.center,
                child: Text(K.room_square,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w600)),
              ),
            ),
            const SizedBox(width: 20),
          ]),
          Expanded(child: _buildTabBarView()),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 44,
      alignment: AlignmentDirectional.center,
      child: CommonTabBar(
        tabs: _tabs.map((e) => Tab(child: Text(e))).toList(),
        isScrollable: true,
        controller: _tabController,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white60,
        labelStyle: _tabStyle,
        unselectedLabelStyle: _tabStyle,
        indicator: const CommonUnderlineTabIndicator(
          borderSide: BorderSide(width: 3, color: Color(0xFF6CFFFF)),
          insets: EdgeInsetsDirectional.only(bottom: 4),
          wantWidth: 25,
          draggingWidth: 15,
        ),
        indicatorWeight: 0,
        labelPadding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      ),
    );
  }

  Widget _buildTabBarView() {
    return Padding(
      padding:
          EdgeInsetsDirectional.only(top: 16, bottom: Util.isIphoneX ? 40 : 20),
      child: TabBarView(
        controller: _tabController,
        children: [
          GlobalHornTab(configList: _configList, hornId: widget.hornId),
          HornPublishListTab(waitSendNum: _configList[0].waitSendNum),
        ],
      ),
    );
  }
}

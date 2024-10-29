import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/assets.dart';
import 'package:vip/k.dart';
import 'package:vip/src/mount/model/mount_buy_panel_data.dart';
import 'package:vip/src/mount/model/mount_repos.dart';
import 'package:vip/src/mount/page/mount_piece_bag_page.dart';
import 'package:vip/src/mount/page/mount_piece_exchange_sheet.dart';
import 'package:vip/src/mount/pb/generated/mount.pb.dart';
import 'package:vip/src/vip_mall/widget/buy_panel.dart';

class MyMountPage extends StatefulWidget {
  final int uid;
  final int serialId;
  final String refer;

  const MyMountPage(
      {super.key, required this.uid, this.serialId = 0, required this.refer});

  static Future show(BuildContext context, int uid,
      {int serialId = 0, String refer = '详情页'}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            MyMountPage(uid: uid, serialId: serialId, refer: refer),
        settings: const RouteSettings(name: '/MyMountPage'),
      ),
    );
  }

  @override
  State<MyMountPage> createState() => _MyMountPageState();
}

class _MyMountPageState extends State<MyMountPage>
    with SingleTickerProviderStateMixin<MyMountPage> {
  ExtendedTabController? _tabController;
  List<MountDebrisBagTab> _tabs = [];
  final List<Widget> _tabsWidget = [];
  final List<Widget> _pages = [];
  final List<GlobalKey<_TabPageState>> _pageKeys = [GlobalKey<_TabPageState>()];

  MountMainPageItem? _selectMount;
  MountMainPageItem? _wearMount;
  final Map<int, MountMainPage> _pageDataMap = {};
  int _topSerialId = 0;
  final String _helpUrl = Util.parseHelpUrl(179);

  @override
  void initState() {
    super.initState();
    _topSerialId = widget.serialId;
    Tracker.instance.track(TrackEvent.enter_my_mounts, properties: {
      'refer': widget.refer,
    });
  }

  @override
  void dispose() {
    _tabController?.removeListener(_onTabChanged);
    _tabController?.dispose();
    super.dispose();
  }

  _onTabChanged() {
    if (_tabController!.indexIsChanging) return;
    int index = _tabController!.index;
    MountMainPage? page = _pageDataMap[_tabs[index].serialId];
    if (page != null) {
      _selectMount = page.items[0];
      if (index < _pageKeys.length) {
        _pageKeys[index].currentState?.reset();
      }
      refresh();
    }
  }

  void _reload() {
    int index = _tabController?.index ?? 0;
    if (index < _pageKeys.length) {
      _pageKeys[index].currentState?._reload();
    }
  }

  void _onDataLoad(MountMain data, int index) {
    if (_tabs.isEmpty) {
      _tabs = data.tabList;
      if (_tabsWidget.isEmpty && _tabs.length > 1) {
        _pageKeys.clear();
        int initIndex = 0;
        for (int i = 0; i < _tabs.length; i++) {
          _tabsWidget.add(Tab(child: Text(_tabs[i].name)));
          GlobalKey<_TabPageState> key = GlobalKey<_TabPageState>();
          _pageKeys.add(key);
          _pages.add(_TabPage(
              key: key,
              uid: widget.uid,
              index: i,
              state: this,
              serialId: _tabs[i].serialId));
          if (_tabs[i].serialId == widget.serialId) {
            initIndex = i;
          }
        }
        _tabController = ExtendedTabController(
            initialIndex: initIndex, length: _tabs.length, vsync: this)
          ..addListener(_onTabChanged);
      }
    }
    if (index == (_tabController?.index ?? 0)) {
      _topSerialId = _tabs[index].serialId;
      bool needResetSelect = true;
      for (var element in data.detail.items) {
        if (element.inUse) {
          _wearMount = element;
        }
        if (element.cid == _selectMount?.cid) {
          _selectMount = element;
          needResetSelect = false;
        }
      }
      if (needResetSelect) {
        _selectMount = data.detail.items[0];
      }
    }
    _pageDataMap[_tabs.isEmpty ? _topSerialId : _tabs[index].serialId] =
        data.detail;
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              colors: [Color(0xFF4C0860), Color(0xFF080A31), Color(0xFF080A31)],
            ),
          ),
        ),
        if (_pageDataMap.isNotEmpty)
          R.img(Assets.vip$mount_top_light_png,
              width: Util.width, fit: BoxFit.fitWidth),
        if (_pageDataMap.isNotEmpty)
          PositionedDirectional(
            top: 100.dp + Util.statusHeight + kToolbarHeight,
            child: R.img(Assets.vip$mount_top_mount_base_png,
                height: 150.5.dp,
                fit: BoxFit.contain,
                package: ComponentManager.MANAGER_PERSONALDATA),
          ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: BaseAppBar.custom(
            backgroundColor: Colors.transparent,
            statusBrightness: Brightness.dark,
            backColor: Colors.white,
            title: Text(
                widget.uid == Session.uid ? K.vip_my_mount : K.vip_ta_mount,
                style: const TextStyle(color: Colors.white)),
            actions: [
              InkWell(
                child: Container(
                  padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
                  margin: const EdgeInsetsDirectional.only(end: 8),
                  alignment: Alignment.center,
                  child: R.img(
                    BaseAssets.titlebar_ic_titlebar_question_svg,
                    color: Colors.white,
                    width: 24,
                    height: 24,
                    package: ComponentManager.MANAGER_BASE_CORE,
                  ),
                ),
                onTap: () {
                  BaseWebviewScreen.show(context,
                      url: _helpUrl, title: K.vip_mount_series_desc);
                },
              ),
            ],
          ),
          body: _buildBody(),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        if (_pageDataMap.isNotEmpty) _buildTop(_pageDataMap[_topSerialId]!),
        _buildTab(),
        Expanded(
          child: _tabsWidget.isNotEmpty
              ? TabBarView(
                  controller: _tabController,
                  children: _pages,
                )
              : _TabPage(
                  key: _pageKeys[0],
                  uid: widget.uid,
                  index: 0,
                  state: this,
                  serialId: _topSerialId),
        ),
      ],
    );
  }

  Widget _buildTab() {
    return _tabsWidget.isNotEmpty
        ? Container(
            width: Util.width,
            height: 50,
            padding: const EdgeInsetsDirectional.only(top: 8, bottom: 8),
            child: CommonTabBar(
              tabs: _tabsWidget,
              isScrollable: true,
              labelColor: const Color(0xFFD4FA00),
              controller: _tabController,
              unselectedLabelColor: Colors.white.withOpacity(0.5),
              labelStyle: R.textStyle.regular16,
              unselectedLabelStyle: R.textStyle.regular14,
              indicator: const CommonUnderlineTabIndicator(
                borderSide: BorderSide(width: 4, color: Color(0xFFD4FA00)),
                insets: EdgeInsetsDirectional.only(bottom: 0),
                wantWidth: 16,
                draggingWidth: 12,
              ),
              indicatorWeight: 0,
              marginStart: 8,
              marginEnd: 0,
              labelPadding: const EdgeInsetsDirectional.only(start: 6, end: 6),
            ),
          )
        : const SizedBox(height: 20);
  }

  Widget _buildTop(MountMainPage mountMain) {
    String openText = mountMain.inDuration
        ? K.vip_renew_mount_series
        : K.vip_open_mount_series;
    MountBuyPanelData mountData = MountBuyPanelData(
      serialId: mountMain.serialId,
      serialName: mountMain.title,
      buyBntText: openText,
      hasMount: _selectMount!.myUnlock,
      pieceNum: _selectMount!.myDebrisNum,
      piecePrice: _selectMount!.debrisItem.exchangeNum,
      helpUrl: _helpUrl,
    );
    return SizedBox(
      width: Util.width,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Column(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => _onTapOpen(autoPlay: true, mountData: mountData),
                child: CachedNetworkImage(
                    imageUrl: _selectMount!.debrisItem.img,
                    width: 200,
                    height: 200),
              ),
              const SizedBox(height: 21),
            ],
          ),
          PositionedDirectional(
            top: 80,
            child: IgnorePointer(
                child: R.img(Assets.vip$mount_top_mount_shadow_png,
                    width: 202, height: 133)),
          ),
          PositionedDirectional(
            top: 77,
            child: IgnorePointer(
                child:
                    R.img(Assets.vip$mount_ic_play_png, width: 46, height: 46)),
          ),
          if (_selectMount!.debrisItem.exchangeNum > 0)
            PositionedDirectional(
              top: 6,
              start: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadiusDirectional.circular(14),
                ),
                child: Row(
                  children: [
                    R.img(Assets.vip$mount_ic_piece_png, width: 24, height: 24),
                    const SizedBox(width: 4),
                    NumText(
                      _selectMount!.unlock
                          ? 'X${_selectMount!.debrisItem.ownNum}'
                          : '${_selectMount!.debrisItem.ownNum}/${_selectMount!.debrisItem.exchangeNum}',
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          PositionedDirectional(
            top: 8,
            end: 0,
            child: GestureDetector(
              onTap: _onTapExchange,
              child: Container(
                padding: const EdgeInsetsDirectional.only(
                    start: 10, end: 8, top: 4, bottom: 4),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(12),
                      bottomStart: Radius.circular(12)),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFB146D1),
                      Color(0xFF7D2EE6),
                      Color(0xFF5E10C7)
                    ],
                  ),
                ),
                child: Text(
                  K.vip_piece_exchange,
                  style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFFD4FA00),
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          PositionedDirectional(
            bottom: 0,
            child: Container(
              padding: const EdgeInsetsDirectional.only(
                  start: 16, end: 16, top: 3, bottom: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(14),
                color: Colors.black.withOpacity(0.3),
              ),
              child: Text(mountMain.endTime,
                  style: const TextStyle(fontSize: 12, color: Colors.white)),
            ),
          ),
          if (!mountMain.inDuration || widget.uid != Session.uid)
            PositionedDirectional(
              bottom: 0,
              end: 12,
              child: _buildWearOrOpenBtn(
                  openText, () => _onTapOpen(mountData: mountData)),
            ),
          if (widget.uid == Session.uid &&
              mountMain.inDuration &&
              _selectMount!.unlock)
            PositionedDirectional(
              bottom: 0,
              end: 12,
              child: _selectMount == _wearMount
                  ? _buildRemoveMountBtn()
                  : _buildWearOrOpenBtn(K.vip_wear_mount, _onTapWearMount),
            ),
        ],
      ),
    );
  }

  Future<void> _onTapExchange() async {
    MountPieceBagPage.show(context, serialId: _topSerialId);
  }

  Future<void> _onTapOpen(
      {bool autoPlay = false, required MountBuyPanelData mountData}) async {
    bool? ret = await BuyPanel.show(context,
        cid: _selectMount!.cid,
        type: '',
        autoPlay: autoPlay,
        mountData: mountData);
    if (ret == true) {
      _reload();
    }
  }

  Future<void> _onTapWearMount() async {
    var res = await MountRepos.wearMount(_selectMount!.cid, true);
    if (res.success) {
      _wearMount?.inUse = false;
      _selectMount?.inUse = true;
      _wearMount = _selectMount;
      refresh();
    } else {
      Fluttertoast.showCenter(msg: res.msg);
    }
  }

  Future<void> _onTapRemoveMount() async {
    var res = await MountRepos.wearMount(_selectMount!.cid, false);
    if (res.success) {
      _wearMount?.inUse = false;
      _wearMount = null;
      refresh();
    } else {
      Fluttertoast.showCenter(msg: res.msg);
    }
  }

  Widget _buildWearOrOpenBtn(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            start: 8, end: 8, top: 4, bottom: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(12),
          gradient: const LinearGradient(
            colors: [Color(0xFFB146D1), Color(0xFF7D2EE6), Color(0xFF5E10C7)],
          ),
        ),
        child: Text(text,
            style: const TextStyle(
                fontSize: 11,
                color: Color(0xFFD4FA00),
                fontWeight: FontWeight.w600)),
      ),
    );
  }

  Widget _buildRemoveMountBtn() {
    return GestureDetector(
      onTap: _onTapRemoveMount,
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            start: 8, end: 8, top: 4, bottom: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(12),
          color: const Color(0xFF221B5B),
        ),
        child: Text(K.vip_remove_mount,
            style: TextStyle(
                fontSize: 11,
                color: Colors.white.withOpacity(0.5),
                fontWeight: FontWeight.w600)),
      ),
    );
  }
}

class _TabPage extends StatefulWidget {
  final int uid;
  final int index;
  final _MyMountPageState state;
  final int serialId;

  const _TabPage(
      {super.key,
      required this.uid,
      required this.index,
      required this.state,
      required this.serialId});

  @override
  State<StatefulWidget> createState() => _TabPageState();
}

class _TabPageState extends State<_TabPage>
    with AutomaticKeepAliveClientMixin<_TabPage> {
  bool _loading = true;
  String? _err;
  MountMainPage? _mountMain;
  final ScrollController _controller = ScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _loadData();
    eventCenter.addListener(mountPieceCountChanged, _onPieceExchange);
  }

  @override
  void dispose() {
    eventCenter.removeListener(mountPieceCountChanged, _onPieceExchange);
    super.dispose();
  }

  _onPieceExchange(String type, Object? data) {
    if (data == widget.serialId) {
      _reload();
    }
  }

  Future<void> _loadData() async {
    ResMountMainPage res =
        await MountRepos.myMount(widget.uid, widget.serialId);
    _loading = false;
    if (res.success) {
      _err = null;
      _mountMain = res.data.detail;
      widget.state._onDataLoad(res.data, widget.index);
    } else {
      _err = res.msg;
    }
    refresh();
  }

  void _reload() {
    _loading = true;
    _err = null;
    refresh();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_loading) {
      return const Loading();
    } else if (_err != null) {
      return ErrorData(
        error: _err,
        fontColor: Colors.white,
        onTap: () {
          _reload();
        },
      );
    }
    _MyMountPageState state = widget.state;
    return RefreshIndicatorFactory.of(
      child: _buildMountsGrid(state, _mountMain!),
      onRefresh: _loadData,
    );
  }

  Widget _buildMountsGrid(_MyMountPageState state, MountMainPage mountMain) {
    double cellW = (Util.width - 12 * 4) / 3;
    return GridView.builder(
      controller: _controller,
      shrinkWrap: true,
      padding: EdgeInsetsDirectional.only(
          start: 12, end: 12, bottom: 12 + Util.iphoneXBottom),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 109 / 154,
      ),
      itemBuilder: (context, index) {
        MountMainPageItem item = mountMain.items[index];
        return GestureDetector(
          onTap: () {
            state._selectMount = item;
            state.refresh();
            refresh();
          },
          child: _buildMountItem(state, cellW, item),
        );
      },
      itemCount: mountMain.items.length,
    );
  }

  Widget _buildMountItem(
      _MyMountPageState state, double cellW, MountMainPageItem item) {
    double imgSize = cellW - 24;
    bool has = item.unlock;
    String name = item.debrisItem.name;
    String icon = item.debrisItem.img;
    bool select = state._selectMount == item;
    bool wear = state._wearMount == item;

    Widget img =
        CachedNetworkImage(imageUrl: icon, width: imgSize, height: imgSize);
    Widget card = Container(
      width: cellW,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(8),
        color:
            select ? const Color(0x269B3CDA) : Colors.white.withOpacity(0.08),
      ),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              has ? img : Opacity(opacity: 0.5, child: img),
              if (!has)
                R.img(Assets.vip$mount_ic_lock_png, width: 20, height: 46),
            ],
          ),
          const Spacer(),
          Text(name,
              maxLines: 1,
              style: R.textStyle.regular14
                  .copyWith(color: Colors.white.withOpacity(has ? 1 : 0.5))),
          const SizedBox(height: 2),
          Text(has ? K.vip_owned : K.vip_not_own,
              style: R.textStyle.regular12
                  .copyWith(color: Colors.white.withOpacity(0.5))),
        ],
      ),
    );
    return Stack(
      children: [
        select
            ? GradientBorder(
                borderGradient: const LinearGradient(
                  colors: [Color(0xFFA942D4), Color(0xFF6516CD)],
                ),
                borderRadius: 8,
                child: card,
              )
            : card,
        if (wear)
          PositionedDirectional(
            end: 0,
            child: Container(
              padding: const EdgeInsetsDirectional.only(
                  start: 6, end: 6, top: 4, bottom: 4),
              decoration: const BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(8),
                    bottomStart: Radius.circular(8)),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFB146D1),
                    Color(0xFF7D2EE6),
                    Color(0xFF5E10C7)
                  ],
                ),
              ),
              child: Text(K.vip_wearing,
                  style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFFD4FA00),
                      fontWeight: FontWeight.w600)),
            ),
          ),
      ],
    );
  }

  void reset() {
    _controller.jumpTo(0);
    refresh();
  }
}

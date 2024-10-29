import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/assets.dart';
import 'package:vip/src/mount/model/mount_repos.dart';
import 'package:vip/src/mount/pb/generated/mount.pb.dart';

class MountRankPage extends StatefulWidget {
  const MountRankPage({super.key});

  @override
  State<MountRankPage> createState() => _MountRankPageState();
}

class _MountRankPageState extends State<MountRankPage>
    with TickerProviderStateMixin {
  bool _loading = true;
  String? _err;
  ExtendedTabController? _tabController;
  PageController? _pageController;
  List<MountDebrisBagTab> _tabList = [];

  @override
  void initState() {
    super.initState();
    Tracker.instance.track(TrackEvent.enter_mount_rank, properties: {
      'uid': Session.uid,
    });
    _pageController = PageController(initialPage: 0, keepPage: true);
    _loadData();
  }

  @override
  void dispose() {
    _tabController?.removeListener(_onTabChanged);
    _pageController?.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    if (_tabController!.indexIsChanging) return;
    _pageController?.jumpToPage(_tabController!.index);
    refresh();
  }

  Future<void> _loadData() async {
    var res = await MountRepos.getRankTab();
    _loading = false;
    if (res.success) {
      _err = null;
      _tabList = res.data;
      if (_tabList.length > 1) {
        _tabController =
            ExtendedTabController(length: _tabList.length, vsync: this);
        _tabController?.addListener(_onTabChanged);
      }
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
    if (_loading) {
      return const Loading();
    } else if (_err != null) {
      return ErrorData(error: _err, onTap: _reload);
    } else if (_tabList.isEmpty) {
      return EmptyWidget(onTap: _reload);
    }
    return Column(
      children: [
        if (_tabController != null) _buildTabBar(),
        Expanded(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: _tabList.map((e) => _TabPage(e.serialId)).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    List<Widget> tabs = [];
    for (int i = 0; i < _tabList.length; i++) {
      bool selected = i == _tabController!.index;
      Widget child = Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        margin: const EdgeInsetsDirectional.only(end: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(14),
          color: selected ? Colors.white : Colors.white.withOpacity(0.3),
        ),
        child: Text(
          _tabList[i].name,
          style: R.textStyle.medium12.copyWith(
              color: selected
                  ? const Color(0xFFD472FD)
                  : Colors.white.withOpacity(0.3)),
        ),
      );
      tabs.add(child);
    }

    return Container(
      width: Util.width,
      padding: const EdgeInsetsDirectional.only(bottom: 8),
      decoration: const BoxDecoration(color: Color(0XFFD670FF)),
      child: CommonTabBar(
        showSplash: false,
        labelPadding: const EdgeInsetsDirectional.all(0),
        controller: _tabController,
        isScrollable: true,
        tabs: tabs,
        marginStart: 8,
        indicator: const BoxDecoration(),
      ),
    );
  }
}

class _TabPage extends StatefulWidget {
  final int serialId;

  const _TabPage(this.serialId);

  @override
  State<_TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<_TabPage>
    with AutomaticKeepAliveClientMixin<_TabPage> {
  bool _loading = true;
  String? _err;
  MountSerialRank? _rankData;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    var res = await MountRepos.getRankList(widget.serialId);
    _loading = false;
    if (res.success) {
      _err = null;
      _rankData = res.data;
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
        onTap: () {
          _reload();
        },
      );
    }
    return Column(
      children: [
        const SizedBox(height: 12),
        _buildHeader(),
        const SizedBox(height: 2),
        Expanded(child: _buildList()),
        Container(
          padding: EdgeInsetsDirectional.only(
              bottom: Util.isIphoneX ? Util.iphoneXBottom : 14),
          decoration: BoxDecoration(
            borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(12), topEnd: Radius.circular(12)),
            border: Border.all(width: 0.5, color: const Color(0x33979797)),
            // color: R.color.mainBgColor,
          ),
          child: _buildItem(_rankData!.me),
        ),
      ],
    );
  }

  Widget _buildNumHeader(String text) {
    return Container(
      width: 62,
      padding: const EdgeInsetsDirectional.only(start: 2, end: 2),
      alignment: AlignmentDirectional.center,
      child: Text(text,
          style: TextStyle(
              fontSize: 13, color: R.color.mainTextColor.withOpacity(0.3))),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 64,
          alignment: AlignmentDirectional.center,
          child: Text('排名',
              style: TextStyle(
                  fontSize: 13, color: R.color.mainTextColor.withOpacity(0.3))),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 11),
            child: Text('姓名',
                style: TextStyle(
                    fontSize: 13,
                    color: R.color.mainTextColor.withOpacity(0.3))),
          ),
        ),
        _buildNumHeader('座驾数'),
        _buildNumHeader(_rankData!.advancedDebrisName),
        _buildNumHeader('其他碎片'),
        const SizedBox(width: 5),
      ],
    );
  }

  Widget _buildList() {
    if (_rankData!.list.isEmpty) {
      return EmptyWidget(onTap: _reload, desc: '暂无人进入该榜单～');
    }
    return RefreshIndicatorFactory.of(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return _buildItem(_rankData!.list[index]);
        },
        itemCount: _rankData!.list.length,
      ),
      onRefresh: _loadData,
    );
  }

  Widget _buildRank(int rank) {
    if (rank == 1) {
      return R.img(Assets.vip$mount_rank_1_webp, width: 40, height: 40);
    } else if (rank == 2) {
      return R.img(Assets.vip$mount_rank_2_webp, width: 40, height: 40);
    } else if (rank == 3) {
      return R.img(Assets.vip$mount_rank_3_webp, width: 40, height: 40);
    } else if (rank < 1 || rank > 100) {
      return NumText('-',
          style: TextStyle(
              fontSize: 14,
              color: R.color.mainTextColor.withOpacity(0.2),
              fontWeight: FontWeight.bold));
    } else {
      return NumText('$rank',
          style: TextStyle(
              fontSize: 14,
              color: R.color.mainTextColor.withOpacity(0.2),
              fontWeight: FontWeight.bold));
    }
  }

  Widget _buildNum(int num) {
    return Container(
      width: 62,
      padding: const EdgeInsetsDirectional.only(start: 2, end: 2),
      alignment: AlignmentDirectional.center,
      child: NumText(
        '$num',
        style: R.textStyle.regular14.copyWith(fontWeight: FontWeight.bold),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildItem(MountSerialRankItem item) {
    return Row(
      children: [
        Container(
            width: 64,
            alignment: AlignmentDirectional.center,
            child: _buildRank(item.rank)),
        const SizedBox(width: 4),
        Expanded(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CommonAvatar(
                    path: item.icon,
                    size: 46,
                    shape: BoxShape.circle,
                    onTap: () => _onTapUser(item.uid)),
              ),
              const SizedBox(width: 8),
              Expanded(
                  child: Text(item.name,
                      style: R.textStyle.regular14,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis)),
            ],
          ),
        ),
        _buildNum(item.mountNum),
        _buildNum(item.debrisNum),
        _buildNum(item.otherNum),
        const SizedBox(width: 5),
      ],
    );
  }

  void _onTapUser(int uid) {
    IPersonalDataManager personalDataManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    personalDataManager.openImageScreen(context, uid);
  }
}

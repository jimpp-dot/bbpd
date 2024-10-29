import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:rank/k.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:rank/src/api/api.dart';
import 'package:rank/src/model/entity/super_admin_patrol_tab_data.dart';
import 'package:rank/src/model/super_admin_patrol_repository.dart';
import 'package:rank/src/widget/room_item_widget.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;

/// 超管巡房列表
class SuperAdminPatrolPage extends StatefulWidget {
  const SuperAdminPatrolPage({super.key});

  @override
  _SuperAdminPatrolPageState createState() => _SuperAdminPatrolPageState();

  static void show(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SuperAdminPatrolPage(),
      settings: const RouteSettings(name: '/SuperAdminPatrolPage'),
    ));
  }
}

class _SuperAdminPatrolPageState extends State<SuperAdminPatrolPage>
    with SingleTickerProviderStateMixin {
  ExtendedTabController? _tabController;
  List<SuperAdminPatrolFirstTab> _tabInfos = [];
  SuperAdminPatrolTabResponse? _rsp;

  @override
  void initState() {
    super.initState();

    _loadTab();
  }

  @override
  void dispose() {
    _tabController?.dispose();

    super.dispose();
  }

  void _loadTab() async {
    _rsp = await Api.getSuperAdminPatrolTab();

    if (_rsp!.success == true) {
      _tabInfos = _rsp!.data?.list ?? [];
      safeRun(
        () => _tabController =
            ExtendedTabController(length: _tabInfos.length, vsync: this),
      );
    } else if (_rsp!.msg != null) {
      Fluttertoast.showCenter(msg: _rsp!.msg);
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        title: Text(
          K.rank_superadmin_patrol_title,
          style: R.textStyle.title,
        ),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 4.0),
            child: IconButton(
                icon: IconTheme(
                    data: Theme.of(context).iconTheme,
                    child: const Icon(Icons.add)),
                onPressed: () {
                  _onAddClick();
                }),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildFirstTab() {
    return Container(
      height: 36.0,
      padding: const EdgeInsetsDirectional.only(start: 10.0),
      margin: const EdgeInsets.only(bottom: 2.0, top: 2.0),
      child: CommonTabBar(
        tabs: _tabInfos.map((e) => Text(e.name)).toList(),
        isScrollable: true,
        labelColor: R.color.mainTextColor,
        controller: _tabController,
        unselectedLabelColor: R.color.secondTextColor,
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
            insets: const EdgeInsetsDirectional.only(bottom: 0),
            wantWidth: 16,
            draggingWidth: 12.0),
        indicatorWeight: 0,
        marginStart: 8,
        marginEnd: 60,
        labelPadding: const EdgeInsetsDirectional.only(start: 12, end: 12),
      ),
    );
  }

  Widget _buildBody() {
    if (_rsp == null) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }

    if (_rsp != null &&
        (_rsp!.success == false ||
            _rsp!.data == null ||
            _rsp!.data?.list is! List ||
            _rsp!.data!.list.isEmpty)) {
      return EmptyWidget(
        desc: _rsp!.msg ?? BaseK.K.no_data,
        onTap: _loadTab,
      );
    }

    return Container(
      padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFirstTab(),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: ExtendedTabBarView(
              controller: _tabController,
              children: _tabInfos
                  .map(
                      (e) => PatrolSubPage(parentTabId: e.id, tabs: e.children))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  _onAddClick() async {
    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.openInitOperateDisplay(context);
  }
}

class PatrolSubPage extends StatefulWidget {
  final int? parentTabId;
  final List<SuperAdminPatrolSubTab>? tabs;

  const PatrolSubPage({super.key, this.parentTabId, this.tabs});

  @override
  _PatrolSubPageState createState() => _PatrolSubPageState();
}

class _PatrolSubPageState extends State<PatrolSubPage>
    with SingleTickerProviderStateMixin {
  ExtendedTabController? _tabController;

  @override
  void initState() {
    super.initState();
    if (widget.tabs != null && widget.tabs!.isNotEmpty) {
      safeRun(
        () => _tabController =
            ExtendedTabController(length: widget.tabs!.length, vsync: this),
      );
    }
  }

  @override
  void dispose() {
    _tabController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 没二级tab
    if (widget.tabs == null || widget.tabs!.isEmpty) {
      return PatrolRoomList(
        firstTabId: widget.parentTabId ?? 0,
        subTabId: 0,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSubTab(),
        const SizedBox(
          height: 8,
        ),
        Expanded(
          child: ExtendedTabBarView(
            controller: _tabController,
            children: widget.tabs!
                .map((e) => PatrolRoomList(
                      firstTabId: widget.parentTabId ?? 0,
                      subTabId: e.id,
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildSubTab() {
    return Container(
      height: 36.0,
      padding: const EdgeInsetsDirectional.only(start: 10.0),
      margin: const EdgeInsets.only(bottom: 2.0, top: 2.0),
      child: CommonTabBar(
        tabs: widget.tabs!.map((e) {
          return Container(
            padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: R.color.secondBgColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(e.name),
          );
        }).toList(),
        isScrollable: true,
        labelColor: R.color.mainBrandColor,
        controller: _tabController,
        unselectedLabelColor: R.color.secondTextColor,
        labelStyle: TextStyle(color: R.color.mainBrandColor, fontSize: 13),
        unselectedLabelStyle:
            TextStyle(color: R.color.secondTextColor, fontSize: 13),
        indicator: CommonUnderlineTabIndicator(
            borderSide: BorderSide(width: 3.0, color: R.color.mainBrandColor),
            insets: const EdgeInsetsDirectional.only(bottom: 0),
            wantWidth: 0,
            draggingWidth: 0.0),
        indicatorWeight: 0,
        marginStart: 8,
        marginEnd: 60,
        labelPadding: const EdgeInsetsDirectional.only(start: 5, end: 5),
      ),
    );
  }
}

class PatrolRoomList extends StatefulWidget {
  final int? firstTabId;
  final int? subTabId;

  const PatrolRoomList({super.key, this.firstTabId, this.subTabId});

  @override
  _PatrolRoomListState createState() => _PatrolRoomListState();
}

class _PatrolRoomListState extends State<PatrolRoomList>
    with AutomaticKeepAliveClientMixin {
  late SuperAdminPatrolRepository _source;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _source = SuperAdminPatrolRepository(
        widget.firstTabId ?? 0, widget.subTabId ?? 0);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (widget.firstTabId == null) return const SizedBox.shrink();

    return RefreshIndicatorFactory.of(
      onRefresh: () async {
        await _source.refresh();
      },
      child: LoadingMoreList(
        ListConfig(
          itemBuilder: (BuildContext context, RoomItemModel item, int index) {
            return RoomItemWidget(
              item: item,
              refer: 'superadmin_patrol',
            );
          },
          sourceList: _source,
          indicatorBuilder: _indicatorBuilder,
        ),
      ),
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const LoadingFooter(hasMore: false);
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: BaseK.K.data_error,
        onTap: () {
          _source.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: BaseK.K.data_error, loadMore: _source.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: BaseK.K.no_data,
        onTap: () {
          _source.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }
}

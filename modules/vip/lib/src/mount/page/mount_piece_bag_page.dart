import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/src/mount/model/mount_repos.dart';
import 'package:vip/src/mount/page/mount_piece_bag_item_page.dart';
import 'package:vip/src/mount/pb/generated/mount.pb.dart';

/// 座驾碎片背包
class MountPieceBagPage extends StatefulWidget {
  final int? mountSerialId; // 座驾id

  const MountPieceBagPage({super.key, this.mountSerialId});

  static Future show(BuildContext context, {int? serialId}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MountPieceBagPage(mountSerialId: serialId),
        settings: const RouteSettings(name: '/MountPieceBagPage'),
      ),
    );
  }

  @override
  State<MountPieceBagPage> createState() => _MountPieceBagPageState();
}

class _MountPieceBagPageState extends State<MountPieceBagPage>
    with BaseScreenStateMixin, TickerProviderStateMixin {
  final List<MountDebrisBagTab> _tabList = [];
  final List<MountDebrisBagItem> _initPieceList = [];
  TabController? _tabController;
  int _initIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _onChange(bool needRefresh) {
    _initPieceList.clear();
  }

  Future _loadData() async {
    ResMountDebrisBag resData =
        await MountRepos.getMountPiece(widget.mountSerialId ?? 0);
    if (resData.success) {
      if (resData.data.tabList.isNotEmpty) {
        int index = 0;
        for (MountDebrisBagTab tab in resData.data.tabList) {
          if (widget.mountSerialId != null &&
              widget.mountSerialId == tab.serialId) {
            _initIndex = index;
          }
          _tabList.add(tab);
          index++;
        }
        for (MountDebrisBagItem piece in resData.data.debrisList) {
          _initPieceList.add(piece);
        }
      }
      if (_tabList.length > 1) {
        _tabController = TabController(
            length: _tabList.length, vsync: this, initialIndex: _initIndex);
      }
      setScreenReady();
    } else {
      setScreenError(
          errorMsg: resData.msg, errorMsgColor: Colors.white.withOpacity(0.5));
    }
  }

  /// 跳转房间
  Future _goToRoom() async {
    if (_tabList.isNotEmpty) {
      int index = _tabController != null ? _tabController!.index : 0;
      ResMountSerialJumpRoom res =
          await MountRepos.gotoRoom(_tabList[index].serialId);
      if (res.success) {
        SchemeUrlHelper.instance()
            .checkSchemeUrlAndGo(System.context, res.data.jumpUrl);
      } else {
        Fluttertoast.showCenter(msg: res.msg);
      }
    }
  }

  @override
  void onTapErrorWidget() {
    super.onTapErrorWidget();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080A31),
      appBar: BaseAppBar.custom(
        backgroundColor: const Color(0xFF080A31),
        statusBrightness: Brightness.dark,
        backColor: Colors.white,
        title: const Text(
          '碎片背包',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        actions: [
          if (_tabList.isNotEmpty)
            Center(
              child: GestureDetector(
                onTap: () {
                  _goToRoom();
                },
                child: Container(
                  padding: const EdgeInsetsDirectional.only(
                      start: 8, end: 8, top: 6, bottom: 7),
                  margin: const EdgeInsetsDirectional.only(end: 8),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Color(0xFFB146D1),
                      Color(0xFF7D2EE6),
                      Color(0xFF5E10C7)
                    ]),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Text(
                    '获取碎片',
                    style: TextStyle(
                        color: Color(0xFFD4FA00),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
        ],
      ),
      body: buildStatusContent(),
    );
  }

  @override
  Widget buildContent() {
    if (_tabList.length == 1) {
      return MountPieceBagItemPage(
          mount: _tabList[0],
          pieceList: _initPieceList,
          onRefreshCallback: _onChange);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _renderTab(),
        Expanded(
          child: _renderTabBarView(),
        ),
      ],
    );
  }

  Widget _renderTab() {
    return CommonTabBar(
      tabs: _tabList
          .map(
            (e) => Tab(
              child: Container(
                  height: 44,
                  alignment: AlignmentDirectional.center,
                  child: Text(e.name)),
            ),
          )
          .toList(),
      isScrollable: true,
      controller: _tabController,
      labelColor: const Color(0xFFD4FA00),
      unselectedLabelColor: Colors.white.withOpacity(0.5),
      labelStyle: const TextStyle(color: Color(0xFFD4FA00), fontSize: 18),
      unselectedLabelStyle:
          TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 16),
      indicator: const CommonUnderlineTabIndicator(
        borderSide: BorderSide(width: 4, color: Color(0xFFD4FA00)),
        insets: EdgeInsetsDirectional.only(bottom: 4),
        wantWidth: 16,
        draggingWidth: 12.0,
      ),
      indicatorWeight: 0,
      marginStart: 8,
      marginEnd: 60,
      labelPadding: const EdgeInsetsDirectional.only(start: 12, end: 12),
    );
  }

  Widget _renderTabBarView() {
    return TabBarView(
      physics: const ClampingScrollPhysics(),
      controller: _tabController,
      children: _tabList
          .mapIndexed(
            (i, e) => MountPieceBagItemPage(
              mount: e,
              pieceList: i == _initIndex ? _initPieceList : null,
              onRefreshCallback: _onChange,
            ),
          )
          .toList(),
    );
  }
}

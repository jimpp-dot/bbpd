import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:shared/widget/search_bar.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:chat_room/src/base/page/data/room_data_total_screen.dart';
import 'package:chat_room/src/base/repo/room_api.dart';
import 'package:chat_room/src/protobuf/generated/room_data.pb.dart';

class RoomSearchRankScreen extends StatefulWidget {
  const RoomSearchRankScreen({super.key});

  static show(BuildContext buildContext) {
    return Navigator.of(buildContext).push(
      MaterialPageRoute(
        builder: (context) => const RoomSearchRankScreen(),
        settings: const RouteSettings(name: '/RoomDataTotalScreen'),
      ),
    );
  }

  @override
  _RoomSearchRankScreenState createState() => _RoomSearchRankScreenState();
}

class _RoomSearchRankScreenState extends State<RoomSearchRankScreen>
    with SingleTickerProviderStateMixin {
  String? _searchStr;
  bool _searchLoading = false;
  ExtendedTabController? _rankTabController;
  late List<Widget> _rankTabsWidget;
  ResRoomData? _resRoomData;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _rankTabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.mainBgColor,
      appBar: BaseAppBar(K.room_room_data),
      body: _buildContent(),
    );
  }

  _loadData() async {
    _resRoomData = await RoomApi.getRoomAdminAllData();
    if (_resRoomData!.success) {
      _rankTabsWidget = _resRoomData!.data.rankTab
          .map((item) => Tab(child: Text(item.title)))
          .toList();
      safeRun(
        () => _rankTabController = ExtendedTabController(
            initialIndex: 0, length: _rankTabsWidget.length, vsync: this),
      );
    }
    if (mounted) {
      setState(() {});
    }
  }

  Widget _buildContent() {
    return Column(
      children: [
        _searchWidget(),
        Expanded(
          child: _validRid(_searchStr) ? _searchContent() : _normalContent(),
        )
      ],
    );
  }

  Widget _searchContent() {
    if (_searchLoading) {
      return const Loading();
    }
    return Container();
  }

  Widget _normalContent() {
    if (_resRoomData == null) {
      return const Loading();
    }
    if (!_resRoomData!.success) {
      return ErrorData(
        error: _resRoomData!.msg,
        onTap: _loadData,
      );
    }
    return Container(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                K.room_phase_rank,
                style: R.textStyle.medium16,
              ),
              const SizedBox(width: 4),
              Text(
                '(${Utility.formatDateToHourAndMin(_resRoomData!.data.phaseStart.toInt())}-${Utility.formatDateToHourAndMin(_resRoomData!.data.phaseEnd.toInt())})',
                style: R.textStyle.regular14
                    .copyWith(color: R.color.secondTextColor, fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(child: _buildRankWidget()),
          SizedBox(height: Util.iphoneXBottom + 20),
        ],
      ),
    );
  }

  _buildRankWidget() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: R.color.secondBgColor),
      child: Column(
        children: [
          Container(
            height: 36,
            alignment: AlignmentDirectional.centerStart,
            padding: const EdgeInsetsDirectional.only(top: 12, end: 20),
            child: Row(
              children: [
                Expanded(
                  child: CommonTabBar(
                    tabs: _rankTabsWidget,
                    controller: _rankTabController,
                    marginStart: 0,
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    labelColor: R.color.mainTextColor,
                    unselectedLabelColor: R.color.secondTextColor,
                    labelStyle: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: R.color.mainTextColor,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: R.color.secondTextColor,
                    ),
                    labelPadding:
                        const EdgeInsetsDirectional.only(start: 10, end: 10),
                    indicator: CommonUnderlineTabIndicator(
                      borderSide:
                          BorderSide(width: 2.0, color: R.color.mainBrandColor),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    BaseWebviewScreen.show(context,
                        url: Util.getHelpUrlWithQStr('k61'));
                  },
                  child: R.img(
                    RoomAssets.chat_room$ic_help_svg,
                    color: R.color.mainBrandColor,
                    width: 16,
                    height: 16,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 32,
            color: const Color(0x1460C8FF),
            alignment: AlignmentDirectional.center,
            child: Text(
              K.room_data_award_tips,
              style: R.textStyle.regular12
                  .copyWith(fontSize: 11, color: R.color.mainBrandColor),
            ),
          ),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                if (notification is ScrollUpdateNotification) {
                  double offset = notification.metrics.pixels;
                  double screenWidth = MediaQuery.of(context).size.width;
                  _rankTabController?.scrollPosition = offset / screenWidth;
                }
                return false;
              },
              child: ExtendedTabBarView(
                controller: _rankTabController,
                physics: const ClampingScrollPhysics(),
                children: _rankPageWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _rankPageWidget() {
    List<Widget> pages = [];
    for (var element in _resRoomData?.data.rankTab ?? []) {
      pages.add(_rankList(element));
    }
    return pages;
  }

  Widget _rankList(RankTab item) {
    return ListView.builder(
      key: PageStorageKey(item.title),
      padding: EdgeInsetsDirectional.zero,
      addAutomaticKeepAlives: false,
      addRepaintBoundaries: false,
      shrinkWrap: false,
      itemCount: item.list.length,
      itemBuilder: (context, index) =>
          _buildItem(item.list[index], item.isRoom),
    );
  }

  Widget _buildItem(RankItem item, bool isRoom) {
    Color color = R.color.thirdTextColor;
    int rank = item.rank;
    String rankStr = '$rank';
    if (rank < 10) {
      rankStr = '0$rankStr';
    }
    if (rank <= 3) {
      color = const Color(0xFFFFD04B);
    }
    return GestureDetector(
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Container(
              width: 40,
              alignment: AlignmentDirectional.center,
              child: Text(
                rankStr,
                style: R.textStyle.medium14.copyWith(
                  fontSize: 13,
                  fontFamily: Util.numFontFamily,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w800,
                  color: color,
                ),
              ),
            ),
            CommonAvatar(
              path: item.icon,
              size: 40,
              shape: BoxShape.circle,
            ),
            const SizedBox(width: 4),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    item.name,
                    style: R.textStyle.medium14,
                    maxLines: 1,
                  ),
                ),
                if (isRoom) const SizedBox(height: 2),
                if (isRoom)
                  Flexible(
                    child: Text(
                      K.room_reception_person + item.receptionName,
                      style: R.textStyle.regular12
                          .copyWith(color: R.color.secondTextColor),
                      maxLines: 1,
                    ),
                  ),
              ],
            )),
            const SizedBox(width: 80),
          ],
        ),
      ),
      onTap: () {
        if (isRoom) {
          IRoomManager roomManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_BASE_ROOM);
          roomManager.openChatRoomScreenShow(context, item.rid);
        } else {
          IPersonalDataManager personalDataManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_PERSONALDATA);
          personalDataManager.openImageScreen(context, item.uid);
        }
      },
    );
  }

  Widget _searchWidget() {
    return Container(
      margin: const EdgeInsetsDirectional.only(
          start: 12, end: 12, top: 4, bottom: 6),
      padding: const EdgeInsets.all(8.0),
      child: SearchBar(
        _onQueryChanged,
        height: 36,
        hintText: K.room_search_room_id,
      ),
    );
  }

  void _onQueryChanged(String text) async {
    _searchStr = text;
    _searchLoading = _validRid(_searchStr);
    if (mounted) {
      setState(() {});
    }
    if (_validRid(_searchStr)) {
      NormalString searchRes = await RoomApi.searchRoomId(_searchStr!);
      int rid = Util.parseInt(_searchStr);
      _searchLoading = false;
      if (searchRes.success) {
        _searchStr = '';
        RoomDataTotalScreen.show(System.context, rid);
      } else {
        Fluttertoast.showCenter(msg: searchRes.msg);
        if (mounted) {
          setState(() {});
        }
      }
    }
  }

  bool _validRid(String? rid) {
    return Util.validStr(rid) && rid!.length == 9;
  }
}

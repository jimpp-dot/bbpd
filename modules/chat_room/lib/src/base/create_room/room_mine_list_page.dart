import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/protobuf/generated/room_info.pb.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';

/// 一人多房的房间列表
class RoomMineListPage extends StatefulWidget {
  final String? name;
  const RoomMineListPage({super.key, this.name});

  @override
  State<RoomMineListPage> createState() => _RoomMineListPageState();

  static Future show(BuildContext context, {String? name}) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            settings: const RouteSettings(name: '/RoomMineListPage'),
            builder: (_) => RoomMineListPage(name: name)));
  }
}

class _RoomMineListPageState extends State<RoomMineListPage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  List<String>? _tabs;
  bool _isLoading = false;
  ResRoomPanel? _roomListData;

  @override
  void initState() {
    super.initState();
    _requestData();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        widget.name ?? '',
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backgroundColor: Colors.transparent,
        backColor: R.colors.mainTextColor,
        titleColor: R.colors.mainTextColor,
      ),
      backgroundColor: Colors.transparent,
      body: _buildBody(),
    ).withCommonBg();
  }

  Widget _loadingWidget() {
    return const Center(
      child: Loading(),
    );
  }

  Widget _errorWidget() {
    return Center(
      child: ErrorData(
        error: _roomListData?.msg,
        fontColor: Colors.white,
        onTap: () {
          _requestData();
        },
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return _loadingWidget();
    }

    if (!(_roomListData?.success ?? false)) {
      return _errorWidget();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 12.dp),
          child: CommonTabBar(
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: const BoxDecoration(),
            indicatorWeight: 0,
            labelStyle: TextStyle(
              fontSize: 18,
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w600,
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white.withOpacity(0.7),
            unselectedLabelStyle: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.7),
            ),
            isScrollable: true,
            tabs: _tabs!.map((e) {
              return Container(
                margin: const EdgeInsetsDirectional.only(bottom: 15),
                height: 25,
                child: Tab(
                  text: e,
                ),
              );
            }).toList(),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: _pageViews(),
          ),
        ),
      ],
    );
  }

  List<Widget> _pageViews() {
    List<Widget> pages = [];
    if (_roomListData == null) return pages;

    for (int i = 0; i < _roomListData!.data.tabs.length; i++) {
      debugPrint(_roomListData!.data.tabs[i].toString());
      pages.add(_createPageView(_roomListData!.data.tabs[i]));
    }
    return pages;
  }

  Widget _createPageView(ResRoomPanel_Data_Tab tabData) {
    if (tabData.list.isEmpty) {
      return const EmptyWidget();
    }

    return ListView.builder(
      padding: EdgeInsetsDirectional.only(start: 16.dp, end: 16.dp),
      itemCount: tabData.list.length,
      itemBuilder: (BuildContext context, int index) {
        return _itemWidget(tabData.list[index]);
      },
    );
  }

  Widget _itemWidget(ResRoomPanel_Data_Tab_RoomItem roomItem) {
    return GestureDetector(
      onTap: () {
        _itemClick(roomItem);
      },
      child: Container(
        width: Util.width - 32.dp,
        height: 90.dp,
        margin: EdgeInsetsDirectional.only(bottom: 8.dp),
        decoration: BoxDecoration(
          color: const Color(0xFF27252D),
          borderRadius: BorderRadius.circular(16.dp),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 8),
            CommonAvatar(
              path: Util.getRemoteImgUrl(roomItem.roomCover),
              suffix: Util.squareResizeSuffix(240),
              size: 74.dp,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12.dp),
              onlyFirstFrame: true,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildInfo(roomItem),
            ),
            const SizedBox(width: 8),
            if (roomItem.roomState == 1)
              RepaintBoundary(
                child: R.img('in_room_status.webp',
                    package: ComponentManager.MANAGER_BASE_CORE,
                    width: 20,
                    height: 20,
                    color: Colors.white),
              ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo(ResRoomPanel_Data_Tab_RoomItem roomItem) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GradientText(
          roomItem.types.show,
          gradient: LinearGradient(
              colors: Util.parseColors(
                  roomItem.types.bg, Colors.black.withOpacity(0.5))),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          roomItem.title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white.withOpacity(0.9),
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          'ID：${roomItem.rid}',
          style: TextStyle(
            fontSize: 10,
            color: Colors.white.withOpacity(0.5),
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            CommonAvatar(
              path: Util.getRemoteImgUrl(roomItem.userIcon),
              suffix: Util.squareResizeSuffix(50),
              size: 16.dp,
              shape: BoxShape.circle,
            ),
            Text(
              roomItem.userName,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withOpacity(0.9),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        )
      ],
    );
  }

  void _itemClick(ResRoomPanel_Data_Tab_RoomItem roomItem) {
    if (roomItem.roomState == 2) {
      Fluttertoast.showCenter(msg: K.room_notice_room_be_closed);
    } else if (roomItem.roomState == 0) {
      Navigator.pop(context);
      //合作厅删除后，先打开修改界面，修改完直接进房 模拟厅逻辑相同
      IRoomManager roomManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.openRoomModifyScreen(System.context,
          rid: roomItem.rid, showRoom: true);
    } else if (roomItem.roomState == 1) {
      Navigator.pop(context);
      IRoomManager roomManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.openChatRoomScreenShow(System.context, roomItem.rid,
          refer: 'create_room_page');
    } else {
      Fluttertoast.showCenter(msg: K.room_not_prosable);
    }
  }

  Future<void> _requestData() async {
    if (_isLoading) return;
    _isLoading = true;
    _roomListData = await RoomRepository.getRoomMineList();
    _isLoading = false;
    if (_roomListData!.success) {
      _tabs = [];
      for (int i = 0; i < _roomListData!.data.tabs.length; i++) {
        _tabs!.add(_roomListData!.data.tabs[i].name);
      }
      safeRun(() {
        _tabController = TabController(length: _tabs!.length, vsync: this);
        setState(() {});
      });
    } else {
      safeRun(() {
        setState(() {});
      });
    }
  }
}

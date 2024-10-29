import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../k.dart';

class SlpSearchKOLRoomsScreen extends StatefulWidget {
  final String searchString;
  final int searchId;

  const SlpSearchKOLRoomsScreen(this.searchId,
      {this.searchString = '', Key? key})
      : super(key: key);

  @override
  State<SlpSearchKOLRoomsScreen> createState() =>
      _SlpSearchKOLRoomsScreenState();

  static void show(int searchId, String searchString, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SlpSearchKOLRoomsScreen(
          searchId,
          searchString: searchString,
        ),
        settings: const RouteSettings(name: '/searchKOLRoomsScreen'),
      ),
    );
  }
}

class _SlpSearchKOLRoomsScreenState extends State<SlpSearchKOLRoomsScreen> {
  RoomListRes? roomListRsp;

  void _loadData() async {
    String url = '${System.domain}go/yy/roomlist/kol';
    try {
      XhrResponse response = await Xhr.get(url,
          queryParameters: {'id': widget.searchId},
          pb: true,
          throwOnError: true);
      roomListRsp = RoomListRes.fromBuffer(response.bodyBytes);
    } catch (e) {
      roomListRsp = RoomListRes(msg: e.toString(), success: false);
    }
    //await GameMasterAPI.getGameCardListRes(widget.uid);

    if (!roomListRsp!.success) {
      Fluttertoast.showCenter(msg: roomListRsp!.msg);
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    Widget? statusWidget;
    if (roomListRsp == null) {
      statusWidget = const Center(
        child: Loading(),
      );
    } else if (!roomListRsp!.success) {
      statusWidget = Center(
        child: ErrorData(
          error: roomListRsp!.msg,
          onTap: () => _loadData(),
        ),
      );
    } else if (roomListRsp!.item.isEmpty) {
      statusWidget = const Center(
        child: EmptyWidget(),
      );
    }

    SliverGridDelegate gridDelegate =
        const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8);
    itemBuilder(BuildContext context, int index) {
      PartyRoomGridItem item = roomListRsp!.item[index].changeToPartGridItem();
      return PartyRoomGridItemNewWidget(
        item: item,
        key: ValueKey('${item.rid}_${item.name}'),
        onItemClick: () {
          IRoomManager manager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_BASE_ROOM);
          manager.openChatRoomScreenShow(context, item.rid,
              searchString: widget.searchString);
        },
      );
    }

    return Scaffold(
      appBar: BaseAppBar(K.search_result_all_rooms),
      body: Container(
        // decoration: BoxDecoration(color: Colors.white),
        child: RefreshIndicatorFactory.of(
          onRefresh: () async {
            _loadData();
          },
          child: statusWidget ??
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
                child: GridView.builder(
                  gridDelegate: gridDelegate,
                  itemBuilder: itemBuilder,
                  itemCount: roomListRsp!.item.length,
                  padding: const EdgeInsetsDirectional.only(top: 8, bottom: 33),
                ),
              ),
        ),
      ),
    );
  }
}

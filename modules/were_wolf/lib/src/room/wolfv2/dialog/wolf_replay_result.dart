import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:were_wolf/src/room/wolfv2/widget/replay_result_list.dart';
//import '../../../../k.dart';

class ReplayReslutWidget extends StatefulWidget {
  final String day;
  final String rid;
  final String permanent_vvc;
  final List<RoomPosition> roomPosition;

  const ReplayReslutWidget(
      this.rid, this.day, this.permanent_vvc, this.roomPosition,
      {super.key});

  @override
  State createState() {
    return _ReplayReslutState();
  }
}

class _ReplayReslutState extends State<ReplayReslutWidget>
    with TickerProviderStateMixin {
  bool _loading = true;
  int _totalDay = 0;
  Map? _res;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() async {
    try {
      String url = "${System.domain}roomwolfv2/replayDetail";
      final Map<String, String> params = {
        "rid": widget.rid,
        'day': widget.day,
        "permanent_vvc": widget.permanent_vvc
      };

      XhrResponse response =
          await Xhr.postJson(url, params, throwOnError: true);
      _loading = false;
      _res = response.value();
      if (_res == null || _res!["data"] == null) {
        return;
      }
      _totalDay = Util.parseInt(_res!['data']['total_day']);
      safeRun(() {
        _tabController = TabController(length: _totalDay, vsync: this);
        _tabController!.addListener(_onTabChanged);
      });
      if (!mounted) {
        return;
      }
      setState(() {});
    } catch (e) {
      Log.d(e);
      setState(() {
        _loading = false;
      });
    }
  }

  _onTabChanged() {
    if (_tabController!.indexIsChanging) return;
    Log.d("tab ${_tabController!.index}");
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: const Color(0x00000000),
        insetPadding: const EdgeInsets.only(left: 32, right: 32),
        child: Container(
            height: 448,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(R.imagePath("wolfv2/wolf_replay_bg.webp",
                  package: ComponentManager.MANAGER_WERE_WOLF)),
              fit: BoxFit.fill,
            )),
            child: _loading
                ? const Loading()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          height: 34,
                          alignment: AlignmentDirectional.centerEnd,
                          padding: const EdgeInsetsDirectional.only(end: 5),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: R.img('wolfv2/wolf_replay_close_icon.webp',
                                width: 34,
                                height: 34,
                                package: ComponentManager.MANAGER_WERE_WOLF),
                          )),
                      const SizedBox(height: 28),
                      _renderTab(),
                      Expanded(child: _buildBody())
                    ],
                  )));
  }

  Widget _renderTab() {
    List<Widget> tabs = <Widget>[];
    for (int i = 0; i < _totalDay; i++) {
      Tab tab = Tab(
          icon: null,
          child: Container(
            height: 28,
            alignment: AlignmentDirectional.center,
            padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(R.imagePath(
                  i == _tabController!.index
                      ? "wolfv2/replay_tab_selected.webp"
                      : 'wolfv2/replay_tab_normal.webp',
                  package: ComponentManager.MANAGER_WERE_WOLF)),
              fit: BoxFit.fill,
            )),
            child: Text(R.string('room_some_day', args: [' ${i + 1} ']),
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w600)),
          ));
      tabs.add(tab);
    }
    return Padding(
        padding: const EdgeInsetsDirectional.only(start: 18, end: 18),
        child: CommonTabBar(
          tabs: tabs,
          controller: _tabController,
          isScrollable: true,
          labelPadding: const EdgeInsets.symmetric(horizontal: 8),
          indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(width: 2, color: Colors.transparent)),
        ));
  }

  Widget _buildBody() {
    List<Widget> tabViews = <Widget>[];
    for (int i = 0; i < _totalDay; i++) {
      int day = i + 1;
      if (day == _res!['data']["day"]) {
        tabViews.add(ReplayList(widget.rid, day.toString(),
            widget.permanent_vvc, widget.roomPosition,
            res: _res!));
      } else {
        tabViews.add(ReplayList(widget.rid, day.toString(),
            widget.permanent_vvc, widget.roomPosition));
      }
    }

    return Padding(
      padding: const EdgeInsetsDirectional.only(
          top: 8.0, start: 10, end: 10, bottom: 15),
      child: TabBarView(
        controller: _tabController,
        children: tabViews,
      ),
    );
  }
}

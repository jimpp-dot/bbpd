import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

import '../../../../assets.dart';
import '../../../../k.dart';
import '../juke_music_util.dart';
import 'juke_music_list_page.dart';
import 'juke_music_singer_add_panel.dart';
import 'juke_music_waiting_page.dart';

class JukeMusicOrderPanel extends StatefulWidget {
  final ChatRoomData room;
  final int? singerUid; // 选中指定歌手

  const JukeMusicOrderPanel({Key? key, required this.room, this.singerUid})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => JukeMusicOrderPanelState();

  static void show(BuildContext context, ChatRoomData room, {int? singerUid}) {
    displayModalBottomSheet(
        context: context,
        maxHeightRatio: 1,
        disableTapDismissible: true,
        builder: (context) {
          return JukeMusicOrderPanel(room: room, singerUid: singerUid);
        });
  }
}

class JukeMusicOrderPanelState extends State<JukeMusicOrderPanel>
    with TickerProviderStateMixin<JukeMusicOrderPanel> {
  final List<String> _tabs = [K.room_juke_tab_1, K.room_juke_tab_2];
  final List<Widget> _tabWidgets = [];
  final List<Widget> _pageWidgets = [];
  ExtendedTabController? _tabController;

  @override
  void initState() {
    super.initState();
    _initTabs();
  }

  _initTabs() {
    _tabController = ExtendedTabController(
        initialIndex: 0, length: _tabs.length, vsync: this);
    _tabs.forEachIndexed((i, e) {
      _tabWidgets.add(Text(e));
      if (i == 0) {
        _pageWidgets.add(JukeWaitSingListWidget(rid: widget.room.realRid));
      } else {
        _pageWidgets.add(
            JukeMusicOrderPage(room: widget.room, singerUid: widget.singerUid));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 600 + Util.iphoneXBottom,
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage(RoomAssets.chat_room$jukemusic_juke_bg_webp),
            fit: BoxFit.fill),
        borderRadius:
            BorderRadiusDirectional.vertical(top: Radius.circular(16.dp)),
      ),
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.maybePop(context);
              },
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
                child: R.img(RoomAssets.chat_room$jukemusic_ic_juke_back_png,
                    width: 24, height: 24),
              ),
            ),
            Expanded(flex: 1, child: _buildTabs()),
            JukeMusicUtil.canOperate
                ? GestureDetector(
                    onTap: () async {
                      bool? res = await JukeMusicSingerAddPanel.show(
                          context, widget.room);
                      if (true == res) {
                        eventCenter.emit("event.jukemusic.singer.added", "");
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(end: 16),
                      child: Text(
                        K.room_juke_add_singer,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ))
                : const SizedBox(width: 40),
          ],
        ),
        Expanded(child: _buildPages()),
      ],
    );
  }

  Widget _buildTabs() {
    return Container(
      width: double.infinity,
      height: 48,
      alignment: AlignmentDirectional.center,
      child: CommonTabBar(
        tabs: _tabWidgets,
        isScrollable: true,
        controller: _tabController,
        labelColor: Colors.white,
        onTap: (index) {},
        unselectedLabelColor: Colors.white.withOpacity(0.6),
        labelStyle: const TextStyle(
            color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        unselectedLabelStyle:
            TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 15),
        indicator: const CommonUnderlineTabIndicator(
            borderSide: BorderSide(width: 3.0, color: Colors.transparent),
            insets: EdgeInsetsDirectional.only(bottom: 0),
            wantWidth: 16,
            draggingWidth: 12.0),
        indicatorWeight: 0,
        marginStart: 16,
        labelPadding: const EdgeInsetsDirectional.only(start: 10, end: 10),
      ),
    );
  }

  Widget _buildPages() {
    return TabBarView(
      controller: _tabController,
      children: _pageWidgets,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }
}

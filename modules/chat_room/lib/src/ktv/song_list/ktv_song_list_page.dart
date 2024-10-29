import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../../chat_room.dart';
import '../../../k.dart';
import 'ktv_recommend_song_page.dart';
import '../ktv_sing_song_tips_dialog.dart';
import '../utils/ktv_theme.dart';
import 'requested_song_list.dart';

enum SongSheetType {
  ordered, // 已点tab  排麦歌曲列表
  rcmd, //点歌tab 推荐歌曲列表
}

/// KTV已点/点歌页（双TAB）
///
class KtvSongListPage extends StatefulWidget {
  final ChatRoomData room;
  final bool isRoomMaster;
  final SongSheetType defaultTab;
  final bool autoMic;
  final int musicNum;

  const KtvSongListPage({
    Key? key,
    required this.room,
    required this.isRoomMaster,
    required this.defaultTab,
    required this.autoMic,
    required this.musicNum,
  }) : super(key: key);

  static Future show(
    BuildContext context,
    ChatRoomData room,
    SongSheetType tab, {
    bool isRoomMaster = false,
    bool autoMic = true,
    int musicNum = 0,
  }) {
    KtvSingSongTipsDialog.dismiss();
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 1,
      disableTapDismissible: true,
      builder: (context) {
        return KtvSongListPage(
          room: room,
          defaultTab: tab,
          isRoomMaster: isRoomMaster,
          autoMic: autoMic,
          musicNum: musicNum,
        );
      },
    );
  }

  @override
  State<KtvSongListPage> createState() => KtvSongListState();
}

class KtvSongListState extends State<KtvSongListPage>
    with TickerProviderStateMixin {
  late ExtendedTabController _tabController;
  final List<Widget> _tabsWidget = [];

  int musicNum = 0;

  @override
  void initState() {
    super.initState();
    musicNum = widget.musicNum;
    resetTabs();

    widget.room.addListener(RoomConstant.Event_Ktv_Info, _onKtvInfo);

    safeRun(
      () => _tabController = ExtendedTabController(
        initialIndex: widget.defaultTab == SongSheetType.ordered ? 0 : 1,
        length: 2,
        vsync: this,
      )..addListener(_onTabChanged),
    );

    Tracker.instance.track(TrackEvent.click, properties: {
      'click_page': widget.defaultTab == SongSheetType.ordered
          ? 'click_orderedsongs'
          : 'click_ordersongs',
      'interactive': '1',
    });
  }

  @override
  void dispose() {
    widget.room.removeListener(RoomConstant.Event_Ktv_Info, _onKtvInfo);
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging) {
      Tracker.instance.track(TrackEvent.click, properties: {
        'click_page': _tabController.index == 0
            ? 'click_orderedsongs'
            : 'click_ordersongs',
        'interactive': '0',
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Util.height * 0.84,
      decoration: BoxDecoration(
        color: KtvTheme.mainBgColor,
        borderRadius:
            const BorderRadiusDirectional.vertical(top: Radius.circular(12)),
      ),
      child: Column(
        children: [
          _buildTab(),
          Container(
            height: 1,
            width: Util.width - 32,
            margin:
                const EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 4),
            color: R.color.secondTextColor.withOpacity(0.1),
          ),
          Expanded(child: _buildContent()),
        ],
      ),
    );
  }

  Widget _buildTab() {
    return SizedBox(
      width: Util.width,
      height: 44,
      child: Row(
        children: [
          const SizedBox(width: 64),
          const Spacer(),
          CommonTabBar(
            tabs: _tabsWidget,
            isScrollable: true,
            labelColor: R.color.mainTextColor,
            controller: _tabController,
            unselectedLabelColor: R.color.secondTextColor,
            labelStyle: TextStyle(
                color: R.color.mainTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w500),
            unselectedLabelStyle: TextStyle(
                color: R.color.secondTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w500),
            indicator: CommonUnderlineTabIndicator(
              borderSide: BorderSide(width: 3.0, color: R.color.mainBrandColor),
              insets: const EdgeInsetsDirectional.only(bottom: 5),
              wantWidth: 16,
              draggingWidth: 12.0,
            ),
            indicatorWeight: 0,
            labelPadding: const EdgeInsetsDirectional.only(start: 20, end: 20),
          ),
          const Spacer(),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.of(context).pop(true);
            },
            child: Container(
              width: 64,
              height: 44,
              alignment: Alignment.center,
              child: R.img("room_ic_close.svg",
                  package: ComponentManager.MANAGER_BASE_ROOM,
                  color: KtvTheme.mainTextColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return TabBarView(
      controller: _tabController,
      children: [
        RequestedSongListWidget(
          isRoomMaster: widget.isRoomMaster,
          room: widget.room,
          onBottomClicked: () {
            _tabController.animateTo(1);
          },
        ),
        KtvRecommendSongTab(
          room: widget.room,
          autoMic: widget.autoMic,
        ),
      ],
    );
  }

  _onKtvInfo(String type, Object? data) {
    if (data == null || data is! KtvInfo || !mounted) return;
    KtvInfo ktvInfo = data;
    if (ktvInfo.listCount != musicNum) {
      /// 排歌列表数目变化
      musicNum = ktvInfo.listCount;
      refreshMusicNum();
    }
  }

  void refreshMusicNum() {
    resetTabs();
    refresh();
  }

  void resetTabs() {
    _tabsWidget.clear();
    _tabsWidget.add(
      Tab(
        child: Text('${K.music_order_has_order}($musicNum)'),
      ),
    );

    _tabsWidget.add(
      Tab(
        child: Text(K.music_order_order_song),
      ),
    );
  }
}

import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/src/biz_plugin/crosspk/widget/setting/list_page_v2.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/biz_plugin/crosspk/widget/setting/list_page.dart';
import 'package:chat_room/src/biz_plugin/crosspk/widget/setting/pk_setting.dart';

import '../../../protobuf/generated/room_cross_pk.pb.dart';
import '../model/repo.dart';

/// 约战pk 设置
class CrossPKLaunchSheet extends StatefulWidget {
  final ChatRoomData room;

  const CrossPKLaunchSheet({Key? key, required this.room}) : super(key: key);

  @override
  _CrossPKLaunchSheetState createState() {
    return _CrossPKLaunchSheetState();
  }

  static Future show(
      {Key? key, required BuildContext context, required ChatRoomData room}) {
    return displayModalBottomSheet(
      context: context,
      supportSoftKeyBoard: true,
      maxHeightRatio: 0.8,
      disableTapDismissible: true,
      settings: const RouteSettings(name: '/CrossPKLaunchSheet'),
      builder: (context) {
        return CrossPKLaunchSheet(key: key, room: room);
      },
    );
  }
}

class _CrossPKLaunchSheetState extends State<CrossPKLaunchSheet>
    with SingleTickerProviderStateMixin {
  ExtendedTabController? _tabController;
  List<RoomCrossPkModeInfo> _tabs = [];
  final List<String> _titles = [];
  final List<Widget> _widgets = [];

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
    _tabs = await CrossPKRepo.getPkTab(widget.room.realRid);
    if (Util.validList(_tabs)) {
      if (_tabs.length > 1) {
        // tab长度超过1，显示tab
        safeRun(
          () => _tabController = ExtendedTabController(
              initialIndex: 0, length: _tabs.length, vsync: this),
        );
        for (RoomCrossPkModeInfo tab in _tabs) {
          _titles.add(tab.name);
          _widgets.add(_buildTab(tab));
        }
      }
      refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Util.height * 0.75,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadiusDirectional.vertical(top: Radius.circular(12)),
      ),
      child: Column(
        children: [
          _buildAppBar(),
          if (Util.validList(_tabs)) ...[
            if (_tabs.length > 1)
              AnimTabBar(
                controller: _tabController,
                height: 44,
                titles: _titles,
                marginStart: 10,
                marginEnd: 44 * 1.5,
                selectedFontSize: 18,
                selectedFontColor: const Color(0xFF313131),
                selectedFontWeight: FontWeight.w600,
                unselectedFontSize: 16,
                unselectedFontColor: const Color(0x99313131),
                unselectedFontWeight: FontWeight.w500,
              ),
            Expanded(child: _buildBody()),
          ] else
            const Expanded(child: Loading()),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SizedBox(
      height: 44,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            padding: const EdgeInsetsDirectional.only(start: 16, end: 8),
            icon: R.img(BaseAssets.shared$icon_btn_close_png,
                width: 32, height: 32, color: const Color(0xFF313131)),
            onPressed: () => Navigator.maybePop(context),
          ),
          const Spacer(),
          Text(K.room_cross_pk,
              style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFF313131),
                  fontWeight: FontWeight.w500)),
          const Spacer(),
          IconButton(
            onPressed: () {
              CrossPKSettingPanel.show(context: context, rid: widget.room.rid);
            },
            icon: R.img(RoomAssets.chat_room$live_live_pk_setting_webp,
                width: 24, height: 24),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(RoomCrossPkModeInfo tab) {
    if (tab.mode == RoomCrossPKMode.ROOM_CROSS_PK_MODE_TOWER ||
        tab.mode == RoomCrossPKMode.ROOM_CROSS_PK_MODE_3) {
      return CrossPKListPage(room: widget.room, mode: tab.mode);
    } else if (tab.mode == RoomCrossPKMode.ROOM_CROSS_PK_MODE_2) {
      return CrossPKListPageV2(room: widget.room, children: tab.children);
    }
    return const SizedBox.shrink();
  }

  Widget _buildBody() {
    if (_tabs.length == 1) {
      return _buildTab(_tabs[0]);
    }
    return TabBarView(
      controller: _tabController,
      children: _widgets,
    );
  }
}

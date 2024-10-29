import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:rank/src/page/composite_rank/composite_rank_dialog.dart';
import 'package:rank/src/rankingList/model/ranking_list_api.dart';
import 'package:rank/src/rankingList/model/ranking_list_bean.dart';
import 'package:pulse_log/pulse_log.dart';
import 'ranking_list_entrance.dart';
import 'ranking_list_page.dart';

class RankingListWidget extends StatefulWidget {
  final int rid;
  final Events? roomEvent;

  const RankingListWidget(this.rid, this.roomEvent, {super.key});

  @override
  _RankingListWidgetState createState() => _RankingListWidgetState();
}

class _RankingListWidgetState extends State<RankingListWidget> {
  RoomCharmIndexBean? _entrance;
  final GlobalKey<RankingListEntranceState> _globalKey =
      GlobalKey<RankingListEntranceState>(
          debugLabel: 'RankingListEntranceState');

  final String _charmRefreshAction = 'Action.room.charm.refresh';

  /// 规则说明
  Map<String, List<String>>? _rule;

  @override
  void initState() {
    super.initState();
    _loadEntrance();
    widget.roomEvent?.addListener(_charmRefreshAction, _onCharmUpdate);
  }

  @override
  void dispose() {
    widget.roomEvent?.removeListener(_charmRefreshAction, _onCharmUpdate);
    super.dispose();
  }

  void refreshUI() {
    if (mounted) {
      setState(() {});
    }
  }

  _onCharmUpdate(String type, dynamic value) {
    RoomCharmIndexBean charmIndexBean = RoomCharmIndexBean.fromJson(value);

    _entrance = charmIndexBean;
    if (_entrance?.rule == null && _rule != null) {
      _entrance?.rule = _rule;
    }
    if (mounted) {
      _globalKey.currentState?.loadData(_entrance);
    }
  }

  _loadEntrance() async {
    RoomCharmIndexResponse response =
        await RankingListApi.getEntrance(widget.rid.toString());
    if (response.success == true) {
      _entrance = response.entrance;
      _rule = _entrance?.rule;
      refreshUI();
    }
  }

  /// 点击排行榜入口
  _onTapEntrance(int index) {
    Tracker.instance.track(TrackEvent.click_list,
        properties: {'rid': widget.rid, 'click_type': 'zd'});
    if (_entrance?.gapList == null || _entrance!.gapList.length <= index)
      return;

    final String type = _entrance!.gapList[index].type;

    int pageIndex =
        _entrance!.rankTypeList.indexWhere((element) => element.type == type);
    Log.d('_onTapEntrance index: $index  pageIndex: $pageIndex');
    _showRankingListPage(pageIndex);
    PulseLog.instance.event('click_event', properties: {
      'click_tag': 'room_ranking_list_current_$pageIndex',
    });
  }

  _showRankingListPage(int pageIndex) {
    RoomConfig? rConfig = ChatRoomData.getInstance()?.config;

    if (rConfig != null &&
        ['cplink', 'play'].contains(rConfig.settlementChannel)) {
      //快乐星球、嗨歌的连连看、拍卖两个结算频道展示新的综合排行榜
      CompositeRankDialog.open(context,
          initTab: pageIndex,
          tabList: _entrance!.rankTypeList,
          rid: widget.rid,
          rule: _entrance!.rule);
      return;
    }

    RankingListPage.openRankingListPage(context,
        initTab: pageIndex,
        tabList: _entrance!.rankTypeList,
        rid: widget.rid,
        rule: _entrance!.rule);
  }

  @override
  Widget build(BuildContext context) {
    if (_entrance == null || _entrance!.haveRoomCharm != true)
      return Container();

    return Container(
      alignment: AlignmentDirectional.topStart,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RankingListEntrance(
            key: _globalKey,
            onTapEntrance: _onTapEntrance,
            data: _entrance,
            rid: widget.rid,
          ),
        ],
      ),
    );
  }
}

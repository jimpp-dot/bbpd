import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/admin/refresh_mixin.dart';
import 'package:chat_room/src/base/admin/room_admin_screen.dart';
import 'package:chat_room/src/base/repo/room_api.dart';
import 'package:chat_room/src/protobuf/generated/ranking_defend.pb.dart';

/// 电台守护
class RankDefendPage extends StatefulWidget {
  final int rid;

  const RankDefendPage({Key? key, required this.rid}) : super(key: key);

  @override
  _RankDefendPageState createState() {
    return _RankDefendPageState();
  }
}

class _RankDefendPageState extends State<RankDefendPage>
    with
        AutomaticKeepAliveClientMixin<RankDefendPage>,
        RefreshMixin<RankDefendPage> {
  final GlobalKey<RefreshIndicatorState> _key =
      GlobalKey<RefreshIndicatorState>();
  bool _loading = true;
  List<DefendData>? _data;

  final List<String> _lables = ['', K.room_gold, K.room_silver, K.room_brass];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _load() async {
    ResRankingDefend res = await RoomApi.getRoomDefendList(widget.rid);
    if (res.success) {
      _data = res.data;
      eventCenter.emit(RoomAdminScreen.Event_Refresh_Rank_Switch, res.hideRank);
    }
    _loading = false;
    if (mounted) setState(() {});
  }

  @override
  refresh() async {
    if (_key.currentState != null) {
      await _key.currentState?.show();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_loading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (_data == null ||
        _data!.isEmpty ||
        !showRankListByKey(roomSweetKey)) {
      return const EmptyWidget();
    }
    return RefreshIndicatorFactory.of(
      key: _key,
      child: ListView.builder(
        itemCount: _data!.length,
        itemBuilder: (BuildContext context, int index) {
          DefendData item = _data!.elementAt(index);
          return _buildItem(item, index);
        },
      ),
      onRefresh: () async {
        await _load();
        return;
      },
    );
  }

  Widget _renderIndex(BuildContext context, int index) {
    if (index <= 2) {
      return R.img(
        "rank/top_rank${index + 1}.webp",
        width: 20.0,
        height: 23.0,
        package: ComponentManager.MANAGER_BASE_CORE,
      );
    } else {
      return NumText(
        "${index + 1}",
        style: Theme.of(context).textTheme.bodySmall,
      );
    }
  }

  Widget _buildItem(DefendData data, int index) {
    int defend = data.defend;
    List has = data.has;
    return InkWell(
      onTap: () async {},
      child: Container(
        padding: const EdgeInsetsDirectional.only(
          start: 0.0,
          end: 16.0,
          top: 8.0,
          bottom: 8.0,
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 50.0,
              margin: const EdgeInsetsDirectional.only(end: 5.0),
              alignment: Alignment.center,
              child: _renderIndex(context, index),
            ),
            CommonAvatar(
              path: data.icon,
              size: 56,
              shape: BoxShape.circle,
              onTap: () {
                int uid = data.uid;
                if (uid > 0) {
                  IPersonalDataManager manager = ComponentManager.instance
                      .getManager(ComponentManager.MANAGER_PERSONALDATA);
                  manager.openImageScreen(context, uid,
                      refer: const PageRefer('AdminDefend'));
                }
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data.name,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      K.room_protect_remaining(
                          [(_lables[defend]), (data.expire)]),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 75.0,
              alignment: AlignmentDirectional.centerEnd,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: has.map((dynamic value) {
                    int defend = value;
                    return Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 2.0,
                      ),
                      child: R.img(
                        "radio_badge_$defend.png",
                        width: 23.0,
                        height: 23.0,
                        package: ComponentManager.MANAGER_BASE_ROOM,
                      ),
                    );
                  }).toList()),
            )
          ],
        ),
      ),
    );
  }
}

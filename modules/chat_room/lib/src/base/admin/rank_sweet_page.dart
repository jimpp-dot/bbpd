import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/base/admin/refresh_mixin.dart';
import 'package:chat_room/src/base/admin/room_admin_screen.dart';
import 'package:chat_room/src/base/repo/room_api.dart';
import 'package:chat_room/src/protobuf/generated/ranking_sweet.pb.dart';
import 'package:chat_room/src/roomNavUtil.dart';

/// 甜蜜守护榜
class RankSweetPage extends StatefulWidget {
  final int rid;

  const RankSweetPage({Key? key, required this.rid}) : super(key: key);

  @override
  _RankSweetPageState createState() {
    return _RankSweetPageState();
  }
}

class _RankSweetPageState extends State<RankSweetPage>
    with
        AutomaticKeepAliveClientMixin<RankSweetPage>,
        RefreshMixin<RankSweetPage> {
  final GlobalKey<RefreshIndicatorState> _key =
      GlobalKey<RefreshIndicatorState>();
  bool _loading = true;
  List<SweetList>? _data;

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
    ResRankingSweet res = await RoomApi.getRoomSweetList(widget.rid);
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
      return const Center(child: CupertinoActivityIndicator());
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
          SweetList item = _data!.elementAt(index);
          return _buildItem(item, index);
        },
      ),
      onRefresh: () async {
        await _load();
        return;
      },
    );
  }

  Widget _buildItem(SweetList item, int index) {
    int toColor = Utility.getVipColor(item.tovip, false);

    return SizedBox(
      height: 80.0,
      child: Row(
        children: <Widget>[
          showRankByKey(roomSweetKey)
              ? Container(
                  width: 50.0,
                  margin: const EdgeInsetsDirectional.only(end: 5.0),
                  alignment: Alignment.center,
                  child: _renderIndex(index),
                )
              : const SizedBox(width: 8),
          Container(
            width: 80.0,
            alignment: Alignment.center,
            child: Stack(
              children: <Widget>[
                PositionedDirectional(
                  end: 0.0,
                  top: (80.0 - 47.0) / 2,
                  child: GestureDetector(
                    onTap: () {
                      RoomNavUtil.showImage(
                          context, item.touid, const PageRefer('AdminSweet'));
                    },
                    child: Container(
                      width: 47.0,
                      height: 47.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23.5),
                        border: Border.all(color: Colors.white, width: 1.0),
                      ),
                      alignment: Alignment.center,
                      child: CommonAvatar(
                        path: item.toicon,
                        size: 45,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                PositionedDirectional(
                  start: 0.0,
                  top: (80.0 - 47.0) / 2,
                  child: GestureDetector(
                    onTap: () {
                      RoomNavUtil.showImage(
                          context, item.uid, const PageRefer('AdminSweet'));
                    },
                    child: Container(
                      width: 47.0,
                      height: 47.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23.5),
                        border: Border.all(color: Colors.white, width: 1.0),
                      ),
                      alignment: Alignment.center,
                      child: CommonAvatar(
                        path: item.uicon,
                        size: 45,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: _renderInfo(item),
                  ),
                  Text(
                    item.toname,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(toColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (showRankScoreByKey(roomSweetKey))
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 15.0),
              child: NumText(
                "${item.money ~/ 100}",
                style: TextStyle(
                  color: R.color.thirdBrightColor,
                  fontSize: 13.0,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _renderIndex(int index) {
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
        style: TextStyle(color: R.color.secondTextColor),
      );
    }
  }

  List<Widget> _renderInfo(SweetList item) {
    int uTitleNew = item.utitleNew;
    int uVip = item.uvip;
    int uPopularity = item.upopularity;
    int uColor = Utility.getVipColor(item.uvip, false);
    List<Widget> res = [];
    res.add(
      UserNobilityWidget(
        titleNew: uTitleNew,
        padding: const EdgeInsetsDirectional.only(end: 1.0),
      ),
    );
    if (uVip > 0) {
      res.add(
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 1.0),
          child: UserVipWidget(vip: uVip),
        ),
      );
    }
    if (uPopularity > 0) {
      res.add(
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 1.0),
          child: UserPopularity(popularityLevel: uPopularity),
        ),
      );
    }
    res.add(
      Expanded(
        child: Text(
          item.uname,
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: TextStyle(fontSize: 16.0, color: Color(uColor)),
        ),
      ),
    );

    return res;
  }
}

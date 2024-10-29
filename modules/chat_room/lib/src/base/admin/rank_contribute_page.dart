import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/base/admin/refresh_mixin.dart';
import 'package:chat_room/src/base/admin/room_admin_screen.dart';
import 'package:chat_room/src/base/repo/room_api.dart';
import 'package:chat_room/src/protobuf/generated/ranking_all.pb.dart';
import 'package:chat_room/src/protobuf/generated/ranking_charm.pb.dart';
import 'package:chat_room/src/protobuf/generated/ranking_contribute.pb.dart';
import 'package:chat_room/src/roomNavUtil.dart';

enum ContributeType {
  all, // 贡献总榜
  week, // 贡献周榜(贡献榜默认是周榜)
  charm, // 魅力榜
}

/// 房间贡献榜/魅力榜
class RankContributePage extends StatefulWidget {
  final int rid;
  final ContributeType contributeType;

  const RankContributePage({
    Key? key,
    required this.rid,
    this.contributeType = ContributeType.week,
  }) : super(key: key);

  @override
  _RankContributePageState createState() {
    return _RankContributePageState();
  }
}

class _RankContributePageState extends State<RankContributePage>
    with
        AutomaticKeepAliveClientMixin<RankContributePage>,
        RefreshMixin<RankContributePage> {
  final GlobalKey<RefreshIndicatorState> _key =
      GlobalKey<RefreshIndicatorState>();
  bool _loading = true;
  List<RankList>? _data;

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
    switch (widget.contributeType) {
      case ContributeType.all:
        ResRankingAll res = await RoomApi.getRoomContributeAllList(widget.rid);
        if (res.success) {
          _data = res.data;
          eventCenter.emit(
              RoomAdminScreen.Event_Refresh_Rank_Switch, res.hideRank);
        } else {
          Fluttertoast.showCenter(msg: res.msg);
        }
        break;
      case ContributeType.week:
        ResRankingContribute res =
            await RoomApi.getRoomContributeWeekList(widget.rid);
        if (res.success) {
          _data = res.data;
          eventCenter.emit(
              RoomAdminScreen.Event_Refresh_Rank_Switch, res.hideRank);
        } else {
          if (mounted) {
            Fluttertoast.showCenter(msg: res.msg);
          }
        }
        break;
      case ContributeType.charm:
        ResRankingCharm res = await RoomApi.getRoomCharmList(widget.rid);
        if (res.success) {
          _data = res.data;
          eventCenter.emit(
              RoomAdminScreen.Event_Refresh_Rank_Switch, res.hideRank);
        } else {
          Fluttertoast.showCenter(msg: res.msg);
        }
        break;
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
        !_showRankListByType(widget.contributeType)) {
      return const EmptyWidget();
    }
    return RefreshIndicatorFactory.of(
      key: _key,
      child: ListView.builder(
        itemCount: _data!.length,
        itemBuilder: (BuildContext context, int index) {
          RankList item = _data!.elementAt(index);
          return _buildItem(item, index);
        },
      ),
      onRefresh: () async {
        await _load();
        return;
      },
    );
  }

  int _getYear(int birthday) {
    if (birthday <= 0) return 0;
    DateTime now = DateTime.fromMillisecondsSinceEpoch(birthday * 1000);
    return ((DateTime.now().millisecondsSinceEpoch -
                now.millisecondsSinceEpoch) /
            86400 /
            1000 /
            365)
        .floor();
  }

  Widget _renderInfo(RankList data) {
    int year = 0;
    if (data.hasBirthday()) {
      year = _getYear(data.birthday);
    }
    int sex = data.sex;
    bool displayInfo = year > 0 && sex > 0;
    if (!displayInfo) {
      return Container();
    }
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 4),
      child: UserSexAndAgeWidget(
        sex: sex,
        age: year,
      ),
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

  Widget _buildItem(RankList data, int index) {
    return InkWell(
      onTap: () async {
        RoomNavUtil.showImage(context, data.uid, const PageRefer('AdminWeek'));
      },
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            start: 0.0, end: 16.0, top: 8.0, bottom: 8.0),
        child: Row(
          children: <Widget>[
            _showRankByType(widget.contributeType)
                ? Container(
                    width: 50.0,
                    margin: const EdgeInsetsDirectional.only(end: 5.0),
                    alignment: Alignment.center,
                    child: _renderIndex(context, index),
                  )
                : const SizedBox(width: 8),
            CommonAvatar(
              path: data.icon,
              shape: BoxShape.circle,
              size: 56,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsetsDirectional.only(start: 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16.0, color: R.color.mainTextColor),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 6),
                      child: _renderInfo(data),
                    ),
                  ],
                ),
              ),
            ),
            if (_showRankScoreByType(widget.contributeType))
              NumText(
                "${(data.money ~/ 100)}",
                style: TextStyle(
                  color: R.color.thirdBrightColor,
                  fontSize: 13.0,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

bool _showRankByType(ContributeType contributeType) {
  if (contributeType == ContributeType.week) {
    /// 房间贡献榜
    return showRankByKey(roomContributeKey);
  }
  if (contributeType == ContributeType.charm) {
    /// 房间魅力榜
    return showRankByKey(roomCharmKey);
  }
  return false;
}

bool _showRankScoreByType(ContributeType contributeType) {
  if (contributeType == ContributeType.week) {
    /// 房间贡献榜
    return showRankScoreByKey(roomContributeKey);
  }
  if (contributeType == ContributeType.charm) {
    /// 房间魅力榜
    return showRankScoreByKey(roomCharmKey);
  }
  return false;
}

bool _showRankListByType(ContributeType contributeType) {
  if (contributeType == ContributeType.week) {
    /// 房间贡献榜
    return showRankListByKey(roomContributeKey);
  }
  if (contributeType == ContributeType.charm) {
    /// 房间魅力榜
    return showRankListByKey(roomCharmKey);
  }
  return false;
}

import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/src/live/model/live_pk_invite_friend_model_v3.dart';
import 'package:chat_room/src/live/model/live_pk_recent_match_model_v3.dart';
import 'package:chat_room/src/live/model/live_repository_v3.dart';
import 'package:flutter/material.dart';

import 'live_pk_launch_v3.dart';

//pk状态 1-未开播，2-可邀请pk，3-pk中，4-未开启PK,
enum LivePKStatus {
  NoBroadcast, //未开播
  CanPK, //可邀请pk
  PKing, //pk中
  NoPK, //未开启PK
}

class LivePkSubPage extends StatefulWidget {
  final int rid;
  final LivePKSubPageType? pageType;
  final int page;
  final int pageSize;
  final Color? backgroundColor;

  final List<LivePKInviteFriendItem>? inviteData;

  const LivePkSubPage({
    super.key,
    required this.rid,
    this.pageType,
    this.backgroundColor,
    this.page = 1,
    this.pageSize = 10,
    this.inviteData,
  });

  @override
  State<LivePkSubPage> createState() => _LivePkSubPageState();
}

class _LivePkSubPageState extends State<LivePkSubPage>
    with AutomaticKeepAliveClientMixin<LivePkSubPage> {
  @override
  bool get wantKeepAlive => true;

  List<LivePKInviteFriendItem> _inviteFriendList = []; //邀请好友列表数据
  List<LivePKRecentItem> _recentMatchList = []; //最近匹配列表数据

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() async {
    if (widget.pageType == LivePKSubPageType.inviteFriend) {
      if (widget.inviteData == null) {
        _inviteFriendList =
            await LiveRepositoryV3.getInviteFriendList(widget.rid);
      } else {
        _inviteFriendList = widget.inviteData ?? [];
      }
    } else if (widget.pageType == LivePKSubPageType.recentMatch) {
      _recentMatchList = await LiveRepositoryV3.getRecentMatchList(widget.rid);
    }

    refresh();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.separated(
      padding: const EdgeInsetsDirectional.only(start: 8),
      scrollDirection: Axis.vertical,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) => _buildItem(index),
      separatorBuilder: (context, index) =>
          Container(height: 1, color: Colors.black.withOpacity(0.05)),
      itemCount: widget.pageType == LivePKSubPageType.inviteFriend
          ? _inviteFriendList.length
          : _recentMatchList.length,
    );
  }

  Widget _buildItem(int index) {
    if (widget.pageType == LivePKSubPageType.inviteFriend) {
      LivePKInviteFriendItem item = _inviteFriendList[index];
      return _getItem(
        icon: item.icon,
        sex: item.sex,
        name: item.name,
        bottomLeft: K.room_live_pk_audience_num([item.onlineNum.toString()]),
        bottomRight: K.room_live_pk_charm_num([item.charm.toString()]),
        pkType: item.pkStatus,
        uid: item.uid,
        rid: item.rid,
      );
    } else {
      LivePKRecentItem item = _recentMatchList[index];
      return _getItem(
        icon: item.icon,
        sex: item.sex,
        name: item.name,
        bottomLeft: '${item.mainScore} : ${item.competeScore}',
        bottomRight: Utility.getDateDiff(Util.parseInt(item.lastMatchTime)),
        pkType: item.pkStatus,
        uid: item.uid,
        rid: item.rid,
      );
    }
  }

  Widget _getItem({
    required String icon,
    int? sex,
    required String name,
    String bottomLeft = '',
    String bottomRight = '',
    LivePKStatus? pkType,
    int uid = 0,
    int rid = 0,
  }) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Stack(
            children: [
              CommonAvatar(
                path: icon,
                shape: BoxShape.circle,
                size: 40,
              ),
              PositionedDirectional(
                end: 4,
                bottom: 0,
                child: R.img(
                  sex == 1
                      ? RoomAssets.live_live_pk_man_webp
                      : RoomAssets.live_live_pk_woman_webp,
                  width: 12,
                  height: 12,
                  package: ComponentManager.MANAGER_BASE_ROOM,
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 8),
                      child: Text(
                        bottomLeft,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        bottomRight,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _getRightWidget(type: pkType, inviteUid: uid, inviteRid: rid),
        ],
      ),
    );
  }

  /// 右边的按钮
  Widget _getRightWidget(
      {int inviteRid = 0, int inviteUid = 0, LivePKStatus? type}) {
    if (type == LivePKStatus.NoBroadcast) {
      // 未开播
      return Container(
        width: 70,
        height: 30,
        decoration:
            commonBoxDecorationWithParams(R.colors.darkGradientColors, 15),
        alignment: Alignment.center,
        child: Text(
          K.room_pk_no_broadcast,
          style: R.textStyle.regular14.copyWith(color: Colors.black),
        ),
      );
    } else if (type == LivePKStatus.PKing) {
      // pk中
      return Container(
        width: 70,
        height: 30,
        alignment: Alignment.center,
        decoration:
            commonBoxDecorationWithParams(R.colors.darkGradientColors, 15),
        child: Text(
          K.room_in_pk,
          style: R.textStyle.regular14.copyWith(color: Colors.black),
        ),
      );
    } else if (type == LivePKStatus.CanPK) {
      // 可邀请PK
      return GestureDetector(
        onTap: () async {
          int source = 1;
          if (widget.pageType == LivePKSubPageType.inviteFriend) {
            if (widget.inviteData == null) {
              source = 1;
            } else {
              source = 3;
            }
          } else if (widget.pageType == LivePKSubPageType.recentMatch) {
            source = 2;
          }
          BaseResponse response = await LiveRepositoryV3.invitePK(
            mainRid: widget.rid,
            mainUid: Session.uid,
            inviteRid: inviteRid,
            inviteUid: inviteUid,
            inviteSource: source,
          );
          if (!(response.success == true)) {
            Fluttertoast.showToast(msg: response.msg);
          }
          Navigator.of(context).pop();
        },
        child: Container(
          decoration:
              commonBoxDecorationWithParams(R.colors.darkGradientColors, 15),
          width: 70,
          height: 30,
          alignment: Alignment.center,
          child: Text(
            K.room_apply_pk,
            style: R.textStyle.regular14.copyWith(color: Colors.black),
          ),
        ),
      );
    } else if (type == LivePKStatus.NoPK) {
      // 未开启pk
      return Container(
        width: 70,
        height: 30,
        alignment: Alignment.center,
        decoration:
            commonBoxDecorationWithParams(R.colors.darkGradientColors, 15),
        child: Text(
          K.room_pk_disabled,
          style: R.textStyle.regular14.copyWith(color: Colors.black),
        ),
      );
    }
    return Container();
  }
}

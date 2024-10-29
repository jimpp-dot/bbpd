import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/under/model/underData.dart';
import 'package:chat_room/src/under/model/underRepository.dart';

import 'custom_nonscroll_gridview.dart';
import 'under_user_icon.dart';

class UnderGameResult extends StatefulWidget {
  final int? rid;
  final List<int>? winners;
  final List<int>? losers;
  final String? underWord;
  final String? populaceWord;
  final String? winType;
  final RoomPosition? positionForCurrentUser;
  final List<RoomPosition> roomPositions;

  const UnderGameResult(
      {super.key,
      this.winners,
      this.losers,
      this.underWord,
      this.populaceWord,
      this.winType,
      this.rid,
      required this.roomPositions,
      this.positionForCurrentUser});

  @override
  _UnderGameResultState createState() => _UnderGameResultState();
}

class _UnderGameResultState extends State<UnderGameResult> {
  List<int> followedUids = [];

  @override
  void initState() {
    super.initState();
    _loadFollow();
  }

  _loadFollow() async {
    List<int> uids = [];
    for (var element in widget.roomPositions) {
      if (element.uid > 0) {
        uids.add(element.uid);
      } else if (element.underData!.gameUnderOrigin > 0) {
        uids.add(element.underData!.gameUnderOrigin);
      }
    }

    followedUids = await UnderRepository.getFollowedUids(uids);
    followedUids.add(Session.uid);

    if (mounted) setState(() {});
  }

  Future<void> _onFollow(RoomPosition roomPosition) async {
    if (Session.isLogined == false) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }

    int followUid = roomPosition.uid > 0
        ? roomPosition.uid
        : roomPosition.underData!.gameUnderOrigin;
    UnderRepository.follow(followUid).then((success) {
      if (success) _loadFollow();
    });
  }

  Widget _buildFollowButton(RoomPosition roomPosition) {
    bool isFollowed = followedUids.contains(roomPosition.uid > 0
        ? roomPosition.uid
        : roomPosition.underData!.gameUnderOrigin);
    isFollowed |= Session.uid ==
        (roomPosition.uid > 0
            ? roomPosition.uid
            : roomPosition.underData!.gameUnderOrigin);

    if (isFollowed) return Container();
    return Container(
      width: 48,
      height: 20,
      decoration: BoxDecoration(
          color: const Color(0xFF32BF60),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.add,
            color: Colors.white,
            size: 8.0,
          ),
          Text(
            '关注',
            style: R.textStyle.subCaption.copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget _buildUserItem(RoomPosition position) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        bool isFollowed = followedUids.contains(position.uid > 0
            ? position.uid
            : position.underData!.gameUnderOrigin);
        isFollowed |= Session.uid ==
            (position.uid > 0
                ? position.uid
                : position.underData!.gameUnderOrigin);

        if (isFollowed) return;
        _onFollow(position);
      },
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: <Widget>[
          HeadIcon(
            icon: '${System.imageDomain}${position.icon}!head150',
            width: 56,
            height: 56,
          ),
          PositionedDirectional(
              start: 6,
              top: 0,
              child: UnderIconPositionWidget(text: '${position.position + 1}')),
          Positioned(
            top: 42,
            child: _buildFollowButton(position),
          ),
          Positioned(
              top: 66,
              child: LimitedBox(
                maxWidth: 60,
                child: Text(
                  position.name,
                  maxLines: 1,
                  style: R.textStyle.caption.copyWith(color: Colors.black),
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    RoomPosition? roomPosition = widget.positionForCurrentUser;
    bool isPopulaceWin = widget.winType == 'populace';

    String bgImg = 'bg_under_result_title_win.png';
    String txt = isPopulaceWin
        ? '${K.room_civilian}${K.win}'
        : '${K.room_under}${K.win}';
    if (roomPosition != null) {
      if (roomPosition.underData?.gameUnderRole == GameUnderRole.Under ||
          roomPosition.underData?.gameUnderRole == GameUnderRole.Under_Loser) {
        //卧底
        txt = isPopulaceWin
            ? '${K.room_under}${K.lose}'
            : '${K.room_under}${K.win}';
        bgImg = isPopulaceWin
            ? 'bg_under_result_title_lose.png'
            : 'bg_under_result_title_win.png';
      } else {
        //平民
        txt = isPopulaceWin
            ? '${K.room_civilian}${K.win}'
            : '${K.room_civilian}${K.lose}';
        bgImg = isPopulaceWin
            ? 'bg_under_result_title_win.png'
            : 'bg_under_result_title_lose.png';
      }
    }

    return SizedBox(
      width: 198,
      height: 108,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          CachedNetworkImage(
              imageUrl: Util.getImgUrl('under/$bgImg',
                  package: ComponentManager.MANAGER_BASE_ROOM),
              width: 198,
              height: 108),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              txt,
              style:
                  R.textStyle.title.copyWith(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPart(Color color, bool isUnder, List<RoomPosition> users) {
    String roleText = isUnder ? K.room_under : K.room_civilian;
    double itemHeight = 90;
    double itemWidth = 84;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
            width: 48,
            height: 20,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Text(
              roleText,
              style: R.textStyle.subCaption.copyWith(color: Colors.white),
            )),
        Container(
          height: 4,
        ),
        Text(
          (isUnder ? widget.underWord : widget.populaceWord) ?? '',
          style: R.textStyle.title.copyWith(color: color, fontSize: 20),
        ),
        Container(
          height: 4,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(26.5),
          ),
          padding: const EdgeInsetsDirectional.only(top: 12),
          child: CustomNonScrollGridView(
            itemHeight: itemHeight,
            itemWidth: itemWidth,
            columnCount: isUnder ? 1 : 2,
            children: users.map((element) => _buildUserItem(element)).toList(),
          ),
        ),
        if (isUnder)
          GestureDetector(
            onTap: () {
              IRoomManager roomManager = ComponentManager.instance
                  .getManager(ComponentManager.MANAGER_BASE_ROOM);
              roomManager.openContributeWordScreen(context);
            },
            child: Container(
              height: itemHeight,
              alignment: Alignment.center,
              child: Text(
                K.room_want_to_contribute,
                maxLines: 1,
                style: R.textStyle.caption.copyWith(
                    color: const Color(0xFF4DA4FC),
                    decoration: TextDecoration.underline),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildContent() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildPart(
            const Color(0xFFFF5353),
            false,
            widget.roomPositions.where((positionItem) {
              return positionItem.underData?.gameUnderRole ==
                      GameUnderRole.Populace ||
                  positionItem.underData?.gameUnderRole ==
                      GameUnderRole.Populace_Loser;
            }).toList()),
        const SizedBox(
          width: 21,
          height: 1,
        ),
        _buildPart(
            const Color(0xFF1861AA),
            true,
            widget.roomPositions.where((positionItem) {
              return positionItem.underData?.gameUnderRole ==
                      GameUnderRole.Under ||
                  positionItem.underData?.gameUnderRole ==
                      GameUnderRole.Under_Loser;
            }).toList()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(bottom: 52),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Positioned.fill(
                child: Padding(
              padding: const EdgeInsetsDirectional.only(
                top: 52,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFD7EBFF),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            )),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 52),
              child: CachedNetworkImage(
                imageUrl: Util.getImgUrl('under/bg_under_result_top.png',
                    package: ComponentManager.MANAGER_BASE_ROOM),
                width: 328,
                height: 150,
              ),
            ),
            Padding(
                padding: const EdgeInsetsDirectional.only(top: 144, bottom: 24),
                child: _buildContent()),
            _buildTitle(),
          ],
        ),
      ),
    );
  }
}

import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';

class LiveItemWidget extends StatefulWidget {
  final RoomItemModel item;
  final RoomFrom? roomFrom;
  final String? refer;
  final VoidCallback? onItemClick;

  const LiveItemWidget(
      {super.key,
      required this.item,
      this.roomFrom,
      this.refer,
      this.onItemClick});

  @override
  LiveItemWidgetState createState() => LiveItemWidgetState();
}

class LiveItemWidgetState extends State<LiveItemWidget> {
  void onTapItem(RoomItemModel room) {
    _onTapItem(room);
  }

  Widget buildAvatar(RoomItemModel item) {
    return _buildAvatar(item);
  }

  Widget buildInfo(RoomItemModel item) {
    return _buildInfo(item);
  }

  Widget buildNameAndFrame(RoomItemModel room) {
    return _buildNameAndFrame(room);
  }

  Color get mainTextColor => R.color.mainTextColor;

  Color get secondTextColor => R.color.secondTextColor;

  @override
  Widget build(BuildContext context) {
    double verticalGap = R.dimen.cardVerticalGap;
    double sideMargin = 20.0;
    return GestureDetector(
      onTap: () {
        _onTapItem(widget.item);
      },
      child: Container(
        height: 90,
        margin: EdgeInsetsDirectional.only(
            top: verticalGap / 2,
            bottom: verticalGap / 2,
            start: sideMargin,
            end: sideMargin),
        decoration: BoxDecoration(
          color: R.color.mainBgColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            getCardBoxShadow(),
          ],
        ),
        child: Row(
          children: <Widget>[
            _buildAvatar(widget.item),
            Expanded(child: _buildInfo(widget.item)),
          ],
        ),
      ),
    );
  }

  void _onTapItem(RoomItemModel room) {
    int rid = room.rid;
    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.openChatRoomScreenShow(context, rid,
        from: widget.roomFrom, refer: widget.refer, checkVideoGuide: true);

    if (widget.onItemClick != null) {
      widget.onItemClick!();
    }
  }

  Widget _buildAvatar(RoomItemModel item) {
    Radius radius = const Radius.circular(12);

    return Stack(
      children: [
        CommonAvatar(
          path: item.roomIcon,
          sex: item.sex,
          size: 90,
          borderRadius: BorderRadiusDirectional.only(
              topStart: radius, bottomStart: radius),
        ),
        if (item.rid > 0)
          PositionedDirectional(
            start: 9,
            bottom: 9,
            child: RepaintBoundary(
              child: R.img(
                BaseAssets.avatar_in_room_webp,
                package: ComponentManager.MANAGER_BASE_CORE,
                width: 12,
                height: 12,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildInfo(RoomItemModel item) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildNameAndFrame(item),
          const SizedBox(
            height: 8,
          ),
          Padding(
              padding: const EdgeInsetsDirectional.only(end: 12),
              child: Row(
                children: [
                  _buildLabels(item),
                  Expanded(child: Container()),
                  if (item.hourRank != 0) _buildRankHour(item),
                ],
              )),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: _buildUserName(item),
          ),
        ],
      ),
    );
  }

  Widget _buildRankHour(RoomItemModel item) {
    return Container(
      width: 72,
      height: 16,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(R.imagePath(Assets.live_rank_hour_png,
              package: ComponentManager.MANAGER_RANK)),
          fit: BoxFit.cover,
        ),
      ),
      child: Text(K.rank_hour_num([item.hourRank.toString()]),
          style: const TextStyle(
              color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500)),
    );
  }

  Widget _buildLabels(RoomItemModel item) {
    return IntrinsicWidth(
      child: Container(
        height: 16,
        padding: const EdgeInsetsDirectional.only(
          start: 5,
          end: 5,
        ),
        alignment: AlignmentDirectional.center,
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          gradient: LinearGradient(
            colors: (item.tag.bgColors?.length ?? 0) >= 2
                ? item.tag.bgColors!
                : [const Color(0xff6fffe8), const Color(0xff6eb6ff)],
          ),
        ),
        child: Text(
          item.tag.label ?? '',
          style: TextStyle(
            color: R.color.mainBgColor,
            fontSize: 9,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildHot(RoomItemModel item) {
    List<Widget> widgets = [
      Padding(
        padding: const EdgeInsetsDirectional.only(end: 3.0, bottom: 2.0),
        child: R.img(
          Assets.room_hot_svg,
          package: ComponentManager.MANAGER_RANK,
          width: 12.0,
          height: 12.0,
        ),
      ),
      Padding(
        padding: const EdgeInsetsDirectional.only(bottom: 1.0),
        child: NumText(
          Utility.getRoundOnline(item.onlineNum, item.realNum, item.types)
              .toString(),
          style: TextStyle(
            color: const Color(0xfffd7b08).withOpacity(0.4),
            fontSize: 13,
            fontWeight: FontWeight.w500,
            height: 1.2,
          ),
        ),
      ),
    ];
    return widgets;
  }

  Widget _buildUserName(RoomItemModel room) {
    bool showBusy = _showBusy(room);
    String prefix = '';
    if (room.isGameRoom || room.types == 'auto') {
      prefix = '';
    } else if (room.types == 'radio-defend' || room.types == 'live') {
      prefix = '[${K.rank_anchor}]';
    } else if (room.type == 'ktv') {
      prefix = '[${K.rank_role_creator}]';
    } else {
      if (room.roomProperty == 'vip' || room.roomProperty == 'private') {
        //个人房显示为房主
        prefix = '[${K.rank_role_creator}]';
      } else {
        prefix = '[${K.rank_reception}]';
      }
    }
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            '$prefix${room.userName}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13,
              color: secondTextColor,
              height: 1.2,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        if (!showBusy) ..._buildHot(room),
        if (showBusy) _buildBusy(room),
      ],
    );
  }

  //房间标题及运营角标
  Widget _buildNameAndFrame(RoomItemModel room) {
    bool hasFrame = widget.item.frame.isNotEmpty;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(child: _buildRoomName(room, hasFrame)),
        if (hasFrame)
          CachedNetworkImage(
              imageUrl:
                  '${System.imageDomain}static/head/${widget.item.frame}.png',
              fit: BoxFit.fill,
              width: 52,
              height: 16),
      ],
    );
  }

  Widget _buildRoomName(RoomItemModel item, bool hasFrame) {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      padding: EdgeInsetsDirectional.only(top: 10, end: hasFrame ? 0 : 12),
      child: Text(
        item.roomName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: mainTextColor,
          fontSize: 16,
          height: 1.2,
        ),
      ),
    );
  }

  Widget renderLabel(RoomItemModel room) {
    return Container(
      height: 16,
      decoration: BoxDecoration(
        color: Color(int.parse("0xFF${(room.tag.color ?? '').substring(1)}")),
        borderRadius: BorderRadius.circular(4),
      ),
      alignment: Alignment.center,
      margin: const EdgeInsetsDirectional.only(end: 4.0),
      padding: const EdgeInsetsDirectional.only(
        start: 4,
        end: 4,
        bottom: 1,
      ),
      child: Text(
        room.tag.label ?? '',
        maxLines: 1,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
        ),
      ),
    );
  }

  Widget _buildBusy(RoomItemModel item) {
    String busyStatus =
        item.isBusy ? R.string('rank_busy') : R.string('rank_leisure');
    return Text(
      busyStatus,
      style: TextStyle(
        fontSize: 11,
        color: item.isBusy
            ? mainTextColor.withOpacity(0.2)
            : R.color.mainBrandColor,
        height: 1.2,
      ),
    );
  }

  bool _showBusy(RoomItemModel item) {
    return item.types == 'order' || item.types == 'cp';
  }
}

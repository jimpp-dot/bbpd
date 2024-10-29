import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';

/// note：狼人杀Online继承使用了该item
class RoomListItem extends StatelessWidget {
  final RoomItemModel room;
  final RoomFrom? roomFrom;
  final String? refer;
  final double? headSize;
  final bool onlyShowTwoLine;
  final GestureTapCallback? customTap;

  const RoomListItem(
      {super.key,
      required this.room,
      this.roomFrom,
      this.refer,
      this.headSize,
      this.onlyShowTwoLine = false,
      this.customTap});

  onTap(BuildContext context, RoomItemModel room) {
    int rid = room.rid;
    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.openChatRoomScreenShow(context, rid,
        from: roomFrom, refer: refer);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (customTap != null) {
          customTap!();
        } else {
          onTap(context, room);
        }
      },
      child: SizedBox(
        height: onlyShowTwoLine ? 56 : 92,
//        margin: EdgeInsetsDirectional.only(
//          start: 18,
//          end: 18,
//        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              renderImageWithPassword(context, room),
              Expanded(
                child: Container(
                  padding: const EdgeInsetsDirectional.only(start: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          renderLabel(room),
                          Expanded(
                            child: Text(
                              getName(room.roomName),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: R.color.mainTextColor,
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0, bottom: 3.0),
                        child: renderInfo(context, room),
                      ),
                      if (!onlyShowTwoLine) renderName(context, room),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget renderImageWithPassword(BuildContext context, RoomItemModel room) {
    List<Widget> res = [_renderImage(context, room)];
    if (room.effect.isNotEmpty) {
      res.add(PositionedDirectional(
        start: -12,
        top: -12,
        width: 96.0,
        height: 96.0,
        child: CachedNetworkImage(
          imageUrl: '${System.imageDomain}static/head/${room.effect}.png',
          fit: BoxFit.cover,
          width: 96.0,
          height: 96.0,
        ),
      ));
    }
    if (room.isPassword) {
      res.add(PositionedDirectional(
        end: 5.0,
        bottom: 5.0,
        width: 13.5,
        height: 16.0,
        child: R.img(Assets.room_password_png,
            width: 13.5, height: 16.0, package: ComponentManager.MANAGER_RANK),
      ));
    }

    bool hasPrefix = room.prefix.isNotEmpty;
    if (hasPrefix) {
      res.add(Positioned(
        bottom: 0.0,
        child: IgnorePointer(
          child: Container(
            width: 72.0,
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.only(
                  left: 9.0, right: 9.0, top: 3, bottom: 2),
              decoration: const ShapeDecoration(
                  color: Color(0xFFEDEDED), shape: StadiumBorder()),
              child: NumText(
                room.prefix,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 10.0,
                  color: Color(0xFF4A4A4A),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ));
    }

    if (room.frame.isNotEmpty) {
      // 年度盛典头像框,尺寸与effect图片不一致，新增了一个frame字段
      res.add(PositionedDirectional(
        start: -8,
        top: -8,
        width: 88.0,
        height: 88.0,
        child: CachedNetworkImage(
          imageUrl: '${System.imageDomain}static/head/${room.frame}.png',
          fit: BoxFit.cover,
          width: 88.0,
          height: 88.0,
        ),
      ));
    }

    return Stack(
      clipBehavior: Clip.none,
      children: res,
    );
  }

  Widget _renderImage(BuildContext context, RoomItemModel room) {
//    return CommonAvatar(
//      path: room.roomIcon,
//      size: 72,
//      shape: BoxShape.circle,
//    );
    return CommonAvatar(
      size: headSize ?? 72,
      shape: BoxShape.circle,
      path: room.roomIcon,
    );
  }

  Widget renderLabel(RoomItemModel room) {
    return Container(
      height: 16,
      decoration: BoxDecoration(
        color: (room.tag.color != null)
            ? Color(int.parse("0xFF${(room.tag.color ?? '').substring(1)}"))
            : R.color.mainBgColor,
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
        style: TextStyle(
          color: room.tag.tagColor ?? Colors.white,
          fontSize: 11,
        ),
      ),
    );
  }

//  String _getUserTitleName(int title) {
//    if (title > 0 && title <= 5) {
//      return R.array('rank_title_array')[title - 1];
//    } else {
//      return '';
//    }
//  }

  Widget renderInfo(BuildContext context, RoomItemModel room) {
    if (room.isGameRoom) {
      //是否游戏房,如卧底房/你画我猜/狼人杀
      List<Widget> res = [];
      if (room.gameProcess != 'wait') {
        //游戏中
        res.add(Text(
          K.rank_gaming,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Theme.of(context).primaryColor),
        ));
      } else if (room.numGirl + room.numBoy > 0) {
        if (room.numGirl > 0) {
          res.add(Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 2.0),
                child: R.img(Assets.slp_female_png,
                    width: 10.0,
                    height: 12.0,
                    package: ComponentManager.MANAGER_RANK),
              ),
              NumText(
                room.numGirl.toString(),
                style:
                    const TextStyle(color: Color(0xFFFF4A82), fontSize: 13.0),
              )
            ],
          ));
        }

        if (room.numBoy > 0) {
          res.add(Container(
            width: 5.0,
          ));
          res.add(Padding(
            padding: const EdgeInsetsDirectional.only(end: 2.0),
            child: R.img(Assets.slp_male_png,
                width: 10.0,
                height: 12.0,
                package: ComponentManager.MANAGER_RANK),
          ));
          res.add(NumText(
            room.numBoy.toString(),
            style: const TextStyle(color: Color(0xFF55C3FF), fontSize: 13.0),
          ));
        }
      }
      return Row(
        children: res,
      );
    } else if (room.types == 'auto') {
      // 产品需求：聊天统一展示男女人数
      List<Widget> res = [];
      if (room.numGirl + room.numBoy > 0) {
        if (room.numGirl > 0) {
          res.add(Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 2.0),
                child: R.img(Assets.slp_female_png,
                    width: 10.0,
                    height: 12.0,
                    package: ComponentManager.MANAGER_RANK),
              ),
              NumText(
                room.numGirl.toString(),
                style:
                    const TextStyle(color: Color(0xFFFF4A82), fontSize: 13.0),
              )
            ],
          ));
        }

        if (room.numBoy > 0) {
          res.add(Container(
            width: 5.0,
          ));
          res.add(Padding(
            padding: const EdgeInsetsDirectional.only(end: 2.0),
            child: R.img(Assets.slp_male_png,
                width: 10.0,
                height: 12.0,
                package: ComponentManager.MANAGER_RANK),
          ));
          res.add(NumText(
            room.numBoy.toString(),
            style: const TextStyle(color: Color(0xFF55C3FF), fontSize: 13.0),
          ));
        }
      }

      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: res,
      );
    } else {
      List<Widget> res = [];
      if (room.types == 'order' || room.types == 'cp') {
        String display = room.types == 'order' ? K.rank_order : K.rank_leisure;
        res.add(Text(
          room.isBusy ? K.rank_busy : display,
          style: TextStyle(
              color: Color(room.isBusy ? 0xffB4B4B4 : 0xff27B5FF),
              fontSize: 12.0),
        ));
      } else {
        res.add(Padding(
          padding: const EdgeInsetsDirectional.only(end: 3.0),
          child: R.img(
            BaseAssets.room_rank_room_hot_small_svg,
            color: R.color.mainBrandColor,
            package: ComponentManager.MANAGER_BASE_CORE,
            width: 9.0,
            height: 12.0,
          ),
        ));
        res.add(Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: NumText(
            Utility.getRoundOnline(room.onlineNum, room.realNum, room.types)
                .toString(),
            style: R.textStyle.caption.copyWith(color: R.color.mainBrandColor),
          ),
        ));
      }

      if (room.tag.isFollow) {
        res.add(Padding(
          padding: const EdgeInsets.only(left: 6.0),
          child: Text(
            K.rank_has_attention,
            style: const TextStyle(color: Color(0xffB4B4B4), fontSize: 12.0),
          ),
        ));
      }
      return Row(
        children: res,
      );
    }
  }

  // 可能被外部重写
  TextStyle? getUserNameStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall;

  Widget renderName(BuildContext context, RoomItemModel room) {
    String prefix = '';
    if (room.isGameRoom || room.types == 'auto') {
      prefix = '';
    } else {
      prefix = room.types == 'radio-defend' ? K.rank_anchor : K.rank_reception;
      prefix = '[$prefix]';
    }

    return Text(
      '$prefix${room.userName}',
      maxLines: 1,
      style: getUserNameStyle(context),
    );
  }

  String getName(String name) {
    int start = name.indexOf("[");
    int end = name.indexOf("]");
    if (start == 0 && end > -1) {
      String nName = name.safeSubstring(end + 1);
      return nName.isEmpty ? name : nName;
    }
    return name;
  }
}

import 'package:chat/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 邀请加入房间item
class DisplayInviteRoom extends StatefulWidget {
  final MessageContent message;
  final Map extra;

  const DisplayInviteRoom(
      {super.key, required this.message, required this.extra});

  @override
  State<StatefulWidget> createState() {
    return DisplayInviteRoomState();
  }
}

class DisplayInviteRoomState extends State<DisplayInviteRoom> {
  late IRoomManager _roomManager;

  @override
  void initState() {
    super.initState();
    _roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
  }

  @override
  Widget build(BuildContext context) {
    String pic = "${System.imageDomain + widget.extra['icon']}!head100";
    String prefix = widget.extra['prefix'];
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: InkWell(
        onTap: () {
          Map extra = widget.extra;
          int rid = Util.parseInt(extra['rid']);
          int inviterUid = Util.parseInt(extra['from']);
          bool isGsRecommend =
              extra['source'] != null && extra['source'] == 'gs_recommend';

          //聊天邀请进房
          _roomManager.openChatRoomScreenShow(context, rid,
              inviterUid: inviterUid,
              refer: isGsRecommend ? 'gs_1v1_recommend' : 'message_card');
        },
        child: Row(
          children: <Widget>[
            _buildIcon(pic, prefix),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: 15.0,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                        margin: const EdgeInsetsDirectional.only(end: 4.0),
                        decoration: BoxDecoration(
                            color: R.colors.fourthBrightColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(2.0))),
                        child: Text(
                          widget.extra['tagName'],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 10.0),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.extra['name'],
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 14.0, color: R.colors.mainTextColor),
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 5.0,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        K.invite_to_join,
                        style: TextStyle(
                            fontSize: 12.0, color: R.colors.secondTextColor),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// 创建头像 和底部prefix
  Widget _buildIcon(String pic, String? prefix) {
    return SizedBox(
      width: 50.0,
      height: 50.0,
      child: Stack(
        children: <Widget>[
          ClipOval(
            child: CachedNetworkImage(imageUrl: pic, width: 50.0, height: 50.0),
          ),
          PositionedDirectional(
            bottom: 0.0,
            start: 0.0,
            end: 0.0,
            height: 14.0,
            child: prefix != null && prefix.isNotEmpty
                ? Center(
                    child: Container(
                      width: 34.0,
                      height: 14.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: R.colors.fourthBrightColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(7.0)),
                      ),
                      child: Text(
                        prefix,
                        style: const TextStyle(
                            fontSize: 10.0, color: Colors.white),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}

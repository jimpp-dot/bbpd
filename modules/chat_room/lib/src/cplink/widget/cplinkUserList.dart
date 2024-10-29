import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/cplink/model/cpSceneModel.dart';
import 'package:chat_room/src/cplink/widget/cplink_user_icon.dart';

class CpLinkUserList extends StatefulWidget {
  final ChatRoomData room;
  final bool displayEmoteAtMic;

  const CpLinkUserList(
      {Key? key, required this.room, required this.displayEmoteAtMic})
      : super(key: key);

  @override
  CpLinkUserListState createState() {
    return CpLinkUserListState();
  }
}

class CpLinkUserListState extends State<CpLinkUserList> {
  double bigIconR = 33.0;

  @override
  void initState() {
    super.initState();
    autoJoinMic();
  }

  @override
  void dispose() {
    super.dispose();
  }

  autoJoinMic() async {
    if (widget.room.positions.length == 2) {
      RoomPosition firstPosition = widget.room.positions.first;
      RoomPosition lastPosition = widget.room.positions.last;
      if (firstPosition.uid != Session.uid && lastPosition.uid != Session.uid) {
        //不在麦上
        if (firstPosition.uid == 0) {
          //麦上没人
          Map? result = await RoomRepository.joinMic(
            widget.room.rid,
            firstPosition.position,
            uid: Session.uid,
            toastError: false,
            toastSuccess: false,
          );
          if (result != null && result['success'] == true) {
          } else {
            await RoomRepository.joinMic(
              widget.room.rid,
              lastPosition.position,
              uid: Session.uid,
              toastError: false,
              toastSuccess: false,
            );
          }
        } else if (lastPosition.uid == 0) {
          await RoomRepository.joinMic(
            widget.room.rid,
            lastPosition.position,
            uid: Session.uid,
            toastError: false,
            toastSuccess: false,
          );
        }
      }
    }
  }

  String _formatValue(int value) {
    if (value >= 10000) {
      return '${(value / 10000.0).toStringAsFixed(2)}w';
    } else {
      return '$value';
    }
  }

  Widget userIconWidget(RoomPosition position) {
    double iconSize = bigIconR * 2;

    return IgnorePointer(
      ignoring: Session.uid == position.uid,
      child: CpLinkUserIcon(
        iconSize: iconSize,
        room: widget.room,
        isAnimating: false,
        roomPosition: position,
        isScene: true,
        displayEmote: widget.displayEmoteAtMic,
        assist: widget.room.cpLinkAssist,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.room.config == null) {
      return Container();
    }

    if (widget.room.positions.length != 2) {
      return Container();
    }
    int heartValue = 0;
    String backgroundUrl = '';
    String titleImageUrl = '';
    if (widget.room.config?.configExpendData != null &&
        widget.room.config?.configExpendData is CpSceneModel) {
      CpSceneModel model = widget.room.config?.configExpendData as CpSceneModel;
      heartValue = model.heartValue;
      if (model.background.isNotEmpty)
        backgroundUrl = '${System.imageDomain}${model.background}';
      if (model.titleImage.isNotEmpty)
        titleImageUrl = '${System.imageDomain}${model.titleImage}';
    }

    double backgroundW = Util.ratio * 335;
    double backgroundH = Util.ratio * 180;
    double titleImageW = Util.ratio * 149;
    double titleImageH = Util.ratio * 67;

    return Container(
      width: Util.width,
      height: 105 + backgroundH + 95,
      padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          if (backgroundUrl.isNotEmpty)
            PositionedDirectional(
              width: backgroundW,
              height: backgroundH,
              child: CachedNetworkImage(
                imageUrl: backgroundUrl,
                fit: BoxFit.fill,
                errorWidget: Container(),
                placeholder: Container(),
              ),
            ),
          if (titleImageUrl.isNotEmpty)
            PositionedDirectional(
              width: titleImageW,
              height: titleImageH,
              top: 95 - titleImageH / 2.0,
              start: 35 * Util.ratio,
              child: CachedNetworkImage(
                imageUrl: titleImageUrl,
                fit: BoxFit.fill,
                errorWidget: Container(),
                placeholder: Container(),
              ),
            ),
          PositionedDirectional(
            width: 224 * Util.ratio,
            height: 88 * Util.ratio,
            child: R.img(
              'cplink/cplink_link_big.png',
              package: ComponentManager.MANAGER_BASE_ROOM,
            ),
          ),
          PositionedDirectional(
            child: Text(
              _formatValue(heartValue),
              style: const TextStyle(color: Color(0xFFFEFEFE), fontSize: 14),
            ),
          ),
          PositionedDirectional(
            end: (Util.width / 2) + 80 * Util.ratio,
            child: userIconWidget(widget.room.positions[0]),
          ),
          PositionedDirectional(
            start: (Util.width / 2) + 80 * Util.ratio,
            child: userIconWidget(widget.room.positions[1]),
          )
        ],
      ),
    );
  }
}

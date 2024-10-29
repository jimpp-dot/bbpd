import 'package:shared/shared.dart';
import 'package:chat_room/src/base/util/god_tag_util.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/cplink/model/cplink_model.dart';
import 'package:chat_room/src/cplink/model/cplink_repo.dart';
import 'package:chat_room/src/cplink/util/cplink_util.dart';
import 'package:chat_room/src/cplink/widget/cplink_user_icon.dart';
import '../../../k.dart';

class CpLinkOperatePanel extends StatefulWidget {
  final ChatRoomData room;
  final RelationshipData? relationData;
  final Map<int, bool>? speakers;
  final bool displayEmote;
  final Widget stepWidget;
  final Widget counterWidget;
  final int? checkedRelationIndex;
  final Function(int checkedRelationIndex)? setCheckedRelationIndex;

  const CpLinkOperatePanel({
    Key? key,
    required this.room,
    this.relationData,
    this.speakers,
    required this.displayEmote,
    required this.stepWidget,
    required this.counterWidget,
    this.checkedRelationIndex,
    this.setCheckedRelationIndex,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CpLinkOperatePanelState();
}

class _CpLinkOperatePanelState extends State<CpLinkOperatePanel> {
  CpLinkConfigData? get cpLinkData =>
      widget.room.config?.configExpendData as CpLinkConfigData?;

  int? get _checkedRelationIndex {
    if (widget.checkedRelationIndex != null) return widget.checkedRelationIndex;

    return null;
  }

  set _checkedRelationIndex(int? checkedRelationIndex) {
    if (widget.setCheckedRelationIndex != null) {
      widget.setCheckedRelationIndex!(checkedRelationIndex ?? 0);
    }
  }

  bool isHand() {
    return cpLinkData?.state == CpLinkState.hand;
  }

  @override
  void initState() {
    super.initState();
    _checkedRelationIndex = null;
  }

  _onAssistTap() async {
    bool result =
        await CpLinkModel.assist(widget.room.rid, !widget.room.cpLinkAssist);
    if (result == true) {
      widget.room.cpLinkAssist = !widget.room.cpLinkAssist;
      if (mounted) setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildControl();
  }

  Widget _buildControl() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildMicUser(widget.room.positions[0], end: false),
        Expanded(child: _buildOperate(context)),
        _buildMicUser(widget.room.positions[7]),
      ],
    );
  }

  Widget _buildMicUser(RoomPosition roomPosition, {bool end = true}) {
    double paddingEnd = 8;
    double paddingStart = 0;
    if (!end) {
      paddingEnd = 0;
      paddingStart = 8;
    }

    bool isUserNotEmpty = roomPosition.uid > 0;

    String godTagIcon = GodTagUtil.getGodTagByUid(roomPosition.uid);
    return Column(
      children: [
        Container(
          width: 70,
          height: 68,
          alignment: end
              ? AlignmentDirectional.centerEnd
              : AlignmentDirectional.centerStart,
          padding:
              EdgeInsetsDirectional.only(end: paddingEnd, start: paddingStart),
          child: CpLinkUserIcon(
            iconSize: 48,
            room: widget.room,
            displayEmote: widget.displayEmote,
            roomPosition: roomPosition,
          ),
        ),
        Container(
          width: 70,
          padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
          alignment: AlignmentDirectional.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (godTagIcon.isNotEmpty)
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 2),
                  child: R.img(godTagIcon, height: 12, fit: BoxFit.fitHeight),
                ),
              Flexible(
                child: Text(
                  //没有user的时候占位
                  isUserNotEmpty ? roomPosition.name : "0",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: isUserNotEmpty
                          ? const Color(0xCCFEFEFE)
                          : Colors.transparent,
                      fontSize: 12),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Container _buildOperate(BuildContext context) {
    const Color bgColor = Color(0xFF6617A5);
    bool isAdmin = Session.uid == widget.room.positions[0].uid;
    List<Widget> adminList = [
      const SizedBox(height: 8),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: _onAssistTap,
            child: Container(
              width: 64,
              height: 24,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: bgColor,
              ),
              child: Text(
                widget.room.cpLinkAssist
                    ? K.room_cp_link_assist_off
                    : K.room_cp_link_assist_on,
                style: const TextStyle(fontSize: 11, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: () async {
              if (isHand()) {
                if (!CpLinkUtil.isHost(widget.room)) {
                  return;
                }
                String shpId = "";
                if (_checkedRelationIndex != null &&
                    widget.relationData?.relationships.isNotEmpty == true) {
                  Relationship relationShip = widget
                      .relationData!.relationships[_checkedRelationIndex ?? 0];
                  shpId = relationShip.id.toString();
                  _checkedRelationIndex = null;
                }
                BaseResponse? resp = await CpLinkRepo.finishLink(
                    widget.room.rid,
                    widget.room.positions[2].uid,
                    widget.room.positions[5].uid,
                    shpId);
                if (resp != null && resp.success == true) {
                } else {
                  String msg = resp?.msg ?? "error";
                  Fluttertoast.showToast(msg: msg);
                }
              } else {
                CpLinkModel.nextStep(context, widget.room);
              }
            },
            child: Container(
              width: 64,
              height: 24,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: bgColor,
              ),
              child: Text(
                isHand() ? K.room_cplink_complete : K.room_cplink_next,
                style: TextStyle(
                    fontSize: 11, color: Colors.white.withOpacity(0.7)),
              ),
            ),
          ),
        ],
      )
    ];

    return Container(
      padding: const EdgeInsetsDirectional.only(top: 8),
      alignment: AlignmentDirectional.center,
      child: Column(
        children: [
          widget.stepWidget,
          const SizedBox(height: 11),
          widget.counterWidget,
          const SizedBox(height: 6),
          if (isAdmin) ...adminList,
        ],
      ),
    );
  }
}

import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/src/base/util/god_tag_util.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/cplink/model/cplink_model.dart';
import 'package:chat_room/src/cplink/model/cplink_repo.dart';
import 'package:chat_room/src/cplink/util/cplink_util.dart';
import 'package:chat_room/src/cplink/widget/cplink_user_icon.dart';
import 'cplink_select_relation_dialog.dart';

class CpLinkV2OperatePanel extends StatefulWidget {
  final ChatRoomData room;
  final bool displayEmote;
  final Widget stepWidget;
  final Widget counterWidget;
  final int? checkedRelationIndex;
  final Function(int checkedRelationIndex)? setCheckedRelationIndex;

  const CpLinkV2OperatePanel({
    Key? key,
    required this.room,
    required this.displayEmote,
    required this.stepWidget,
    required this.counterWidget,
    this.checkedRelationIndex,
    this.setCheckedRelationIndex,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CpLinkV2OperatePanelState();
  }
}

class _CpLinkV2OperatePanelState extends State<CpLinkV2OperatePanel> {
  CpLinkConfigData? get cpLinkData =>
      widget.room.config?.configExpendData as CpLinkConfigData?;

  set _checkedRelationIndex(int? checkedRelationIndex) {
    if (widget.setCheckedRelationIndex != null) {
      widget.setCheckedRelationIndex!(checkedRelationIndex ?? 0);
    }
  }

  bool isHand() {
    return cpLinkData?.state == CpLinkState.hand;
  }

  bool isHeart() {
    return cpLinkData?.state == CpLinkState.heart;
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
          child: _renderNameWithTag(isUserNotEmpty,
              isUserNotEmpty ? roomPosition.name : "0", roomPosition.uid),
        )
      ],
    );
  }

  Widget _renderNameWithTag(bool isUserNotEmpty, String? name, int uid) {
    String godTagIcon = GodTagUtil.getGodTagByUid(uid);
    List<Widget> list = [];
    // 标签
    if (!Util.isStringEmpty(godTagIcon)) {
      list.add(
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 3),
          child: CachedNetworkImage(
            imageUrl: Util.getRemoteImgUrl(godTagIcon),
            height: 12,
            fit: BoxFit.fitHeight,
          ),
        ),
      );
    }
    Widget nameWidget = Text(
      name ?? '',
      style: TextStyle(
          color: isUserNotEmpty ? const Color(0xCCFEFEFE) : Colors.transparent,
          fontSize: 12),
    );
    if (list.isEmpty) {
      return nameWidget;
    } else {
      list.add(Flexible(child: nameWidget));
    }
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: list,
    );
  }

  Container _buildOperate(BuildContext context) {
    bool isAdmin = Session.uid == widget.room.positions[0].uid;
    return Container(
      padding: const EdgeInsetsDirectional.only(top: 8),
      alignment: AlignmentDirectional.center,
      child: Column(
        children: [
          widget.stepWidget,
          const SizedBox(height: 10),
          widget.counterWidget,
          const SizedBox(height: 6),
          if (isAdmin)
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
                      color: Colors.black.withOpacity(0.2),
                    ),
                    child: Text(
                      widget.room.cpLinkAssist
                          ? K.room_cp_link_assist_off
                          : K.room_cp_link_assist_on,
                      style: TextStyle(
                          fontSize: 11, color: Colors.white.withOpacity(0.7)),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () async {
                    if (isHand()) {
                      /// 结束
                      _finishLink();
                    } else if (isHeart()) {
                      /// 先定关系
                      _showSelectRelationDialog();
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
                      color: Colors.black.withOpacity(0.2),
                    ),
                    child: Text(
                      isHand()
                          ? K.room_cplink_complete
                          : isHeart()
                              ? K.room_cplink_v2_select_relation
                              : K.room_cplink_next,
                      style: TextStyle(
                          fontSize: 11, color: Colors.white.withOpacity(0.7)),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  void _finishLink() async {
    if (!CpLinkUtil.isHost(widget.room)) {
      return;
    }
    bool? result = await showDialog(
        context: context,
        builder: (context) {
          return ConfirmDialog(
            title: K.notice,
            content: K.room_cplink_finsh_link_content,
          );
        });
    if (result == true) {
      String shpId = "";
      BaseResponse? resp = await CpLinkRepo.finishLink(widget.room.rid,
          widget.room.positions[2].uid, widget.room.positions[5].uid, shpId);
      if (resp == null || !(resp.success == true)) {
        Fluttertoast.showToast(msg: resp?.msg ?? 'error');
      }
    }
  }

  void _showSelectRelationDialog() async {
    int? result =
        await CpLinkSelectRelationDialogWidget.show(context, widget.room);
    if (result != null) {
      if (result > 0) {
        CpLinkRepo.nextStep(widget.room.realRid,
            (widget.room.config?.configExpendData as CpLinkConfigData).state,
            selectId: result);
      } else {
        bool? result = await showDialog(
            context: context,
            builder: (context) {
              return ConfirmDialog(
                title: K.room_cplink_relation_select_early_finish,
                content: K.room_cplink_relation_select_early_finish_content,
              );
            });
        if (result ?? false) {
          /// 提前结束
          CpLinkRepo.finishLink(widget.room.realRid,
              widget.room.positions[2].uid, widget.room.positions[5].uid, '0');
        }
      }
    }
  }
}

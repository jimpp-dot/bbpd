import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/cplink/model/cplink_model.dart';
import 'package:chat_room/src/cplink/widget/total_progress_widget.dart';

class CpLinkRelationWidget extends StatelessWidget {
  final RelationshipData? relationshipData;
  final int? checkedRelationIndex;
  final Function(int index, bool selected)? onCheckChanged;

  const CpLinkRelationWidget(
      {Key? key,
      this.relationshipData,
      this.onCheckChanged,
      this.checkedRelationIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (relationshipData == null ||
        relationshipData!.relationships.isEmpty ||
        relationshipData!.levels.isEmpty) {
      return const SizedBox.shrink();
    }
    return Container(
      height: 130.dp,
      margin: EdgeInsetsDirectional.only(
        top: 6.dp,
        bottom: 14.dp,
        start: 12.dp,
        end: 12.dp,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF6617A5),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.dp),
            child: Text(
              K.room_cplink_relation_title(['${relationshipData!.defendDays}']),
              style: TextStyle(color: Colors.white, fontSize: 12.dp),
            ),
          ),
          _buildRelations(),
          const SizedBox(height: 4),
          Expanded(
            child: TotalProgressWidget(
              relationship:
                  relationshipData!.relationships[checkedRelationIndex ?? 0],
              levels: relationshipData!.levels,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRelations() {
    return SizedBox(
      height: 20.dp,
      child: ListView.builder(
        itemBuilder: (context, index) {
          Relationship relationShip = relationshipData!.relationships[index];
          return Padding(
            padding: EdgeInsetsDirectional.only(end: 8.dp),
            child: _CheckLabel(
              text: relationShip.name ?? '',
              enable: relationShip.lightStatus,
              initChecked: checkedRelationIndex == index,
              onCheckChanged: (bool c) {
                if (onCheckChanged != null) {
                  onCheckChanged!(index, c);
                }
              },
            ),
          );
        },
        itemCount: relationshipData!.relationships.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 24.dp),
      ),
    );
  }
}

class _CheckLabel extends StatefulWidget {
  final String text;
  final bool initChecked;
  final bool enable;
  final OnCheckChanged? onCheckChanged;

  const _CheckLabel({
    Key? key,
    required this.text,
    this.initChecked = false,
    this.onCheckChanged,
    this.enable = true,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CheckLabelState();
  }
}

typedef OnCheckChanged = Function(bool checked);

class _CheckLabelState extends State<_CheckLabel> {
  @override
  Widget build(BuildContext context) {
    bool c = widget.initChecked;

    return InkWell(
      onTap: () {
        if (widget.onCheckChanged != null) {
          widget.onCheckChanged!(c);
        }
      },
      child: Container(
        constraints:
            BoxConstraints(maxHeight: 20.dp, minHeight: 20.dp, minWidth: 38.dp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 0.5,
          ),
          gradient: LinearGradient(
            colors: c
                ? [const Color(0xFFFF96F4), const Color(0xFFFF61D6)]
                : [Colors.transparent, Colors.transparent],
          ),
        ),
        padding: EdgeInsetsDirectional.only(
          start: 7.dp,
          end: 7.dp,
        ),
        alignment: Alignment.center,
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: widget.enable ? Colors.white : Colors.white.withOpacity(0.5),
            fontSize: 11.dp,
            fontWeight: c ? FontWeight.w600 : FontWeight.normal,
            height: 1,
          ),
        ),
      ),
    );
  }
}

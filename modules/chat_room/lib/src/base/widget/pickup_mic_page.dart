import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../chat_room.dart';
import '../../../k.dart';

// @JsonSerializable(createToJson: false)
class PositionIndex {
  PositionIndex(this.display, this.position, this.uid);

  final int display;
  final int position;
  final int uid;

  factory PositionIndex.fromJson(Map<String, dynamic> json) => PositionIndex(
        Util.parseInt(json['display']),
        Util.parseInt(json['position']),
        Util.parseInt(json['uid']),
      );
}

class PickupMicModel {
  PickupMicModel(this.waitUid,
      {required this.title,
      this.selectedPosition,
      required this.roomData,
      required this.positionIndex});

  final int? waitUid;
  String title;
  int? selectedPosition;
  ChatRoomData roomData;

  List<RoomPosition> get positions => roomData.positions;
  List<PositionIndex> positionIndex;

  int get count => positions.length;
}

/// 抱xxx上麦弹窗
class PickupMicPage extends StatelessWidget {
  const PickupMicPage({super.key, required this.model});

  final PickupMicModel model;

  _onSelect(int position, StateSetter setState) {
    setState(() {
      model.selectedPosition = position;
    });
  }

  _onPickMic(BuildContext context) async {
    if (model.selectedPosition == null || model.waitUid == null) return;

    int uid = model.waitUid!;
    int pos = model.selectedPosition!;
    Map? res = await RoomRepository.joinMic(model.roomData.realRid, pos,
        uid: uid, needCertify: false);
    if (res != null && res['success'] == false) {
      Fluttertoast.showToast(
          msg: '${res['msg']}', gravity: ToastGravity.CENTER);
    } else {
      Fluttertoast.showToast(
          msg: K.room_wait_other_up_mic, gravity: ToastGravity.CENTER);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadiusDirectional.vertical(top: Radius.circular(12)),
          ),
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildHeader(context),
                _buildDivider(),
                _buildMicList(setState),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildMicList(StateSetter setState) {
    return GridView.count(
      crossAxisCount: 4,
      padding: EdgeInsets.all(20.dp),
      mainAxisSpacing: 20.dp,
      crossAxisSpacing: 32.dp,
      childAspectRatio: 1.0,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: model.positionIndex
          .map((e) => _buildIcon(
              e.display,
              e.uid > 0,
              e.position == model.selectedPosition,
              () => _onSelect(e.position, setState)))
          .toList(),
    );
  }

  Widget _buildIcon(
      int displayPosition, bool isOnMic, bool selected, Function onSelected) {
    return InkWell(
      onTap: () {
        if (!isOnMic) onSelected();
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected ? R.color.mainBrandColor : const Color(0xFFF5F5F5),
        ),
        alignment: AlignmentDirectional.center,
        child: isOnMic
            ? R.img('room_on_mic.png',
                package: ComponentManager.MANAGER_BASE_ROOM,
                width: 30,
                height: 30)
            : Text(
                '$displayPosition',
                style: TextStyle(
                    color: selected ? Colors.black : Colors.black,
                    fontSize: 24),
              ),
      ),
    );
  }

  Divider _buildDivider({double indent = 16}) => Divider(
      height: 1.0,
      indent: indent,
      endIndent: indent,
      color: const Color(0x14202020));

  Widget _buildHeader(BuildContext context) {
    const textColor = Color(0xFF313131);
    return BaseAppBar.custom(
      showBack: false,
      title: Text(model.title),
      leading: InkWell(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          alignment: AlignmentDirectional.center,
          width: 50,
          height: double.infinity,
          child: Text(
            K.cancel,
            style: const TextStyle(color: textColor),
          ),
        ),
      ),
      actions: [
        InkWell(
          child: Container(
            alignment: AlignmentDirectional.center,
            width: 50,
            height: double.infinity,
            child: Text(
              K.room_complete,
              style: TextStyle(
                  color: model.selectedPosition == null
                      ? textColor.withOpacity(0.4)
                      : textColor),
            ),
          ),
          onTap: () => _onPickMic(context),
        ),
      ],
      backgroundColor: Colors.transparent,
    );
  }
}

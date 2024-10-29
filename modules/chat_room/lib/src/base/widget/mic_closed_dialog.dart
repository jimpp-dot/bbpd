import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';

class MicCloseModel {
  MicCloseModel(this.checked);

  bool checked;
}

class MicClosedDialog extends StatelessWidget {
  final MicCloseModel model;
  final ChatRoomData room;

  const MicClosedDialog({Key? key, required this.model, required this.room})
      : super(key: key);

  _onConfirm(BuildContext context, bool checked) {
    if (checked && ChatRoomUtil.isUidOnPosition(Session.uid)) {
      room.setMute(!checked);
    }

    RoomRepository.opMic(room.realRid, room.positionForCurrentUser?.position,
        checked ? 'openMic' : 'closeMic');

    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          _buildContent(context),
          Positioned.fill(child: _buildTopIcon()),
        ],
      ),
    );
  }

  Widget _buildTopIcon() {
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: Container(
        width: 82,
        height: 82,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: R.color.mainBrandColor,
          border: Border.all(color: Colors.white, width: 3.0),
        ),
        alignment: AlignmentDirectional.center,
        child: R.img(RoomAssets.chat_room$micphone_mark_png,
            width: 22, height: 32),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.only(top: 26),
      padding: EdgeInsetsDirectional.only(
          bottom: MediaQuery.of(context).padding.bottom + 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadiusDirectional.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 70),
          Text(
            K.room_join_mic_close_hint,
            style: const TextStyle(
              color: Color(0xFF313131),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NegativeButton(
                text: K.room_mic_cancel,
                width: 157,
                height: 48,
                onPressed: () {
                  _onConfirm(context, false);
                },
              ),
              PositiveButton(
                text: K.room_open_mic_des,
                width: 157,
                height: 48,
                useGradientBg: true,
                onPressed: () {
                  _onConfirm(context, true);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

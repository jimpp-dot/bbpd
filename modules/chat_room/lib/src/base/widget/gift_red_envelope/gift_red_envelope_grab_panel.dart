import 'dart:async';
import 'dart:ui';

import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/protobuf/generated/gift_red_packet.pb.dart';
import 'package:flutter/material.dart';

import 'gift_red_envelope_grab_item.dart';
import 'gift_red_envelope_repo.dart';

class GiftRedEnvelopeGrabPanel extends StatefulWidget {
  final ChatRoomData room;

  const GiftRedEnvelopeGrabPanel({super.key, required this.room});

  static Future show(BuildContext context, ChatRoomData room) {
    return displayModalBottomSheet(
      context: context,
      disableTapDismissible: true,
      builder: (BuildContext context) => GiftRedEnvelopeGrabPanel(room: room),
    );
  }

  @override
  State<GiftRedEnvelopeGrabPanel> createState() =>
      _GiftRedEnvelopeGrabPanelState();
}

class _GiftRedEnvelopeGrabPanelState extends State<GiftRedEnvelopeGrabPanel>
    with BaseScreenStateMixin {
  final List<RobRedPacket> _list = [];
  final ValueNotifier _timerNotifier = ValueNotifier<int>(0);

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    emptyMsgColor = Colors.white;
    errorMsgColor = Colors.white;
    _loadList(showStatus: true);
    _timer = Timer.periodic(
        const Duration(seconds: 1), (timer) => _timerNotifier.value++);
  }

  @override
  void dispose() {
    _timerNotifier.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _loadList({bool showStatus = false}) async {
    ResRobRedList resp =
        await GiftRedEnvelopeRepo.getGrabGiftRedEnvelopeList(widget.room.rid);
    ScreenStatus status;
    if (resp.success) {
      if (resp.data.redList.isNotEmpty) {
        _list.clear();
        _list.addAll(resp.data.redList);
        status = ScreenStatus.Ready;
      } else {
        status = ScreenStatus.Empty;
      }
    } else {
      status = ScreenStatus.Error;
    }
    if (showStatus) {
      screenStatus = status;
    }
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          height: Util.iphoneXBottom + 474,
          padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
          decoration: const BoxDecoration(
            color: Color(0xB3171621),
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(16),
              topEnd: Radius.circular(16),
            ),
          ),
          child: Stack(
            children: [
              PositionedDirectional(
                top: 0,
                child: R.img(
                  RoomAssets.chat_room$gift_red_envelope_top_atmosphere_bg_webp,
                  width: Util.width,
                  height: 24,
                ),
              ),
              PositionedDirectional(
                bottom: 0,
                child: R.img(
                    RoomAssets
                        .chat_room$gift_red_envelope_bottom_atmosphere_bg_webp,
                    width: Util.width,
                    height: 100,
                    fit: BoxFit.fill),
              ),
              _buildPanel(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return Column(
      children: [
        _buildTitle(),
        Expanded(child: buildStatusContent()),
      ],
    );
  }

  Widget _buildTitle() {
    return Stack(
      children: [
        PositionedDirectional(
          start: 0,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Padding(
              padding: const EdgeInsetsDirectional.all(10),
              child:
                  R.img(RoomAssets.chat_room$back_svg, width: 24, height: 24),
            ),
          ),
        ),
        Container(
          width: Util.width,
          height: 44,
          alignment: AlignmentDirectional.center,
          child: Text(
            K.room_gift_red_envelope_grab,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }

  @override
  Widget buildContent() {
    return GridView.builder(
      itemCount: _list.length,
      padding: const EdgeInsetsDirectional.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 104 / 135,
      ),
      itemBuilder: (context, index) {
        var itemData = _list[index];
        return GREGrabItem(
          key: ValueKey(itemData.id),
          rid: widget.room.rid,
          itemData: itemData,
          timer: _timerNotifier,
          onStatusChanged: _onStatusChanged,
        );
      },
    );
  }

  void _onStatusChanged(int id, String action) {
    if (action == 'delete') {
      _list.removeWhere((e) => e.id == id);
    } else if (action == 'refresh') {
      RobRedPacket? item;
      _list.removeWhere((e) {
        if (e.id != id) return false;
        item = e;
        item!.state = 1;
        return true;
      });
      if (item != null) {
        _list.add(item!);
      }
    }
    refresh();
  }

  @override
  void onTapErrorWidget() => _loadList();
}

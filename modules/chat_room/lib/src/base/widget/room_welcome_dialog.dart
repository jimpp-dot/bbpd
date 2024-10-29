import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/widget/single_gift_button.dart';
import 'package:chat_room/src/protobuf/generated/room.screen.welcome.pb.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';

class RoomWelcomeDialog extends StatelessWidget {
  final ChatRoomData roomData;
  final WelcomePopup welcomeData;
  final Function() sendGiftAndFollow;

  const RoomWelcomeDialog(
      this.roomData, this.welcomeData, this.sendGiftAndFollow,
      {Key? key})
      : super(key: key);

  _onDismiss(BuildContext context) {
    Tracker.instance
        .track(TrackEvent.welcome_popup_click, properties: {'paga': 'close'});

    Navigator.of(context).pop(false);
  }

  @override
  Widget build(BuildContext context) {
    List<int> toUids = [];
    List<int> positions = [];
    for (var element in welcomeData.giftResponse.micData) {
      toUids.add(element.uid);
      positions.add(element.position);
    }

    return Center(
      child: Container(
        width: 316,
        height: 264,
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 260,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Tracker.instance.track(
                                TrackEvent.welcome_popup_click,
                                properties: {'paga': 'politeness'});

                            Navigator.pop(context);
                            OperateUtil.sendText(
                                context, roomData, welcomeData.wordsResponse);
                            // eventCenter.emit(RoomConstant.Event_Room_Display_Input);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              R.img("welcome/room_welcome_dialog_reply.webp",
                                  package: ComponentManager.MANAGER_BASE_ROOM,
                                  width: 48,
                                  height: 48),
                              const SizedBox(height: 6),
                              Text(
                                K.room_reply_quickly,
                                style: TextStyle(
                                    color: R.color.mainTextColor, fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 50),
                        SingleGiftButton(
                          roomData,
                          'room_welcome',
                          welcomeData.giftResponse.id,
                          welcomeData.giftResponse.name,
                          welcomeData.giftResponse.giftType,
                          Util.parseInt(welcomeData.giftResponse.price),
                          positions,
                          -1,
                          toUids,
                          (bool success) {
                            Tracker.instance.track(
                                TrackEvent.welcome_popup_click,
                                properties: {
                                  'gift': success ? 'succeed' : 'unsent'
                                });

                            sendGiftAndFollow();
                            Navigator.pop(context);
                          },
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              R.img(
                                "welcome/room_welcome_dialog_gift.webp",
                                package: ComponentManager.MANAGER_BASE_ROOM,
                                width: 48,
                                height: 48,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                K.room_reply_and_gift,
                                style: TextStyle(
                                    color: R.color.mainTextColor, fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: IconButton(
                        iconSize: 24,
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          _onDismiss(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 42),
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                    borderRadius: const BorderRadius.all(Radius.circular(60)),
                  ),
                  child: ClipOval(
                    child: CommonAvatar(
                      path: welcomeData.giftResponse.micData.first.icon,
                      size: 48,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: SizedBox(
                width: 156,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFFEED2), Color(0xFFF8E1EF)],
                          begin: Alignment(-0.6, -1),
                          end: Alignment(0.6, 1),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                            top: 16, bottom: 16, start: 20, end: 20),
                        child: Text(
                          welcomeData.welcome,
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: R.color.mainTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 20),
                      child: R.img(
                        "welcome/room_welcome_dialog_bubble.webp",
                        package: ComponentManager.MANAGER_BASE_ROOM,
                        width: 10,
                        height: 5,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

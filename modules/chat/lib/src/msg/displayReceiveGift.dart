import 'package:shared/shared.dart';
import '../../assets.dart';
import '../../k.dart';
import 'config.dart';
import 'received_gift_dialog.dart';
import 'package:flutter/material.dart';

class DisplayReceiveGift extends StatefulWidget {
  final MessageContent message;
  final Map extra;
  final MessageDisplayDirection? direction;

  const DisplayReceiveGift(
      {super.key, required this.message, required this.extra, this.direction});

  @override
  State<StatefulWidget> createState() {
    return _DisplayReceiveGiftState();
  }
}

class _DisplayReceiveGiftState extends State<DisplayReceiveGift> {
  MessageContent get message => widget.message;

  Map get extra => widget.extra;

  MessageDisplayDirection? get direction => widget.direction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 247,
      constraints: const BoxConstraints(minHeight: 90),
      padding: const EdgeInsetsDirectional.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [Color(0xffFD8849), Color(0xffFFC45E)],
        ),
      ),
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          PositionedDirectional(
            start: 0,
            bottom: 0,
            child: R.img(
              Assets.chat$received_gift_bg_left_png,
              width: 76,
              height: 48,
              package: ComponentManager.MANAGER_CHAT,
            ),
          ),
          PositionedDirectional(
            end: 0,
            top: 0,
            child: R.img(
              Assets.chat$received_gift_bg_right_png,
              width: 70,
              height: 61,
              package: ComponentManager.MANAGER_CHAT,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 7,
              ),
              R.img(
                Assets.chat$received_gift_notice_icon_png,
                width: 64,
                height: 70,
                package: ComponentManager.MANAGER_CHAT,
              ),
              const SizedBox(width: 3),
              Expanded(
                child: direction == MessageDisplayDirection.Right
                    ? Text(K.send_gift_im_tip,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(K.send_gift_im_tip,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16)),
                          const SizedBox(
                            height: 8,
                          ),
                          GestureDetector(
                            onTap: () {
                              ReceivedGiftDialog.show(context, extra);
                            },
                            child: Container(
                              width: 76,
                              height: 32,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadiusDirectional.all(
                                      Radius.circular(24)),
                                  color: Colors.white),
                              padding: const EdgeInsetsDirectional.only(
                                  start: 5, end: 5),
                              alignment: AlignmentDirectional.center,
                              child: Text(K.view_now,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Color(0xffFE8732), fontSize: 13)),
                            ),
                          )
                        ],
                      ),
              ),
              const SizedBox(
                width: 3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

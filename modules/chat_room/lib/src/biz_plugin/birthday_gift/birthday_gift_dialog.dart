import 'dart:async';
import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';

class BirthdayGiftDialog extends StatefulWidget {
  final DisplayGiftConfig config;
  final VoidCallback onClose;

  const BirthdayGiftDialog(
      {super.key, required this.config, required this.onClose});

  @override
  State createState() => _BirthdayGiftDialogState();
}

class _BirthdayGiftDialogState extends State<BirthdayGiftDialog>
    with SingleTickerProviderStateMixin {
  late Timer _timer;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    int duration = widget.config.birthdayGift?.duration ?? 0;
    _timer = Timer(Duration(seconds: duration > 0 ? duration : 5), () {
      if (mounted) {
        widget.onClose();
      }
    });
    _controller = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: const ElasticOutCurve(0.7)))
        .animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String title = widget.config.birthdayGift?.word ?? '';
    String content = widget.config.birthdayGift?.sentence ?? '';
    return Container(
      color: Colors.black54,
      alignment: AlignmentDirectional.center,
      child: ScaleTransition(
        scale: _animation,
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 78),
              Container(
                width: 280,
                height: 430,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(RoomAssets
                            .chat_room$birthday_gift_bg_birthday_dialog_webp),
                        fit: BoxFit.fill)),
                child: Stack(
                  children: [
                    PositionedDirectional(
                      top: 22,
                      start: 24,
                      child: Text(
                        K.room_darling_colon,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF812F00)),
                      ),
                    ),
                    PositionedDirectional(
                      top: 90,
                      child: Column(
                        children: [
                          R.img(RoomAssets.chat_room$birthday_gift_ic_cake_webp,
                              width: 280, height: 160),
                          const SizedBox(height: 3),
                          GradientText(
                            title,
                            gradient: const LinearGradient(
                                colors: [Color(0xFF812F00), Color(0xFFEE6C00)]),
                            style: const TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 280,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              content,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFEE6C00)),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 35),
                          _buildBtn(),
                        ],
                      ),
                    ),
                    PositionedDirectional(
                      top: 33.5,
                      child: Container(
                        width: 280,
                        height: 60.5,
                        alignment: AlignmentDirectional.center,
                        child: _buildUserRow(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () => widget.onClose(),
                child: R.img(
                    RoomAssets.chat_room$confess_v2_ic_dialog_close_webp,
                    width: 48,
                    height: 48),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserRow() {
    var users = widget.config.birthdayGift?.to ?? [];
    for (var user in users) {
      if (user.uid == Session.uid) {
        users = [user];
        break;
      }
    }
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return _buildUser(users[index].icon);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(width: 16);
      },
      itemCount: users.length,
    );
  }

  Widget _buildUser(String icon) {
    return SizedBox(
      width: 44,
      height: 60.5,
      child: Stack(
        children: [
          PositionedDirectional(
            bottom: 0,
            child: Container(
              width: 44,
              height: 44,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(22),
                gradient: const LinearGradient(
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  colors: [Color(0xFFFFCE5C), Color(0xFFFF941A)],
                ),
              ),
              child:
                  CommonAvatar(path: icon, size: 41.56, shape: BoxShape.circle),
            ),
          ),
          PositionedDirectional(
              end: 2,
              child: R.img(
                  RoomAssets.chat_room$birthday_gift_ic_birthday_hat_webp,
                  width: 25,
                  height: 25)),
        ],
      ),
    );
  }

  Widget _buildBtn() {
    String text;
    bool needSend = true;
    if (widget.config.birthdayGift?.from == Session.uid) {
      text = K.room_send_again;
    } else if (widget.config.birthdayGift!.to
        .map((e) => e.uid)
        .toList()
        .contains(Session.uid)) {
      text = K.room_accept_bless;
      needSend = false;
    } else {
      text = K.room_i_send_too;
    }
    return GestureDetector(
      onTap: () {
        widget.onClose();
        if (needSend) {
          int giftId = widget.config.giftId;
          IGiftManager giftManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_GIFT);
          giftManager.showRoomGiftPanel(System.context,
              room: ChatRoomData.getInstance(), defaultId: giftId);
        }
      },
      child: Container(
        width: 212,
        height: 50,
        alignment: AlignmentDirectional.center,
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          gradient: LinearGradient(
            colors: [
              Color(0xFFA325FF),
              Color(0xFFFF7BA9),
              Color(0xFFFFD03F),
              Color(0xFF52EF58),
              Color(0xFF51D1FF)
            ],
          ),
        ),
        child: Container(
          width: 208,
          height: 46,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(23),
            border: Border.all(color: Colors.white),
            gradient: const LinearGradient(
                colors: [Color(0xFFFFEDA3), Color(0xFFFFE11F)]),
          ),
          child: GradientText(
            text,
            gradient: const LinearGradient(
                colors: [Color(0xFF812F00), Color(0xFFEE6C00)]),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/grab_hat/rank/hat_activity_page.dart';
import 'package:chat_room/src/protobuf/generated/grab_hat.pb.dart';
import 'package:flutter/material.dart';
import 'model/hat_play_data.dart';

class GrabHatOperateDialog extends StatefulWidget {
  final ChatRoomData? room;
  const GrabHatOperateDialog({super.key, this.room});

  static Future show(BuildContext context, ChatRoomData? room, {Key? key}) {
    return displayModalBottomSheet(
      disableTapDismissible: true,
      context: context,
      builder: (context) {
        return GrabHatOperateDialog(
          key: key,
          room: room,
        );
      },
      defineBarrierColor: Colors.black.withOpacity(0.4),
      maxHeightRatio: 1,
    );
  }

  @override
  State<GrabHatOperateDialog> createState() => _GrabHatOperateDialogState();
}

class _GrabHatOperateDialogState extends State<GrabHatOperateDialog> {
  bool get isHost => widget.room!.positions[0].uid == Session.uid;

  ResHatIndex? _data;

  bool hasData = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future _loadData() async {
    _data = await GrabHatRepo.getCurrentHatInfo(widget.room!.rid);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        border: GradientBoxBorder(
          gradient: LinearGradient(
              colors: [Color(0xFFFDE6D7), Color(0xff2B0656)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          width: 1,
        ),
        gradient: LinearGradient(
            colors: [Color(0xff201050), Color(0xff32025B)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Positioned(
                bottom: 0,
                right: 0,
                child: R.img(RoomAssets.grab_hat_ic_hat_dialog_bg_webp,
                    width: 225, height: 395, package: RoomAssets.package)),
            if (_data == null || !_data!.success)
              const SizedBox(
                height: 500,
                child: Center(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            if (_data != null && _data!.success)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildHeader(),
                  const SizedBox(
                    height: 32,
                  ),
                  _buildCountDown(),
                  const SizedBox(
                    height: 36,
                  ),
                  _buildMVPs(),
                  const SizedBox(
                    height: 36,
                  ),
                  _buildAction(),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 120,
            child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  HatActivityPage.launch(context);
                },
                child: R.img(RoomAssets.chat_room$grab_hat_ic_hat_king_webp,
                    width: 44, height: 44),
              ),
            ),
          ),
          Text(
            K.room_grab_hat,
            style: const TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 120,
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => BaseWebviewScreen.show(
                  context,
                  url: Util.parseHelpUrl(175),
                ),
                child: R.img(
                    RoomAssets.chat_room$vindicate_vindicate_instruction_webp,
                    width: 24,
                    height: 24),
              ),
            ),
          )
        ],
      ),
    );
  }

  int duration = 0;
  Widget _buildCountDown() {
    duration = _data!.data.playData.remainSeconds;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          K.room_hat_tip_total_time(
              ['${_data!.data.playData.totalSeconds ~/ 60}']),
          style: const TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        TimerWidget(
          key: GlobalKey(),
          stop: Duration(seconds: duration),
          onTick: () {
            if (duration > 0) duration--;
            if (duration <= 0) {
              Navigator.of(context).pop();
              Fluttertoast.showToast(msg: K.room_hat_tip_is_end);
            }
          },
          builder: (context) => Text(
            getTimerText(),
            style: Util.numStyle.copyWith(
              fontSize: 50,
              color: const Color(0xffF995E3),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  String getTimerText() {
    int seconds = duration;

    String twoDigits(int n) => n >= 10 ? "$n" : "0$n";

    String text;
    if (seconds > 60) {
      text = '${twoDigits(seconds ~/ 60)}:${twoDigits(seconds % 60)}';
    } else if (seconds <= 0) {
      text = '';
      refresh();
    } else {
      text = '${seconds}s';
    }
    return text;
  }

  Widget _buildMVPs() {
    bool haveMVP = _data!.data.playData.data.isNotEmpty;
    final mvps = _data!.data.playData.data;

    return Stack(
      alignment: Alignment.center,
      children: [
        const SizedBox(
          height: 182,
          width: 306,
        ),
        Positioned(
            top: 0,
            child: MvpItem(
                mvp: haveMVP ? mvps[0] : HatMvpData(),
                index: 0,
                empty: !haveMVP)),
        if (mvps.length > 1)
          Positioned(
              bottom: 0, left: 0, child: MvpItem(mvp: mvps[1], index: 1)),
        if (mvps.length > 2)
          Positioned(
              bottom: 0, right: 0, child: MvpItem(mvp: mvps[2], index: 2)),
      ],
    );
  }

  Widget _buildAction() {
    return GestureDetector(
      onTap: () {
        if (isHost) {
          showDialog(
              context: context,
              builder: (context) => ConfirmDialog(
                    title: K.room_hat_dialog_end_title,
                    content: K.room_hat_dialog_end_content,
                    negativeButton: NegativeButton(
                      text: K.cancel,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    positiveButton: PositiveButton(
                      text: K.end,
                      bgColor: const Color(0xFFF995E3),
                      onPressed: () async {
                        NormalNull result =
                            await GrabHatRepo.stop(widget.room!.rid);
                        if (result.success) {
                          widget.room!
                              .emit(RoomConstant.Event_Room_Grab_Hat, null);
                          Navigator.of(context)
                            ..pop()
                            ..pop();
                        } else {
                          Fluttertoast.showToast(msg: result.msg);
                        }
                      },
                    ),
                  ));
        } else {
          Tracker.instance.track(TrackEvent.room_grab_hat_help_ta);
          Navigator.of(context).pop();
          IGiftManager giftManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_GIFT);
          giftManager.showRoomGiftPanel(context, room: widget.room);
        }
      },
      child: Container(
        height: 48,
        width: 170,
        margin: EdgeInsets.only(bottom: Util.isAndroid ? 30.dp : 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: const LinearGradient(colors: [
              Color(0xFFFEEDD4),
              Color(0xFFFBB989),
            ])),
        child: Center(
          child: Container(
            height: 44,
            width: 164,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: const Color(0xFF8521B6), width: 1),
                gradient: const LinearGradient(colors: [
                  Color(0xFFFADFCD),
                  Color(0xFFC544B1),
                  Color(0xFFD070C0),
                  Color(0xFFD070C0),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Center(
              child: Text(
                isHost ? K.room_hat_early_end : K.room_hat_help_grab,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MvpItem extends StatelessWidget {
  const MvpItem(
      {Key? key, required this.mvp, required this.index, this.empty = false})
      : super(key: key);

  final HatMvpData mvp;
  final int index;
  final bool empty;

  @override
  Widget build(BuildContext context) {
    var borderColors = [const Color(0xFFFFDBBE), const Color(0xFFFF8657)];
    if (index == 0) {
      borderColors = [const Color(0xFFFFF29F), const Color(0xFFFF9A2B)];
    } else if (index == 1) {
      borderColors = [const Color(0xFFD8EAFF), const Color(0xFF8CAAFF)];
    } else {
      borderColors = [const Color(0xFFFFDBBE), const Color(0xFFFF8657)];
    }
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: borderColors,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                borderRadius: BorderRadius.circular(36),
              ),
              child: Center(
                  child: empty
                      ? Container(
                          width: 68,
                          height: 68,
                          decoration: const BoxDecoration(
                              color: Color(0xFFF995E3), shape: BoxShape.circle),
                          child: Align(
                            alignment: const Alignment(0, -0.3),
                            child: R.img(
                                RoomAssets.grab_hat_ic_hat_mvp_empty_webp,
                                width: 19,
                                height: 36,
                                package: RoomAssets.package),
                          ),
                        )
                      : CommonAvatar(
                          path: Util.getRemoteImgUrl(mvp.icon),
                          shape: BoxShape.circle,
                          size: 68,
                        )),
            ),
            Positioned(
                top: -14.5,
                left: -4,
                child: R.img(
                    'assets/images/grab_hat/ic_hat_top${index + 1}.webp',
                    width: 32,
                    height: 32,
                    package: RoomAssets.package)),
            if (index == 0)
              Positioned(
                  bottom: -1,
                  child: R.img(RoomAssets.grab_hat_ic_hat_mvp_webp,
                      width: 66, height: 21, package: RoomAssets.package)),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        if (!empty)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 2.5, vertical: 3),
            decoration: BoxDecoration(
                color: const Color(0x1AFFFFFF),
                borderRadius: BorderRadius.circular(7.5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                R.img(RoomAssets.chat_room$grab_hat_ic_hat_heart_webp,
                    width: 11, height: 11),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  mvp.num,
                  style: Util.numStyle.copyWith(
                      fontSize: 10,
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        const SizedBox(
          height: 6,
        ),
        if (!empty)
          Text(
            mvp.name,
            style: TextStyle(
                fontSize: 12,
                height: 1,
                color: Colors.white.withOpacity(0.9),
                fontWeight: FontWeight.w600),
          ),
      ],
    );
  }
}

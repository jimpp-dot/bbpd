// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:auto_size_text/auto_size_text.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/biz_plugin/grab_hat/rank/hat_activity_page.dart';
import 'package:flutter/material.dart';

import '../../protobuf/generated/grab_hat.pb.dart';
import 'model/hat_play_data.dart';

class GrabHatSettingDialog extends StatefulWidget {
  final ChatRoomData? room;
  const GrabHatSettingDialog({super.key, this.room});

  static Future show(BuildContext context, ChatRoomData? room, {Key? key}) {
    return displayModalBottomSheet(
      disableTapDismissible: true,
      context: context,
      builder: (context) {
        return GrabHatSettingDialog(key: key, room: room);
      },
      defineBarrierColor: Colors.black.withOpacity(0.4),
      maxHeightRatio: 1,
    );
  }

  @override
  State<GrabHatSettingDialog> createState() => _GrabHatSettingDialogState();
}

class _GrabHatSettingDialogState extends State<GrabHatSettingDialog> {
  List<HatSeries> hats = [];

  ResHatIndex? _data;

  bool hasData = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future _loadData() async {
    _data = await GrabHatRepo.getCurrentHatInfo(widget.room!.rid);
    if (_data!.success) {
      hats = _data!.data.hat;
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
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
                  _buildHats(),
                  _buildDurations(),
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

  Widget _buildHats() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                K.room_hat_series,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              // GestureDetector(
              //   onTap: () async {
              //     ResHatRandom result = await GrabHatRepo.randomHat(widget.room!.rid);
              //     if (result.success) {
              //       hats = result.data.hat;
              //       if (mounted) {
              //         setState(() {});
              //       }
              //     }
              //   },
              //   child: Row(
              //     children: [
              //       R.img(RoomAssets.chat_room$grab_hat_ic_hat_refresh_webp, width: 12, height: 12),
              //       Text(
              //         K.room_hat_refresh,
              //         style: const TextStyle(fontSize: 12, color: Color(0xB3FFFFFF), fontWeight: FontWeight.w400),
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: hats
              .map(
                (e) => Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: const BoxDecoration(
                              color: Color(0x1AFFFFFF), shape: BoxShape.circle),
                        ),
                        Positioned(
                          top: 7,
                          left: 7,
                          child: Container(
                            width: 48,
                            height: 48,
                            clipBehavior: Clip.hardEdge,
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: FittedBox(
                              fit: BoxFit.none,
                              alignment: Alignment.topLeft,
                              child: CachedNetworkImage(
                                imageUrl: Util.getRemoteImgUrl(e.hatImage),
                                width: 100,
                                height: 100,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: -5,
                          child: CachedNetworkImage(
                            imageUrl: Util.getRemoteImgUrl(e.seriesImage),
                            width: 32,
                            height: 16,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 9.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 2.5, vertical: 3),
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
                          SizedBox(
                            child: AutoSizeText(
                              e.levelTxt,
                              minFontSize: 8,
                              style: Util.numStyle.copyWith(
                                  fontSize: 8,
                                  color: Colors.white.withOpacity(0.9),
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  int? _durationValue = 5;
  Widget _buildDurations() {
    double itemW = (Util.width - 8 * 7) / 4.0;
    final durations = _data!.data.countTime.map((e) => e ~/ 60);
    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.only(left: 14.0, right: 14.0, top: 40, bottom: 40),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                K.room_hat_choose_time,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: durations
                .map((e) => SizedBox(
                      width: itemW,
                      height: 50,
                      child: ChoiceChip(
                          selected: _durationValue == e,
                          onSelected: (selected) {
                            setState(() {
                              _durationValue = selected ? e : null;
                            });
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          selectedColor: const Color(0xFFD676BD),
                          backgroundColor: const Color(0xFF421F68),
                          label: Align(
                            alignment: const Alignment(0, -0.3),
                            child: Text(
                              K.room_hat_n_mins(['$e']),
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xE6FFFFFF),
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                    ))
                .toList(),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildAction() {
    return GestureDetector(
      onTap: () async {
        NormalNull result = await GrabHatRepo.start(widget.room!.rid,
            _data!.data.hat.map((e) => e.id).join(','), _durationValue! * 60);
        if (result.success) {
          Tracker.instance.track(TrackEvent.room_grab_hat_start, properties: {
            'open_time': DateTime.now().millisecondsSinceEpoch ~/ 1000,
            'rid': widget.room!.rid,
            'room_type': widget.room!.config?.originalRFT,
          });

          Navigator.pop(context);
        } else {
          Fluttertoast.showToast(msg: result.msg);
        }
      },
      child: Container(
        height: 48,
        width: 170,
        margin: EdgeInsets.only(bottom: Util.isAndroid ? 30.dp : 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
                colors: _durationValue == null
                    ? [const Color(0xFFDBDBDB), const Color(0xFF8C8C8C)]
                    : [
                        const Color(0xFFFEEDD4),
                        const Color(0xFFFBB989),
                      ])),
        child: Center(
          child: Container(
            height: 44,
            width: 164,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                    color: _durationValue == null
                        ? const Color(0xFF6C6C6C)
                        : const Color(0xFF8521B6),
                    width: 1),
                gradient: LinearGradient(
                    colors: _durationValue == null
                        ? [const Color(0xFFC7C7C7), const Color(0xFF8B8C8D)]
                        : [
                            const Color(0xFFFADFCD),
                            const Color(0xFFC544B1),
                            const Color(0xFFD070C0),
                            const Color(0xFFD070C0),
                          ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: Center(
              child: Text(
                K.room_hat_confirm_start,
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

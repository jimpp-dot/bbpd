import 'dart:async';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../k.dart';
import '../base/model/roomConstant.dart';
import '../chatRoomData.dart';
import 'song_list/ktv_song_list_page.dart';

/// 进厅30s未点歌，弹点歌提示
class KtvSingSongTipsDialog extends StatefulWidget {
  static String KTV_SING_SONG_TIPS = 'ktv_sing_song_tips';
  static Timer? timer;

  const KtvSingSongTipsDialog({super.key});

  static delayShowDialog() {
    dismiss();

    timer = Timer(const Duration(seconds: 30), () {
      String curName = appNavigatorObserver.getLast();
      if (curName.startsWith('/room/')) {
        /// 房间页在前台
        ChatRoomData? room = ChatRoomData.getInstance();
        if (ChatRoomData.exists() &&
            (room!.isKtvRoom || room.isKtvChorusRoom)) {
          /// 当前是KTV房型
          String today = DateTime.now().toyyyyMMdd();
          Config.set(KTV_SING_SONG_TIPS, today);
          KtvSingSongTipsDialog.show(System.context);
        }
      }
    });
  }

  static dismiss() {
    if (timer != null) {
      timer?.cancel();
      timer = null;
    }
  }

  static Future<void> show(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const KtvSingSongTipsDialog(),
    );
  }

  @override
  State<KtvSingSongTipsDialog> createState() => _KtvSingSongTipsState();
}

class _KtvSingSongTipsState extends State<KtvSingSongTipsDialog> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted && (ModalRoute.of(context)?.isActive ?? false)) {
        Navigator.of(context).maybePop();
      }
    });

    Tracker.instance.track(TrackEvent.click, properties: {
      'click_page': 'click_songswindow',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 150),
        child: Stack(
          children: [
            Material(
              color: Colors.transparent,
              child: Container(
                width: 254,
                height: 104,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsetsDirectional.only(
                    start: 9, top: 14, end: 27),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    R.img(
                      'ktv/ic_ktv_sing_tips.webp',
                      width: 60,
                      height: 60,
                      package: ComponentManager.MANAGER_BASE_ROOM,
                    ),
                    const SizedBox(width: 8),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 2),
                        Text(
                          K.room_ktv_sing_song_tips_1,
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 11, color: Colors.white, height: 1.2),
                        ),
                        Text(
                          K.room_ktv_sing_song_tips_2,
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 11, color: Colors.white, height: 1.2),
                        ),
                        const SizedBox(height: 8),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            // 跳转到推荐歌单列表
                            ChatRoomData? room = ChatRoomData.getInstance();
                            if (ChatRoomData.exists()) {
                              bool isCreator =
                                  room!.createor?.uid == Session.uid;
                              int musicNum =
                                  room.config?.ktvInfo?.listCount ?? 0;
                              Tracker.instance
                                  .track(TrackEvent.click, properties: {
                                'click_page': 'click_windowsorder',
                              });
                              KtvSongListPage.show(
                                context,
                                room,
                                SongSheetType.rcmd,
                                isRoomMaster: isCreator,
                                autoMic: room.config?.mode == RoomMode.Lock,
                                musicNum: musicNum,
                              );
                            }
                          },
                          child: Container(
                            width: 58,
                            height: 32,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(16),
                              gradient: LinearGradient(
                                  colors: R.color.mainBrandGradientColors),
                            ),
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              K.ktv_music_order,
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  height: 1.1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            PositionedDirectional(
              top: 7,
              end: 8,
              child: SizedBox(
                width: 20,
                height: 20,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.maybePop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

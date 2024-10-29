import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

import '../utils/ktv_util.dart';
import 'ktv_music_singer_info.dart';
import 'ktv_singer_icon.dart';

class KtvMusicTwoSinger extends StatefulWidget {
  final ChatRoomData room;

  final KtvInfo ktvInfo;
  final bool needAni;

  const KtvMusicTwoSinger(
      {super.key,
      required this.room,
      required this.ktvInfo,
      this.needAni = false});

  @override
  State<KtvMusicTwoSinger> createState() => _KtvMusicTwoSingerState();
}

class _KtvMusicTwoSingerState extends State<KtvMusicTwoSinger>
    with SingleTickerProviderStateMixin {
  late AnimationController _aniController;

  /// 主唱左移动画
  late Animation<Offset> slideSinger;

  /// 伴唱动画
  late Animation<Offset> slideChorusIcon;
  late Animation<double> fadeChorusIcon;
  late Animation<double> scaleChorusIcon;
  late Animation<Offset> slideChorusInfo;
  late Animation<double> fadeChorusInfo;

  @override
  void initState() {
    super.initState();

    double initValue = 1.0;
    if (widget.needAni) {
      initValue = 0.0;
    }

    _aniController = AnimationController(
        value: initValue,
        vsync: this,
        duration: const Duration(milliseconds: 800));
    CurvedAnimation curve =
        CurvedAnimation(parent: _aniController, curve: Curves.easeInOutSine);
    slideSinger = TweenSequence([
      TweenSequenceItem<Offset>(
          tween: Tween(begin: const Offset(0.5, 0), end: const Offset(0, 0)),
          weight: 30),
      TweenSequenceItem<Offset>(
          tween: Tween(begin: const Offset(0, 0), end: const Offset(0, 0)),
          weight: 8),
    ]).animate(curve);

    slideChorusIcon = TweenSequence([
      TweenSequenceItem<Offset>(
        tween: Tween(
            begin: Offset((Util.width + 32 - 128 - 128) / 2 / 64, 0),
            end: const Offset(0, 0)),
        weight: 30,
      ),
      TweenSequenceItem<Offset>(
          tween: Tween(begin: const Offset(0, 0), end: const Offset(0, 0)),
          weight: 8),
    ]).animate(curve);

    fadeChorusIcon = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 1.0), weight: 30),
      TweenSequenceItem<double>(tween: Tween(begin: 1.0, end: 1.0), weight: 8),
    ]).animate(curve);

    scaleChorusIcon = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween(begin: 48 / 64, end: 1.0), weight: 30),
      TweenSequenceItem<double>(tween: Tween(begin: 1.0, end: 1.0), weight: 8),
    ]).animate(curve);

    slideChorusInfo = TweenSequence([
      TweenSequenceItem<Offset>(
          tween: Tween(
              begin: const Offset(0, 10 / 39), end: const Offset(0, 10 / 39)),
          weight: 30),
      TweenSequenceItem<Offset>(
          tween:
              Tween(begin: const Offset(0, 10 / 39), end: const Offset(0, 0)),
          weight: 8),
    ]).animate(curve);

    fadeChorusInfo = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 0.0), weight: 30),
      TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 1.0), weight: 8),
    ]).animate(curve);

    if (widget.needAni) {
      _aniController.forward();
    }
  }

  @override
  void dispose() {
    _aniController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.ktvInfo.currentSong == null ||
        widget.ktvInfo.currentSong!.uid == 0 ||
        widget.ktvInfo.chorus == null ||
        widget.ktvInfo.chorus!.uid == 0) {
      return SizedBox(height: 115 + KtvUtil.getDiffHeight(widget.room));
    }

    return AnimatedBuilder(
      animation: _aniController,
      builder: (BuildContext context, _) {
        return SizedBox(
          width: Util.width - 32,
          height: 115 + KtvUtil.getDiffHeight(widget.room),
          child: Row(
            children: [
              SizedBox(width: (Util.width - 32 - 128 - 128) / 2),
              SlideTransition(
                position: slideSinger,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    KtvSingerIcon(
                      widget.room,
                      icon: widget.ktvInfo.currentSong!.icon,
                      uid: widget.ktvInfo.currentSong!.uid,
                      isPause: widget.ktvInfo.currentSong!.status ==
                          KtvSingStatus.pause,
                    ),
                    KtvMusicSingerInfo(
                      room: widget.room,
                      uid: widget.ktvInfo.currentSong!.uid,
                      name: widget.ktvInfo.currentSong!.name,
                      weekMusicalNotes:
                          widget.ktvInfo.currentSong!.weekMusicalNotes,
                      songId: widget.ktvInfo.currentSong!.sid,
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SlideTransition(
                    position: slideChorusIcon,
                    child: FadeTransition(
                      opacity: fadeChorusIcon,
                      child: ScaleTransition(
                        scale: scaleChorusIcon,
                        child: KtvSingerIcon(
                          widget.room,
                          icon: widget.ktvInfo.chorus!.icon,
                          uid: widget.ktvInfo.chorus!.uid,
                          isPause: widget.ktvInfo.currentSong!.status ==
                              KtvSingStatus.pause,
                        ),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: slideChorusInfo,
                    child: FadeTransition(
                      opacity: fadeChorusInfo,
                      child: KtvMusicSingerInfo(
                        room: widget.room,
                        uid: widget.ktvInfo.chorus!.uid,
                        name: widget.ktvInfo.chorus!.name,
                        weekMusicalNotes:
                            widget.ktvInfo.chorus!.weekMusicalNotes,
                        songId: widget.ktvInfo.currentSong!.sid,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

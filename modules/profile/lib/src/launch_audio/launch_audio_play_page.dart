import 'dart:async';

import 'package:shared/shared.dart';
import 'package:shared/k.dart' as baseK;
import 'package:flutter/material.dart';
import 'package:profile/assets.dart';
import 'package:profile/src/launch_audio/launch_audio_api.dart';
import 'package:profile/src/launch_audio/launch_audio_group_page.dart';
import 'package:profile/src/model/pb/generated/api_tone.pb.dart';
import '../../k.dart';

/// 启动音播放界面
class LaunchAudioPlayPage extends StatefulWidget {
  final ToneAudio audio;
  final VoidCallback? onClose; // 关闭回调
  final int showTime; // 启屏显示时间
  final bool launchScreen; // 启屏页

  const LaunchAudioPlayPage(this.audio,
      {super.key, this.onClose, this.showTime = 0, this.launchScreen = false});

  static Future launch(BuildContext context, ToneAudio audio) {
    return Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LaunchAudioPlayPage(audio);
    }));
  }

  @override
  State<LaunchAudioPlayPage> createState() => _LaunchAudioPlayPageState();
}

class _LaunchAudioPlayPageState extends State<LaunchAudioPlayPage>
    with TickerProviderStateMixin {
  final int _id = DateTime.now().microsecondsSinceEpoch;

  late AnimationController _animationController;
  Timer? timer;
  late String audioUrl;

  @override
  void initState() {
    super.initState();
    audioUrl = Util.getRemoteImgUrl(widget.audio.url, useProxy: false);
    eventCenter.addListener(AudioPlay.eventAudioStopChanged, _onStopEvent);
    _animationController =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    _animationController.repeat();
    OpenScreenAd.playLaunchAudio(audioUrl, widget.audio.audioDuration, _id);
    if (widget.showTime > 0) {
      timer = Timer(Duration(seconds: widget.showTime), _onClose);
    }
    if (widget.launchScreen) {
      Tracker.instance
          .track(TrackEvent.start_open_tone, properties: {'uid': Session.uid});
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    _animationController.dispose();
    eventCenter.removeListener(AudioPlay.eventAudioStopChanged, _onStopEvent);
    // 启屏页，UI关闭后 还要继续播
    if (!widget.launchScreen) {
      OpenScreenAd.stopLaunchAudio();
    }
    super.dispose();
  }

  void _onStopEvent(String type, dynamic data) {
    if (data is Map) {
      String? url = data['url'];
      if (url == audioUrl) {
        if (widget.launchScreen) {
          _onClose();
        } else {
          // 循环播放
          OpenScreenAd.playLaunchAudio(
              audioUrl, widget.audio.audioDuration, _id);
        }
      }
    }
  }

  void _onClose() {
    timer?.cancel();
    timer = null;
    if (widget.onClose != null) {
      widget.onClose!();
    } else {
      Navigator.pop(context);
    }
  }

  void _onUseClick() async {
    if (!widget.audio.isUse) {
      Tracker.instance.track(TrackEvent.settle_open_tone,
          properties: {'uid': Session.uid, 'audio': widget.audio.id});
    }
    bool result;
    if (widget.audio.isUse) {
      result = await LaunchAudioApi.use(widget.audio.id, false);
    } else {
      result = await LaunchAudioApi.use(widget.audio.id, true);
    }
    if (!mounted) return;
    if (result) {
      widget.audio.isUse = !widget.audio.isUse;
      if (widget.audio.isUse) {
        eventCenter.emit(eventLaunchAudioUseChange, widget.audio);
        _onClose();
      } else {
        eventCenter.emit(eventLaunchAudioUseChange, null);
        refresh();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        toolbarHeight: 44,
        leading: widget.launchScreen
            ? const SizedBox.shrink()
            : GestureDetector(
                onTap: _onClose,
                child: Container(
                  height: 44,
                  width: 60,
                  padding: const EdgeInsetsDirectional.only(start: 16),
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    K.profile_close,
                    style:
                        const TextStyle(color: Color(0x80000000), fontSize: 18),
                  ),
                ),
              ),
        actions: [
          if (!widget.launchScreen)
            GestureDetector(
              onTap: _onUseClick,
              child: Container(
                height: 44,
                width: 60,
                padding: const EdgeInsetsDirectional.only(end: 16),
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  widget.audio.isUse ? baseK.K.cancel : K.profile_use,
                  style: const TextStyle(
                      color: Color(0xE6000000),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
        ],
      ),
      body: _renderBody(),
    );
  }

  Widget _renderBody() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        GestureDetector(
          onTap: () {
            if (widget.launchScreen) {
              _onClose();
            }
            OpenScreenAd.stopLaunchAudio();
            IPersonalDataManager personalDataManager = ComponentManager.instance
                .getManager(ComponentManager.MANAGER_PERSONALDATA);
            personalDataManager.openImageScreen(
                System.context, widget.audio.uid);
            Tracker.instance.track(TrackEvent.open_tone_click,
                properties: {'uid': widget.audio.uid});
          },
          child: Container(
            width: Util.width,
            height: Util.width,
            alignment: AlignmentDirectional.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.profile$launch_audio_bg_audio_webp),
                fit: BoxFit.fill,
              ),
            ),
            child: RotationTransition(
              turns: _animationController,
              child: CommonAvatar(
                path: Util.getRemoteImgUrl(widget.audio.icon, useProxy: false),
                size: 150.dp,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 47.5.dp, end: 47.5.dp),
          child: Text(
            '${widget.audio.nickname}:',
            style: const TextStyle(
              color: Color(0xE6000000),
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 6.dp),
        Expanded(
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.white,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.white,
                ],
                stops: [0.0, 0.06, 0.94, 1.0],
              ).createShader(bounds);
            },
            blendMode: BlendMode.dstOut,
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  top: 4.dp, start: 47.5.dp, end: 47.5.dp, bottom: 4.dp),
              child: SingleChildScrollView(
                child: Text(
                  widget.audio.hotWord,
                  style: const TextStyle(
                    color: Color(0xB3000000),
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 56.dp),
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: 25.5.dp,
            width: 104.dp,
            child: MultiframeImage.asset(
              R.imagePath(Assets.profile$launch_audio_ic_logo_webp),
            ),
          ),
        ),
        SizedBox(height: 60.dp),
      ],
    );
  }
}

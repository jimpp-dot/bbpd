import 'dart:ui';

import 'package:shared/k.dart';
import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../assets.dart';

mixin SoundPlayer<T extends StatefulWidget> on State<T> {
  int leftSeconds = 0;
  PlayerState playerState = PlayerState.stopped;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener('Home.Audio.Play', onAudioPlayListener);
    eventCenter.addListener('Home.Audio.Stop', onAudioPlayListener);

    if (autoStop) appStateObserver.addListener(onAppStateChanged);
  }

  @override
  void dispose() {
    if (autoStop) appStateObserver.removeListener(onAppStateChanged);
    eventCenter.removeListener('Home.Audio.Play', onAudioPlayListener);
    eventCenter.removeListener('Home.Audio.Stop', onAudioPlayListener);
    AudioPlay.instance().stop(messageId: hashCode);
    playerState = PlayerState.stopped;
    super.dispose();
  }

  @protected
  String get audioUrl;

  @protected
  int get duration;

  @protected
  bool get autoStop => false;

  onAudioPlayListener(String type, dynamic data) {
    Map res = data;
    String audioUrl = Util.notNullStr(res['url']);
    int seconds = Util.parseInt(res['seconds']);
    int messageId = Util.parseInt(res['messageid']);
    if (messageId > 0 && messageId != hashCode) return;

    if (audioUrl != audioUrl) return;

    Log.d("_onStopAudioPlay type=$type seconds=$seconds audioUrl=$audioUrl");
    if (type == 'Home.Audio.Play') {
      onAudioTick(seconds);
    } else if (type == 'Home.Audio.Stop') {
      onAudioStopped();
    }
  }

  @protected
  @mustCallSuper
  void onAudioTick(int seconds) {
    playerState = PlayerState.playing;
  }

  @protected
  @mustCallSuper
  void onAudioStopped() {
    playerState = PlayerState.stopped;
  }

  Future play({bool isLocal = false}) async {
    if (audioUrl.isNotEmpty) {
      AudioPlay.instance().play(audioUrl, duration, messageId: hashCode);
    }
  }

  void onAppStateChanged() {
    if (autoStop) AudioPlay.instance().stop(messageId: hashCode);
  }
}

class SoundButton extends StatefulWidget {
  final String? audioUrl;
  final int? duration;
  final Widget? tagWidget;
  final Color? color;
  final Color imageColor;
  final double iconTextPadding;
  final double soundIconSize;
  final double soundIconLeftPadding;
  final bool needCircle;

  const SoundButton({
    Key? key,
    this.audioUrl,
    this.duration,
    this.tagWidget,
    this.color,
    this.imageColor = Colors.white,
    this.iconTextPadding = 4.0,
    this.soundIconSize = 20,
    this.soundIconLeftPadding = 4,
    this.needCircle = true,
  }) : super(key: key);

  @override
  SoundButtonState createState() => SoundButtonState();
}

class SoundButtonState extends State<SoundButton>
    with AutomaticKeepAliveClientMixin<SoundButton>, SoundPlayer<SoundButton> {
  @override
  String get audioUrl => widget.audioUrl ?? '';

  @override
  int get duration => widget.duration ?? 0;

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  void initState() {
    super.initState();
    leftSeconds = widget.duration ?? 0;
  }

  @override
  void onAudioTick(int seconds) {
    super.onAudioTick(seconds);
    leftSeconds = seconds;
    _refresh();
  }

  @override
  void onAudioStopped() {
    super.onAudioStopped();
    leftSeconds = widget.duration ?? 0;
    _refresh();
  }

  _refresh() {
    if (mounted) setState(() {});
  }

  Color get textColor {
    return widget.color ?? R.color.mainBrandColor;
  }

  Widget _buildContent() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        if (widget.tagWidget != null) widget.tagWidget!,
        if (widget.tagWidget != null) const SizedBox(width: 4.0),
        SizedBox(width: widget.soundIconLeftPadding),
        widget.needCircle
            ? ClipOval(
                child: Container(
                  width: widget.soundIconSize,
                  height: widget.soundIconSize,
                  color: widget.imageColor,
                  child: R.img(
                    playerState == PlayerState.playing
                        ? "home/icon_sound.webp"
                        : "home/icon_sound.png",
                    width: widget.soundIconSize,
                    height: widget.soundIconSize,
                    fit: BoxFit.cover,
                    package: ComponentManager.MANAGER_BASE_CORE,
                  ),
                ),
              )
            : Container(
                width: widget.soundIconSize,
                height: widget.soundIconSize,
                color: widget.imageColor,
                child: R.img(
                  playerState == PlayerState.playing
                      ? "home/icon_sound.webp"
                      : "home/icon_sound.png",
                  width: widget.soundIconSize,
                  height: widget.soundIconSize,
                  fit: BoxFit.cover,
                  package: ComponentManager.MANAGER_BASE_CORE,
                ),
              ),
        SizedBox(width: widget.iconTextPadding),
        Text(
          '${leftSeconds.toString()}s',
          textScaleFactor: 1.0,
          style: TextStyle(
              fontSize: 12.0, color: textColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        (widget.audioUrl != null && widget.audioUrl!.isNotEmpty)
            ? InkWell(
                onTap: play,
                child: _buildContent(),
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (widget.tagWidget != null) widget.tagWidget!,
                  Container(width: 8.0),
                ],
              ),
      ],
    );
  }
}

class SoundStadiumButton extends SoundStadiumEmptyButton {
  final Color? color;
  final double iconTextPadding;
  final double soundIconSize;
  final double soundIconLeftPadding;
  final Color? borderColor;
  final Color? bgColor;
  final bool hideCountdown;
  final bool supportDark;

  const SoundStadiumButton(
      {Key? key,
      String? audioUrl,
      int? duration,
      bool autoStop = true,
      this.color,
      this.iconTextPadding = 6,
      this.soundIconSize = 20,
      this.soundIconLeftPadding = 4,
      this.borderColor,
      this.bgColor,
      this.supportDark = false,
      this.hideCountdown = false})
      : super(
            key: key,
            audioUrl: audioUrl,
            duration: duration,
            autoStop: autoStop);

  @override
  SoundStadiumButtonState createState() => SoundStadiumButtonState();
}

class SoundStadiumButtonState
    extends SoundStadiumEmptyButtonState<SoundStadiumButton> {
  Color get textColor {
    return widget.color ??
        (widget.supportDark ? R.colors.soundTextColor : R.color.mainBrandColor);
  }

  Color get borderColor {
    return widget.borderColor ??
        (widget.supportDark ? R.colors.soundBorderColor : R.color.thirdBgColor);
  }

  Color get bgColor {
    return widget.bgColor ??
        (widget.supportDark ? R.colors.mainBgColor : Colors.transparent);
  }

  @override
  Widget get subClassChild {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(width: widget.soundIconLeftPadding),
        ClipOval(
          child: SizedBox(
            width: widget.soundIconSize,
            height: widget.soundIconSize,
            child: R.img(
              playerState == PlayerState.playing
                  ? "home/sound_play.webp"
                  : "home/sound_normal.svg",
              width: widget.soundIconSize,
              height: widget.soundIconSize,
              fit: BoxFit.cover,
              package: ComponentManager.MANAGER_BASE_CORE,
              color: widget.supportDark
                  ? R.colors.tagTextV2Color
                  : R.color.mainBrandColor,
            ),
          ),
        ),
        if (!widget.hideCountdown) ...[
          SizedBox(width: widget.iconTextPadding),
          Text(
            '${leftSeconds.toString()}s',
            textScaleFactor: 1.0,
            style: TextStyle(
                fontSize: 12.0, color: textColor, fontWeight: FontWeight.bold),
          ),
        ],
        SizedBox(
            width: widget.hideCountdown ? widget.soundIconLeftPadding : 12),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!Util.validStr(widget.audioUrl)) {
      return super.build(context);
    }

    return Container(
        decoration: ShapeDecoration(
          shape: StadiumBorder(side: BorderSide(color: borderColor)),
          color: bgColor,
        ),
        height: 28,
        alignment: AlignmentDirectional.center,
        child: super.build(context));
  }
}

class SoundStadiumEmptyButton extends StatefulWidget {
  final String? audioUrl;
  final int? duration;
  final bool autoStop;
  final GestureTapCallback? onTap;

  const SoundStadiumEmptyButton(
      {Key? key,
      this.audioUrl,
      this.duration,
      this.autoStop = true,
      this.onTap})
      : super(key: key);

  @override
  SoundStadiumEmptyButtonState createState() => SoundStadiumEmptyButtonState();
}

class SoundStadiumEmptyButtonState<T extends SoundStadiumEmptyButton>
    extends State<T> with AutomaticKeepAliveClientMixin<T>, SoundPlayer<T> {
  Widget get subClassChild {
    return const SizedBox.shrink();
  }

  @override
  String get audioUrl => widget.audioUrl ?? '';

  @override
  int get duration => widget.duration ?? 0;

  @override
  @protected
  bool get autoStop => widget.autoStop;

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  void onAudioTick(int seconds) {
    super.onAudioTick(seconds);
    leftSeconds = seconds;
    _refresh();
  }

  @override
  void onAudioStopped() {
    super.onAudioStopped();
    leftSeconds = widget.duration ?? 0;
    _refresh();
  }

  _refresh() {
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    leftSeconds = widget.duration ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (!Util.validStr(widget.audioUrl)) {
      return Container();
    }

    return InkWell(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        }
        play();
      },
      child: subClassChild,
    );
  }
}

class FateSoundWidget extends StatefulWidget {
  final String? audioUrl;
  final int? duration;
  final Color? color;
  final double iconTextPadding;
  final bool autoStop;
  final double soundIconSize;
  final VoidCallback? onPlay;

  const FateSoundWidget({
    Key? key,
    this.audioUrl,
    this.duration,
    this.color,
    this.iconTextPadding = 9.0,
    this.autoStop = true,
    this.soundIconSize = 20,
    this.onPlay,
  }) : super(key: key);

  @override
  FateSoundState createState() => FateSoundState();
}

class FateSoundState extends State<FateSoundWidget>
    with
        AutomaticKeepAliveClientMixin<FateSoundWidget>,
        SoundPlayer<FateSoundWidget> {
  @override
  String get audioUrl => widget.audioUrl ?? '';

  @override
  int get duration => widget.duration ?? 0;

  @override
  @protected
  bool get autoStop => widget.autoStop;

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  void initState() {
    super.initState();
    leftSeconds = widget.duration ?? 0;
  }

  @override
  void onAudioTick(int seconds) {
    super.onAudioTick(seconds);
    leftSeconds = seconds;
    _refresh();
  }

  @override
  void onAudioStopped() {
    super.onAudioStopped();
    leftSeconds = widget.duration ?? 0;
    _refresh();
  }

  _refresh() {
    if (mounted) setState(() {});
  }

  Color get textColor {
    return widget.color ?? R.color.mainBrandColor;
  }

  Widget _buildContent() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        R.img(
          playerState == PlayerState.playing
              ? 'icon_audio_playing.webp'
              : 'icon_audio_playing.png',
          width: 13,
          height: 15,
          fit: BoxFit.cover,
          package: ComponentManager.MANAGER_PERSONALDATA,
        ),
        SizedBox(width: widget.iconTextPadding),
        Text(
          '${leftSeconds.toString()}\'\'',
          textScaleFactor: 1.0,
          style: TextStyle(
              fontSize: 13.0, color: textColor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (!Util.validStr(widget.audioUrl)) {
      return const SizedBox.shrink();
    }
    return Container(
      height: 24,
      width: 58,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(12),
        gradient: const LinearGradient(
          colors: [Color(0xFFFFA45E), Color(0xFFFCD315)],
        ),
      ),
      child: InkWell(
        onTap: play,
        child: _buildContent(),
      ),
    );
  }
}

class ChatCardSoundButton extends StatefulWidget {
  final String audioUrl;
  final int duration;
  final bool suppDark;

  const ChatCardSoundButton(
      {Key? key, this.audioUrl = '', this.duration = 0, this.suppDark = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ChatCardSoundButtonState();
}

class ChatCardSoundButtonState extends State<ChatCardSoundButton>
    with SoundPlayer<ChatCardSoundButton> {
  @override
  String get audioUrl => widget.audioUrl;

  @override
  int get duration => widget.duration;

  @override
  bool get autoStop => true;

  @override
  void initState() {
    super.initState();
    leftSeconds = widget.duration;
  }

  @override
  void onAudioTick(int seconds) {
    super.onAudioTick(seconds);
    refresh(() {
      leftSeconds = seconds;
    });
  }

  @override
  void onAudioStopped() {
    super.onAudioStopped();
    refresh(() {
      leftSeconds = widget.duration;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!Util.validStr(widget.audioUrl)) {
      return const SizedBox();
    }
    return InkWell(
      onTap: play,
      child: Container(
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        alignment: AlignmentDirectional.center,
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          color: widget.suppDark
              ? R.colors.moduleBgColor
              : const Color(0xFFF6F7F9),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                gradient: LinearGradient(
                  colors: widget.suppDark
                      ? R.colors.mainBrandGradientColors
                      : R.color.mainBrandGradientColors,
                ),
              ),
              alignment: AlignmentDirectional.center,
              child: R.img(
                  (playerState == PlayerState.playing)
                      ? 'chat_card_audio_stop.webp'
                      : 'chat_card_audio_play.webp',
                  width: 18,
                  height: 18,
                  color: widget.suppDark ? R.colors.brightTextColor : null,
                  package: ComponentManager.MANAGER_BASE_CORE),
            ),
            const SizedBox(width: 6),
            MultiframeImage.asset(
              R.imagePath('chat_card_audio_anim.webp',
                  package: ComponentManager.MANAGER_BASE_CORE),
              width: 42,
              height: 12,
              pause: !(playerState == PlayerState.playing),
              pauseShowFirst: true,
              loop: true,
            ),
            const SizedBox(width: 6),
            Text('${leftSeconds}s',
                style: TextStyle(
                    color: widget.suppDark
                        ? R.colors.thirdTextColor
                        : R.color.thirdTextColor,
                    fontSize: 12)),
            const SizedBox(width: 4),
          ],
        ),
      ),
    );
  }
}

/// 个人主页顶部背景图上的录制声音简介按钮
class PersonalHomePageSoundButton extends StatefulWidget {
  final String audioUrl;
  final int duration;
  final VoidCallback? toImageModifyScreen;

  const PersonalHomePageSoundButton(
      {Key? key,
      this.audioUrl = '',
      this.duration = 0,
      this.toImageModifyScreen})
      : super(key: key);

  @override
  State<PersonalHomePageSoundButton> createState() =>
      _PersonalHomePageSoundButtonState();
}

class _PersonalHomePageSoundButtonState
    extends State<PersonalHomePageSoundButton>
    with SoundPlayer<PersonalHomePageSoundButton> {
  @override
  String get audioUrl => widget.audioUrl;

  @override
  int get duration => widget.duration;

  @override
  bool get autoStop => true;

  @override
  void initState() {
    super.initState();
    leftSeconds = widget.duration;
  }

  @override
  void onAudioTick(int seconds) {
    super.onAudioTick(seconds);
    refresh(() {
      leftSeconds = seconds;
    });
  }

  @override
  void onAudioStopped() {
    super.onAudioStopped();
    refresh(() {
      leftSeconds = widget.duration;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap:
            Util.validStr(widget.audioUrl) ? play : widget.toImageModifyScreen,
        child: Container(
          height: 54,
          width: 153,
          alignment: AlignmentDirectional.centerStart,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SizedBox(
                width: 121,
                height: 28,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0x2999FFBC),
                          Color(0x2926C4FF),
                          Color(0x29926AFF)
                        ]),
                      ),
                    ),
                  ),
                ),
              ),
              Rext.autoStyleImg(BaseAssets.shared$home_sound_record_bg_webp,
                  width: 153,
                  height: 54,
                  package: ComponentManager.MANAGER_BASE_CORE,
                  fit: BoxFit.fill),
              Container(
                height: 28,
                padding: const EdgeInsetsDirectional.only(start: 19, end: 8),
                child: Row(
                  children: [
                    ClipOval(
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            gradient: LinearGradient(
                              colors: R.colors.mainBrandGradientColors,
                            )),
                        child: R.img(
                          playerState == PlayerState.playing
                              ? BaseAssets.shared$home_icon_playing_webp
                              : BaseAssets.shared$home_icon_play_webp,
                          width: 24,
                          height: 24,
                          fit: BoxFit.cover,
                          package: ComponentManager.MANAGER_BASE_CORE,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    if (Util.validStr(widget.audioUrl)) ...[
                      MultiframeImage.asset(
                        R.imagePath('profile_audio_animation.webp',
                            package: ComponentManager.MANAGER_BASE_CORE),
                        width: 54,
                        height: 16,
                        pause: !(playerState == PlayerState.playing),
                        pauseShowFirst: true,
                        loop: true,
                      ),
                      const SizedBox(width: 4),
                      Text('$leftSeconds\'',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                    ] else
                      Text(
                        K.base_record_sound_brief,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

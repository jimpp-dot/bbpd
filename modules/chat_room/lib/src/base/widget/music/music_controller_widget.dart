import 'dart:math';

import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/model/music_bean.dart';
import 'package:flutter/material.dart';

/// 返回音量的变化，范围[0,100]
typedef MusicVolumeChange = void Function(double volume);

/// 返回当前播放进度拖拽后的进度
typedef MusicProgressChange = void Function(int progress);

/// 音乐播放底部的操作控件
class MusicControllerWidget extends StatefulWidget {
  final double musicVolume;
  final String musicName;
  final int progress;
  final int duration;
  final bool isPlaying;
  final MusicPlayType playType;
  final MusicVolumeChange? volumeChange;
  final MusicProgressChange? progressChange;

  final VoidCallback? onTapPlayType;
  final VoidCallback? onTapPreMusic;
  final VoidCallback? onTapPlayMusic;
  final VoidCallback? onTapNextMusic;

  final bool hideVolume;

  const MusicControllerWidget({
    super.key,
    this.musicVolume = 50,
    this.isPlaying = false,
    this.musicName = '',
    this.progress = 0,
    this.duration = 0,
    this.playType = MusicPlayType.Cycle,
    this.volumeChange,
    this.progressChange,
    this.onTapPlayType,
    this.onTapPreMusic,
    this.onTapPlayMusic,
    this.onTapNextMusic,
    this.hideVolume = false,
  });

  @override
  State<MusicControllerWidget> createState() => _MusicControllerWidgetState();
}

class _MusicControllerWidgetState extends State<MusicControllerWidget> {
  double _playerBottom = 0.0;
  double _playerOpacity = 0.0;

  /// 当前音量
  double _currentVolume = 50;

  double? _dragValue;

  @override
  void initState() {
    super.initState();
    _currentVolume = widget.musicVolume;
  }

  @override
  Widget build(BuildContext context) {
    double current = 0.0;
    if (widget.duration > 0) {
      current = max(0.0, min(1.0, widget.progress / widget.duration));
    }
    if (_dragValue != null) {
      current = _dragValue!;
    }

    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        _buildVolumeSlider(),
        Container(
          height: 160.0,
          margin: EdgeInsets.only(top: _playerBottom == 0.0 ? 0.0 : 56.0),
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          decoration: BoxDecoration(
            color: R.color.mainBgColor,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Theme.of(context).dividerColor,
                  offset: const Offset(0.0, -1.0),
                  blurRadius: 1.0)
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 12),

              /// 音乐的标题
              Text(
                widget.musicName,
                style: TextStyle(color: R.color.mainTextColor, fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              _buildProgressDuration(current),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _buildPlayType(),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _buildPreMusic(),
                          _buildPlayMusic(),
                          _buildNextMusic(),
                        ],
                      ),
                    ),
                    _buildVolume()
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  /// 播放模式(循环，单曲，随机)
  Widget _buildPlayType() {
    return IconButton(
      iconSize: 32,
      icon: R.img(widget.playType.getPlayAssetPath(),
          package: ComponentManager.MANAGER_BASE_ROOM,
          width: 32,
          color: R.color.mainTextColor),
      onPressed: widget.onTapPlayType,
    );
  }

  /// 音量标识
  Widget _buildVolume() {
    if (widget.hideVolume) {
      return const SizedBox(width: 32);
    }
    return IconButton(
      iconSize: 32,
      icon: R.img(
        widget.musicVolume == 0
            ? RoomAssets.chat_room$music_music_slience_svg
            : RoomAssets.chat_room$music_icon_music_voice_setting_svg,
        package: ComponentManager.MANAGER_BASE_ROOM,
        color: R.color.mainTextColor,
        width: 32,
      ),
      onPressed: () {
        if (_playerBottom == 0.0) {
          _playerBottom = 176.0;
          _playerOpacity = 1.0;
          refresh();
        } else {
          _playerBottom = 0.0;
          _playerOpacity = 0.0;
          refresh();
        }
      },
    );
  }

  /// 播放/暂停
  Widget _buildPlayMusic() {
    return IconButton(
      onPressed: widget.onTapPlayMusic,
      iconSize: 36,
      icon: R.img(
        widget.isPlaying
            ? RoomAssets.chat_room$music_music_pause_svg
            : RoomAssets.chat_room$music_music_big_play_svg,
        package: ComponentManager.MANAGER_BASE_ROOM,
        color: R.color.mainTextColor,
        width: 36,
      ),
    );
  }

  /// 下一首音乐
  Widget _buildNextMusic() {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: IconButton(
        onPressed: widget.onTapNextMusic,
        iconSize: 24,
        icon: R.img(
          RoomAssets.chat_room$music_music_next_svg,
          package: ComponentManager.MANAGER_BASE_ROOM,
          color: R.color.mainTextColor,
          width: 24,
        ),
      ),
    );
  }

  /// 上一首歌
  Widget _buildPreMusic() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 30),
      child: IconButton(
        onPressed: widget.onTapPreMusic,
        iconSize: 24,
        icon: R.img(RoomAssets.chat_room$music_music_pre_svg,
            color: R.color.mainTextColor, width: 24),
      ),
    );
  }

  /// 当前的播放进度，时长，并且可以拖拽改变进度
  Widget _buildProgressDuration(double current) {
    return Container(
      height: 56,
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        children: <Widget>[
          Text(
            _formatTime(widget.progress),
            style: TextStyle(fontSize: 13, color: R.color.mainTextColor),
          ),
          Expanded(
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackShape: const RoundedRectSliderTrackShape(),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 12),
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 3),
              ),
              child: Slider(
                min: 0.0,
                max: 1.0,
                value: current,
                activeColor: R.color.mainTextColor,
                inactiveColor: R.color.thirdTextColor,
                onChangeStart: (double value) {},
                onChangeEnd: (double value) async {
                  int position = (value * widget.duration).toInt();
                  widget.progressChange?.call(position);
                  _dragValue = null;
                  refresh();
                },
                onChanged: (double value) {
                  setState(() {
                    _dragValue = value;
                  });
                },
              ),
            ),
          ),
          Text(
            _formatTime(widget.duration),
            style: TextStyle(fontSize: 13, color: R.color.mainTextColor),
          ),
        ],
      ),
    );
  }

  String _formatTime(int time) {
    int second = time ~/ 1000;
    int m = second ~/ 60;
    int s = second % 60;
    return '${m > 9 ? m.toString() : '0$m'}:${s > 9 ? s.toString() : '0$s'}';
  }

  /// 悬浮移动出来的音量调节
  Widget _buildVolumeSlider() {
    return AnimatedPositioned(
      left: 90.0,
      bottom: _playerBottom,
      width: 194.0,
      height: 40.0,
      duration: const Duration(milliseconds: 500),
      child: AnimatedOpacity(
        opacity: _playerOpacity,
        duration: const Duration(milliseconds: 500),
        child: Container(
          decoration: BoxDecoration(
            color: R.color.mainBgColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Theme.of(context).dividerColor,
                offset: const Offset(0.0, -1.0),
                blurRadius: 8.0,
              )
            ],
          ),
          padding: const EdgeInsets.only(left: 12.0, right: 0.0),
          child: Row(
            children: <Widget>[
              Text(
                K.room_music_volume,
                style: TextStyle(color: R.color.mainTextColor),
              ),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackShape: const RoundedRectSliderTrackShape(),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 20),
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 3),
                  ),
                  child: Slider(
                    activeColor: R.color.mainTextColor,
                    inactiveColor: R.color.thirdTextColor,
                    value: _currentVolume,
                    min: 0.0,
                    max: 100.0,
                    onChanged: (double value) {
                      _currentVolume = value;
                      widget.volumeChange?.call(value);
                      refresh();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

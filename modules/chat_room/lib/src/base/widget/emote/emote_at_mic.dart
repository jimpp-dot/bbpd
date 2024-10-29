import 'dart:async';

import 'package:chat_room/src/base/widget/emote/emote_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

///  麦上emoji 表情
///
class EmoteAtMic extends StatefulWidget {
  final int uid;
  final int position;
  final double width;

  const EmoteAtMic({Key? key, required this.uid, this.position = -1, required this.width}) : super(key: key);

  @override
  _EmoteAtMicState createState() => _EmoteAtMicState();
}

class _Emote {
  final String image;
  final String key;
  final int uid;
  final int format;
  final double riveValue;

  _Emote(this.image, this.key, this.uid, this.format, {this.riveValue = 1});
}

class _EmoteAtMicState extends State<EmoteAtMic> {
  Timer? _timer;
  _Emote? _emote;

  final List<_Emote> _queue = [];

  final IChatManager _chatManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);

  @override
  void initState() {
    super.initState();
    eventCenter.addListener('Room.Emote', _onEmote);
  }

  @override
  void dispose() {
    eventCenter.removeListener('Room.Emote', _onEmote);
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  _onEmote(String type, dynamic data) {
    Map extra = data as Map;
    if (!extra.containsKey('emote_sender')) return;
    int uid = Util.parseInt(extra['emote_sender']);
    if (uid != widget.uid) return;

    Log.d("_onEmote --------------------------> extra=$extra");
    String key;
    String image;
    int format = Util.parseInt(extra['img_format']);
    String riveUrl = Util.parseStr(extra['effect_url']) ?? '';
    double riveValue = Util.parseDouble(extra['fvalue'], -1);
    if (Util.validStr(riveUrl) && riveValue > 0) {
      /// rive格式
      image = Util.getRemoteImgUrl(riveUrl);
      key = Util.parseStr(extra['emote']) ?? '';
      format = EmoteImgFormat.RIVE;
    } else {
      switch (Util.parseStr(extra['emote'])) {
        case 'card':
          return;
        case 'stone':
        case 'stone_new':
        case 'rand':
        case 'rand_new':
        case 'coin':
        case 'coin_new':
          if (extra.containsKey('emote_data') && extra['emote_data'] is List) {
            List res = extra['emote_data'];
            if (res.isNotEmpty) {
              key = Util.parseStr(extra['emote']) ?? '';
              image = EmoteUtil.emoteMicEffectUrl('${key}_${res[0]}', format);
            } else {
              return;
            }
          } else {
            return;
          }
          break;

        default:
          key = Util.parseStr(extra['emote']) ?? '';
          image = EmoteUtil.emoteMicEffectUrl(key, format);
          break;
      }
    }

    _Emote emote = _Emote(image, key, uid, format, riveValue: riveValue);
    Log.d('emote insert:${emote.image}');
    if (_emote != null || _timer != null) {
      _queue.insert(0, emote);
    } else {
      setState(() {
        _emote = emote;
      });
      _check();
    }
  }

  void _onComplete() {
    _clear();
  }

  _clear() async {
    _timer?.cancel();
    _timer = null;

    if (mounted) {
      setState(() {
        _emote = null;
      });
    }
    if (_queue.isNotEmpty) {
      _removeUpdatedFromQueue();
      _timer = Timer(const Duration(milliseconds: 500), _next);
    }
  }

  _next() {
    _timer?.cancel();
    _timer = null;

    if (_queue.isEmpty) return;
    _Emote emote = _queue.removeLast();

    if (!mounted) {
      return;
    }

    setState(() {
      _emote = emote;
    });
    _check();
  }

  _removeUpdatedFromQueue() {
    _queue.removeWhere((emote) => emote.uid != widget.uid);
  }

  _check() {
    _timer?.cancel();
    _timer = Timer(const Duration(milliseconds: 4000), _onComplete);
  }

  @override
  Widget build(BuildContext context) {
    if (_emote == null) {
      return const SizedBox.shrink();
    }
    double imageWidth = widget.width;
    double scale = 5 / 3;
    double width = imageWidth * scale;
    double top = (imageWidth - width);
    return PositionedDirectional(
      start: top / 2,
      top: top / 2,
      width: width,
      height: width,
      child: Align(
        alignment: Alignment.topCenter,
        child: IgnorePointer(
          child: Container(
            padding: const EdgeInsets.all(18),
            width: width,
            height: width,
            child: RepaintBoundary(
              child: _buildRemote(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRemote() {
    if (Session.lowDeviceSpecialEffect == 1) {
      /// 关闭动效时，展示一个静态图片
      return Center(
        child: CachedNetworkImage(
          imageUrl: EmoteUtil.emoteImgUrl(_emote?.key ?? ''),
          width: widget.width,
          height: widget.width,
        ),
      );
    }
    switch (_emote?.format) {
      case EmoteImgFormat.WEBP:
        return Center(
          child: MultiframeImage.network(
            _emote?.image,
            'emote',
            loop: true,
            onComplete: _onComplete,
          ),
        );
      case EmoteImgFormat.RIVE:
        return BbStateRive.network(
          path: Util.getRemoteImgUrl(_emote?.image ?? ''),
          riveValue: _emote?.riveValue ?? 1,
          loop: false,
          alignment: Alignment.center,
          fit: BoxFit.contain,
          onComplete: _onComplete,
        );
      default:
        return _chatManager.getGifRemote(uri: _emote?.image ?? '', onComplete: _onComplete);
    }
  }
}

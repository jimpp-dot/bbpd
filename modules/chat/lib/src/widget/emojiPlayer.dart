import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:shared/shared.dart';
import 'package:chat/src/bottom/emote.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart';

/// 私聊 emoji
///
class EmojiPlayer extends StatefulWidget {
  const EmojiPlayer({super.key});

  @override
  _State createState() => _State();
}

class EmojiConfig {
  final GlobalKey key;
  final String icon;
  final String? audio;

  EmojiConfig(this.key, this.icon, this.audio);
}

class _State extends State<EmojiPlayer> {
  final List<EmojiConfig> _data = [];
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer()..setReleaseMode(ReleaseMode.stop);
    eventCenter.addListener("UserChat.PlayEmoji", _onPlay);
    eventCenter.addListener(Im.EventMessageReceived, _onEvent);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    eventCenter.removeListener(Im.EventMessageReceived, _onEvent);
    eventCenter.removeListener("UserChat.PlayEmoji", _onPlay);
    super.dispose();
  }

  void _onEvent(String type, Object? value) async {
    if (!mounted || value is! Map) return;

    try {
      Map data = value;
      if (data['message'] is! Map<String, dynamic>) return;

      MessageContent message = MessageContent.fromJson(data['message']);
      if (message.type == 'text' && message.extra != null) {
        Map? extra;
        extra = json.decode(message.extra!);
        if (extra != null) {
          bool isEmoji = extra.containsKey('icon') &&
              extra.containsKey('type') &&
              (extra['type'] == 'emoji' ||
                  extra['type'] == 'magic' ||
                  extra['type'] == 'yellow' ||
                  extra['type'] == 'gif' ||
                  extra['type'] == 'dan' ||
                  extra['type'] == 'custom');
          if (isEmoji) {
            if (extra['icon'].toString().startsWith("magic.")) {
              _onPlay('UserChat.PlayEmoji', extra['icon']);
            }
          }
        }
      }
    } catch (e) {
      Log.d('EmojiPlayer decode failed:${e.toString()}');
    }
  }

  _onPlay(String type, dynamic data) {
    String? audio;
    for (int i = 0; i < magicEmotes.length; i++) {
      if (magicEmotes[i].key == data) {
        audio = magicEmotes[i].audio;

        Log.d("EmojiPlayer _onPlay $audio");
        audio = 'packages/chat/$audio'; //硬编，chat为当前audio文件所在的模块名
        Log.d("EmojiPlayer _onPlay $audio");

        break;
      }
    }

    _data.add(EmojiConfig(GlobalKey(), data, audio));
    if (mounted) {
      setState(() {});
    }
  }

  _onComplete(EmojiConfig config) {
    Log.d("play emoji audio complete:${config.audio}");
    _data.remove(config);
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      start: 0.0,
      end: 0.0,
      top: 0.0,
      bottom: 0.0,
      child: IgnorePointer(
        child: Stack(
          children: _data.map((EmojiConfig config) {
            return EmojiAni(
              key: config.key,
              config: config,
              onComplete: _onComplete,
              player: _audioPlayer,
            );
          }).toList(),
        ),
      ),
    );
  }
}

typedef OnEmojiComplete = Function(EmojiConfig config);

class EmojiAni extends StatefulWidget {
  final EmojiConfig config;
  final OnEmojiComplete onComplete;
  final AudioPlayer player;

  const EmojiAni(
      {super.key,
      required this.config,
      required this.onComplete,
      required this.player});

  @override
  _EmojiAniState createState() => _EmojiAniState();
}

class _EmojiAniState extends State<EmojiAni>
    with SingleTickerProviderStateMixin<EmojiAni> {
  late AnimationController _controller;
  late Animation _left;
  late double _top;
  late String _image;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _left = Tween(begin: -100.0, end: Util.width).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.easeOut),
      ),
    );

    String prefix = '${System.imageDomain}static/xs/emote/';
    List<String> res = widget.config.icon.split(".");
    String ext = res.removeLast();
    String name = res.removeLast();
    _image = '$prefix${res.join('/')}/$name.$ext';

    Random random = Random();
    _top = random
        .nextInt(Util.height.toInt() - 100 - Util.iphoneXBottom.toInt())
        .toDouble();
    _controller.addStatusListener(_onChanged);
    _controller.addListener(_onUpdate);
    _controller.forward(from: 0.0);

    _play();
  }

  _play() async {
    if (widget.config.audio != null && widget.config.audio!.isNotEmpty) {
      Log.d("play emoji audio:${widget.config.audio}");

      Digest digest = sha1.convert(utf8.encode(widget.config.audio!));
      String key = digest.toString().toLowerCase();

      File file = File(join(Constant.temporaryDirectory.path, '$key.mp3'));

      if (await file.exists() == false) {
        try {
          ByteData bytes = await otaResourceBundle.load(widget.config.audio!);
          await file.writeAsBytes(bytes.buffer.asInt8List(), flush: true);
        } catch (e) {
          Log.d('play emoji audio error:$e');
          return;
        }
      }
      widget.player.play(DeviceFileSource(file.path));
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onUpdate);
    _controller.removeStatusListener(_onChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      widget.onComplete(widget.config);
    }
  }

  void _onUpdate() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      top: _top,
      start: _left.value,
      child: SizedBox(
        width: 100.0,
        height: 100.0,
        child:
            CachedNetworkImage(imageUrl: _image, width: 100.0, height: 100.0),
      ),
    );
  }
}

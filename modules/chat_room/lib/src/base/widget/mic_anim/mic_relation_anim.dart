import 'dart:async';
import 'dart:typed_data';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/base/widget/user_icon_plugin.dart';
import 'package:chat_room/src/protobuf/generated/gift_relation_mic_effect.pb.dart';
import 'package:flutter/material.dart';

/// 关系打赏动效
///
class MicEffectPlugin extends UserIconPlugin {
  static const String eventMicEffect =
      '${RoomConstant.Event_Pb_Prefix}gift.relationship.mic.effect';

  final int maxNum = 20;

  final List<MicRelationEffect> _effectsBuff = [];
  MicRelationEffect? _playEffect;

  @override
  bool get effect => true;

  @override
  String get name => UserIconPlugin.micRelation;

  @override
  void onInitState() {
    super.onInitState();
    room.addListener(eventMicEffect, _onReceiveMsg);
  }

  @override
  void onDispose() {
    room.removeListener(eventMicEffect, _onReceiveMsg);
    _effectsBuff.clear();
    _playEffect = null;
    super.onDispose();
  }

  _onReceiveMsg(String type, data) {
    // Log.d('eventMicEffect: $type');

    try {
      if (data is Uint8List) {
        GiftRelationMicEffect effect = GiftRelationMicEffect.fromBuffer(data);
        if (roomPosition.uid <= 0) {
          _effectsBuff.clear();
          return;
        }
        for (var uid in effect.uid) {
          MicRelationEffect effectData = MicRelationEffect(
            uid: uid,
            duration: effect.timeSecond,
            url: effect.url,
            key: GlobalKey(),
          );
          if (roomPosition.uid != effectData.uid) continue;
          Log.d('eventMicEffect: $effect');
          if (_playEffect == null) {
            _playEffect = effectData;
          } else if (_effectsBuff.length < maxNum) {
            _effectsBuff.add(effectData);
          } else {
            Log.d('eventMicEffect: full');
          }
        }

        refreshUI();
      }
    } catch (e) {
      Log.d('eventMicEffect error${e.toString()}');
    }
  }

  _onComplete(MicRelationEffect data) {
    Log.d('eventMicEffect _onComplete');
    _playEffect = null;
    if (_effectsBuff.isNotEmpty) {
      _playEffect = _effectsBuff.removeAt(0);
    }
    refreshUI();
  }

  @override
  List<Widget> buildWidgets() {
    List<Widget> res = <Widget>[];
    //惩罚的搞笑头像框

    if (_playEffect != null && roomPosition.uid > 0) {
      double overflow = -14.0 * size / 60;
      res.add(PositionedDirectional(
        start: overflow,
        end: overflow,
        top: overflow,
        bottom: overflow,
        child:
            _RelationEffect(_playEffect!, _onComplete, key: _playEffect!.key),
      ));
    }
    return res;
  }
}

class _RelationEffect extends StatefulWidget {
  final MicRelationEffect effect;
  final OnEffectComplete onComplete;

  const _RelationEffect(this.effect, this.onComplete, {Key? key})
      : super(key: key);

  @override
  State<_RelationEffect> createState() => _RelationEffectState();
}

class _RelationEffectState extends State<_RelationEffect> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer(widget.effect.duration);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  _startTimer(int duration) {
    Log.d('eventMicEffect _startTimer:$duration');
    _timer?.cancel();
    _timer = Timer(Duration(seconds: duration), _removeAnim);
  }

  _removeAnim() {
    widget.onComplete(widget.effect);
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: MultiframeImage.network(
        Util.getRemoteImgUrl(widget.effect.url),
        'effect',
        loop: true,
      ),
    );
  }
}

typedef OnEffectComplete = Function(MicRelationEffect config);

class MicRelationEffect {
  final GlobalKey key;
  final int uid;
  final String url;
  final int duration; // 持续时长，秒

  MicRelationEffect(
      {required this.uid,
      required this.url,
      required this.duration,
      required this.key});
}

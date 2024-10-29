import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../chat_room.dart';
import '../welcomeItem.dart';

class GiftComboOwnerWidget extends StatefulWidget {
  final GlobalKey<ComboFullEffectWidgetState>? comboEffectKey;
  final GlobalKey? messageKey;

  const GiftComboOwnerWidget({super.key, this.comboEffectKey, this.messageKey});

  @override
  _GiftComboOwnerWidgetState createState() => _GiftComboOwnerWidgetState();
}

class _GiftComboOwnerWidgetState extends State<GiftComboOwnerWidget> {
  late double _bottomH;
  final List<Welcome> _combos = [];

  @override
  void initState() {
    super.initState();
    _bottomH = 48 + 64 + 336 * Util.ratio + Util.iphoneXBottom; //打赏礼物最大高度
    eventCenter.addListener(EventConstant.EventRoomCombo, _onRoomComb);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _updateBottomIfNeed(context);
    });
  }

  @override
  void dispose() {
    eventCenter.removeListener(EventConstant.EventRoomCombo, _onRoomComb);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!Util.validList(_combos)) return const SizedBox.shrink();
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: _bottomH),
      alignment: AlignmentDirectional.bottomCenter,
      child: IgnorePointer(
        child: ListView.builder(
          padding: EdgeInsetsDirectional.zero,
          addAutomaticKeepAlives: false,
          addRepaintBoundaries: false,
          shrinkWrap: false,
          reverse: true,
          itemCount: _combos.length,
          itemBuilder: (BuildContext context, int index) {
            Welcome welcome = _combos.elementAt(index);
            return RepaintBoundary(
              child: WelcomeItem(
                  key: welcome.key,
                  data: welcome,
                  onComplete: _onWelcomeComplete),
            );
          },
        ),
      ),
    );
  }

  _updateBottomIfNeed(BuildContext buildContext) {
    final messageListRenderBox =
        widget.messageKey?.currentContext?.findRenderObject();
    if (messageListRenderBox != null && messageListRenderBox is RenderBox) {
      Offset paintPosition = messageListRenderBox.localToGlobal(Offset.zero);
      double height = Util.height - paintPosition.dy;
      double maxHeight = max(height, _bottomH);
      if (_bottomH != maxHeight) {
        _bottomH = maxHeight;
        if (mounted) {
          setState(() {});
        }
      }
    }
  }

  _onRoomComb(String type, dynamic welcome) {
    if (welcome is Welcome) {
      bool resetHitNum = false;
      for (Welcome element in _combos) {
        if (element.type == WelcomeType.ComboGift &&
            Util.validStr(element.hitId) &&
            element.hitId == Util.parseStr(welcome.hitId) &&
            element.giftId == welcome.giftId) {
          element.hitNum = welcome.hitNum;
          resetHitNum = true;
          break;
        }
      }

      if (!resetHitNum) {
        _combos.add(welcome);
      }
      String? iconStr =
          ChatRoomData.getInstance()?.hitIconWithCount(welcome.hitNum ?? 0);
      if (Util.validStr(iconStr)) {
        Tracker.instance.track(TrackEvent.gift_combo_effects,
            properties: {'effects_type': '${welcome.hitNum}'});
      }
      if (mounted) {
        setState(() {
          _refreshComboEffect();
        });
      }
    }
  }

  _onWelcomeComplete(Welcome data) {
    if (_combos.contains(data)) {
      _combos.remove(data);
      if (mounted) {
        setState(() {
          _refreshComboEffect();
        });
      }
    }
  }

  _refreshComboEffect() {
    if (widget.comboEffectKey == null) return;
    if (Util.validStr(widget.comboEffectKey?.currentState?.currentPath)) return;
    if (Util.validList(_combos)) {
      Welcome item = _combos.first;
      String? effectStr =
          ChatRoomData.getInstance()?.hitBgWithCount(item.hitNum ?? 0);
      if (Util.validStr(effectStr)) {
        widget.comboEffectKey?.currentState?.filePath = effectStr;
        return;
      }
    }
  }
}

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';

/// 陪伴房特效
class AccompanyEffectWidget extends StatefulWidget {
  final ChatRoomData room;

  const AccompanyEffectWidget({super.key, required this.room});

  @override
  _AccompanyEffectWidgetState createState() => _AccompanyEffectWidgetState();
}

class _AccompanyEffectWidgetState extends State<AccompanyEffectWidget> {
  Vap? _vap;

  @override
  void initState() {
    super.initState();
    widget.room
        .addListener(RoomConstant.Event_Accompany_Refresh, _onAccompanyRefresh);
  }

  @override
  void dispose() {
    widget.room.removeListener(
        RoomConstant.Event_Accompany_Refresh, _onAccompanyRefresh);
    super.dispose();
  }

  _onAccompanyRefresh(String type, dynamic data) {
    if (data is! Map || _vap != null) return;
    Map json = data;
    try {
      if (json['heart_effect'] != null) {
        Map? effect = json['heart_effect'];
        String? url = effect?['url'];
        int size = Util.parseInt(effect?['size']);
        if (url != null && url.isNotEmpty && size > 0) {
          _vap = Vap(url: Util.getRemoteImgUrl(url), size: size);
          if (mounted) setState(() {});
        }
      }
    } catch (e, s) {
      Log.e(e, stackTrace: s);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_vap == null) return const SizedBox.shrink();
    return VapDisplayWidget(
      vap: _vap!,
      onComplete: () {
        _vap = null;
      },
    );
  }
}

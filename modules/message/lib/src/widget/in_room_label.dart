import 'package:shared/shared.dart';
import 'package:shared/k.dart';
import 'package:flutter/material.dart';

/// 在房间的标识
class InRoomLabel extends StatefulWidget {
  final String label;
  final List<Color>? colors;

  const InRoomLabel({super.key, required this.label, this.colors});

  @override
  State<StatefulWidget> createState() {
    return _InRoomLabelState();
  }
}

class _InRoomLabelState extends State<InRoomLabel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: R.color.mainBrandColor,
        gradient: LinearGradient(
            colors: !Util.isCollectionEmpty(widget.colors)
                ? widget.colors!
                : [const Color(0xFFEA6AFF), const Color(0xFF81DAFF)]),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 2),
            child: R.img(
              'living_small.webp',
              height: 16,
              width: 16,
              fit: BoxFit.contain,
              package: ComponentManager.MANAGER_BASE_CORE,
            ),
          ),
          Text(
            !Util.isStringEmpty(widget.label) ? widget.label : K.chat,
            style: const TextStyle(color: Colors.white, fontSize: 9),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/talent/talent_constants.dart';

class TalentSerialPointWidget extends StatelessWidget {
  final bool selected;

  const TalentSerialPointWidget({super.key, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 11.dp,
      height: 11.dp,
      child: Center(
        child: Container(
          width: selected ? 11.dp : 7.dp,
          height: selected ? 11.dp : 7.dp,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: selected ? lineCircleColor : const Color(0xFF383754),
          ),
        ),
      ),
    );
  }
}

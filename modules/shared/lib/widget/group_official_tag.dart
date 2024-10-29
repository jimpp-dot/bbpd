import 'package:flutter/material.dart';

import '../k.dart';

class GroupOfficialTag extends StatelessWidget {
  final List<Color>? colors;

  const GroupOfficialTag({super.key, this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors:
                  colors ?? [const Color(0xFFFFBD26), const Color(0xFFFFDD35)]),
          borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(12),
              topEnd: Radius.circular(12),
              bottomStart: Radius.circular(12))),
      child: Text(
        K.office,
        style: const TextStyle(color: Colors.white, fontSize: 10),
      ),
    );
  }
}

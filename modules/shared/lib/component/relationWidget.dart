import 'package:shared/a.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RelationWidget extends StatelessWidget {
  final int relation;
  final List<Color> relationColor;

  const RelationWidget({
    super.key,
    required this.relation,
    this.relationColor = const [
      Color(0xFFA3CAFF),
      Color(0xFFFFBC26),
      Color(0xFFFF93E5),
      Color(0xFFFF9579)
    ],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: relationColor[relation], width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
      child: Text(
        A.relation_array[relation],
        style: TextStyle(
          fontSize: 8,
          color: relationColor[relation],
        ),
      ),
    );
  }
}

import 'package:shared/k.dart';
import 'package:flutter/material.dart';

Widget dakaWidget() {
  return Container(
    height: 16,
    padding: const EdgeInsets.symmetric(horizontal: 4),
    alignment: AlignmentDirectional.center,
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        begin: AlignmentDirectional.topStart,
        end: AlignmentDirectional.bottomEnd,
        colors: [Color(0xFFFF53A6), Color(0xFFFFC148)],
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      K.tag_daka,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 9,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

Widget jiarenWidget() {
  return Container(
    height: 16,
    padding: const EdgeInsets.symmetric(horizontal: 4),
    alignment: AlignmentDirectional.center,
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        begin: AlignmentDirectional.topStart,
        end: AlignmentDirectional.bottomEnd,
        colors: [Color(0xFFD153FF), Color(0xFFD6B6FF)],
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      K.tag_jiaren,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 9,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

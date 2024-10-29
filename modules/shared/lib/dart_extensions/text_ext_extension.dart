import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension TextExtExtension on Text {
  toStandardStyleContain({double? radius, double? mWidth, double? mHeight}) {
    return Container(
      width: mWidth ?? double.infinity,
      height: mHeight ?? 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 32)),
        border: Border.all(width: 3, color: Colors.black),
      ),
      child: Container(
        margin: const EdgeInsets.all(3),
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          color: const Color(0xFF4AFFC0),
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 32)),
          boxShadow: const [
            BoxShadow(
                color: Colors.white,
                offset: Offset(0.0, -4.0), //阴影y轴偏移量
                blurRadius: 0, //阴影模糊程度
                spreadRadius: 0 //阴影扩散程度
                ),
            BoxShadow(
                color: Color(0xFF0CA36F),
                offset: Offset(0.0, 4.0), //阴影y轴偏移量
                blurRadius: 0, //阴影模糊程度
                spreadRadius: 0 //阴影扩散程度
                ),
          ],
        ),
        child: this,
      ),
    );
  }

  toStandardMBrandStyleContain(
      {double? radius, double? mWidth, double? mHeight, EdgeInsets? padding}) {
    double width = mWidth ?? double.infinity;

    return Container(
      width: width == 0 ? null : width,
      height: mHeight ?? 48,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 32)),
        // border: Border.all(width: 3, color: const Color(0xFFC1FF25)),
        color: const Color(0xFFC1FF25),
      ),
      child: this,
    );
  }
}

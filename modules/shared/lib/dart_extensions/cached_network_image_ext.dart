import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../component/cachedNetworkImage.dart';

extension CachedNetworkImageExt on CachedNetworkImage {
  toShaderMaskBlack() {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(colors: [Colors.black, Colors.white]).createShader(bounds);
      },
      blendMode: BlendMode.color,
      child: this,
    );
  }
}

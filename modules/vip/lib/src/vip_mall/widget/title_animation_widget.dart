import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class TitleAnimation extends StatefulWidget {
  final String image1;
  final String image2;
  final double size;

  final double? mWidth;
  final double? mHeight;

  const TitleAnimation(
      {super.key,
      required this.image1,
      required this.image2,
      this.size = 132,
      this.mWidth,
      this.mHeight});

  @override
  _TitleAnimationState createState() => _TitleAnimationState();
}

class _TitleAnimationState extends State<TitleAnimation> {
  final Completer inAnimCompleter = Completer();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.mWidth ?? widget.size,
      height: widget.mHeight ?? widget.size,
      child: Stack(
        children: [
          MultiframeImage.network(
            Util.getRemoteImgUrl(widget.image1),
            'title',
            width: widget.mWidth ?? widget.size,
            height: widget.mHeight ?? widget.size,
            onFrameEmitted: (cur, count) {
              if (count == cur + 1) {
                Log.d('inAnimCompleter.complete');
                inAnimCompleter.complete();
              }
            },
          ),
          MultiframeImage.network(
            Util.getRemoteImgUrl(widget.image2),
            'title',
            width: widget.mWidth ?? widget.size,
            height: widget.mHeight ?? widget.size,
            delayToShowFuture: inAnimCompleter.future,
            loop: true,
          ),
        ],
      ),
    );
  }
}

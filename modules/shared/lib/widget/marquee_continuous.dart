import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MarqueeContinuous extends StatelessWidget {
  final Text? text;
  final Widget child;
  final Duration duration;
  final double step;
  final double? paddingEnd;

  const MarqueeContinuous(
      {super.key,
      this.text,
      required this.child,
      this.duration = const Duration(seconds: 2),
      this.step = 50,
      this.paddingEnd});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) =>
          _MarqueeContainer(
        text: text,
        constraints: constraints,
        duration: duration,
        step: step,
        paddingEnd: paddingEnd,
        child: child,
      ),
    );
  }
}

class _MarqueeContainer extends StatefulWidget {
  final Text? text;
  final Widget child;
  final BoxConstraints constraints;
  final Duration duration;
  final double step;
  final double? paddingEnd;

  const _MarqueeContainer(
      {this.text,
      required this.child,
      required this.constraints,
      required this.duration,
      required this.step,
      this.paddingEnd});

  @override
  _MarqueeContainerState createState() => _MarqueeContainerState();
}

class _MarqueeContainerState extends State<_MarqueeContainer> {
  ScrollController? _controller;
  Timer? _timer;
  double _offset = 0.0;
  bool _showMarquee = true;

  void _judgeMarquee() {
    if (widget.text != null) {
      var renderParagraph = RenderParagraph(
        TextSpan(
          text: widget.text!.data,
          style: widget.text!.style,
        ),
        softWrap: false,
        maxLines: 1,
        textDirection: TextDirection.ltr,
        overflow: TextOverflow.visible,
      );
      renderParagraph.layout(widget.constraints);
      var textWidth = renderParagraph.textSize.width;
      var constraintsWidth = renderParagraph.constraints.maxWidth;
      _showMarquee = textWidth > constraintsWidth;
    } else {
      _showMarquee = true;
    }

    if (_showMarquee) {
      _startTimer();
    } else {
      _cancelTimer();
    }
  }

  void _startTimer() {
    if (_timer != null) {
      return;
    }
    _controller = ScrollController(initialScrollOffset: _offset);
    _timer = Timer.periodic(widget.duration, (timer) {
      double newOffset = _controller!.offset + widget.step;
      if (newOffset != _offset) {
        _offset = newOffset;
        _controller?.animateTo(_offset,
            duration: widget.duration, curve: Curves.linear);
      }
    });
  }

  void _cancelTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
      _controller?.dispose();
    }
  }

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _judgeMarquee();
    final Widget child = widget.text ?? widget.child;

    return _showMarquee
        ? ListView.builder(
            padding: EdgeInsetsDirectional.zero,
            scrollDirection: Axis.horizontal,
            controller: _controller,
            itemBuilder: (context, index) {
              return Container(
                alignment: AlignmentDirectional.center,
                padding:
                    EdgeInsetsDirectional.only(end: widget.paddingEnd ?? 4),
                child: child,
              );
            },
          )
        : child;
  }
}

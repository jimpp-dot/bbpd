import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

@Deprecated('Should use the widget in foundation')
class SoundFastWare extends StatefulWidget {
  final bool isSpeaking;

//	final UserIconStyle style;
  final double left;
  final double width;
  final Color? aniColor;
  final double borderWidth;

  const SoundFastWare(
      {super.key,
      required this.isSpeaking,
      this.left = 0.0,
      required this.width,
      this.aniColor,
      this.borderWidth = 3});

  @override
  _SoundFastWareState createState() => _SoundFastWareState();
}

class _SoundFastWareState extends State<SoundFastWare>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _opacity;
  late Animation _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _opacity = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0,
          1.0,
          curve: Curves.linear,
        ),
      ),
    );
    _scale = Tween(
      begin: 1.0,
      end: 1.25,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0,
          1.0,
          curve: Curves.linear,
        ),
      ),
    );
    _scale.addListener(_onChanged);
    if (widget.isSpeaking) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(SoundFastWare old) {
    super.didUpdateWidget(old);
    if (old.isSpeaking != widget.isSpeaking) {
      if (widget.isSpeaking) {
        _controller.value = 0.0;
        _controller.forward();
      }
    }
  }

  @override
  void dispose() {
    _scale.removeListener(_onChanged);
    _controller.dispose();
    super.dispose();
  }

  _onChanged() {
    setState(() {});
    if (_controller.status == AnimationStatus.completed && widget.isSpeaking) {
      _controller.value = 0.0;
      _controller.forward();
    }
  }

  Widget _buildAni(BuildContext context, Widget? child) {
    double width = widget.width +
        widget.borderWidth * 2; //IconStyles[this.widget.style].width + 6.0;
    double translate = 0.0 - ((_scale.value - 1.0) * width / 2 / _scale.value);
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.isSpeaking
              ? (widget.aniColor != null
                  ? widget.aniColor!.withOpacity(_opacity.value)
                  : R.color.mainBrandColor.withOpacity(_opacity.value))
              : Colors.transparent,
          width: widget.borderWidth,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(width / 2),
      ),
      transform: Matrix4.identity()
        ..scale(_scale.value, _scale.value)
        ..translate(translate, translate),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = widget.width +
        widget.borderWidth * 2; //IconStyles[this.widget.style].width + 6.0;
    return PositionedDirectional(
      start: -widget.borderWidth,
      top: -widget.borderWidth,
      width: width,
      height: width,
      child: IgnorePointer(
        child: AnimatedBuilder(animation: _controller, builder: _buildAni),
      ),
    );
  }
}

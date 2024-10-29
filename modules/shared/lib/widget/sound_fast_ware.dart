import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

/// 麦上光圈动效
class SoundEffectWidget extends StatelessWidget {
  final bool isSpeaking;
  final double width;
  final Color? aniColor;
  final double borderWidth;
  final String? ring; // 麦上光圈链接

  const SoundEffectWidget({
    Key? key,
    this.isSpeaking = false,
    required this.width,
    this.aniColor,
    this.borderWidth = 3,
    this.ring,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child = (ring != null &&
            ring!.isNotEmpty &&
            Session.lowDeviceSpecialEffect != 1)
        ? _renderEffect()
        : _SoundFastWare(
            isSpeaking: isSpeaking,
            width: width,
            aniColor: aniColor,
            borderWidth: borderWidth);

    return SizedBox(
      width: width,
      height: width,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: [
          child,
        ],
      ),
    );
  }

  Widget _renderEffect() {
    String? finalUrl = ring;
    if (finalUrl == null || finalUrl.isEmpty || !isSpeaking)
      return const SizedBox.shrink();
    double maxSize = width * 1.6;
    double start = -(maxSize - width) / 2;
    double top = -(maxSize - width) / 2;
    return PositionedDirectional(
      start: start,
      top: top,
      width: maxSize,
      height: maxSize,
      child: IgnorePointer(
        child: UserIconFrame(
          size: maxSize,
          frameUrl: finalUrl,
        ),
      ),
    );
  }
}

class _SoundFastWare extends StatefulWidget {
  final bool isSpeaking;
  final double width;
  final Color? aniColor;
  final double borderWidth;

  const _SoundFastWare({
    Key? key,
    this.isSpeaking = false,
    required this.width,
    this.aniColor,
    this.borderWidth = 3,
  }) : super(key: key);

  @override
  _SoundFastWareState createState() => _SoundFastWareState();
}

class _SoundFastWareState extends State<_SoundFastWare>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _opacity;
  late Animation _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    _opacity = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );
    _scale = Tween(begin: 1.0, end: 1.25).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );
    _controller.addStatusListener(_onChanged);
    if (widget.isSpeaking) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(_SoundFastWare old) {
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
    _controller.removeStatusListener(_onChanged);
    _controller.dispose();
    super.dispose();
  }

  _onChanged(AnimationStatus status) {
    if (status == AnimationStatus.completed && widget.isSpeaking) {
      _controller.value = 0.0;
      _controller.forward();
    }
  }

  Widget _buildAni(BuildContext context, Widget? child) {
    double width = widget.width + widget.borderWidth * 2;
    double translate = 0.0 - ((_scale.value - 1.0) * width / 2 / _scale.value);
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: _getAntiColor(),
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

  Color _getAntiColor() {
    if (widget.isSpeaking) {
      return widget.aniColor != null
          ? widget.aniColor!.withOpacity(_opacity.value)
          : R.color.mainBrandColor.withOpacity(_opacity.value);
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    double width = widget.width + widget.borderWidth * 2;
    return PositionedDirectional(
      start: -widget.borderWidth,
      top: -widget.borderWidth,
      width: width,
      height: width,
      child: IgnorePointer(
        child: RepaintBoundary(
          child: AnimatedBuilder(
            animation: _controller,
            builder: _buildAni,
          ),
        ),
      ),
    );
  }
}

/// 新版样式默认麦圈动画回退，暂时保留代码
// class _SoundFastWare extends StatefulWidget {
//   final bool isSpeaking;
//   final double width;
//   final Color aniColor;
//   final double borderWidth;
//
//   _SoundFastWare({Key key, this.isSpeaking,  this.width, this.aniColor, this.borderWidth}) : super(key: key);
//
//   @override
//   _SoundFastWareState createState() => new _SoundFastWareState();
// }
//
//
//
// class _SoundFastWareState extends State<_SoundFastWare> with SingleTickerProviderStateMixin {
//   AnimationController _controller;
//   Animation _borderOpacity1;
//   Animation _solidOpacity1;
//   Animation _scale1;
//   Animation _borderOpacity2;
//   Animation _solidOpacity2;
//   Animation _scale2;
//
//   @override
//   void initState() {
//     super.initState();
//     this._controller = new AnimationController(
//       duration: const Duration(milliseconds: 1500),
//       vsync: this,
//     );
//
//     _borderOpacity1 = TweenSequence(
//         [TweenSequenceItem<double>(tween: Tween(begin: 0.4, end: 0.2), weight: 500),
//           TweenSequenceItem<double>(tween: Tween(begin: 0.2, end: 0.0), weight: 500),
//           TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 0.0), weight: 500),
//         ]
//     ).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Interval(0.0, 1.0, curve: Curves.linear),
//       ),
//     );
//
//     _solidOpacity1 = TweenSequence(
//         [TweenSequenceItem<double>(tween: Tween(begin: 0.2, end: 0.1), weight: 500),
//           TweenSequenceItem<double>(tween: Tween(begin: 0.1, end: 0.0), weight: 500),
//           TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 0.0), weight: 500),
//         ]
//     ).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Interval(0.0, 1.0, curve: Curves.linear),
//       ),
//     );
//
//     _scale1 = TweenSequence(
//         [TweenSequenceItem<double>(tween: Tween(begin: 1.0, end: 1.2), weight: 500),
//           TweenSequenceItem<double>(tween: Tween(begin: 1.2, end: 1.4), weight: 500),
//           TweenSequenceItem<double>(tween: Tween(begin: 1.4, end: 1.4), weight: 500),
//         ]
//     ).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Interval(0.0, 1.0, curve: Curves.linear),
//       ),
//     );
//
//     _borderOpacity2 = TweenSequence(
//         [TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 0.0), weight: 500),
//           TweenSequenceItem<double>(tween: Tween(begin: 0.4, end: 0.2), weight: 500),
//           TweenSequenceItem<double>(tween: Tween(begin: 0.2, end: 0.0), weight: 500),
//         ]
//     ).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Interval(0.0, 1.0, curve: Curves.linear),
//       ),
//     );
//
//     _solidOpacity2 = TweenSequence(
//         [TweenSequenceItem<double>(tween: Tween(begin: 0.0, end: 0.0), weight: 500),
//           TweenSequenceItem<double>(tween: Tween(begin: 0.2, end: 0.1), weight: 500),
//           TweenSequenceItem<double>(tween: Tween(begin: 0.1, end: 0.0), weight: 500),
//         ]
//     ).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Interval(0.0, 1.0, curve: Curves.linear),
//       ),
//     );
//
//     _scale2 = TweenSequence(
//         [TweenSequenceItem<double>(tween: Tween(begin: 1.0, end: 1.0), weight: 500),
//           TweenSequenceItem<double>(tween: Tween(begin: 1.0, end: 1.2), weight: 500),
//           TweenSequenceItem<double>(tween: Tween(begin: 1.2, end: 1.4), weight: 500),
//         ]
//     ).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Interval(0.0, 1.0, curve: Curves.linear),
//       ),
//     );
//
//
//     this._borderOpacity1.addListener(this._onChanged);
//     if (this.widget.isSpeaking) {
//       this._controller.forward();
//     }
//   }
//
//   @override
//   void didUpdateWidget(_SoundFastWare old) {
//     super.didUpdateWidget(old);
//     if (this.widget != null && old.isSpeaking != this.widget.isSpeaking) {
//       if (this.widget.isSpeaking) {
//         this._controller.value = 0.0;
//         this._controller.forward();
//       }
//     }
//   }
//
//   @override
//   void dispose() {
//     this._borderOpacity1.removeListener(this._onChanged);
//     this._controller.dispose();
//     super.dispose();
//   }
//
//   _onChanged() {
//     setState(() {});
//     if (this._controller.status == AnimationStatus.completed && this.widget.isSpeaking) {
//       this._controller.value = 0.0;
//       this._controller.forward();
//     }
//   }
//
//   Color _getBorder1Color() {
//     if (this.widget.isSpeaking) {
//       return this.widget.aniColor != null
//           ? this.widget.aniColor.withOpacity(_borderOpacity1.value)
//           : Colors.white.withOpacity(_borderOpacity1.value);
//     }
//     return Colors.transparent;
//   }
//
//   Color _getBorder2Color() {
//     if (this.widget.isSpeaking) {
//       return this.widget.aniColor != null
//           ? this.widget.aniColor.withOpacity(_borderOpacity2.value)
//           : Colors.white.withOpacity(_borderOpacity2.value);
//     }
//     return Colors.transparent;
//   }
//
//   Color _getSolid1Color() {
//     if (this.widget.isSpeaking) {
//       return this.widget.aniColor != null
//           ? this.widget.aniColor.withOpacity(_solidOpacity1.value)
//           : Colors.white.withOpacity(_solidOpacity1.value);
//     }
//     return Colors.transparent;
//   }
//
//   Color _getSolid2Color() {
//     if (this.widget.isSpeaking) {
//       return this.widget.aniColor != null
//           ? this.widget.aniColor.withOpacity(_solidOpacity2.value)
//           : Colors.white.withOpacity(_solidOpacity2.value);
//     }
//     return Colors.transparent;
//   }
//
//   Widget _buildAni(BuildContext context, Widget child) {
//     return Container(
//       width: _scale1.value * widget.width,
//       height: _scale1.value * widget.width,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(_scale1.value * widget.width / 2)),
//         border: Border.all(color: _getBorder1Color(), width: 1.0),
//         color: _getSolid1Color(),
//       ),
//       alignment: AlignmentDirectional.center,
//       child: Container(
//         width: _scale2.value * widget.width,
//         height: _scale2.value * widget.width,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(_scale2.value * widget.width / 2)),
//           border: Border.all(color: _getBorder2Color(), width: 1.0),
//           color: _getSolid2Color(),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return PositionedDirectional(
//       start: -0.4 * 0.5 * widget.width,
//       top: -0.4 * 0.5 * widget.width,
//       child: Container(
//         width: 1.4 * widget.width,
//         height: 1.4 * widget.width,
//         alignment: AlignmentDirectional.center,
//         child: IgnorePointer(
//           child: RepaintBoundary(
//             child: AnimatedBuilder(
//               animation: _controller,
//               builder: _buildAni,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

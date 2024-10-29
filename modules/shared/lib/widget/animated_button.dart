import 'package:flutter/material.dart';

enum GradientOrientation {
  vertical,
  horizontal,
}

class AnimatedButton extends StatefulWidget {
  // colors  The list of colors for the gradient for the background of the widget(isMulticolor should be true for this to work)
  final List<Color> colors;

  /// The color of the 3D border of the button.
  final Color borderColor;

  /// The color of circular progress indicator, defaults to white.
  final Color progressColor;

  /// The size of progress indicator circle, defaults to 20.
  final double progressSize;

  /// Orientation of the gradient defaults to Horizontal.
  final GradientOrientation gradientOrientation;

  /// The thickness of the 3D border, defaults to 5.
  final double borderThickness;

  /// Height of the button, defaults to 60.
  final double height;

  /// The border radius for the button, defaults to 20.
  final double borderRadius;

  /// Whether to occupy the full available space in the parent, defaults to true.
  final bool stretch;

  /// Width of the button defaults to 200, it's useless if the stretch property
  /// is set to true.
  final double width;

  /// Whether the progress indicator is required or not, defaults to false.
  final bool progress;

  /// Disables the button, defaults to false.
  final bool disabled;

  /// Button on press handler, required.
  final Function onTap;

  /// Child widget that will be wrapped inside the button.
  final Widget child;

  /// The calculated border radius for the buttons.
  final BorderRadius br;

  /// The calculated width of the button, sets to parent width when
  /// stretch property is set to true.
  final double calculatedWidth;

  AnimatedButton({
    super.key,
    required this.onTap,
    required this.child,
    this.colors = const [Color(0xFF2ec8ff), Color(0xFF529fff)],
    this.borderColor = const Color(0xFF3489e9),
    this.progressColor = Colors.white,
    this.progressSize = 20,
    this.borderRadius = 20,
    this.borderThickness = 5,
    this.height = 60,
    this.width = 200,
    this.gradientOrientation = GradientOrientation.vertical,
    this.stretch = true,
    this.progress = false,
    this.disabled = false,
  })  : br = BorderRadius.all(Radius.circular((borderRadius))),
        calculatedWidth = stretch ? double.infinity : width;

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState(borderThickness);
}

/// Button state to keep track of press and progress animations.
class _AnimatedButtonState extends State<AnimatedButton>
    with TickerProviderStateMixin {
  double _borderThickness = 5;
  double _moveMargin = 0.0;
  double _progressWidth = 0.0;
  bool _showProgress = false;
  bool _tapped = false;
  bool _processing = false;
  int _progressBarMillis = 2500;

  _AnimatedButtonState(double borderThickness) {
    _borderThickness = borderThickness;
  }

  /// The back view of the button that gives the feel of 3D border.
  Widget _buildBackLayout() {
    return Container(
      padding: EdgeInsets.only(top: _borderThickness),
      width: double.infinity,
      height: double.infinity,
      child: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          borderRadius: widget.br,
          color: widget.disabled ? const Color(0xFF666665) : widget.borderColor,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(
              width: double.infinity, height: double.infinity),
        ),
      ),
    );
  }

  /// The front view of the button, that has the user child widget content and
  /// progress widget to show progress animation.
  bool endFrom0 = false;
  Widget _buildFrontLayout() {
    return AnimatedContainer(
      onEnd: () {
        setState(() {
          if (endFrom0) widget.onTap();

          _moveMargin = 0;
          endFrom0 = true;
          if (widget.progress && !_showProgress && _tapped) {
            _showProgress = true;
            _progressWidth = double.infinity;
            _processing = true;
            _progressBarMillis = 2500;
          }
          _tapped = false;
        });
      },
      margin: EdgeInsets.only(top: _moveMargin),
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        borderRadius: widget.br,
        gradient: LinearGradient(
          begin: widget.gradientOrientation == GradientOrientation.vertical
              ? Alignment.topCenter
              : Alignment.centerLeft,
          end: widget.gradientOrientation == GradientOrientation.vertical
              ? Alignment.bottomCenter
              : Alignment.centerRight,
          colors: widget.disabled
              ? const [Color(0xFFC7C7C7), Color(0xFF8B8C8D)]
              : widget.colors,
        ),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(
            width: double.infinity, height: widget.height - _borderThickness),
        child: ClipRRect(
          borderRadius: widget.br,
          child: Stack(
            children: <Widget>[
              _buildProgressBar(),
              if (_showProgress) _buildProgressCircle(),
              if (!_showProgress) _buildUserChild(),
            ],
          ),
        ),
      ),
    );
  }

  /// The progress widget.
  Widget _buildProgressBar() {
    return AnimatedSize(
      duration: Duration(milliseconds: _progressBarMillis),
      curve: Curves.fastOutSlowIn,
      child: Container(
        width: _progressWidth,
        height: double.infinity,
        color: const Color.fromARGB(60, 255, 255, 255),
      ),
    );
  }

  /// The progress circle widget.
  Widget _buildProgressCircle() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: widget.progressSize,
          height: widget.progressSize,
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(widget.progressColor)),
        ),
      ),
    );
  }

  /// User provided child widget.
  Widget _buildUserChild() {
    return Align(
      alignment: Alignment.center,
      //child: widget.child != null ? widget.child : Text(''),
      child: widget.child,
    );
  }

  /// The button press handler for the gesture detector. This will be triggered
  /// when button is pressed. Calls the user provided onTap function.
  void _onTap() {
    setState(() {
      _moveMargin = _borderThickness;
      _tapped = true;
      endFrom0 = false;
    });
    _finish();
  }

  /// The finish method that will reset the state of the animation, user
  /// has to call this explicitly from the parent.
  void _finish() {
    setState(() {
      _showProgress = false;
      _progressWidth = 0;
      _processing = false;
      _progressBarMillis = 1;
    });
  }

  /// The cumulative button widget that builds the front and back layout of the
  /// button.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.disabled || _processing ? null : _onTap,
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(
            width: widget.calculatedWidth, height: widget.height),
        child: Stack(
          children: <Widget>[
            _buildBackLayout(),
            _buildFrontLayout(),
          ],
        ),
      ),
    );
  }
}

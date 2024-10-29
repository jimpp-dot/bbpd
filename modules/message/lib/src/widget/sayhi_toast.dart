import 'package:shared/k.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'dart:convert';

const DefaultDuration = Duration(milliseconds: 3500);

class SayhiToast {
  static showToast(
      {required String msg,
      ToastGravity gravity = ToastGravity.BOTTOM,
      WidgetBuilder? widgetBuilder}) {
    ToastPosition toastPosition = ToastPosition.Center;
    switch (gravity) {
      case ToastGravity.TOP:
        toastPosition = ToastPosition.Top;
        break;

      case ToastGravity.CENTER:
        toastPosition = ToastPosition.Center;
        break;

      case ToastGravity.BOTTOM:
        toastPosition = ToastPosition.Bottom;
        break;
    }

    Toast.show(
        Constant.context, msg, toastPosition, DefaultDuration, widgetBuilder);
  }

  static hide() {
    Toast.hide();
  }

  static toastException(
      {dynamic exp, ToastGravity gravity = ToastGravity.BOTTOM}) {
    if (exp is XhrError) {
      showToast(msg: exp.toString(), gravity: gravity);
    } else {
      showToast(msg: K.server_return_error_retry, gravity: gravity);
    }
  }
}

class Toast {
  static ToastView? _preToast;

  static showTop(BuildContext context, dynamic msg,
      [Duration duration = DefaultDuration]) {
    show(context, msg, ToastPosition.Top, duration);
  }

  static showCenter(BuildContext context, dynamic msg,
      [Duration duration = DefaultDuration]) {
    show(context, msg, ToastPosition.Center, duration);
  }

  static showBottom(BuildContext context, dynamic msg,
      [Duration duration = DefaultDuration]) {
    show(context, msg, ToastPosition.Bottom, duration);
  }

  static hide() {
    if (_preToast != null) {
      _preToast!.dismiss();
    }
  }

  static show(BuildContext? context, dynamic msg,
      [ToastPosition position = ToastPosition.Center,
      Duration duration = DefaultDuration,
      WidgetBuilder? widgetBuilder]) {
    if (_preToast != null) {
      _preToast!.dismiss();
    }

    if (msg == null && widgetBuilder == null) return;

    String? message;
    if (msg is String) {
      message = msg;
    } else if (msg != null) {
      message = json.encode(msg);
    }

    var overlayState = Overlay.of(context ?? System.context);

    var controllerShowAnim = AnimationController(
      vsync: overlayState,
      duration: const Duration(milliseconds: 250),
    );
    var controllerShowOffset = AnimationController(
      vsync: overlayState,
      duration: const Duration(milliseconds: 350),
    );
    var controllerHide = AnimationController(
      vsync: overlayState,
      duration: const Duration(milliseconds: 250),
    );
    var opacityAnim1 = Tween(begin: 0.0, end: 1.0).animate(controllerShowAnim);
    var controllerCurvedShowOffset = CurvedAnimation(
        parent: controllerShowOffset, curve: const _BounceOutCurve._());
    var offsetAnim =
        Tween(begin: 30.0, end: 0.0).animate(controllerCurvedShowOffset);
    var opacityAnim2 = Tween(begin: 1.0, end: 0.0).animate(controllerHide);

    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      return ToastWidget(
        opacityAnim1: opacityAnim1,
        opacityAnim2: opacityAnim2,
        offsetAnim: offsetAnim,
        child: buildToastLayout(
            msg: message ?? '',
            position: position,
            widgetBuilder: widgetBuilder),
      );
    });
    var toastView = ToastView(
      overlayEntry: overlayEntry,
      controllerShowAnim: controllerShowAnim,
      controllerShowOffset: controllerShowOffset,
      controllerHide: controllerHide,
      overlayState: overlayState,
    );

    _preToast = toastView;
    toastView._show(duration);
  }

  static LayoutBuilder buildToastLayout(
      {required String msg,
      ToastPosition? position,
      WidgetBuilder? widgetBuilder}) {
    Widget? toastWidget;
    if (widgetBuilder != null) {
      toastWidget = widgetBuilder(System.context);
    }

    toastWidget ??= Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(23),
      ),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          R.img('sayhi_small_icon.webp',
              package: ComponentManager.MANAGER_MESSAGE, width: 28, height: 28),
          const SizedBox(
            width: 4,
          ),
          Flexible(
            child: Text(
              msg,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          const SizedBox(
            width: 4,
          ),
        ],
      ),
    );

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return IgnorePointer(
        ignoring: true,
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.white.withOpacity(0),
            child: Container(
              margin: _getMargin(),
              child: toastWidget,
            ),
          ),
        ),
      );
    });
  }

  static EdgeInsetsGeometry _getMargin() {
    return EdgeInsetsDirectional.only(
        bottom: Util.isOnlyIphoneX
            ? (609 * Util.ratio - 90 + Util.iphoneXBottom)
            : (609 * Util.ratio - 90));
  }
}

class ToastView {
  final OverlayEntry overlayEntry;
  final AnimationController controllerShowAnim;
  final AnimationController controllerShowOffset;
  final AnimationController controllerHide;
  final OverlayState overlayState;
  bool dismissed = false;

  ToastView(
      {required this.overlayEntry,
      required this.controllerShowAnim,
      required this.controllerShowOffset,
      required this.controllerHide,
      required this.overlayState});

  _show(Duration duration) async {
    overlayState.insert(overlayEntry);
    controllerShowAnim.forward();
    controllerShowOffset.forward();
    await Future.delayed(duration);
    dismiss();
  }

  dismiss() async {
    if (dismissed) {
      return;
    }
    dismissed = true;
    controllerHide.forward();
    await Future.delayed(const Duration(milliseconds: 250));
    overlayEntry.remove();
  }
}

class ToastWidget extends StatelessWidget {
  final Widget? child;
  final Animation<double> opacityAnim1;
  final Animation<double> opacityAnim2;
  final Animation<double> offsetAnim;

  const ToastWidget(
      {super.key,
      this.child,
      required this.offsetAnim,
      required this.opacityAnim1,
      required this.opacityAnim2});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: opacityAnim1,
      child: child,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: opacityAnim1,
          child: AnimatedBuilder(
            animation: offsetAnim,
            builder: (BuildContext context, _) {
              return Transform.translate(
                offset: Offset(0, offsetAnim.value),
                child: AnimatedBuilder(
                  animation: opacityAnim2,
                  builder: (BuildContext context, _) {
                    return FadeTransition(
                      opacity: opacityAnim2,
                      child: child,
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _BounceOutCurve extends Curve {
  const _BounceOutCurve._();

  @override
  double transform(double t) {
    t -= 1.0;
    return t * t * ((2 + 1) * t + 2) + 1.0;
  }
}

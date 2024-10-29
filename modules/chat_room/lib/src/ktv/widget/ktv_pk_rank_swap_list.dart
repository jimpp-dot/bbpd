import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class WReorderData {
  Widget widget;
  BuildContext? context;
  double? height;

  WReorderData(this.widget);
}

class SwapReorderList extends StatefulWidget {
  final List<Widget> children;
  final Duration duration;

  final VoidCallback swapCallback;

  final VoidCallback dismissCallBack;

  const SwapReorderList({
    Key? key,
    required this.children,
    this.duration = const Duration(milliseconds: 500),
    required this.swapCallback,
    required this.dismissCallBack,
  }) : super(key: key);

  @override
  SwapReorderListState createState() => SwapReorderListState();
}

class SwapReorderListState extends State<SwapReorderList>
    with TickerProviderStateMixin<SwapReorderList> {
  List<WReorderData> data = [];
  List<int> swapIndex = [];

  static const LOG_TAG = 'SwapReorderListState';

  late AnimationController _scaleController;
  late Animation<double> _scaleAnim;

  late AnimationController _rotateController;
  late Animation<double> _rotateAnim;

  AlignmentDirectional _top1Aliment = AlignmentDirectional.bottomStart;
  AlignmentDirectional _top2Aliment = AlignmentDirectional.topStart;
  double _rotateInitAngle = pi / 200;

  bool _top1Rotate = true;

  int _rCount = 0;

  @override
  void initState() {
    super.initState();
    _initAnimation();
    data = widget.children.map((d) => WReorderData(d)).toList();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAnim();
      Future.delayed(const Duration(milliseconds: 250), () {
        _startRotate0();
      });
    });
  }

  @override
  void dispose() {
    _rotateController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  void _initAnimation() {
    _scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    _scaleAnim = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _scaleController, curve: Curves.linear))
      ..addListener(() {
        if (mounted) {
          Log.d(tag: LOG_TAG, '_scaleController, data = ${_scaleAnim.value}');
          setState(() {});
        }
      })
      ..addStatusListener((status) {
        Log.d(tag: LOG_TAG, "_scaleAnim status = $status");
        if (status == AnimationStatus.completed) {}
      });

    _initRotateAnim();
  }

  void _initRotateAnim({int from = 0}) {
    _rotateController = AnimationController(
        vsync: this, duration: Duration(milliseconds: from == 2 ? 50 : 100));
    double begin = 0.0;
    double end = pi / 100;

    if (from == 0) {
      end = pi / 200;
    }

    if (from == 2) {
      begin = -pi / 100;
    }

    if (from == 3) {
      begin = pi / 100;
      end = 0;
    }

    _rotateAnim = Tween(begin: begin, end: end).animate(
        CurvedAnimation(parent: _rotateController, curve: Curves.linear))
      ..addListener(() {
        if (mounted) {
          Log.d(tag: LOG_TAG, '_rotateController, data = ${_rotateAnim.value}');
          setState(() {});
        }
      })
      ..addStatusListener((status) {
        Log.d(tag: LOG_TAG, "_rotateAnim status = $status and from = $from");
        if (status == AnimationStatus.completed) {
          if (from == 0) _startRotate1();
          if (from == 1) {
            _rotateController.reverseDuration =
                const Duration(milliseconds: 100);
            _rotateController.reverse();
          }
          if (from == 2) {
            _rotateController.reverse();
          }
          if (from == 3) {
            Future.delayed(const Duration(seconds: 1), () {
              if (mounted) _startOpacity();
            });
          }
        } else if (status == AnimationStatus.dismissed) {
          if (from == 1) {
            Future.delayed(const Duration(milliseconds: 300), () {
              if (!mounted) return;
              widget.swapCallback.call();
              Future.delayed(const Duration(milliseconds: 1250), () {
                if (mounted) _startRotate2();
              });
            });
          }
          if (from == 2) {
            _rCount++;
            if (_rCount < 3) {
              _rotateController.forward();
            } else {
              _startRotate3();
            }
          }
        }
      });
  }

  void _startAnim() {
    if (!_scaleController.isAnimating) {
      _scaleController.forward();
    }
  }

  void _startRotate0() {
    if (!_rotateController.isAnimating) {
      _rotateController.forward();
      Log.d(tag: LOG_TAG, '_rotateController.forward0000...');
    }
  }

  void _startRotate1() {
    _top1Aliment = AlignmentDirectional.bottomEnd;
    _top2Aliment = AlignmentDirectional.topEnd;
    _rotateInitAngle = 0;
    _initRotateAnim(from: 1);
    if (!_rotateController.isAnimating) {
      _rotateController.forward();
      Log.d(tag: LOG_TAG, '_rotateController.forward11111...');
    }
  }

  void _startRotate2() {
    _top2Aliment = AlignmentDirectional.center;
    _top1Rotate = false;
    _rotateInitAngle = 0;
    _initRotateAnim(from: 2);
    if (!_rotateController.isAnimating) {
      _rotateController.forward(from: 0);
      Log.d(tag: LOG_TAG, '_rotateController.forward2222222...');
    }
  }

  void _startRotate3() {
    _top2Aliment = AlignmentDirectional.center;
    _top1Rotate = false;
    _rotateInitAngle = 0;
    _initRotateAnim(from: 3);
    if (!_rotateController.isAnimating) {
      _rotateController.forward(from: 0);
      Log.d(tag: LOG_TAG, '_rotateController.forward3333...');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Builder(
          builder: (context) {
            Future.delayed(const Duration(milliseconds: 100), () {
              if (!mounted) return;
              data[index].context = context;
              data[index].height = context.size?.height;
            });
            return swapIndex.contains(index)
                ? SizedBox(height: data[index].height)
                : Transform.rotate(
                    angle: index == 0
                        ? (_top1Rotate
                            ? -_rotateInitAngle + _rotateAnim.value
                            : 0)
                        : _rotateInitAngle - _rotateAnim.value,
                    alignment: index == 0 ? _top1Aliment : _top2Aliment,
                    child: Transform.scale(
                        scale: _scaleAnim.value, child: data[index].widget),
                  );
          },
        );
      },
      itemCount: widget.children.length,
    );
  }

  swap(int i, int j) {
    setState(() {
      swapIndex = [i, j];
    });
    Navigator.push(
            context,
            WPopupPage(
                data1: data[i], data2: data[j], duration: widget.duration))
        .then((v) {
      setState(() {
        var temp = data[i];
        data[i] = data[j];
        data[j] = temp;
        swapIndex = [];
      });
    });
  }

  void _startOpacity() {
    if (mounted) widget.dismissCallBack();
  }
}

class WPopupPage extends PopupRoute {
  final WReorderData data1;
  final WReorderData data2;
  final Duration duration;

  WPopupPage(
      {required this.data1, required this.data2, required this.duration});

  @override
  Color? get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return SwapIndexWidget(
      data1: data1,
      data2: data2,
      duration: duration,
    );
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 100);
}

class SwapIndexWidget extends StatefulWidget {
  final WReorderData data1;
  final WReorderData data2;
  final Duration duration;

  const SwapIndexWidget(
      {super.key,
      required this.data1,
      required this.data2,
      required this.duration});

  @override
  _SwapIndexWidgetState createState() => _SwapIndexWidgetState();
}

class _SwapIndexWidgetState extends State<SwapIndexWidget>
    with TickerProviderStateMixin<SwapIndexWidget> {
  late RenderBox rb1;
  late RenderBox rb2;
  late Rect child1Rect;
  late Rect child2Rect;
  late Widget child1;
  late Widget child2;

  late AnimationController _scaleTopController;
  late Animation<double> _scaleTopAnim;

  late AnimationController _scaleBottomController;
  late Animation<double> _scaleBottomAnim;

  static const LOG_TAG = '_SwapIndexWidgetState';

  @override
  void initState() {
    super.initState();
    rb1 = widget.data1.context?.findRenderObject() as RenderBox;
    rb2 = widget.data2.context?.findRenderObject() as RenderBox;
    child1Rect = Rect.fromPoints(rb1.localToGlobal(Offset.zero),
        rb1.localToGlobal(Offset(rb1.size.width, rb1.size.height)));
    child2Rect = Rect.fromPoints(rb2.localToGlobal(Offset.zero),
        rb2.localToGlobal(Offset(rb2.size.width, rb2.size.height)));

    child1 = widget.data1.widget;
    child2 = widget.data2.widget;

    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        var temp = child1Rect;
        child1Rect = child2Rect;
        child2Rect = temp;
      });
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          child1 = Container();
          child2 = Container();
        });
        Navigator.pop(context);
      });
    });

    _initAnimation();
    _start();
  }

  @override
  void dispose() {
    _scaleTopController.dispose();
    _scaleBottomController.dispose();
    super.dispose();
  }

  void _initAnimation() {
    _scaleTopController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 750));

    _scaleTopAnim = Tween(begin: 1.0, end: 0.5).animate(
        CurvedAnimation(parent: _scaleTopController, curve: Curves.linear))
      ..addListener(() {
        if (mounted) {
          Log.d(
              tag: LOG_TAG,
              '_scaleTopController, data = ${_scaleTopAnim.value}');
          setState(() {});
        }
      })
      ..addStatusListener((status) {
        Log.d(tag: LOG_TAG, "_scaleTopAnim status = $status");
        if (status == AnimationStatus.completed) {
          _scaleTopController.reverse();
        }
      });

    _scaleBottomController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 750));

    _scaleBottomAnim = Tween(begin: 1.0, end: Util.width / (Util.width - 48))
        .animate(CurvedAnimation(
            parent: _scaleBottomController, curve: Curves.linear))
      ..addListener(() {
        if (mounted) {
          Log.d(
              tag: LOG_TAG,
              '_scaleBottomController, data = ${_scaleBottomAnim.value}');
          setState(() {});
        }
      })
      ..addStatusListener((status) {
        Log.d(tag: LOG_TAG, "_scaleBottomAnim status = $status");
        if (status == AnimationStatus.completed) {
          _scaleBottomController.reverse();
        }
      });
  }

  void _start() {
    _scaleTopController.forward();
    _scaleBottomController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          AnimatedPositioned.fromRect(
            duration: widget.duration,
            rect: child1Rect,
            child: Transform.scale(scale: _scaleTopAnim.value, child: child1),
          ),
          AnimatedPositioned.fromRect(
            duration: widget.duration,
            rect: child2Rect,
            child:
                Transform.scale(scale: _scaleBottomAnim.value, child: child2),
          ),
        ],
      ),
    );
  }
}

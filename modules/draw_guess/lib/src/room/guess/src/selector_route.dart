import 'package:flutter/widgets.dart';

class SelectorRoute extends PopupRoute {
  Widget child;

  SelectorRoute({required this.child});

  @override
  Color? get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) =>
      child;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 50);
}

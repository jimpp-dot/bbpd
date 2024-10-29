import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

typedef StarChangedCallback = Function(int type, int star);

class StarWidget extends StatefulWidget {
  final int star;
  final int? type;
  final StarChangedCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final int totalStar;
  final Widget? starOnWidget;
  final Widget? starOffWidget;

  const StarWidget({
    super.key,
    required this.star,
    this.width,
    this.height,
    this.type,
    this.padding,
    this.onTap,
    this.totalStar = 5,
    this.starOnWidget,
    this.starOffWidget,
  });

  @override
  _StarWidgetState createState() => _StarWidgetState();
}

class _StarWidgetState extends State<StarWidget> {
  int star = 0;
  StarChangedCallback? onStarTaped;

  @override
  void initState() {
    super.initState();
    setState(() {
      star = widget.star;
      onStarTaped = widget.onTap;
    });
  }

  @override
  void didUpdateWidget(StarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.star != widget.star) {
      setState(() {
        star = widget.star;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildSingleStar(
              onStarTaped == null ? null : () => _onPress(1), star > 0),
          _buildSingleStar(
              onStarTaped == null ? null : () => _onPress(2), star > 1),
          _buildSingleStar(
              onStarTaped == null ? null : () => _onPress(3), star > 2),
          _buildSingleStar(
              onStarTaped == null ? null : () => _onPress(4), star > 3),
          _buildSingleStar(
              onStarTaped == null ? null : () => _onPress(5), star > 4),
        ],
      ),
    );
  }

  Widget _buildSingleStar(GestureTapCallback? onTap, bool isStar) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(0),
      child: InkWell(
        onTap: onTap,
        child: isStar
            ? (widget.starOnWidget ??
                R.img(
                  "star_on.svg",
                  package: ComponentManager.MANAGER_BASE_CORE,
                  width: widget.width ?? 20,
                  height: widget.height ?? 20,
                ))
            : (widget.starOffWidget ??
                R.img(
                  "star_off.svg",
                  package: ComponentManager.MANAGER_BASE_CORE,
                  width: widget.width ?? 20,
                  height: widget.height ?? 20,
                )),
      ),
    );
  }

  void _onPress(int starTap) {
    if (widget.onTap != null) {
      setState(() {
        star = starTap;
      });
      widget.onTap!(widget.type ?? 0, star);
    }
  }
}

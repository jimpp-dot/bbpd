import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../k.dart';

/// ktv 公屏鼓掌按钮
///
class KtvApplauseButton extends StatefulWidget {
  final String icon;
  final String name;
  final String uuid;
  final String rid;
  final VoidCallback onComplete;

  const KtvApplauseButton(
      this.icon, this.name, this.uuid, this.rid, this.onComplete,
      {super.key});

  @override
  State<KtvApplauseButton> createState() => _KtvApplauseButtonState();
}

class _KtvApplauseButtonState extends State<KtvApplauseButton>
    with SingleTickerProviderStateMixin<KtvApplauseButton> {
  Timer? hideTimer;
  final GlobalKey _key = GlobalKey();
  Animation<double>? _translateX;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_onLayout);
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _hideSelf();
  }

  @override
  void dispose() {
    hideTimer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(KtvApplauseButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.uuid != widget.uuid) {
      _hideSelf();
    }
  }

  _onLayout(Duration timeStamp) {
    if (_key.currentContext == null || !mounted) {
      return;
    }

    RenderBox box = _key.currentContext!.findRenderObject() as RenderBox;
    _translateX = Tween(begin: -box.size.width, end: 0.0).animate(
      CurvedAnimation(
          parent: _animationController,
          curve: const Interval(0.0, 1.0, curve: Curves.easeOut)),
    );

    _animationController.forward();
  }

  void _hideSelf() {
    hideTimer?.cancel();
    hideTimer = Timer(const Duration(seconds: 4), () {
      if (mounted) {
        widget.onComplete();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, child) {
        return Container(
          transform: Matrix4.translationValues(
              _translateX == null ? -Util.width : _translateX!.value, 0.0, 0.0),
          child: child,
        );
      },
      child: Container(
        key: _key,
        height: 40,
        margin: const EdgeInsetsDirectional.only(start: 12, top: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
              colors: [Color(0xFFC382FF), Color(0xFFFE5AB1)]),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 4),
            Container(
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withOpacity(0.5),
                  width: 1,
                ),
              ),
              child: CommonAvatar(
                path: widget.icon,
                size: 30,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  constraints:
                      const BoxConstraints(minWidth: 40, maxWidth: 150),
                  child: Text(
                    widget.name,
                    style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  constraints:
                      const BoxConstraints(minWidth: 40, maxWidth: 150),
                  child: Text(
                    K.room_ktv_sing_end,
                    style: const TextStyle(fontSize: 11, color: Colors.white70),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 4),
            GestureDetector(
              onTap: _onTap,
              child: Container(
                height: 24,
                padding: const EdgeInsets.symmetric(horizontal: 6),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Text(
                  K.room_ktv_applause_encourage,
                  style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFFF163C2),
                      fontWeight: FontWeight.w500,
                      height: 1),
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }

  void _onTap() {
    try {
      Xhr.postJson(
        '${System.domain}ktv/cheerup',
        {'rid': widget.rid},
        throwOnError: true,
      );
    } catch (e) {
      if (mounted) {
        Fluttertoast.toastException(
            exp: e.toString(), gravity: ToastGravity.CENTER);
      }
    }
    widget.onComplete();
  }
}

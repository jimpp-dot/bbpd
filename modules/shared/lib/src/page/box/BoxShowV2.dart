import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'global_float_screen.dart';

/// 全局飘屏展示
class BoxShowV2Tool {
  static OverlayEntry? _overlayEntry;

  static init() {
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      dispose();
      var overlayState = Overlay.of(System.context);
      OverlayEntry overlayEntry;
      overlayEntry = OverlayEntry(builder: (context) {
        return const BoxShowV2();
      });
      _overlayEntry = overlayEntry;
      overlayState.insert(overlayEntry);
    });
  }

  static dispose() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }
}

class BoxShowV2 extends StatefulWidget {
  const BoxShowV2({Key? key}) : super(key: key);

  @override
  _BoxShowV2State createState() => _BoxShowV2State();
}

class _BoxShowV2State extends State<BoxShowV2> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PositionedDirectional(
          start: 0.0,
          end: 0.0,
          top: Util.statusHeight + 34.0,
          child: const GlobalFloatScreen(),
        ),
      ],
    );
  }
}

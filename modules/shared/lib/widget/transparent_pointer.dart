import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

// touch穿透视图，只穿透自己的child，不影响child子节点的点击事件
class TransparentPointer extends SingleChildRenderObjectWidget {
  const TransparentPointer({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  RenderTransparentBox createRenderObject(BuildContext context) {
    return RenderTransparentBox();
  }
}

class RenderTransparentBox extends RenderProxyBox {
  RenderTransparentBox({RenderBox? child}) : super(child);

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    super.hitTest(result, position: position);
    return false;
  }
}

import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';

/// 头像框和座驾物品组件基类
class CollectionCommodityBaseWidget extends StatelessWidget {
  final ExhibitCommodityItem data;

  final VoidCallback? onTap;

  final bool showLock;

  final double size;

  const CollectionCommodityBaseWidget({
    Key? key,
    required this.data,
    this.onTap,
    this.showLock = true,
    required this.size,
  }) : super(key: key);

  bool get isLock {
    if (!showLock) return false;
    return data.lock.toPbBool();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

const ColorFilter greyscale = ColorFilter.matrix(<double>[
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
]);

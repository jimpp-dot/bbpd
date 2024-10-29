import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 收藏品列表背景
class CollectionListBox extends StatelessWidget {
  final String levelIcon;
  final Widget? child;
  const CollectionListBox({Key? key, this.child, required this.levelIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        alignment: AlignmentDirectional.center,
        clipBehavior: Clip.none,
        children: [
          _buildBackground(),
          _buildTopLevel(),
          Container(
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    double width = Util.width - 40;

    return Positioned.fill(
      child: Column(
        children: [
          R.img('collection_room/collection_box_bg_top.webp',
              package: ComponentManager.MANAGER_PERSONALDATA,
              width: width,
              height: 76,
              fit: BoxFit.fill),
          Expanded(
            child: R.img('collection_room/collection_box_bg_middle.webp',
                package: ComponentManager.MANAGER_PERSONALDATA,
                fit: BoxFit.fill,
                width: width),
          ),
          R.img('collection_room/collection_box_bg_bottom.webp',
              package: ComponentManager.MANAGER_PERSONALDATA, width: width),
        ],
      ),
    );
  }

  Widget _buildTopLevel() {
    return PositionedDirectional(
      top: -24,
      width: 165,
      height: 56,
      child: CachedNetworkImage(
        imageUrl: Util.parseIcon(levelIcon),
        cachedHeight: 56.px,
        cachedWidth: 165.px,
      ),
      // child: R.img(,cachedWidth: 165.px,cachedHeight: 56.px),
    );
  }
}

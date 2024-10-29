import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/collection_room/widgets/collection_commodity_base_widget.dart';

///  座驾物品展示
class CollectionMountsWidget extends CollectionCommodityBaseWidget {
  /// 是否播放东校
  final bool showPlay;

  const CollectionMountsWidget({
    Key? key,
    required ExhibitCommodityItem data,
    VoidCallback? onTap,
    bool showLock = true,
    double size = 224,
    this.showPlay = true,
  }) : super(
          key: key,
          data: data,
          onTap: onTap,
          showLock: showLock,
          size: size,
        );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: super.onTap,
      child: _MountsAnimateWidget(
        data: data,
        isLock: isLock,
        size: size,
        showPlay: showPlay,
      ),
    );
  }
}

/// 座驾动画播放组件
class _MountsAnimateWidget extends StatefulWidget {
  final ExhibitCommodityItem data;

  final bool isLock;

  final double size;

  final bool showPlay;

  const _MountsAnimateWidget({
    Key? key,
    required this.data,
    required this.isLock,
    required this.size,
    required this.showPlay,
  }) : super(key: key);

  @override
  State<_MountsAnimateWidget> createState() => _MountsAnimateWidgetState();
}

class _MountsAnimateWidgetState extends State<_MountsAnimateWidget> {
  bool isPlayed = false;

  @override
  void dispose() {
    Log.d('=======_MountsAnimateWidget dispose=======');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.center,
      children: [
        if (widget.showPlay && !isPlayed)
          PositionedDirectional(
            width: Util.width,
            height: Util.height,
            child: IgnorePointer(
              child: DecorateDisplayWidget(
                effect: Decorate(widget.data.giftId, widget.data.vapSize),
                repeat: false,
                onError: _onPlayFinished,
                onComplete: _onPlayFinished,
              ),
            ),
          ),
        AnimatedOpacity(
          opacity: (widget.showPlay) ? (isPlayed ? 1 : 0) : 1,
          duration: const Duration(milliseconds: 200),
          child: _buildStaticCommodityWidget,
        ),
        _buildLockWidget,
      ],
    );
  }

  _onPlayFinished() {
    if (mounted) {
      setState(() {
        isPlayed = true;
      });
    }
  }

  /// 静态图
  Widget get _buildStaticCommodityWidget {
    return ColorFiltered(
      colorFilter: widget.data.lock.toPbBool()
          ? greyscale
          : const ColorFilter.mode(Colors.transparent, BlendMode.color),
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: CachedNetworkImage(
          imageUrl: Util.parseIcon(widget.data.image),
        ),
      ),
    );
  }

  Widget get _buildLockWidget {
    if (!(widget.isLock)) return const SizedBox.shrink();
    return PositionedDirectional(
      width: 48,
      height: 48,
      child: Container(
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
          borderRadius: BorderRadiusDirectional.all(Radius.circular(12)),
          color: Color(0x80000000),
        ),
        child: R.img('collection_room/ic_lock.webp',
            package: ComponentManager.MANAGER_PERSONALDATA,
            width: 24,
            height: 24),
      ),
    );
  }
}

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/src/collection_room/collection_room_util.dart';
import 'package:personaldata/src/collection_room/widgets/collection_commodity_base_widget.dart';

/// 其他道具收藏组件
class CollectionOtherCommodityWidget extends CollectionCommodityBaseWidget {
  final int? targetUid;

  const CollectionOtherCommodityWidget({
    Key? key,
    required ExhibitCommodityItem data,
    VoidCallback? onTap,
    bool showLock = true,
    double size = 94,
    this.targetUid,
  }) : super(
          key: key,
          data: data,
          onTap: onTap,
          showLock: showLock,
          size: size,
        );

  @override
  Widget build(BuildContext context) {
    String type = data.type;
    double width = size - 8;
    double imgWidth = 0;
    double imgHeight = 0;

    if (type == CollectionRoomUtil.bubbleTypeKey) {
      //聊天气泡
      imgWidth = width;
      imgHeight = (imgWidth / 80 * 52).truncateToDouble();
    } else if (type == CollectionRoomUtil.effectTypeKey) {
      //入场特效
      imgWidth = width;
      imgHeight = (imgWidth / 96 * 34).truncateToDouble();
    } else {
      imgWidth = width;
      imgHeight = width;
    }

    return GestureDetector(
      onTap: super.onTap,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: width,
            height: width,
            alignment: Alignment.center,
            child: SizedBox(
              width: width,
              height: imgHeight,
              child: ColorFiltered(
                colorFilter: isLock
                    ? greyscale
                    : const ColorFilter.mode(
                        Colors.transparent, BlendMode.color),
                child: type == CollectionRoomUtil.bubbleTypeKey
                    ? CachedNetworkImageStretch(
                        imageUrl: Util.parseIcon(data.image),
                        centerSlice: const Rect.fromLTWH(32, 23, 2, 2),
                        scale: 3,
                      )
                    : CachedNetworkImage(
                        imageUrl: Util.parseIcon(data.image),
                        cachedWidth: imgWidth.px,
                        cachedHeight: imgHeight.px,
                      ),
              ),
            ),
          ),
          Visibility(visible: isLock, child: const _LockWidget()),
        ],
      ),
    );
  }
}

class _LockWidget extends StatelessWidget {
  const _LockWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      alignment: AlignmentDirectional.center,
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.all(Radius.circular(6)),
        color: Color(0x80000000),
      ),
      child: R.img('collection_room/ic_lock.webp',
          package: ComponentManager.MANAGER_PERSONALDATA,
          width: 18,
          height: 18),
    );
  }
}

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:vip/src/level/model/level_bean.dart';

typedef OnLevelItemTaped = void Function();

class LevelItemWidget extends StatelessWidget {
  final GestureTapCallback? onTap;

  final LevelItem item;

  final bool showDesc;

  const LevelItemWidget(this.item,
      {super.key, this.onTap, this.showDesc = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double ratio = constraints.maxWidth / 104;
          Log.d('item.cover:${item.cover}');
          return Container(
            alignment: AlignmentDirectional.topCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: item.cover,
                        width: constraints.maxWidth,
                        height: constraints.maxWidth,
                        fit: BoxFit.cover,
                        errorWidget: Container(),
                      ),
                    ),
                    if (item.isLocked) _buildLockMask(constraints.maxWidth),
                    if (item.heatRemark.isNotEmpty)
                      _buildCorner(item.heatRemark),
                  ],
                ),
                SizedBox(height: 4 * ratio),
                Text(
                  item.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: showDesc ? 13 * ratio : 10),
                ),
                if (showDesc)
                  Text(
                    MoneyConfig.isDiamond()
                        ? (Util.validStr(item.remarkNew)
                            ? item.remarkNew
                            : item.remark)
                        : item.remark,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.3),
                        fontSize: 11 * ratio),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLockMask(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: AlignmentDirectional.center,
      child: R.img('ic_lock.svg',
          width: 24, height: 24, package: ComponentManager.MANAGER_BASE_CORE),
    );
  }

  Widget _buildCorner(String text) {
    return PositionedDirectional(
      top: 0,
      end: 0,
      child: Container(
        height: 16,
        padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: const BorderRadiusDirectional.only(
              topEnd: Radius.circular(8.5), bottomStart: Radius.circular(8.5)),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 11),
        ),
      ),
    );
  }
}

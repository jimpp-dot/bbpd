import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';

/// 收藏展示列表Item
class CollectionDisplayItem extends StatelessWidget {
  /// 判断是否是我自己的收藏品
  final bool isMe;

  final ExhibitCommodityItem? data;

  final VoidCallback? onTap;

  final double? size;

  const CollectionDisplayItem(
      {Key? key, this.isMe = true, this.data, this.onTap, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: Container(
            width: size,
            height: size,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF291088),
                  Color(0xFF5224BD),
                ],
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
              ),
              borderRadius: BorderRadiusDirectional.all(Radius.circular(8)),
            ),
            alignment: AlignmentDirectional.center,
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: _buildCollection(),
          ),
        ),
        _buildLevelIcon(),
      ],
    );
  }

  Widget _buildLevelIcon() {
    if (data == null) return const SizedBox.shrink();

    return PositionedDirectional(
      start: 4,
      top: 4,
      width: 28,
      height: 14,
      child: CachedNetworkImage(
        imageUrl: Util.parseIcon(data?.gradeIcon),
      ),
    );
  }

  /// 收藏品内容， 头像框或座驾
  Widget _buildCollection() {
    if (data == null) return _buildEmpty();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: UserIconFrame(
        size: 80,
        frameUrl: data?.image ?? '',
      ),
    );
  }

  /// 空占位符， isMe ? 点击添加 : 尚未添加
  Widget _buildEmpty() {
    String title = isMe ? "点击添加展示" : "尚未添加";
    TextStyle textStyle =
        R.textStyle.regular10.copyWith(color: const Color(0x66FFFFFF));
    double iconSize = isMe ? 24 : 48;
    String iconPath =
        isMe ? 'collection_room/ic_add.webp' : 'collection_room/ic_gift.webp';

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(),
          R.img(iconPath,
              package: ComponentManager.MANAGER_PERSONALDATA,
              width: iconSize,
              height: iconSize,
              cachedWidth: iconSize.px,
              cachedHeight: iconSize.px),
          SizedBox(
            height: (isMe ? 12 : 0),
          ),
          Text(
            title,
            style: textStyle,
          ),
          Expanded(
              child: Container(
            constraints: const BoxConstraints(maxHeight: 10),
          )),
          // const SizedBox(height: 10,),
        ],
      ),
    );
  }
}

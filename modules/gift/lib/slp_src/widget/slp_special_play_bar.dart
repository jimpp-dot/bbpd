import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../assets.dart';

class SlpSpecialPlayBar extends StatelessWidget {
  final BbGiftPanelGift selectGift;
  final ValueChanged<BbGiftPanelSpecialPlayItem>? onSelect;
  final Map<int, BbGiftPanelSpecialPlayItem> specialPlayItemMap;

  const SlpSpecialPlayBar(
      {Key? key,
      required this.selectGift,
      required this.specialPlayItemMap,
      this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Util.isCollectionEmpty(selectGift.specialPlayItems)) {
      return const SizedBox.shrink();
    }
    return Container(
      height: 76,
      alignment: AlignmentDirectional.centerStart,
      decoration: BoxDecoration(
        border: Border(
            bottom:
                BorderSide(color: Colors.white.withOpacity(0.1), width: 0.5)),
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsetsDirectional.only(
          start: 16,
          end: 16,
          top: 16,
          bottom: 12,
        ),
        itemBuilder: (ctx, index) {
          final item = selectGift.specialPlayItems[index];
          bool select = specialPlayItemMap[selectGift.id] != null
              ? item.newGiftId == specialPlayItemMap[selectGift.id]?.newGiftId
              : item.newGiftId == selectGift.id;
          bool unlock = item.grantStatus == 'unlock';
          return GestureDetector(
            onTap: () {
              if (unlock) {
                if (onSelect != null) {
                  onSelect!(item);
                }
              } else {
                SchemeUrlHelper.instance()
                    .checkSchemeUrlAndGo(context, item.jumpPage);
              }
            },
            child: Stack(
              children: [
                _itemContainer(item, select, unlock),
                if (!unlock) _buildLocked(item),
              ],
            ),
          );
        },
        separatorBuilder: (ctx, index) {
          return const SizedBox(
            width: 12,
          );
        },
        itemCount: selectGift.specialPlayItems.length,
      ),
    );
  }

  Widget _buildLocked(BbGiftPanelSpecialPlayItem item) {
    return Container(
      width: 106,
      height: 48,
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsetsDirectional.only(
        start: 8,
        end: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 0.5,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              R.img(
                Assets.ic_lock_special_play_svg,
                width: 12,
                height: 12,
                package: ComponentManager.MANAGER_GIFT,
              ),
              Flexible(
                child: Text(
                  item.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 1,
          ),
          Text(
            item.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  List<Color> _parseColors(dynamic colorData, bool unlock) {
    List<Color> colors = Util.parseColors(colorData, Colors.transparent);
    if (Util.isCollectionEmpty(colors)) {
      colors = [Colors.transparent, Colors.transparent];
    } else if (colors.length == 1) {
      colors.add(colors[0]);
    }
    return colors.map((e) => e.withOpacity(unlock ? 1 : 0.08)).toList();
  }

  Widget _itemContainer(
      BbGiftPanelSpecialPlayItem item, bool select, bool unlock) {
    return Container(
      width: 106,
      height: 48,
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsetsDirectional.only(
        start: 8,
        end: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: select && unlock
              ? R.color.mainBrandColor
              : Colors.white.withOpacity(0.3),
          width: select && unlock ? 1.5 : 0.5,
        ),
      ),
      child: _buildItem(item, unlock),
    );
  }

  Widget _buildItem(BbGiftPanelSpecialPlayItem item, bool unlock) {
    if (item.type == 'color') {
      return Row(
        children: [
          Expanded(
            child: Text(
              item.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                color: Colors.white.withOpacity(unlock ? 1 : 0.02),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
                colors: _parseColors(item.showColor, unlock),
              ),
            ),
          ),
        ],
      );
    }

    if (item.type == 'voice') {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          PositionedDirectional(
            bottom: 0,
            end: -8,
            child: R.img(
              Assets.ic_special_play_voice_png,
              width: 33,
              height: 32,
              package: ComponentManager.MANAGER_GIFT,
            ),
          ),
          Container(
            width: 90,
            alignment: AlignmentDirectional.center,
            child: Text(
              item.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                color: Colors.white.withOpacity(unlock ? 1 : 0.02),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      );
    }

    return const SizedBox.shrink();
  }
}

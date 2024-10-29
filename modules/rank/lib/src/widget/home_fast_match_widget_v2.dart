import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/src/util/fast_match_uitl.dart';

import 'home_match_widget.dart';

class HomeFastMatchWidgetV2 extends StatelessWidget {
  final List<HomeMatchItemData> matchItems;

  const HomeFastMatchWidgetV2({super.key, required this.matchItems});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Stack(
        children: [
          SizedBox(width: (106 * matchItems.length - 1) + 24, height: 90),
          ...matchItems
              .mapIndexed((i, e) => _buildMatchItem(context, e, i))
              .toList(),
        ],
      ),
    );
  }

  Widget _buildMatchItem(
      BuildContext context, HomeMatchItemData item, int index) {
    if (Util.isStringEmpty(item.matchIcon)) return const SizedBox();
    return PositionedDirectional(
      start: index * 106,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _onItemTap(context, item),
        child: SizedBox(
          width: 130,
          height: 90,
          child: CachedNetworkImage(
            imageUrl: item.matchIcon,
            width: 130,
            height: 90,
            cachedWidth: 130.px,
            cachedHeight: 90.px,
            supportDark: true,
          ),
        ),
      ),
    );
  }

  void _onItemTap(BuildContext context, HomeMatchItemData itemData) async {
    if ('fate_dialog' == itemData.type) {
      /// 今日缘分
      // IMessageManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MESSAGE);
      // manager.openFateDialog(context);
      //
      // Tracker.instance.track(TrackEvent.luck_click, properties: {
      //   'entrance' : 'home',
      // });

      return;
    }
    FastMatchUtil.toFastMatch(context, itemData.type, itemData.title);
  }
}

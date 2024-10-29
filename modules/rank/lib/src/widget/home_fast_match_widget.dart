import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:rank/src/util/fast_match_uitl.dart';

import 'home_match_widget.dart';

class HomeFastMatchWidget extends StatelessWidget {
  final List<HomeMatchItemData> matchItems;
  final bool showTitle;
  final bool isFloat;
  final Widget? customTitle;

  HomeFastMatchWidget({
    required this.matchItems,
    this.customTitle,
    this.showTitle = true,
    this.isFloat = false,
    super.key,
  });

  double? _ratio;

  int pageIndex = 0;

  double get ratio {
    if (_ratio != null) {
      return _ratio!;
    }

    _ratio = (Util.width - 32) / 388;
    return _ratio!;
  }

  @override
  Widget build(BuildContext context) {
    if (isFloat) {
      return buildFloatType();
    }

    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showTitle)
            Container(
              padding: const EdgeInsetsDirectional.only(bottom: 12, start: 16),
              alignment: AlignmentDirectional.centerStart,
              child: customTitle ??
                  Text(
                    K.rank_quick_match_room,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: R.color.mainTextColor,
                    ),
                  ),
            ),
          SizedBox(
            width: Util.width,
            height: ratio * 150 + 11,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: Util.width,
                  height: ratio * 150 + 11,
                  child: _buildMatch(context, index),
                );
              },
              itemCount: matchItems.length ~/ 5 +
                  ((matchItems.length % 5) > 0 ? 1 : 0),
              pagination: matchItems.length > 5
                  ? SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.zero,
                      builder: RectSwiperPaginationBuilder(
                        activeColor: R.color.mainBrandColor,
                        color: R.color.mainBrandColor.withOpacity(0.5),
                        size: const Size(9, 3),
                        activeSize: const Size(9, 3),
                        radius: 2,
                      ),
                    )
                  : null,
              autoplay: false,
              loop: false,
              autoplayDisableOnInteraction: false,
              onIndexChanged: (int index) {
                _handleItemExposureReport(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  /// 浮层样式
  Widget buildFloatType() {
    return Container(
      width: Util.width,
      height: 67,
      color: R.color.mainBgColor,
      padding: const EdgeInsetsDirectional.only(top: 7, bottom: 12),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          HomeMatchItemData data = matchItems[index];
          return buildFloatItem(context, data);
        },
        padding: const EdgeInsetsDirectional.only(start: 16),
        itemCount: matchItems.length,
        scrollDirection: Axis.horizontal,
        itemExtent: 112,
      ),
    );
  }

  Widget buildFloatItem(BuildContext context, HomeMatchItemData data) {
    return GestureDetector(
      onTap: () {
        _onItemTap(context, data);
      },
      child: Container(
        height: 48,
        width: 104,
        margin: const EdgeInsetsDirectional.only(end: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          gradient: data.bgColors.length >= 2
              ? LinearGradient(
                  begin: AlignmentDirectional.bottomStart,
                  end: AlignmentDirectional.topEnd,
                  colors: [
                    data.bgColors[0].withOpacity(0.12),
                    data.bgColors[1].withOpacity(0.12)
                  ],
                )
              : null,
        ),
        padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: data.bgColors.length >= 2
                    ? LinearGradient(
                        begin: AlignmentDirectional.bottomStart,
                        end: AlignmentDirectional.topEnd,
                        colors: [data.bgColors[0], data.bgColors[1]],
                      )
                    : null,
              ),
              alignment: AlignmentDirectional.center,
              child: CachedNetworkImage(
                imageUrl: Util.getRemoteImgUrl(data.partyIcon),
                width: 21,
                height: 21,
                cachedWidth: 21.px,
                cachedHeight: 21.px,
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Container(
              constraints: const BoxConstraints(
                maxWidth: 54,
              ),
              child: Text(
                data.title,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF313131),
                  height: 1.2,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMatch(BuildContext context, int index) {
    List<HomeMatchItemData> items = matchItems.skip(index * 5).toList();
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }

    Widget widget;

    if (items.length == 1) {
      widget = Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [buildVerticalItem(context, items[0])],
      );
    } else if (items.length == 2) {
      widget = Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHorizontalItem(context, items[0]),
          SizedBox(
            height: ratio * 8,
          ),
          buildHorizontalItem(context, items[1]),
        ],
      );
    } else if (items.length == 3) {
      widget = Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildVerticalItem(context, items[0]),
          SizedBox(
            width: ratio * 8,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHorizontalItem(context, items[1]),
              SizedBox(
                height: ratio * 8,
              ),
              buildHorizontalItem(context, items[2]),
            ],
          ),
        ],
      );
    } else if (items.length == 4) {
      widget = Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHorizontalItem(context, items[0]),
              SizedBox(
                height: ratio * 8,
              ),
              buildHorizontalItem(context, items[1]),
            ],
          ),
          SizedBox(
            width: ratio * 8,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHorizontalItem(context, items[2]),
              SizedBox(
                height: ratio * 8,
              ),
              buildHorizontalItem(context, items[3]),
            ],
          ),
        ],
      );
    } else {
      widget = Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildVerticalItem(context, items[0]),
          SizedBox(
            width: ratio * 8,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHorizontalItem(context, items[1]),
              SizedBox(
                height: ratio * 8,
              ),
              buildHorizontalItem(context, items[2]),
            ],
          ),
          SizedBox(
            width: ratio * 8,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHorizontalItem(context, items[3]),
              SizedBox(
                height: ratio * 8,
              ),
              buildHorizontalItem(context, items[4]),
            ],
          ),
        ],
      );
    }

    return Container(
      width: Util.width,
      height: ratio * 150,
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      child: widget,
    );
  }

  Widget buildVerticalItem(BuildContext context, HomeMatchItemData item) {
    String partyIcon = item.partyIcon;
    if (!partyIcon.startsWith(RegExp(r'http(s?):\/\/'))) {
      partyIcon = System.imageDomain + partyIcon;
    }
    return GestureDetector(
      onTap: () {
        _onItemTap(context, item);
      },
      child: Container(
        width: ratio * 110,
        height: ratio * 150,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: item.bgColors.length >= 2
              ? LinearGradient(
                  begin: AlignmentDirectional.bottomStart,
                  end: AlignmentDirectional.topEnd,
                  colors: [item.bgColors[0], item.bgColors[1]],
                )
              : null,
        ),
        child: Stack(
          children: [
            PositionedDirectional(
              top: ratio * 12,
              start: ratio * 12,
              child: Text(
                item.title,
                style: TextStyle(
                  fontSize: ratio * 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
            ),
            PositionedDirectional(
              top: ratio * 40,
              start: ratio * 12,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  R.img(
                    Assets.ic_people_in_party_svg,
                    width: 12,
                    height: 12,
                    package: ComponentManager.MANAGER_RANK,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    '${item.playingNum}',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.white60,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            PositionedDirectional(
              top: ratio * 62,
              start: ratio * 20,
              child: CachedNetworkImage(
                imageUrl: partyIcon,
                width: ratio * 100,
                height: ratio * 100,
                cachedWidth: (100 * ratio).px,
                cachedHeight: (100 * ratio).px,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHorizontalItem(BuildContext context, HomeMatchItemData item) {
    String partyIcon = item.partyIcon;
    if (!partyIcon.startsWith(RegExp(r'http(s?):\/\/'))) {
      partyIcon = System.imageDomain + partyIcon;
    }
    return GestureDetector(
      onTap: () {
        _onItemTap(context, item);
      },
      child: Container(
        width: ratio * 131,
        height: ratio * 71,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: item.bgColors.length >= 2
              ? LinearGradient(
                  begin: AlignmentDirectional.bottomStart,
                  end: AlignmentDirectional.topEnd,
                  colors: [item.bgColors[0], item.bgColors[1]],
                )
              : null,
        ),
        child: Stack(
          children: [
            PositionedDirectional(
              top: ratio * 3,
              start: ratio * 66,
              child: CachedNetworkImage(
                imageUrl: partyIcon,
                width: ratio * 80,
                height: ratio * 80,
                cachedWidth: (80 * ratio).px,
                cachedHeight: (80 * ratio).px,
              ),
            ),
            PositionedDirectional(
              top: ratio * 12,
              start: ratio * 10,
              child: Text(
                item.title,
                style: TextStyle(
                  fontSize: ratio * 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
            ),
          ],
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

  void _handleItemExposureReport(int index) {
    if (pageIndex != index) {
      Tracker.instance.track(TrackEvent.page_slide, properties: {
        'uid': Session.uid,
        'page_type': 'quick_match',
        'from_page': pageIndex + 1,
        'to_page': index + 1,
        'from_page_expose': getTypesByIndex(pageIndex),
        'to_page_expose': getTypesByIndex(index),
      });

      pageIndex = index;
    }
  }

  String getTypesByIndex(int index) {
    List<String> types = [];
    List<HomeMatchItemData> items = matchItems.skip(index * 5).toList();

    for (int i = 0; i < items.length && i < 5; i++) {
      types.add(items[i].type);
    }

    if (types.isNotEmpty) {
      return types.join(',');
    }
    return '';
  }
}

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';
import 'package:rank/src/page/main_page_controller.dart';
import 'package:get/get.dart';

/// Tab过滤
class RoomTabSexFilterWidget extends StatelessWidget {
  final double top;
  final int filterIndex;
  final List<FilterSubTab> filterList;
  final ValueChanged<int> onSexFilterChanged;

  const RoomTabSexFilterWidget(
      {super.key,
      required this.top,
      required this.filterIndex,
      required this.filterList,
      required this.onSexFilterChanged});

  static OverlayEntry? _overlayEntry;

  static void show(BuildContext context,
      {required double top,
      required int filterIndex,
      required List<FilterSubTab> filterList,
      required ValueChanged<int> onSexFilterChanged}) {
    MainPageController mainPageController = Get.find<MainPageController>();
    if (_overlayEntry != null) {
      dismiss();
      return;
    }
    mainPageController.isFilterShowing.value = true;
    OverlayState overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(builder: (context) {
      return RoomTabSexFilterWidget(
          top: top,
          filterIndex: filterIndex,
          filterList: filterList,
          onSexFilterChanged: onSexFilterChanged);
    });
    overlayState.insert(_overlayEntry!);
  }

  static void dismiss() {
    if (_overlayEntry != null) {
      MainPageController mainPageController = Get.find<MainPageController>();
      mainPageController.isFilterShowing.value = false;
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        dismiss();
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: top),
          Container(
            width: Util.width,
            height: Util.height - top,
            color: const Color(0xB3000000),
            alignment: AlignmentDirectional.topStart,
            child: UnconstrainedBox(
              child: Container(
                width: Util.width,
                height: 132.dp,
                padding: EdgeInsetsDirectional.only(top: 12.dp, bottom: 12.dp),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(16.dp)),
                  color: R.colors.homeBgColor,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: filterList
                      .mapIndexed((index, e) => _renderItem(e, index))
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderItem(FilterSubTab item, int index) {
    bool selected = index == filterIndex;
    List<Color> textColors = selected
        ? (darkMode
            ? R.dColor.mainBrandGradientColors
            : [Colors.black, Colors.black])
        : [R.colors.tipsTextColor, R.colors.tipsTextColor];
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        dismiss();
        onSexFilterChanged(index);
      },
      child: Container(
        width: Util.width,
        height: 36.dp,
        padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
        alignment: AlignmentDirectional.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GradientText(
              item.tab,
              style: const TextStyle(fontSize: 12),
              gradient: LinearGradient(colors: textColors),
            ),
            if (selected)
              Rext.autoStyleImg(Assets.rank$ic_selected_svg,
                  width: 14,
                  height: 14,
                  color: darkMode ? null : R.colors.mainTextColor),
          ],
        ),
      ),
    );
  }
}

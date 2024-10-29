import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class PopBean {
  int id;
  String title;

  PopBean(this.id, this.title);

  @override
  String toString() {
    return 'PopBean{id: $id, title: $title}';
  }
}

class BaseSelectPopDialog extends StatelessWidget {
  final GlobalKey locationKey;
  final double width;
  final double defaultMarginTop;
  final List<PopBean> list;
  final int selectedId;
  final int direction; // 0-左对齐（下边显示），1-右对齐（下边显示）

  const BaseSelectPopDialog(
      {Key? key,
      required this.list,
      required this.selectedId,
      required this.locationKey,
      this.width = 140,
      this.defaultMarginTop = 0,
      this.direction = 0})
      : super(key: key);

  static Future<PopBean?> show(BuildContext buildContext, List<PopBean> list,
      int selectedId, GlobalKey locationKey,
      {double width = 140,
      double defaultMarginTop = 0,
      int direction = 0}) async {
    return await showDialog(
      context: buildContext,
      useSafeArea: false,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (buildContext) {
        return BaseSelectPopDialog(
            list: list,
            selectedId: selectedId,
            locationKey: locationKey,
            width: width,
            defaultMarginTop: defaultMarginTop,
            direction: direction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry margin;
    AlignmentGeometry alignment;
    if (direction == 1) {
      // 1-右对齐（下边显示）
      double marginEnd = 0;
      double marginTop = defaultMarginTop;
      RenderObject? renderBox = locationKey.currentContext?.findRenderObject();
      if (renderBox != null && renderBox is RenderBox) {
        Offset paintPosition = renderBox.localToGlobal(Offset.zero);
        Size size = renderBox.size;
        marginEnd +=
            MediaQuery.of(context).size.width - (paintPosition.dx + size.width);
        marginTop += (paintPosition.dy + size.height);
      }
      margin = EdgeInsetsDirectional.only(end: marginEnd, top: marginTop);
      alignment = AlignmentDirectional.topEnd;
    } else {
      // 0-左对齐（下边显示）
      double marginStart = 0;
      double marginTop = defaultMarginTop;
      RenderObject? renderBox = locationKey.currentContext?.findRenderObject();
      if (renderBox != null && renderBox is RenderBox) {
        Offset paintPosition = renderBox.localToGlobal(Offset.zero);
        Size size = renderBox.size;
        marginStart += paintPosition.dx;
        marginTop += (paintPosition.dy + size.height);
      }
      margin = EdgeInsetsDirectional.only(start: marginStart, top: marginTop);
      alignment = AlignmentDirectional.topStart;
    }

    return Container(
      margin: margin,
      alignment: alignment,
      child: Stack(
        children: [
          Container(
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: R.color.mainBgColor,
            ),
            padding: const EdgeInsetsDirectional.only(
                start: 20, end: 20, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: list.map((e) => _buildItem(context, e)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, PopBean item) {
    bool selected = item.id == selectedId;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(item),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 10, bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                item.title,
                style: TextStyle(
                    color: selected
                        ? R.color.mainTextColor
                        : R.color.secondTextColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 20,
              height: 20,
              child: selected
                  ? R.img('ic_base_pop_selected.webp',
                      width: 20,
                      height: 20,
                      package: ComponentManager.MANAGER_BASE_CORE)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

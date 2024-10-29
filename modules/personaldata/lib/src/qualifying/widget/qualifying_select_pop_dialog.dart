import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class PopBean {
  int id;
  String title;

  PopBean(this.id, this.title);
}

class QualifyingSelectPopDialog extends StatelessWidget {
  final GlobalKey locationKey;
  final int selectedId;
  final List<PopBean> list;

  const QualifyingSelectPopDialog(
      {Key? key,
      required this.list,
      required this.locationKey,
      required this.selectedId})
      : super(key: key);

  static Future<PopBean?> show(
      BuildContext buildContext, List<PopBean> list, GlobalKey locationKey,
      {int selectedId = 0}) async {
    return await showDialog(
      context: buildContext,
      useSafeArea: false,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (buildContext) {
        return QualifyingSelectPopDialog(
            list: list, selectedId: selectedId, locationKey: locationKey);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry margin;
    AlignmentGeometry alignment;
    double marginEnd = 0;
    double marginTop = 0;
    RenderObject? renderBox = locationKey.currentContext?.findRenderObject();
    if (renderBox != null && renderBox is RenderBox) {
      Offset paintPosition = renderBox.localToGlobal(Offset.zero);
      Size size = renderBox.size;
      marginEnd +=
          MediaQuery.of(context).size.width - (paintPosition.dx + size.width);
      marginTop += paintPosition.dy;
    }
    margin = EdgeInsetsDirectional.only(end: marginEnd, top: marginTop);
    alignment = AlignmentDirectional.topEnd;

    return Container(
      margin: margin,
      alignment: alignment,
      child: Stack(
        children: [
          Container(
            width: 84,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: const Color(0xFFF6F7F9),
            ),
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
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(item),
      child: Container(
        width: 84,
        height: 36,
        alignment: AlignmentDirectional.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              item.title,
              style: TextStyle(
                  color: (item.id == selectedId)
                      ? const Color(0xFF222222)
                      : const Color(0xFF222222).withOpacity(0.5),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(width: 8),
            if (item.id == selectedId)
              CustomPaint(
                  painter: DownArrowPainter(color: const Color(0xFF202020)),
                  size: const Size(6, 3))
            else
              const SizedBox(width: 6),
          ],
        ),
      ),
    );
  }
}

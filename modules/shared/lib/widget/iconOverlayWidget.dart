import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconOverlayWidget extends StatelessWidget {
  final List<String> pathList;
  final double itemSize; //一个item大小
  final double offset; //偏移大小
  final Color? borderColor;
  final double borderWidth;
  final bool reversed;

  const IconOverlayWidget(this.pathList,
      {super.key,
      this.itemSize = 16,
      this.offset = 4,
      this.borderWidth = 1,
      this.borderColor,
      this.reversed = true});

  @override
  Widget build(BuildContext context) {
    if (pathList.isEmpty) {
      return Container();
    }

    List<PositionedDirectional> items = [];
    int index = 0;
    for (var element in pathList) {
      items.add(PositionedDirectional(
        width: itemSize,
        top: 0,
        bottom: 0,
        end: index * (itemSize - offset),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: borderColor ?? const Color(0x87FFFFFF),
                width: borderWidth),
            borderRadius: BorderRadius.circular(itemSize / 2.0),
          ),
          child: CommonAvatar(
            size: itemSize,
            shape: BoxShape.circle,
            path: element,
          ),
        ),
      ));
      index++;
    }
    if (reversed) {
      items = items.reversed.toList();
    }
    return Container(
      height: itemSize,
      width: itemSize * pathList.length - offset * (pathList.length - 1),
      alignment: AlignmentDirectional.center,
      child: Stack(
        children: items,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomNonScrollGridView extends StatelessWidget {
  final double itemHeight;
  final double itemWidth;
  final int columnCount;
  final List<Widget> children;

  const CustomNonScrollGridView(
      {super.key,
      required this.itemHeight,
      required this.itemWidth,
      required this.children,
      required this.columnCount});

  Widget _buildItem(Widget itemWidget) {
    return SizedBox(
      width: itemWidth,
      height: itemHeight,
      child: itemWidget,
    );
  }

  Widget _buildRow(List<Widget> widgets) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: widgets.map((element) => _buildItem(element)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = [];
    for (int i = 0; i < children.length; i = i + columnCount) {
      rows.add(_buildRow(children.skip(i).take(columnCount).toList()));
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: rows,
    );
  }
}

import 'package:flutter/material.dart';

typedef OnPriceSelected = Function(int index);

class HorizontalPriceSelector extends StatefulWidget {
  final OnPriceSelected? onPriceSelected;

  final int selectedIndex;

  final List<String>? tags;

  const HorizontalPriceSelector(
      {Key? key, this.onPriceSelected, this.tags, this.selectedIndex = 0})
      : super(key: key);

  @override
  _HorizontalPriceSelectorState createState() =>
      _HorizontalPriceSelectorState();
}

class _HorizontalPriceSelectorState extends State<HorizontalPriceSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsetsDirectional.only(start: 12, top: 4, bottom: 12),
      child: ListView.builder(
        itemBuilder: _buildItem,
        scrollDirection: Axis.horizontal,
        itemCount: widget.tags?.length ?? 0,
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    bool selected = widget.selectedIndex == index;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (!selected) {
          setState(() {});
          if (widget.onPriceSelected != null) {
            widget.onPriceSelected!(index);
          }
        }
      },
      child: Container(
        width: 64,
        height: 28,
        margin: const EdgeInsetsDirectional.only(end: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            border: Border.all(
                color: selected ? Colors.white : Colors.white.withOpacity(0.4),
                width: 2,
                style: BorderStyle.solid)),
        child: Center(
          child: Text(
            widget.tags?[index] ?? '',
            style: TextStyle(
                color: selected ? Colors.white : Colors.white.withOpacity(0.6),
                fontSize: 13,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

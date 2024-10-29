import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/src/model/entity/moreTabRsp.dart';

typedef OnTabItemClicked = void Function(MoreTabItem item);

class MoreTabGroup extends StatelessWidget {
  final MoreTabGroupData data;
  final OnTabItemClicked? onTabItemClicked;

  final int _itemCountPerRow = 3;
  final double _marginSide = 20.0;
  final double _spacing = 8.0;
  double? itemWidth;

  MoreTabGroup({super.key, required this.data, this.onTabItemClicked});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (data.title.isNotEmpty)
          Text(
            data.title,
            style: TextStyle(
              color: R.color.dividerColor.withOpacity(0.6),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        const SizedBox(
          height: 12,
        ),
        Wrap(
          spacing: _spacing,
          runSpacing: _spacing,
          children: _buildSubTabs(),
        ),
      ],
    );
  }

  _buildSubTabs() {
    itemWidth ??=
        (Util.width - 2 * _marginSide - (_itemCountPerRow - 1) * _spacing) /
            _itemCountPerRow;
    return data.items.map((item) {
      return GestureDetector(
        onTap: () {
          if (onTabItemClicked != null) {
            onTabItemClicked!(item);
          }
        },
        child: Container(
          height: 48,
          width: itemWidth,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8) * Util.ratio,
            color: const Color(0xFFF5F5F5),
          ),
          child: Text(
            item.tab,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13,
              color: R.color.mainTextColor.withOpacity(0.7),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }).toList();
  }
}

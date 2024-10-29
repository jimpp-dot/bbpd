import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/protobuf/generated/room_data.pb.dart';

/// 房间数据总览widget

typedef OnItemSelect = Function(TabInfo info);

class RoomDataOverview extends StatefulWidget {
  final List<TabInfo> info;
  final bool canSelectItem;
  final OnItemSelect? onItemSelect;
  final TabInfo? defaultInfo;

  const RoomDataOverview({
    super.key,
    required this.info,
    this.canSelectItem = false,
    this.onItemSelect,
    this.defaultInfo,
  });

  @override
  RoomDataOverviewState createState() => RoomDataOverviewState();
}

//index 1:进房人数 2:付费人数 3:新付费人数 4:房间流水 5：开播时间 6：新增粉丝人数
class RoomDataOverviewState extends State<RoomDataOverview> {
  TabInfo? selectInfo;
  late double itemWidth;

  @override
  void initState() {
    super.initState();
    widget.info.removeWhere((element) => !element.show);
    if (Util.validList(widget.info)) {
      selectInfo = widget.info.first;
    }
    if (widget.defaultInfo != null) {
      selectInfo = widget.defaultInfo;
    }
    if (widget.canSelectItem != true) {
      selectInfo = null;
    }
    itemWidth = (Util.width - 2 * 20 - 2 * 4 - 2 * 8) /
        3; // 20:margin, 4:padding, 8:GridView crossAxisSpacing
  }

  @override
  Widget build(BuildContext context) {
    if (widget.info.isEmpty) {
      return const SizedBox.shrink();
    }

    double height = (widget.info.length / 3).ceil() * 60.0;

    return Container(
      width: Util.width - 20 - 20,
      height: height + 1,
      color: R.color.mainBgColor,
      child: Column(
        children: [
          Container(
            width: Util.width - 20 - 20,
            height: 1,
            color: R.color.secondBgColor,
          ),
          SizedBox(
            width: Util.width - 20 - 20,
            height: height,
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              padding: const EdgeInsetsDirectional.only(
                  top: 4, bottom: 4, start: 4, end: 4),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: itemWidth / 52,
              children: _buildGrid(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildGrid() {
    List<Widget> widgets = [];

    for (int i = 0; i < widget.info.length; i++) {
      widgets.add(_buildItem(i));
    }

    return widgets;
  }

  Widget _buildItem(int index) {
    TabInfo tabInfo = widget.info[index];
    if (widget.canSelectItem == true) {
      return GestureDetector(
        onTap: () {
          if (mounted) {
            selectInfo = tabInfo;
            widget.onItemSelect?.call(tabInfo);
            setState(() {});
          }
        },
        child: _buildColumn(index),
      );
    }

    return _buildColumn(index);
  }

  Widget _buildColumn(int index) {
    TabInfo tabInfo = widget.info[index];
    String numStr = '${tabInfo.num}';
    if (tabInfo.intdex == 5) {
      double hour = tabInfo.num / 3600;
      numStr = '${hour.toStringAsFixed(1)}h';
    }
    bool selected = false;
    if (tabInfo.intdex == selectInfo?.intdex) {
      selected = true;
    }
    return Container(
      width: itemWidth,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(
            width: 1,
            color: selected ? R.color.mainBrandColor : R.color.mainBgColor),
        color: selected
            ? R.color.mainBrandColor.withOpacity(0.08)
            : R.color.mainBgColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 6),
          NumText(
            numStr,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              fontStyle: FontStyle.italic,
              color: R.color.mainTextColor,
              height: 1.2,
            ),
          ),
          Text(
            tabInfo.name,
            style: TextStyle(
              fontSize: 13,
              color: R.color.secondTextColor,
            ),
          ),
        ],
      ),
    );
  }
}

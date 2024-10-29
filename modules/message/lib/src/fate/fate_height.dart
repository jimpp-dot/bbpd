import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:shared/widget/custom_paging_scroll_physics.dart';

import '../../K.dart';

class FateHeight extends StatefulWidget {
  final void Function(int)? valueDidChange;
  final void Function() tapIgnore;

  const FateHeight({required this.tapIgnore, this.valueDidChange, Key? key})
      : super(key: key);

  @override
  State<FateHeight> createState() => _FateHeightState();
}

class _FateHeightState extends State<FateHeight>
    with SingleTickerProviderStateMixin {
  //标尺起始100，截止300
  final double start = 100;
  final double end = 300;
  final double markWidth = 2;
  final double markMarggin = 3;
  late double indicatorOffset;
  late ScrollController scrollCtr;

  Animation<double>? animation;
  bool isAnimating = false;
  double currentOffset = 180;

  @override
  void initState() {
    super.initState();

    //男性默认选中180，女性默认选中165,
    currentOffset = Session.sex == 1 ? 180 : 165;

    //中央刻度在scrolloffset为0时偏移的刻度
    indicatorOffset =
        (Util.width / 2 - markMarggin) / (markWidth + markMarggin * 2);

    //scroll需要滚动的距离
    double initOffsetX = (currentOffset - start - indicatorOffset) *
        (markWidth + markMarggin * 2);
    scrollCtr = ScrollController(initialScrollOffset: initOffsetX);

    scrollCtr.addListener(() {
      setState(() {
        //滚动后的刻度
        currentOffset =
            (scrollCtr.offset - markMarggin) / (markWidth + markMarggin * 2) +
                start +
                indicatorOffset;
        if (widget.valueDidChange != null) {
          widget.valueDidChange!(currentOffset.ceil());
        }
      });
    });

    if (widget.valueDidChange != null) {
      widget.valueDidChange!(currentOffset.ceil());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              K.message_fate_extinfo_title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              K.message_fate_extinfo_desc,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            const SizedBox(height: 42),
            Text(
              K.message_fate_extinfo_height,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: Util.width,
              height: 126,
              child: Stack(
                children: [
                  ListView.builder(
                    itemBuilder: ((context, index) {
                      return Container(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: markMarggin, right: markMarggin, top: 70),
                          child: Container(
                            color: Colors.white,
                            child: SizedBox(
                              width: markWidth,
                              height: index % 10 == 0 ? 34 : 20,
                            ),
                          ),
                        ),
                      );
                    }),
                    itemCount: 201,
                    itemExtent: markWidth + markMarggin * 2,
                    scrollDirection: Axis.horizontal,
                    controller: scrollCtr,
                    physics: CustomPagingScrollPhysics(
                        itemDimension: markWidth + markMarggin * 2,
                        parent: const ClampingScrollPhysics()),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 6, right: 6, top: 68),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF776FFE),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: const SizedBox(
                          width: 4,
                          height: 48,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text(
              currentOffset.round().toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.w400),
            ),
            const Expanded(
              child: SizedBox.shrink(),
            ),
          ],
        ),
        PositionedDirectional(
            top: 10,
            end: 12,
            child: GestureDetector(
              onTap: widget.tapIgnore,
              child: Container(
                height: 28,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color(0x4DFFFFFF),
                    borderRadius: BorderRadius.circular(14),
                    border:
                        Border.all(color: const Color(0x80FFFFFF), width: 0.5)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    K.msg_next_time,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}

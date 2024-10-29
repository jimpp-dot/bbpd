import 'package:shared/shared.dart';
import 'package:shared/widget/custom_paging_scroll_physics.dart';
import 'package:flutter/material.dart';

import '../../K.dart';

class SingleSelectionRes {
  final String? errorMsg;
  final List<SingleSelectionItem>? selections;

  const SingleSelectionRes(this.errorMsg, this.selections);
}

class SingleSelectionItem {
  final int id;
  final String name;

  const SingleSelectionItem(this.id, this.name);

  static List<SingleSelectionItem> ducationSelections() {
    List<String> eduList = ConversationUserInfoApi.getEducationSelections();
    List<SingleSelectionItem> list = [];
    for (var i = 1; i <= 6; i++) {
      SingleSelectionItem item = SingleSelectionItem(i, eduList[i - 1]);
      list.add(item);
    }
    return list;
  }
}

class FateSingleSelection extends StatefulWidget {
  final String title;
  final void Function(SingleSelectionItem)? valueDidChange;
  final void Function() tapIgnore;
  final Future<SingleSelectionRes> Function()? loadData;

  const FateSingleSelection(this.title, this.tapIgnore,
      {this.loadData, this.valueDidChange, Key? key})
      : super(key: key);

  @override
  State<FateSingleSelection> createState() => _FateSingleSelectionState();
}

class _FateSingleSelectionState extends State<FateSingleSelection> {
  bool loading = true;
  final double itemHeight = 56;
  ScrollController? scrollCtr;
  late int showCount;
  late int placeholderCount = 0;
  SingleSelectionRes? res;
  List<SingleSelectionItem>? items;

  SingleSelectionItem? get selectedItem {
    if (!Util.validList(items)) {
      return null;
    }

    int index = (scrollCtr!.offset / itemHeight).round();
    return items![index];
  }

  void _refreshData() async {
    setState(() {
      loading = true;
    });

    res = await widget.loadData!();
    if (res!.errorMsg == null && Util.validList(res!.selections)) {
      items = res!.selections;
      if (widget.valueDidChange != null) {
        widget.valueDidChange!(items!.first);
      }
    }

    if (mounted) {
      setState(() {
        loading = false;

        //滚动到初始化的值
        double initOffset = 0;
        scrollCtr = ScrollController(initialScrollOffset: initOffset);
        scrollCtr!.addListener(() {
          if (widget.valueDidChange != null && selectedItem != null) {
            widget.valueDidChange!(selectedItem!);
          }
          setState(() {});
        });
      });
    }
    // refresh(() {

    // });
  }

  @override
  void initState() {
    super.initState();

    //同时可显示几行
    showCount = ((Util.height - 290 - 220) / itemHeight).truncate();
    if (showCount % 2 == 0) {
      showCount--;
    }
    //上下占位行
    placeholderCount = ((showCount - 1) / 2).truncate();

    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    Widget? infoWidget;
    if (loading) {
      infoWidget = const Loading();
    } else if (!Util.validList(items)) {
      infoWidget = ErrorData(
          error: res?.errorMsg ?? K.msg_something_wrong,
          fontColor: R.colors.secondTextColor,
          onTap: () => _refreshData());
    }

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
            const SizedBox(height: 12),
            Text(
              K.message_fate_extinfo_desc,
              style:
                  TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 12),
            ),
            const SizedBox(height: 42),
            Text(
              widget.title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 12,
            ),
            if (infoWidget != null) infoWidget,
            if (infoWidget == null)
              SizedBox(
                  width: Util.width,
                  height: itemHeight * showCount,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 200,
                        height: itemHeight,
                        decoration: BoxDecoration(
                            color: const Color(0xFF7770FE),
                            borderRadius: BorderRadius.circular(6)),
                      ),
                      ShaderMask(
                        shaderCallback: (bounds) {
                          return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [
                                0,
                                0.3,
                                0.6,
                                1.0
                              ],
                              colors: [
                                Color.fromRGBO(0, 0, 0, 0),
                                Color.fromRGBO(0, 0, 0, 1),
                                Color.fromRGBO(0, 0, 0, 1),
                                Color.fromRGBO(0, 0, 0, 0)
                              ]).createShader(
                              Rect.fromLTRB(0, 0, bounds.width, bounds.height));
                        },
                        blendMode: BlendMode.dstIn,
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          removeBottom: true,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              if (index < placeholderCount ||
                                  index >= (items!.length + placeholderCount)) {
                                return SizedBox(height: itemHeight);
                              }

                              SingleSelectionItem item =
                                  items![index - placeholderCount];
                              return SizedBox(
                                height: itemHeight,
                                child: Center(
                                  child: Text(
                                    item.name,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              );
                            },
                            itemCount: items!.length + placeholderCount * 2,
                            itemExtent: itemHeight,
                            controller: scrollCtr,
                            physics: CustomPagingScrollPhysics(
                                itemDimension: itemHeight,
                                parent: const ClampingScrollPhysics()),
                          ),
                        ),
                      )
                    ],
                  )),
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
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    '下次再说',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )),
      ],
    );
  }
}

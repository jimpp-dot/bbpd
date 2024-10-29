// ignore_for_file: import_of_legacy_library_into_null_safe
import 'dart:math';

import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/shared.dart';
import 'package:shared/widget/custom_paging_scroll_physics.dart';
import 'package:flutter/material.dart';

import '../../K.dart';
import '../../assets.dart';

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

class ImageModifySingleSelectionScreen extends StatefulWidget {
  final String? initItemName;
  final String? title;
  final Future<SingleSelectionRes> Function()? loadData;
  final void Function(SingleSelectionItem item)? tapSave;

  const ImageModifySingleSelectionScreen(
      {this.initItemName, this.title, this.loadData, this.tapSave, Key? key})
      : super(key: key);

  static Future show(BuildContext context,
      {String? selectedItemName,
      String? title,
      Future<SingleSelectionRes> Function()? loadDataFunc,
      void Function(SingleSelectionItem item)? clickSave}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ImageModifySingleSelectionScreen(
          initItemName: selectedItemName,
          title: title,
          loadData: loadDataFunc,
          tapSave: clickSave),
      settings: const RouteSettings(name: '/imageModify/single_selection'),
    ));
  }

  @override
  State<ImageModifySingleSelectionScreen> createState() =>
      _ImageModifySingleSelectionScreenState();
}

class _ImageModifySingleSelectionScreenState
    extends State<ImageModifySingleSelectionScreen> {
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
    refresh(() {
      loading = true;
    });

    res = await widget.loadData!();
    if (res!.errorMsg == null && Util.validList(res!.selections)) {
      items = res!.selections;
    }

    refresh(() {
      loading = false;

      //滚动到初始化的值
      double initOffset = 0;
      if (Util.validList(items) && widget.initItemName != null) {
        for (var element in items!) {
          if (element.name == widget.initItemName!) {
            initOffset = items!.indexOf(element) * itemHeight;
            break;
          }
        }
      }
      scrollCtr = ScrollController(initialScrollOffset: initOffset);
      scrollCtr!.addListener(() {
        refresh(() {});
      });
    });
    // refresh(() {

    // });
  }

  @override
  void initState() {
    super.initState();

    //同时可显示几行
    showCount = ((Util.height - 340 - (Util.isIphoneX ? 30 : 0)) / itemHeight)
        .truncate();
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
          error: res?.errorMsg ?? K.server_error, onTap: () => _refreshData());
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // CachedNetworkImage(
          //   imageUrl:
          //       'static/hisong/personaldata/hisong_personal_ext_info_bg.webp',
          //   fit: BoxFit.cover,
          // ),
          R.img(
            Assets.personaldata$nomal_bg_bg,
            width:  Util.width,
            height: Util.height,
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Util.statusHeight + kToolbarHeight,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                K.personal_info_height_input_tips,
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
              const SizedBox(
                height: 72,
              ),
              Text(
                widget.title ?? K.personal_info_industry_title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w500),
              ),
              if (infoWidget != null)
                Expanded(child: Center(child: infoWidget)),
              if (infoWidget == null)
                Expanded(
                    child: Center(
                  child: SizedBox(
                      width: Util.width,
                      height: itemHeight * showCount,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 200,
                            height: itemHeight,
                            decoration: BoxDecoration(
                                color: const Color(0x4DFFFFFF),
                                border:
                                    Border.all(width: 0.5, color: Colors.white),
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
                                  ]).createShader(Rect.fromLTRB(
                                  0, 0, bounds.width, bounds.height));
                            },
                            blendMode: BlendMode.dstIn,
                            child: MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              removeBottom: true,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  if (index < placeholderCount ||
                                      index >=
                                          (items!.length + placeholderCount)) {
                                    return SizedBox(height: itemHeight);
                                  }

                                  SingleSelectionItem item =
                                      items![index - placeholderCount];
                                  return SizedBox(
                                    height: itemHeight,
                                    child: Center(
                                      child: Text(
                                        item.name,
                                        style: TextStyle(
                                            color: item == selectedItem!
                                                ? R.colors.mainBrandColor
                                                : Colors.white,
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
                )),
              Padding(
                padding: EdgeInsets.only(bottom: Util.isIphoneX ? 87 : 34),
                child: Material(
                  color: Colors.transparent,
                  child: Ink(
                    width: min(Util.width - 40, 335),
                    height: 52,
                    decoration: commonBoxDecorationWithParams(R.colors.darkGradientColors, 26),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(26),
                      child: Center(
                        child: Text(
                          K.sure,
                          style:  TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      onTap: () {
                        if (widget.tapSave != null) {
                          widget.tapSave!(selectedItem!);
                        }
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
          PositionedDirectional(
            start: 0,
            end: 0,
            top: 0,
            child: BaseAppBar.custom(
              statusBrightness: Brightness.dark,
              backgroundColor: Colors.transparent,
              leading: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: kToolbarHeight,
                  height: kToolbarHeight,
                  alignment: AlignmentDirectional.centerStart,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 20),
                    child: R.img(
                      'ic_titlebar_back.svg',
                      color: Colors.white,
                      width: 24,
                      height: 24,
                      package: ComponentManager.MANAGER_BASE_CORE,
                    ),
                  ),
                ),
              ),
              title: Text(
                K.personal_info,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

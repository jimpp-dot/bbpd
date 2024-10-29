// ignore_for_file: import_of_legacy_library_into_null_safe
import 'dart:math';

import 'package:shared/dart_extensions/extensions_common.dart';
import 'package:shared/shared.dart';
import 'package:shared/widget/custom_paging_scroll_physics.dart';
import 'package:flutter/material.dart';

import '../../K.dart';
import '../../assets.dart';

class ImageModifyHeightScreen extends StatefulWidget {
  final double? initHeight;
  final void Function(int)? tapSave;
  const ImageModifyHeightScreen({this.initHeight, this.tapSave, Key? key})
      : super(key: key);

  static Future show(BuildContext context,
      {double? height, void Function(int)? clickSave}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>
          ImageModifyHeightScreen(initHeight: height, tapSave: clickSave),
      settings: const RouteSettings(name: '/imageModify/height'),
    ));
  }

  @override
  State<ImageModifyHeightScreen> createState() =>
      _ImageModifyHeightScreenState();
}

class _ImageModifyHeightScreenState extends State<ImageModifyHeightScreen>
    with SingleTickerProviderStateMixin {
  //标尺起始100，截止300
  final double start = 100;
  final double end = 300;
  final double markWidth = 2;
  final double markMarggin = 3;
  late double screenDiff;
  late double indicatorOffset;
  late ScrollController scrollCtr;

  Animation<double>? animation;
  bool isAnimating = false;
  double currentOffset = 180;

  @override
  void initState() {
    super.initState();

    //男性默认选中180，女性默认选中165,
    currentOffset = widget.initHeight ?? (Session.sex == 1 ? 180 : 165);

    //中央刻度需要偏移才能和标尺重合的位移
    screenDiff = (Util.width / 2 - markMarggin) % (markWidth + markMarggin * 2);

    //中央刻度在scrolloffset为0时偏移的刻度
    indicatorOffset = (Util.width / 2 - markMarggin - screenDiff) /
        (markWidth + markMarggin * 2);

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
      });
    });
  }

  // void adjustOffsetIfNeeded() {
  //   if (isAnimating) {
  //     return;
  //   }
  //   //不足一个刻度的偏移
  //   double space = scrollCtr.offset - markMarggin % (markWidth + markMarggin * 2);
  //   if (space < 0.1) {
  //     return;
  //   }

  //   isAnimating = true;

  //   AnimationController controller = AnimationController(
  //     duration: const Duration(seconds: 3),
  //     vsync: this,
  //   );
  //   animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
  //   animation?.addStatusListener(((status) {
  //     if (status == AnimationStatus.completed) {
  //       isAnimating = false;
  //     }
  //   }));
  //   animation = Tween(begin: scrollCtr.offset, end: scrollCtr.offset + space * (markWidth + markMarggin * 2)).animate(animation!)
  //     ..addListener(() {
  //       refresh();
  //     });
  //   //启动动画
  //   controller.forward();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [

          R.img(
            Assets.personaldata$nomal_bg_bg,
            width:  Util.width,
            height: Util.height,
            fit: BoxFit.cover,
          ),

          // CachedNetworkImage(
          //   imageUrl:
          //       'static/hisong/personaldata/hisong_personal_ext_info_bg.webp',
          //   fit: BoxFit.cover,
          // ),
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
                height: 92,
              ),
              Text(
                K.personal_height,
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
                        padding: EdgeInsets.only(
                            right: screenDiff == 0 ? 0 : screenDiff + 1,
                            top: 68),
                        child: Container(
                          decoration: commonBoxDecorationWithParams(R.colors.mainBrandGradientColors, 2),
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
                    fontWeight: FontWeight.w500),
              ),
              const Expanded(
                child: SizedBox.shrink(),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: Util.isIphoneX ? 87 : 54),
                child: Material(
                  color: Colors.transparent,
                  child: Ink(
                    width: min(Util.width - 40, 335),
                    height: 52,
                    decoration: commonBoxDecorationWithParams(R.colors.darkGradientColors, 26),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(26),
                      onTap: (() {
                        if (widget.tapSave != null) {
                          widget.tapSave!(currentOffset.ceil());
                        }
                      }),
                      child: Center(
                        child: Text(
                          K.sure,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
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

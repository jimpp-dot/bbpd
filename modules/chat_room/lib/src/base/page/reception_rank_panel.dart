import 'package:shared/shared.dart';
import 'package:chat_room/src/base/page/reception_rank_sub_page.dart';
import 'package:flutter/material.dart';

import '../../../assets.dart';
import '../../../k.dart';

class ReceptionRankPanel extends StatefulWidget {
  const ReceptionRankPanel({super.key});

  @override
  State<StatefulWidget> createState() => ReceptionRankPanelState();

  static Future<void> show(BuildContext context) {
    return displayModalBottomSheet(
      context: context,
      disableTapDismissible: true,
      maxHeightRatio: 0.8,
      defineBarrierColor: Colors.transparent,
      builder: (context) => const ReceptionRankPanel(),
    );
  }
}

class ReceptionRankPanelState extends State<ReceptionRankPanel>
    with TickerProviderStateMixin<ReceptionRankPanel> {
  final List<String> _tabs = [
    K.room_fans_group_this_week,
    K.room_fans_group_last_week
  ];
  late final PageController _pageController;
  int _currIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    double height = Util.width * 604 / 375;
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        PositionedDirectional(
            width: Util.width,
            bottom: 0,
            child: R.img(RoomAssets.chat_room$reception_rank_bg_webp,
                width: Util.width, height: height, fit: BoxFit.fitWidth)),
        PositionedDirectional(
          width: Util.width,
          bottom: height * 0.73,
          child: Container(
              padding:
                  const EdgeInsetsDirectional.only(start: 16, end: 16, top: 16),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GradientText(K.room_reception_rank,
                        style: Util.youSheBiaoTiYuan.copyWith(
                            color: const Color(0xFFFEE4BC), fontSize: 34),
                        gradient: const LinearGradient(
                            colors: [Color(0xFFFEF0D6), Color(0xFFFEE4BC)])),
                    Text(K.room_reception_rank_sub_title_1,
                        style: TextStyle(
                            color: const Color(0xFFFEF0D6).withOpacity(0.5),
                            fontSize: 10,
                            fontWeight: FontWeight.normal)),
                    const SizedBox(height: 12),
                    Text(K.room_reception_rank_sub_title_2,
                        style: const TextStyle(
                            color: Color(0xFFFEF0D6),
                            fontSize: 10,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 13),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [..._buildTabs()]),
                  ])),
        ),
        PositionedDirectional(
            height: height * 0.74,
            width: Util.width,
            bottom: 0,
            child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  _currIndex = index;
                  refresh();
                },
                children: _buildPageViews())),
      ],
    );
  }

  List<Widget> _buildTabs() {
    List<Widget> list = [];
    for (int i = 0; i < _tabs.length; i++) {
      list.add(_buildTabItem(_tabs[i], i));
      if (i != _tabs.length - 1) {
        list.add(const SizedBox(width: 10));
      }
    }
    return list;
  }

  Widget _buildTabItem(String title, int index) {
    bool isSelected = _currIndex == index;
    return GestureDetector(
        onTap: () {
          if (_currIndex != index) {
            _currIndex = index;
            refresh();
            _pageController.jumpToPage(index);
          }
        },
        child: SizedBox(
          height: 41,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                width: 90,
                height: 36,
                decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFFFFCB82)
                        : Colors.white.withOpacity(0.16),
                    borderRadius: BorderRadius.circular(10)),
                alignment: AlignmentDirectional.center,
                child: Text(title,
                    style: TextStyle(
                        color: isSelected
                            ? const Color(0xFF120C04)
                            : const Color(0xFFFEF0D6),
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
              PositionedDirectional(
                  top: 35,
                  height: 6,
                  child: isSelected
                      ? R.img(RoomAssets.chat_room$ic_arrow_webp, height: 6)
                      : const SizedBox(height: 6)),
            ],
          ),
        ));
  }

  List<Widget> _buildPageViews() {
    List<Widget> list = [];
    for (int i = 0; i < _tabs.length; i++) {
      list.add(ReceptionRankSubPage(
        rankType: i,
      ));
    }
    return list;
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}

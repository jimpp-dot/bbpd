import 'package:moment/k.dart';
import 'dart:math' as math;
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moment/assets.dart';
import 'package:get/get.dart';
import 'package:moment/moment.dart';
import 'package:moment/src/page/moment_detail_screen.dart';

import 'moment_week_statistic_item.dart';

/// 广场一周情报统计局
class MomentWeekStatisticPage extends StatefulWidget {
  const MomentWeekStatisticPage({super.key});

  static Future launch(BuildContext context) async {
    return Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const MomentWeekStatisticPage();
    }));
  }

  @override
  State<MomentWeekStatisticPage> createState() =>
      _MomentWeekStatisticPageState();
}

class _MomentWeekStatisticPageState extends State<MomentWeekStatisticPage>
    with BaseScreenStateMixin, SingleTickerProviderStateMixin {
  GetWeekInfoData? _data;

  final List<List<GetWeekInfoData_CircleWeekItem>> _tabDataList = [];

  final RxInt _currentTab = 0.obs;

  final List<String> _tabList = [];
  TabController? _tabController;

  @override
  void initState() {
    super.initState();

    _load();
  }

  Future _load() async {
    RespGetWeekInfo dataResp = await Api.getWeekInfo();
    Log.d('MomentWeekStatisticPage dataResp=${dataResp.toProto3Json()}');
    if (!mounted) return;
    if (dataResp.success) {
      GetWeekInfoData data = dataResp.data;
      if (data.popularityTop.isNotEmpty) {
        _tabList.add(
            '${K.moment_week_statistic_tab_popularity}${data.popularityTop.length}');
        _tabDataList.add(data.popularityTop);
      }
      if (data.fansTop.isNotEmpty) {
        _tabList
            .add('${K.moment_week_statistic_tab_fans}${data.fansTop.length}');
        _tabDataList.add(data.fansTop);
      }
      if (data.influenceTop.isNotEmpty) {
        _tabList.add(
            '${K.moment_week_statistic_tab_influence}${data.influenceTop.length}');
        _tabDataList.add(data.influenceTop);
      }
      if (_tabList.isNotEmpty) {
        _tabController = TabController(length: _tabList.length, vsync: this);
      }
      _data = data;
      if (_tabList.isEmpty) {
        setScreenEmpty();
      } else {
        setScreenReady();
      }
    } else {
      setScreenError(errorMsg: dataResp.msg);
    }
  }

  @override
  void onTapErrorWidget() {
    super.onTapErrorWidget();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Stack(
          children: [
            _renderBg(),
            buildStatusContent(),
            PositionedDirectional(
              top: Util.statusHeight,
              start: 8.dp,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 8.dp, end: 8.dp, top: 1.dp, bottom: 1.dp),
                  child: R.img(
                    Assets.moment$statistic_ic_back_webp,
                    width: 30.dp,
                    height: 30.dp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderBg() {
    double itemHeight = 54.dp;
    int count = Util.height ~/ itemHeight;
    return SizedBox(
      width: Util.width,
      height: Util.height,
      child: Column(
        children: [
          ...List.generate(
            count,
            (index) => R.img(
              Assets.moment$statistic_bg_fragment_webp,
              width: Util.width,
              height: itemHeight,
            ),
          ),
          R.img(Assets.moment$statistic_bg_fragment_webp,
              width: Util.width,
              height: Util.height - itemHeight * count,
              fit: BoxFit.fitWidth),
        ],
      ),
    );
  }

  Widget _renderHead() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(children: [
          R.img(
            Assets.moment$statistic_bg_head_webp,
            width: Util.width,
            height: 488.dp,
          ),
          _renderTime(),
        ]),
        Container(
          width: Util.width,
          height: 264.dp,
          padding:
              EdgeInsetsDirectional.only(start: 35.dp, end: 35.dp, top: 80.dp),
          alignment: AlignmentDirectional.topCenter,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage(Assets.moment$statistic_bg_week_content_info_webp),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ColoredBox(
                  color: const Color(0xFFAEFF17),
                  child: Text(
                    _data!.pop.title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.dp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 2.dp),
                _renderDesc(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget buildContent() {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverToBoxAdapter(
            child: _renderHead(),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: Util.width,
              height: 40.dp,
              margin: EdgeInsetsDirectional.only(top: 12.dp),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _tabList.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsetsDirectional.only(start: 11.dp, end: 10.dp),
                itemBuilder: (BuildContext context, int index) {
                  return _renderTab(index);
                },
              ),
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: _tabList
            .mapIndexed(
              (index, e) => NestedScrollViewInnerScrollPositionKeyWidget(
                ValueKey('tab_$index'),
                _renderTabList(index),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _renderTime() {
    return PositionedDirectional(
      start: 88.dp,
      top: 245.dp,
      child: Transform.rotate(
        angle: -math.pi / 12.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _data!.weekStar,
              style: TextStyle(
                  height: 1,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 12.dp),
            ),
            Transform.rotate(
              angle: -math.pi / 6,
              child: Text(
                '-',
                style: TextStyle(
                    height: 1.2,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 12.dp),
              ),
            ),
            Text(
              _data!.weekEnd,
              style: TextStyle(
                  height: 1,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 12.dp),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderDesc() {
    TextSpan parseSpan(ContentZone item) {
      TextStyle style = TextStyle(
          color: Util.parseColor(item.color, Colors.black),
          fontSize: 14.dp,
          fontWeight: item.isBold ? FontWeight.w600 : null);
      String text = item.content;
      if (item.wordsLimit > 0 && item.content.length > item.wordsLimit) {
        text = '${text.safeSubstring(0, item.wordsLimit)}... ';
      }
      return TextSpan(text: text.toCharacterBreakStr(), style: style);
    }

    List<InlineSpan> spans =
        _data!.pop.content.map((e) => parseSpan(e)).toList();
    return Text.rich(
      TextSpan(children: spans),
      textAlign: TextAlign.center,
    );
  }

  Widget _renderTab(int index) {
    return Obx(() {
      bool selected = _currentTab.value == index;
      return GestureDetector(
        onTap: () {
          if (selected) return;
          _currentTab.value = index;
          _tabController?.animateTo(index);
        },
        child: Container(
          width: 108.dp,
          height: 40.dp,
          padding: EdgeInsetsDirectional.only(bottom: 3.dp),
          margin: EdgeInsetsDirectional.only(start: 5.dp, end: 5.dp),
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(selected
                  ? Assets.moment$statistic_bg_tab_selected_webp
                  : Assets.moment$statistic_bg_tab_default_webp),
            ),
          ),
          child: Text(
            _tabList[index],
            style: TextStyle(
                color: selected ? Colors.white : Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.w600,
                fontSize: 12.dp),
          ),
        ),
      );
    });
  }

  Widget _renderTabList(int tabIndex) {
    return NestedScrollViewInnerScrollPositionKeyWidget(
      ValueKey('tab_$tabIndex'),
      ListView.builder(
        shrinkWrap: true,
        padding:
            EdgeInsetsDirectional.only(top: 10.dp, bottom: Util.bottomMargin),
        physics: const ClampingScrollPhysics(),
        itemCount: _tabDataList[tabIndex].length,
        itemBuilder: (context, index) {
          GetWeekInfoData_CircleWeekItem item = _tabDataList[tabIndex][index];
          return Padding(
            padding: EdgeInsetsDirectional.only(
              bottom: 28.dp,
              start: 15.dp,
              end: 16.dp,
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                MomentDetailScreen.openMomentDetailScreen(context,
                    topicId: item.item.topicId.toInt(),
                    tUid: item.item.user.uid,
                    parentPage: MomentFlowPage.weekStatistic);
              },
              child: MomentWeekStatisticItem(
                index,
                item,
              ),
            ),
          );
        },
      ),
    );
  }
}

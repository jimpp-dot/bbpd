import 'dart:math';

import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../K.dart';
import '../../../assets.dart';
import '../../api/gift_wall_api.dart';
import '../widget/gift_task_view.dart';

class GiftWallTaskPanel extends StatefulWidget {
  final int initialIndex;
  final String? type; // 送礼 or 收礼
  final List<SeriesMeta>? seriesList;
  final Map<int, GiftBookRuleInfo>? ruleInfoMap;

  const GiftWallTaskPanel(
      {Key? key,
      this.initialIndex = 0,
      this.type,
      this.seriesList,
      this.ruleInfoMap})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => GiftWallTaskPanelState();

  static Future<void> show(BuildContext context, int initialIndex, String type,
      List<SeriesMeta> seriesList, Map<int, GiftBookRuleInfo> ruleInfoMap) {
    return displayModalBottomSheet(
      context: context,
      disableTapDismissible: true,
      maxHeightRatio: 0.7,
      defineBarrierColor: Colors.transparent,
      builder: (context) {
        return GiftWallTaskPanel(
            initialIndex: initialIndex,
            type: type,
            seriesList: seriesList,
            ruleInfoMap: ruleInfoMap);
      },
    );
  }
}

class GiftWallTaskPanelState extends State<GiftWallTaskPanel>
    with TickerProviderStateMixin<GiftWallTaskPanel> {
  final List<String> _tabs = [];
  late ExtendedTabController _tabController;
  AwakeTaskRsp? rsp;
  final String _tag = "GiftWallTaskPanel";
  int seriesIndex = 0;
  int levelIndex = 0;
  int lastClickTime = 0;
  int screenState = 0; // 0，无数据，1，success，2，error

  @override
  void initState() {
    super.initState();
    seriesIndex = widget.initialIndex;
    _load();
  }

  _load() async {
    rsp = await GiftWallApi.getAwakeTask(Session.uid, widget.type ?? '',
        widget.seriesList?[seriesIndex].typ ?? '');
    _tabs.clear();
    if (rsp!.success) {
      for (var element in rsp!.data.levelTaskList) {
        _tabs.add("${element.level}");
      }
      screenState = 1;
    } else {
      screenState = 2;
    }
    int initIndex = 0;
    if (rsp!.data.levelTaskList.isNotEmpty) {
      for (int i = 1; i < _tabs.length; i++) {
        if (rsp!.data.awakeNum < rsp!.data.levelTaskList[i - 1].awakeNum) {
          continue;
        }
        initIndex = i;
      }
    }
    _tabController = ExtendedTabController(
        initialIndex: initIndex, length: _tabs.length, vsync: this);
    _tabController.removeListener(_onTabChanged);
    _tabController.addListener(_onTabChanged);
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        R.img(Assets.personaldata$gift_wall_task_panel_bg_webp,
            width: Util.width, fit: BoxFit.fitWidth),
        PositionedDirectional(
            width: Util.width,
            height: 540.dp,
            top: 105.dp,
            child: Column(children: [
              _buildSwitch(),
              Expanded(child: _buildContent()),
            ])),
      ],
    );
  }

  Widget _buildContent() {
    if (screenState == 1 &&
        widget.seriesList?[seriesIndex].typ != "all" &&
        rsp?.data.levelTaskList.isNotEmpty == true) {
      return Column(
        children: [
          SizedBox(height: 15.dp),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Expanded(
              flex: 1,
              child: CommonTabBar(
                  controller: _tabController,
                  isScrollable: true,
                  labelColor: R.color.mainTextColor,
                  unselectedLabelColor: R.color.thirdTextColor,
                  labelStyle: R.textStyle.medium16
                      .copyWith(fontWeight: FontWeight.bold),
                  unselectedLabelStyle: R.textStyle.medium16.copyWith(
                      color: R.color.thirdTextColor,
                      fontWeight: FontWeight.normal),
                  indicator: const CommonUnderlineTabIndicator(
                      borderSide: BorderSide(width: 4, color: Colors.white)),
                  tabs: _buildTabs()),
            )
          ]),
          SizedBox(height: 15.dp),
          Expanded(
              flex: 1,
              child: TabBarView(
                  controller: _tabController, children: _buildTabViews())),
        ],
      );
    } else if (screenState == 1 &&
        widget.seriesList?[seriesIndex].typ == "all") {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          R.img(Assets.personaldata$gift_wall_task_ic_series_all_webp,
              width: 140),
          Text(
            K.gift_wall_task_tips,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          )
        ],
      );
    } else if (screenState == 2 ||
        screenState == 1 &&
            widget.seriesList?[seriesIndex].typ != "all" &&
            rsp?.data.levelTaskList.isEmpty == true) {
      return Padding(
        padding:
            EdgeInsetsDirectional.only(start: 16.dp, end: 16.dp, top: 52.dp),
        child: Column(children: [
          R.img(Assets.personaldata$gift_wall_task_task_state_empty_webp)
        ]),
      );
    }
    return const SizedBox.shrink();
  }

  List<Widget> _buildTabs() {
    List<Widget> list = [];
    for (int i = 0; i < _tabs.length; i++) {
      bool locked = true;
      if (i == 0 ||
          (rsp?.data.awakeNum ?? 0) >=
              (rsp?.data.levelTaskList[i - 1].awakeNum ?? 0)) {
        locked = false;
      }
      list.add(_buildTabItem(_tabs[i], locked));
    }
    return list;
  }

  List<Widget> _buildTabViews() {
    List<Widget> list = [];
    for (int i = 0; i < _tabs.length; i++) {
      bool locked = true;
      if (i == 0 ||
          (rsp?.data.awakeNum ?? 0) >=
              (rsp?.data.levelTaskList[i - 1].awakeNum ?? 0)) {
        locked = false;
      }
      list.add(GiftTaskView(
          key: GlobalKey(),
          type: widget.type ?? '',
          seriesType: widget.seriesList?[seriesIndex].typ ?? '',
          levelIndex: i,
          isTaskLocked: locked,
          ruleInfoMap: widget.ruleInfoMap,
          data: rsp?.data));
    }
    return list;
  }

  Widget _buildSwitch() {
    return Container(
        width: Util.width,
        height: 34.dp,
        padding: EdgeInsetsDirectional.only(start: 16.dp, end: 12.dp),
        child: Stack(
          alignment: AlignmentDirectional.centerEnd,
          children: [
            PositionedDirectional(
                end: 60.dp,
                child: Container(
                  height: 34.dp,
                  width: 228.5.dp,
                  padding: EdgeInsetsDirectional.only(start: 3.dp, end: 3.dp),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(17.dp)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _switchSeries(true);
                        },
                        child: R.img(
                            Assets.personaldata$gift_wall_task_ic_switch_webp,
                            width: 28.dp),
                      ),
                      Expanded(
                          flex: 1,
                          child: Text(
                              widget.seriesList?[seriesIndex].name ??
                                  K.gift_wall_series_title,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  height: 1.1))),
                      GestureDetector(
                        onTap: () {
                          _switchSeries(false);
                        },
                        child: Transform.rotate(
                            angle: pi,
                            child: R.img(
                                Assets
                                    .personaldata$gift_wall_task_ic_switch_webp,
                                width: 28.dp)),
                      ),
                    ],
                  ),
                )),
            PositionedDirectional(
              child: GestureDetector(
                  child: R.img(BaseAssets.shared$ic_close_a_svg,
                      width: 24.dp, height: 24.dp),
                  onTap: () {
                    Navigator.pop(context);
                  }),
            ),
          ],
        ));
  }

  Widget _buildTabItem(String name, bool locked) {
    return Padding(
        padding: EdgeInsetsDirectional.only(bottom: 5.dp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (locked) ...[
              R.img(Assets.personaldata$gift_wall_task_ic_lock_webp,
                  width: 12.dp, color: Colors.white.withOpacity(0.7)),
              SizedBox(
                width: 2.dp,
              )
            ],
            Text(
              "Lv.$name",
              style: TextStyle(
                  color: locked ? Colors.white.withOpacity(0.7) : Colors.white,
                  fontSize: 16,
                  fontFamily: Util.numFontFamily,
                  package: ComponentManager.MANAGER_BASE_CORE),
            ),
          ],
        ));
  }

  _switchSeries(bool pre) {
    if (DateTime.now().millisecondsSinceEpoch - lastClickTime <= 500) {
      return;
    }
    lastClickTime = DateTime.now().millisecondsSinceEpoch;
    if ((widget.seriesList?.length ?? 0) > 0) {
      if (pre) {
        seriesIndex = seriesIndex - 1;
        if (seriesIndex < 0) {
          seriesIndex = widget.seriesList!.length - 1;
        }
      } else {
        seriesIndex = (seriesIndex + 1) % widget.seriesList!.length;
      }
    }
    _load();
    eventCenter.emit(EventConstant.EventHandBookSwitch, pre);
  }

  _onTabChanged() {
    Log.d(tag: _tag, "onTabChanged,current:${_tabController.index}");
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.removeListener(_onTabChanged);
  }
}

import 'dart:collection';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:moment/k.dart';
import 'package:moment/moment.dart';
import 'package:moment/src/api/topic_api.dart';
import 'package:moment/src/model/topic_bean.dart';
import 'package:moment/src/page/topic_detail_screen.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../assets.dart';

class TopicSquareTab {
  static const String Follow = 'follow'; // 关注
  static const String Recommend = 'rcmd'; // 推荐
}

/// 话题广场页面
class TopicSquarePage extends StatefulWidget {
  final String? tab;

  const TopicSquarePage({super.key, this.tab});

  static Future openTopicSquareScreen(BuildContext context,
      {Key? key, String? tab}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        settings: const RouteSettings(name: '/openTopicSquareScreen'),
        builder: (context) {
          return TopicSquarePage(
            key: key,
            tab: tab,
          );
        },
      ),
    );
  }

  @override
  _TopicSquarePageState createState() => _TopicSquarePageState();
}

class _TopicSquarePageState extends State<TopicSquarePage>
    with TickerProviderStateMixin {
  ExtendedTabController? _tabController;
  List<TopicTab>? _tabList;
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    _load();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.removeListener(_onTabChange);
    _tabController?.dispose();
    _TabPageState.exposureIds.clear();
  }

  void _load() async {
    List<TopicTab>? list = await TopicApi.getTopicTab();
    refresh(() {
      _loading = false;
      _tabList = list;
      if (_tabList != null && _tabList!.isNotEmpty) {
        int initialIndex = 0;
        if (Util.validStr(widget.tab)) {
          for (int i = 0; i < _tabList!.length; i++) {
            if (_tabList![i].type == widget.tab) {
              initialIndex = i;
              break;
            }
          }
        }
        safeRun(
          () => _tabController = ExtendedTabController(
              initialIndex: initialIndex, length: _tabList!.length, vsync: this)
            ..addListener(_onTabChange),
        );
      }
    });
  }

  void _refresh() {
    refresh(() {
      _loading = true;
    });
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: BaseAppBar(
        K.moment_topic_square,
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backgroundColor: Colors.transparent,
        backColor: R.colors.mainTextColor,
        titleColor: R.colors.mainTextColor,
      ),
      body: _renderBody(),
    ).withCommonBg();
  }

  Widget _renderBody() {
    if (_loading) return const Loading();
    if (_tabList == null || _tabList!.isEmpty) {
      return Center(
        child: ErrorData(
          onTap: _refresh,
          fontColor: R.colors.secondTextColor,
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _renderTab(),
        const SizedBox(
          height: 16,
        ),
        Expanded(child: _renderPager()),
      ],
    );
  }

  Widget _renderTab() {
    double tabHeight = 44;
    List<Widget> tabs = [];

    for (int i = 0; i < _tabList!.length; i++) {
      tabs.add(Tab(
        child: Container(
          height: tabHeight,
          alignment: AlignmentDirectional.center,
          child: Text(_tabList![i].name ?? '',
              style: TextStyle(color: R.colors.secondTextColor)),
        ),
      ));
    }
    return CommonTabBar(
      tabs: tabs,
      isScrollable: true,
      controller: _tabController,
      labelStyle: TextStyle(
          color: R.colors.secondTextColor,
          fontSize: 18,
          fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(
          color: R.colors.secondTextColor,
          fontSize: 14,
          fontWeight: FontWeight.w400),
      indicator: const BoxDecoration(),
      marginStart: 8,
      marginEnd: 60,
      labelPadding: const EdgeInsetsDirectional.only(start: 12, end: 12),
      tabItemAlign: const Alignment(0, 0.2),
    );
  }

  Widget _renderPager() {
    List<_TabPage> subPage = [];
    for (int i = 0; i < _tabList!.length; i++) {
      subPage.add(_TabPage(
        _tabList![i],
        _changeTab,
        key: ValueKey(_tabList![i].id),
      ));
    }
    return TabBarView(
      physics: const ClampingScrollPhysics(),
      controller: _tabController,
      children: subPage,
    );
  }

  _changeTab(int index) {
    if (!mounted) return;
    if (_tabList != null && _tabList!.length > index && index >= 0) {
      _tabController?.index = 1;
    }
  }

  _onTabChange() {}
}

/// tab数据
class _TabPage extends StatefulWidget {
  final TopicTab _topicTab;
  final ValueChanged<int> _onChange;

  const _TabPage(this._topicTab, this._onChange, {super.key});

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<_TabPage> with AutomaticKeepAliveClientMixin {
  static Set<String> exposureIds = HashSet();

  late GlobalKey<PageLoadingListState> _refreshKey;

  @override
  void initState() {
    super.initState();
    _refreshKey = GlobalKey();
    eventCenter.addListener(EventRefreshFollowTopics, _onRefreshFollowTopics);
  }

  @override
  void dispose() {
    super.dispose();
    eventCenter.removeListener(
        EventRefreshFollowTopics, _onRefreshFollowTopics);
  }

  _onRefreshFollowTopics(String type, dynamic data) {
    if (_isFollowTab()) {
      // 关注tab需要刷新
      _refreshKey.currentState?.refresh();
    }
  }

  /// 关注tab
  _isFollowTab() {
    return widget._topicTab.type == TopicSquareTab.Follow;
  }

  /// 推荐tab
  _isRecommendTab() {
    return widget._topicTab.type == TopicSquareTab.Recommend;
  }

  @override
  bool get wantKeepAlive => true;

  Future<TopicSquareListResponse> _load(int page) {
    return TopicApi.getTopicList(widget._topicTab.id, page);
  }

  _onWidgetVisible(bool visible, Topic topic) {
    if (visible && exposureIds.contains(_getKey(topic)) == false) {
      // Log.d('topic square exposure topic :$visible: ${topic.name}');
      exposureIds.add(_getKey(topic));
      Tracker.instance.track(TrackEvent.topic_expo, properties: {
        'topic_id': topic.id,
        'page': _exposureType(widget._topicTab.id),
      });
    }
  }

  String _getKey(Topic topic) {
    return '${widget._topicTab.id}_${topic.id}_${topic.name}';
  }

  _onFollowTaped(Topic topic) async {
    bool isFollow = topic.isFollow > 0;
    // 已关注不可点击
    if (isFollow) {
      return;
    }
    bool success = false;
    if (isFollow) {
      success =
          await TopicApi.unFollowTopic(topic.id, Session.uid, 'topic_square');
    } else {
      success =
          await TopicApi.followTopic(topic.id, Session.uid, 'topic_square');
    }

    if (success) {
      refresh(() {
        if (isFollow) {
          topic.isFollow = 0;
        } else {
          topic.isFollow = 1;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PageLoadingList<Topic>(
      key: _refreshKey,
      loadData: _load,
      noDataWidget: _renderNoData(),
      suppDark: true,
      itemBuilder: (context, topic, index) {
        return _renderItem(topic, index);
      },
    );
  }

  Widget _renderItem(Topic topic, int index) {
    return VisibilityDetector(
      key: ValueKey(_getKey(topic)),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction == 0.0) {
          _onWidgetVisible(false, topic);
        } else if (visibilityInfo.visibleFraction == 1.0) {
          _onWidgetVisible(true, topic);
        }
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Tracker.instance.track(TrackEvent.topic_click, properties: {
            'topic_id': topic.id,
            'page': _exposureType(widget._topicTab.id),
          });
          TopicDetailScreen.openTopicDetailScreen(context,
              tagId: topic.id, tagName: topic.topicName);
        },
        child: Rext.themeCardContainer(
          padding: const EdgeInsetsDirectional.only(
              start: 10, end: 5, top: 5, bottom: 5),
          cornerRadius: 16,
          margin: const EdgeInsetsDirectional.only(
            start: 16,
            end: 16,
            bottom: 10,
          ),
          width: Util.width,
          height: 72,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  CommonAvatar(
                      path: topic.icon,
                      size: 48,
                      borderRadius: BorderRadius.circular(4)),
                  if (topic.isActivity ?? false)
                    R.img(Assets.moment$circle_ic_activity_webp, height: 16),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 160),
                            child: Text(
                              topic.name ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: R.colors.mainTextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            )),
                        const SizedBox(
                          width: 2,
                        ),
                        Expanded(
                            flex: 1,
                            child: Text(topic.content ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: R.colors.thirdTextColor,
                                    fontSize: 11))),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(topic.desc ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: R.colors.thirdTextColor.withOpacity(0.5),
                            fontSize: 11)),
                  ],
                ),
              ),
              if (!_isFollowTab()) _renderBtn(topic),
            ],
          ),
        ),
      ),
    );
  }

  /// 关注按钮
  Widget _renderBtn(Topic topic) {
    bool isFollow = topic.isFollow > 0;
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 8),
      child: Follow2Button(
        isFollow: isFollow,
        onFollowTap: () => _onFollowTaped(topic),
      ),
    );
  }

  // 无数据样式
  Widget? _renderNoData() {
    if (_isFollowTab()) {
      return Container(
        alignment: AlignmentDirectional.center,
        padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            R.img('bb_null.webp',
                package: ComponentManager.MANAGER_BASE_CORE,
                width: 180,
                height: 180),
            const SizedBox(height: 18),
            Text(
              K.moment_no_follow_topic,
              style: TextStyle(
                  color: R.colors.mainTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(K.moment_no_follow_topic_tip,
                style:
                    TextStyle(color: R.colors.secondTextColor, fontSize: 14)),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                widget._onChange(1);
              },
              child: Container(
                width: 232,
                height: 52,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                    color: R.colors.mainBrandColor,
                    borderRadius: BorderRadius.circular(26)),
                child: Text(
                  K.moment_no_follow_topic_button,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      );
    }
    return null;
  }

  String _exposureType(int tabId) {
    if (_isFollowTab()) {
      return 'topic_square_follow';
    }
    if (_isRecommendTab()) {
      return 'topic_square_rec';
    }
    return 'topic_square_$tabId';
  }
}

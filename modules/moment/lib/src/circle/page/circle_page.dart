import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:moment/moment.dart';
import 'package:moment/src/circle/widget/circle_activity_widget.dart';

import '../../../k.dart';
import 'circle_detail_screen.dart';

/// 圈子
class CirclePage extends StatefulWidget {
  final String pageKey;
  final VoidCallback? onRefreshCallback;

  const CirclePage({super.key, required this.pageKey, this.onRefreshCallback});

  @override
  State<StatefulWidget> createState() {
    return CirclePageState();
  }
}

class CirclePageState extends State<CirclePage>
    with AutomaticKeepAliveClientMixin {
  CirclePageData? _pageData;
  static const STATE_LOADING = 1;
  static const STATE_ERROR = 2;
  static const STATE_LOADED = 3;
  int _state = STATE_LOADING;
  bool _expand = false;
  bool _requesting = false;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(EventConstant.EventLogin, _onLogin);
    _loadData();
  }

  void _loadData() async {
    if (mounted) {
      setState(() {
        _state = STATE_LOADING;
      });
    }
    _requesting = true;
    DataRsp<CirclePageData> rsp = await Api.getCirclePageList();
    _requesting = false;
    if (rsp.success == true && rsp.data != null) {
      if (mounted) {
        setState(() {
          _state = STATE_LOADED;
          _pageData = rsp.data;
        });
      }
    } else {
      if (mounted) {
        setState(() {
          _state = STATE_ERROR;
        });
      }
    }
    if (widget.onRefreshCallback != null) {
      widget.onRefreshCallback!.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _buildBody();
  }

  Widget _buildBody() {
    if (_state == STATE_LOADING && _pageData == null) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (_state == STATE_ERROR && _pageData == null) {
      return ErrorData(
        error: K.moment_something_went_wrong,
        onTap: () {
          _loadData();
        },
      );
    } else if (_state == STATE_LOADED &&
        (_pageData != null &&
            _pageData!.activityList.isEmpty &&
            _pageData!.friendsActivityList.isEmpty &&
            _pageData!.myCircleList.isEmpty &&
            _pageData!.recommendList.isEmpty)) {
      return ErrorData(
        error: K.moment_no_more_info,
        onTap: () {
          _loadData();
        },
      );
    } else {
      bool hasMyCircle =
          _pageData != null && _pageData!.myCircleList.isNotEmpty;
      bool hasRecommend =
          _pageData != null && _pageData!.recommendList.isNotEmpty;
      _handlePositionChanged(0, 1, hasMyCircle, hasRecommend);
      return RefreshIndicatorFactory.of(
          onRefresh: () async {
            _loadData();
          },
          child: NestedScrollViewInnerScrollPositionKeyWidget(
              Key(widget.pageKey),
              CustomScrollView(
                cacheExtent: 0,
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: <Widget>[
                  SliverList(
                    delegate:
                        FixedExtentSliverChildBuilderDelegate((context, index) {
                      if (index == 0) {
                        return buildCircleActivityAndFriendPlayingZone();
                      }
                      if (hasMyCircle) {
                        if (index == 1) {
                          return buildMyCircleZone();
                        }
                        if (hasRecommend && index == 2) {
                          return buildRecommendZone();
                        }
                      } else {
                        if (hasRecommend && index == 1) {
                          return buildRecommendZone();
                        }
                      }
                      return Container();
                    }, onPositionChanged: (int firstIndex, int lastIndex) {
                      _handlePositionChanged(
                          firstIndex, lastIndex, hasMyCircle, hasRecommend);
                    }, childCount: getChildCount(hasMyCircle, hasRecommend)),
                  )
                ],
              )));
    }
  }

  void _handlePositionChanged(
      int firstIndex, int lastIndex, bool hasMyCircle, bool hasRecommend) {
    if (_requesting) {
      return;
    }
    int recommendIndex = hasMyCircle ? 2 : 1;
    for (int i = firstIndex; i <= lastIndex; i++) {
      if (i == 0) {
        //圈子活动和圈友在玩
        if (!_pageData!.activityExposure &&
            _pageData!.activityList.isNotEmpty) {
          _pageData!.activityExposure = true;
          Tracker.instance.track(TrackEvent.net_view,
              properties: {'page': 'net_event_list'});
        }
        if (!_pageData!.friendExposure &&
            _pageData!.friendsActivityList.isNotEmpty) {
          _pageData!.friendExposure = true;
          Tracker.instance.track(TrackEvent.net_view,
              properties: {'page': 'net_play_list'});
        }
      }
      if (i == 1 && hasMyCircle && !_pageData!.myCircleExposure) {
        _pageData!.myCircleExposure = true;
        Tracker.instance
            .track(TrackEvent.net_view, properties: {'page': 'net_me'});
      }
      if (hasRecommend &&
          i == recommendIndex &&
          !_pageData!.recommendExposure) {
        _pageData!.recommendExposure = true;
        List<String> nameList = [];
        for (var element in _pageData!.recommendList) {
          nameList.add(element.name ?? '');
        }
        Tracker.instance.track(TrackEvent.net_recommend,
            properties: {'show': json.encode(nameList)});
      }
    }
  }

  int getChildCount(bool hasCircle, bool hasRecommend) {
    // 圈子活动，圈友在玩加分割线
    int count = 1;
    if (hasCircle) {
      // 我的圈子加分割线
      count += 1;
    }
    if (hasRecommend) {
      // 推荐圈子
      count += 1;
    }
    return count;
  }

  /// 圈子活动and 圈友在玩
  Widget buildCircleActivityAndFriendPlayingZone() {
    return Column(children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        alignment: AlignmentDirectional.centerStart,
        child: CircleActivityWidget(
            _pageData?.activityList, _pageData?.friendsActivityList),
      ),
      buildDivider(),
    ]);
  }

  Widget buildDivider() {
    return Container(
      height: 8,
      color: const Color(0xFFF6F7F9),
    );
  }

  Widget buildMyCircleZone() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _buildSectionHeader(
            'circle/ic_rush_my_circle.svg', K.moment_my_circles),
        const SizedBox(
          height: 10,
        ),
        _buildMyCircleBody(),
        if (_pageData!.myCircleList.length > 6) _buildMyCircleExpandButton(),
        buildDivider(),
      ],
    );
  }

  Widget _buildMyCircleBody() {
    //左右20dp固定的，中间的大小和间距动态去算
    double ratio = (Util.width - 40) / (375 - 40);
    int count;
    if (_pageData!.myCircleList.length > 6) {
      count = _expand ? _pageData!.myCircleList.length : 6;
    } else {
      count = _pageData!.myCircleList.length;
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, left: 20, right: 20),
      child: GridView.builder(
          padding: const EdgeInsets.only(top: 0),
          itemCount: count,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10 * ratio,
            crossAxisSpacing: 10 * ratio,
            childAspectRatio: 105 / 132,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {
                  Tracker.instance.track(TrackEvent.net_me, properties: {
                    'click': _pageData!.myCircleList[index].name
                  });
                  CircleDetailScreen.openCircleDetailScreen(
                      context,
                      _pageData!.myCircleList[index].id,
                      _pageData!.myCircleList[index].name, () {
                    reload();
                  }, 'me');
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: R.color.dividerColor,
                        width: 1,
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 8 * ratio,
                      ),
                      SizedBox(
                        width: 72 * ratio,
                        height: 72 * ratio,
                        child: Stack(
                          children: <Widget>[
                            ClipOval(
                              child: CachedNetworkImage(
                                imageUrl: _pageData!.myCircleList[index].icon,
                                fit: BoxFit.cover,
                                width: 72 * ratio,
                                height: 72 * ratio,
                              ),
                            ),
                            if (_pageData!.myCircleList[index].hasNew > 0)
                              PositionedDirectional(
                                end: 4,
                                top: 1,
                                child: R.img(
                                    'circle/ic_rush_my_circle_redpoint.webp',
                                    width: 12,
                                    height: 12,
                                    fit: BoxFit.fill,
                                    package: ComponentManager.MANAGER_MOMENT),
                              )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8 * ratio,
                      ),
                      Text(
                        _pageData!.myCircleList[index].name ?? '',
                        style: TextStyle(
                            fontSize: 13 * ratio,
                            color: R.color.mainTextColor,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 2 * ratio,
                      ),
                      Text(
                        K.moment_joined_number([
                          _pageData!.myCircleList[index].joinedNumber.toString()
                        ]),
                        style: TextStyle(
                            fontSize: 11 * ratio,
                            color: R.color.thirdTextColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ));
          }),
    );
  }

  Widget _buildMyCircleExpandButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            if (!_expand) {
              //点击展开
              Tracker.instance
                  .track(TrackEvent.net_me, properties: {'click': 'more'});
            }
            setState(() {
              _expand = !_expand;
            });
          },
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
            child: Container(
              width: 160,
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(20), right: Radius.circular(20)),
                  border: Border.all(
                    color: const Color(0xFFD2D2D2),
                    width: 1,
                  )),
              alignment: Alignment.center,
              child: Text(
                _expand ? K.moment_circle_collapse : K.moment_circle_view_all,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: R.color.thirdTextColor),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget _buildSectionHeader(String imagePath, String title) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 12),
      child: Container(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            R.img(imagePath,
                width: 16,
                height: 16,
                package: ComponentManager.MANAGER_MOMENT),
            const SizedBox(
              width: 2,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  color: R.color.mainTextColor,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  /// 推荐圈子
  Widget buildRecommendZone() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _buildSectionHeader(
            'circle/ic_rush_recommend_circle.svg', K.moment_recommend_circle),
        _buildRecommendBody(),
      ],
    );
  }

  Widget _buildRecommendBody() {
    return ListView.builder(
        padding: const EdgeInsets.only(top: 0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return RecommendCircleItemWidget(_pageData!.recommendList[index], () {
            reload();
          }, index != 0);
        },
        itemCount: _pageData!.recommendList.length);
  }

  _onLogin(String type, dynamic data) {
    reload();
  }

  void reload() {
    //refresh data
    _loadData();
  }

  @override
  void dispose() {
    eventCenter.removeListener(EventConstant.EventLogin, _onLogin);
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}

import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';

import '../../k.dart';
import '../../rank.dart';

/// 海龟汤-作者榜
class RankPuzzleAuthorLoader extends StatefulWidget {
  final PageConfig? config;

  const RankPuzzleAuthorLoader({super.key, this.config});

  @override
  _RankPuzzleAuthorLoaderState createState() => _RankPuzzleAuthorLoaderState();
}

class _RankPuzzleAuthorLoaderState extends State<RankPuzzleAuthorLoader>
    with AutomaticKeepAliveClientMixin<RankPuzzleAuthorLoader> {
  late PageController _pageController;

  int _type = 0;
  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, keepPage: true);
    _pageController.addListener(_onTabChanged);
    _pages = [
      const _StarPageView(
        type: 'week',
      ),
      const _StarPageView(
        type: 'month',
      ),
      const _StarPageView(
        type: 'all',
      ),
    ];
  }

  @override
  void dispose() {
    _pageController.removeListener(_onTabChanged);
    _pageController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  _onTabChanged() {}

  _jump(int page) {
    Log.d("set page = $page");
    setState(() {
      _type = page;
    });
    _pageController.jumpToPage(page);
  }

  /// tab
  Widget buildSubTab(BuildContext context, int index) {
    String title =
        ''; // = index == 0 ? R.string('charm_ranklist') : R.string('contribution_ranklist')
    if (index == 0) {
      title = K.week_ranklist;
    } else if (index == 1) {
      title = K.month_ranklist;
    } else if (index == 2) {
      title = K.total_ranklist;
    }
    return Expanded(
      child: InkWell(
        onTap: () {
          _jump(index);
        },
        child: Container(
          height: 34,
          decoration: BoxDecoration(
            color: _type == index ? Colors.white : R.color.secondBgColor,
            borderRadius: BorderRadius.circular(17),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: _type == index ? Colors.black : R.color.thirdTextColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 38.0,
          margin: const EdgeInsetsDirectional.only(
              start: 16.0, end: 16.0, bottom: 0.0, top: 15.0),
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Theme.of(context).inputDecorationTheme.fillColor,
            borderRadius: BorderRadius.circular(19),
          ),
          child: Row(
            children: <Widget>[
              buildSubTab(context, 0),
              buildSubTab(context, 1),
              buildSubTab(context, 2),
            ],
          ),
        ),
        Expanded(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: _pages,
          ),
        )
      ]),
    );
  }
}

class RankItem {
  int? uid;
  String? icon;
  String name = '';
  String order = '';
  int? score;
  int? con;
}

class _StarPageView extends StatefulWidget {
  final String type;

  const _StarPageView({
    required this.type,
  });

  @override
  _StarPageViewState createState() => _StarPageViewState();
}

class _StarPageViewState extends State<_StarPageView>
    with
        AutomaticKeepAliveClientMixin<_StarPageView>,
        SingleTickerProviderStateMixin<_StarPageView> {
  final List<RankItem> _data = [];

  RankItem? _my;

  bool _loading = true;

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _load();
    safeRun(() {
      _tabController = TabController(initialIndex: 0, length: 1, vsync: this);
      _tabController!.addListener(_onTabChanged);
    });
  }

  _onTabChanged() {}

  @override
  void dispose() {
    _tabController?.removeListener(_onTabChanged);
    _tabController?.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  _load() async {
    try {
      XhrResponse response = await Xhr.postJson(
          "${System.domain}games/puzzle/authorRank",
          {
            'type': widget.type,
          },
          throwOnError: true,
          optimize: true);

      Map res = response.value();
      setState(() {
        _data.clear();

        Map data = res['data'];

        List? list = data['list'];
        if (list != null && list.isNotEmpty) {
          for (var i in list) {
            Map item = i;
            RankItem rankItem = RankItem();
            rankItem.uid = Util.parseInt(item['uid']);
            rankItem.icon = (item['user_icon'] != null
                ? '${System.imageDomain + item['user_icon']}!head150'
                : '');
            rankItem.name = item['user_name'];
            rankItem.order = '${item['rank_num']}';
            rankItem.score = Util.parseInt(item['score']);
            rankItem.con = Util.parseInt(item['con']);

            _data.add(rankItem);
          }
        }

        Map? my = data['mine'];
        if (my != null) {
          _my = RankItem();
          _my!.icon = (my['user_icon'] != null
              ? '${System.imageDomain + my['user_icon']}!head150'
              : '');
          _my!.name = Util.parseStr(my['user_name']) ?? '';
          _my!.order = '${my['rank_num']}';
          _my!.score = Util.parseInt(my['score']);
        }

        _loading = false;
      });
    } catch (e) {
      Log.d(e);
    }
  }

  _noData() {
    return Container(
      height: 100.0,
      margin: const EdgeInsets.only(top: 10),
      child: Center(
        child: Text(
          R.string('havent_enough_to_show'),
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }

  Widget _renderTopThreeItem(int index) {
    String bg = Assets.bg_rank_star_new_top0_png;
    double bgWidth = 106.0;
    double bgHeight = 146.0;
    double iconSize = 64.0;
    if (index == 1) {
      bgWidth = 106.0;
      bgHeight = 126.0;
      iconSize = 48.0;
      bg = Assets.bg_rank_star_new_top1_png;
    } else if (index == 2) {
      bgWidth = 106.0;
      bgHeight = 126.0;
      iconSize = 48.0;
      bg = Assets.bg_rank_star_new_top2_png;
    }

    RankItem rankItem = _data[index];

    return SizedBox(
      width: bgWidth,
      height: bgHeight,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            child: R.img(
              bg,
              package: ComponentManager.MANAGER_RANK,
              fit: BoxFit.cover,
              width: bgWidth,
              height: bgHeight,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              InkWell(
                onTap: () {
                  RankManager.showImage(
                    context,
                    rankItem.uid,
                    const PageRefer('RankScript'),
                  );
                },
                child: CommonAvatarWithFrame(
                  childWidget: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: rankItem.icon,
                      width: iconSize,
                      height: iconSize,
                    ),
                  ),
                  overflow: -3.0,
                  uid: rankItem.uid,
                  framePath: UserImageCacheHelper.instance()
                      .getItemFrame(rankItem.uid ?? 0),
                ),
              ),
              Container(
                height: 8.0,
              ),
              Text(
                rankItem.name,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(color: R.color.mainTextColor, fontSize: 15),
              ),
              Container(
                height: 2.0,
              ),
              Text(
                "${rankItem.score}${K.rank_like}",
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.0,
                  color: R.color.secondTextColor,
                ),
              ),
              Container(
                height: 11.0,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _renderTopThree() {
    if (_data.length < 3) return Container();

    return SizedBox(
      height: 146,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: <Widget>[
          _renderTopThreeItem(0),
          PositionedDirectional(
            start: 0,
            child: _renderTopThreeItem(1),
          ),
          PositionedDirectional(
            end: 0,
            child: _renderTopThreeItem(2),
          ),
        ],
      ),
    );
  }

  Widget _renderNoData() {
    return _noData();
  }

  Widget _renderListAndTop(int index) {
    if (index < 2) {
      return Container();
    } else if (index == 2) {
      return SizedBox(
        width: MediaQuery.of(context).size.width - 32,
        height: 154, //146 + 8
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            PositionedDirectional(
              top: 0,
              start: 0,
              end: 0,
              child: _renderTopThree(),
            ),
          ],
        ),
      );
    } else {
      return _renderItem(index);
    }
  }

  Widget _renderItem(int index) {
    RankItem config = _data[index];
    return InkWell(
      onTap: () {
        RankManager.showImage(
            context, config.uid, const PageRefer('RankScript'));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "${index + 1}",
              style: TextStyle(color: R.color.secondTextColor, fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 12.0, end: 12.0, top: 10.0, bottom: 10.0),
            child: CommonAvatarWithFrame(
              childWidget: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: config.icon,
                  width: 56.0,
                  height: 56.0,
                  fit: BoxFit.cover,
                ),
              ),
              overflow: -3.0,
              uid: config.uid,
              framePath:
                  UserImageCacheHelper.instance().getItemFrame(config.uid ?? 0),
            ),
          ),
          Expanded(
            child: Text(
              config.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: R.color.mainTextColor, fontSize: 17),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 10.0),
            child: Text(
              "${config.score}${K.rank_like}",
              textScaleFactor: 1.0,
              style: TextStyle(color: R.color.secondTextColor, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_loading) {
      return const Center(
        child: Loading(),
      );
    }

    List<Widget> res = [];
    if (!_loading) {
      res.add(
        Expanded(
          child: RefreshIndicatorFactory.of(
            child: (_data.length < 3)
                ? _renderNoData()
                : Container(
                    padding: const EdgeInsetsDirectional.only(
                        start: 16, end: 16, top: 20),
                    child: ListView.builder(
                      itemCount: max(_data.length, 3),
                      addAutomaticKeepAlives: false,
                      padding: const EdgeInsets.all(0.0),
                      itemBuilder: (BuildContext context, int index) {
                        return _renderListAndTop(index);
                      },
                    ),
                  ),
            onRefresh: () async {
              await _load();
            },
          ),
        ),
      );
    }

    if (!_loading && _my != null) {
      //活动规则
      res.add(
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: R.color.dividerColor,
                width: 0.5,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.only(
                start: 16.0, end: 0.0, bottom: Util.iphoneXBottom),
            child: Row(
              children: <Widget>[
                Text(
                  _my!.order,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 12.0, end: 12.0, top: 12.0, bottom: 12.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(56)),
                    child: CachedNetworkImage(
                      imageUrl: _my!.icon,
                      width: 56.0,
                      height: 56.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(_my!.name, style: R.textStyle.subhead),
                      Container(
                        height: 2.0,
                      ),
                      Text(
                        "${_my!.score}${K.rank_like}",
                        style: R.textStyle.caption,
                      ),
                    ],
                  ),
                ),
                TextButton(
                    onPressed: () {
                      _showRule();
                    },
                    child: Text(
                      K.rank_rule_of_activity,
                      style: TextStyle(
                        fontSize: 12.0,
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).primaryColor,
                      ),
                    ))
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      children: res,
    );
  }

  _showRule() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Stack(
          children: <Widget>[
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.width * 0.7,
                ),
                decoration: BoxDecoration(
                  color: R.color.secondBgColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 12.0, bottom: 6.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              K.rank_rule_of_activity,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: R.color.mainBrandColor,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 12.0,
                                  end: 12.0,
                                  bottom: 12.0,
                                  top: 12.0),
                              child: Text(
                                K.rank_rule_puzzle_author,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: R.color.mainTextColor,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    PositionedDirectional(
                      end: 0.0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          alignment: Alignment.center,
                          child: R.img(
                            Assets.rank_dialog_close_svg,
                            package: ComponentManager.MANAGER_RANK,
                            width: 24,
                            height: 24,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';

import '../../rank.dart';

/// 周星
class StarLoader extends StatefulWidget {
  final PageConfig? config;

  const StarLoader({super.key, this.config});

  @override
  _StarLoaderState createState() => _StarLoaderState();
}

class _StarLoaderState extends State<StarLoader>
    with AutomaticKeepAliveClientMixin<StarLoader> {
  late PageController _pageController;

  final List<Widget> _pages = const [
    _StarPageView(type: 0),
    _StarPageView(type: 1)
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, keepPage: true);
    _pageController.addListener(_onTabChanged);
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
    setState(() {});
    _pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    // 魅力榜、贡献榜
    List<String> subTabs = [K.charm_ranklist, K.contribution_ranklist];
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SubTabWidget(
          tabLabels: subTabs,
          onTabSelected: (_) => _jump(_),
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

class _StarPageView extends StatefulWidget {
  final int type;

  const _StarPageView({required this.type});

  @override
  _StarPageViewState createState() => _StarPageViewState();
}

class _StarPageViewState extends State<_StarPageView>
    with
        AutomaticKeepAliveClientMixin<_StarPageView>,
        SingleTickerProviderStateMixin<_StarPageView> {
  Map? _lastWeekTop;
  Map? _currWeekData;
  Map? _currWeekGift;
  Map? _currWeekUser;

  List? _data;
  String? _gift;

  bool _loading = true;
  bool _left = true;
  List<String> _effect = [];
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _load();
    safeRun(() {
      _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
      _tabController!.addListener(_onTabChanged);
    });
  }

  _onTabChanged() {
    _setLeft(_tabController!.index == 0);
  }

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
      XhrResponse response = await Xhr.getJson(
          "${System.domain}rank/weekstar/?tp=${widget.type}&version=1",
          throwOnError: true);
      Map res = response.value();

      setState(() {
        _lastWeekTop = res['data']['lastWeekTop'];
        _currWeekData = res['data']['currWeekData'];
        _currWeekGift = res['data']['currWeekGift'];
        _currWeekUser = res['data']['currWeekUser'];
        _data = _left ? _currWeekData!['g1data'] : _currWeekData!['g2data'];
        _gift = _left ? _currWeekGift!['g1gift'] : _currWeekGift!['g2gift'];
        if (_left) {
          _effect = [
            _currWeekGift!['g1h1'],
            _currWeekGift!['g1h2'],
            _currWeekGift!['g1h3'],
          ];
        } else {
          _effect = [
            _currWeekGift!['g2h1'],
            _currWeekGift!['g2h2'],
            _currWeekGift!['g2h3'],
          ];
        }
        Log.d("------------>");
        _loading = false;
      });
    } catch (e) {
      Log.d(e);
    }
  }

  _setLeft(bool ok) {
    setState(() {
      _left = ok;
      _data = _left ? _currWeekData!['g1data'] : _currWeekData!['g2data'];
      _gift = _left ? _currWeekGift!['g1gift'] : _currWeekGift!['g2gift'];
      if (_left) {
        _effect = [
          _currWeekGift!['g1h1'],
          _currWeekGift!['g1h2'],
          _currWeekGift!['g1h3'],
        ];
      } else {
        _effect = [
          _currWeekGift!['g2h1'],
          _currWeekGift!['g2h2'],
          _currWeekGift!['g2h3'],
        ];
      }
      _loading = false;
    });
  }

  _noData() {
    return Container(
      height: 100.0,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: R.color.secondBgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          K.havent_enough_to_show,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }

  Widget _renderGiftTabItem(String giftUrl, String giftName, bool selected) {
    return Tab(
      child: Container(
        height: 30.0,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CachedNetworkImage(imageUrl: giftUrl, width: 22.0),
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Text(
                giftName,
                style: TextStyle(
                  color:
                      selected ? R.color.mainTextColor : R.color.thirdTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 礼物顶部tab
  Widget _renderGiftTab() {
    if (_currWeekGift == null || !_currWeekGift!.containsKey('g1gift')) {
      return Container();
    }
    List<Widget> tabs = [];
    tabs.add(_renderGiftTabItem(
        _currWeekGift!['g1gift'], _currWeekGift!['g1gname'], _left));
    tabs.add(_renderGiftTabItem(
        _currWeekGift!['g2gift'], _currWeekGift!['g2gname'], !_left));

    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 8),
      decoration: const BoxDecoration(
        color: Color(0xFFFFF8F0),
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      child: TabBar(
        indicator: CommonUnderlineTabIndicator(
          borderSide: BorderSide(width: 2.0, color: R.color.mainBrandColor),
          wantWidth: 58.0,
        ),
        tabs: tabs,
        isScrollable: false,
        indicatorPadding: const EdgeInsets.only(left: 15, right: 15),
        controller: _tabController,
      ),
    );
  }

  Widget _renderTopThreeItem(int index) {
    String bg = Assets.bg_rank_star_top1_png;
    if (index == 0) bg = Assets.bg_rank_star_top0_png;

    return SizedBox(
      width: 112,
      height: 194,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 30,
            child: R.img(
              bg,
              package: ComponentManager.MANAGER_RANK,
              fit: BoxFit.contain,
              height: 180,
              width: 122,
            ),
          ),
          Column(
            children: <Widget>[
              Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      RankManager.showImage(context, _data![index]['uid'],
                          PageRefer('RankStar${widget.type}'));
                    },
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(32.0)),
                      child: CachedNetworkImage(
                        imageUrl: _data![index]['icon'],
                        width: 64.0,
                        height: 64.0,
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    start: -4.0,
                    top: -4.0,
                    child: IgnorePointer(
                      child: CachedNetworkImage(
                        imageUrl: _effect[index],
                        width: 72.0,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                _data![index]['name'],
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(color: R.color.mainTextColor, fontSize: 16),
              ),
              Container(
                decoration: BoxDecoration(
                  color: index == 0
                      ? const Color(0xFFFF9E9E)
                      : const Color(0xFFFFC27E),
                  borderRadius: BorderRadius.circular(9),
                ),
                width: 79,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CachedNetworkImage(
                      imageUrl: _gift,
                      height: 20.0,
                    ),
                    Text(
                      " x ${_data![index]['gnum']}",
                      style:
                          R.textStyle.subCaption.copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _renderTopThree() {
    if (_data!.length < 3) return Container();

    return Container(
      color: const Color(0xFFFFF8F0),
      height: 259,
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: <Widget>[
          _renderTopThreeItem(0),
          PositionedDirectional(
            top: 52,
            start: 14,
            child: _renderTopThreeItem(1),
          ),
          PositionedDirectional(
            top: 52,
            end: 14,
            child: _renderTopThreeItem(2),
          ),
        ],
      ),
    );
  }

  Widget _renderNoData() {
    if (_data!.length < 3) {
      return _noData();
    } else {
      return Container(
        color: const Color(0xFFFFF8F0),
        height: 8.0,
      );
    }
  }

  /// 上周周星top1
  Widget _renderLastWeek(BuildContext context) {
    if (_lastWeekTop == null || !_lastWeekTop!.containsKey('g1icon')) {
      return Container();
    }

    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Container(
            height: 151,
            margin: const EdgeInsets.only(top: 16.0),
            padding: const EdgeInsets.only(top: 27.0, left: 36.0, right: 36.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(R.imagePath(Assets.bg_rank_star_png,
                    package: ComponentManager.MANAGER_RANK)),
                fit: BoxFit.fill,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Stack(
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            RankManager.showImage(
                                context,
                                _lastWeekTop!['g1uid'],
                                PageRefer('RankStar${widget.type}'));
                          },
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(32.0)),
                            child: CachedNetworkImage(
                              imageUrl: _lastWeekTop!['g1icon'],
                              width: 64.0,
                              height: 64.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        PositionedDirectional(
                          start: -4,
                          top: -4,
                          child: IgnorePointer(
                            child: CachedNetworkImage(
                              imageUrl: _lastWeekTop!['g1h1'],
                              width: 72.0,
                              height: 72.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
//										height: 18.0,
                      width: 100.0,
                      alignment: Alignment.bottomCenter,
                      margin: const EdgeInsets.only(top: 4),
                      child: Text(
                        _lastWeekTop!['g1name'],
                        maxLines: 1,
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: R.color.mainTextColor,
                        ),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 1.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CachedNetworkImage(
                              imageUrl: _lastWeekTop!['g1gift'],
                              height: 22.0,
                            ),
                            Text(
                              "${_lastWeekTop!['g1gname']}",
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  color: R.color.secondTextColor,
                                  fontSize: 12.0),
                            )
                          ],
                        ))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Stack(
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            RankManager.showImage(
                                context,
                                _lastWeekTop!['g2uid'],
                                PageRefer('RankStar${widget.type}'));
                          },
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(32.0)),
                            child: CachedNetworkImage(
                              imageUrl: _lastWeekTop!['g2icon'],
                              width: 64.0,
                              height: 64.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        PositionedDirectional(
                          start: -4,
                          top: -4,
                          child: IgnorePointer(
                            child: CachedNetworkImage(
                              imageUrl: _lastWeekTop!['g2h1'],
                              width: 72.0,
                              height: 72.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
//										height: 18.0,
                      width: 100.0,
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        _lastWeekTop!['g2name'],
                        maxLines: 1,
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: R.color.mainTextColor,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CachedNetworkImage(
                          imageUrl: _lastWeekTop!['g2gift'],
                          height: 20.0,
                        ),
                        Text(
                          "${_lastWeekTop!['g2gname']}",
                          textScaleFactor: 1.0,
                          style: TextStyle(
                              color: R.color.secondTextColor, fontSize: 12.0),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            width: 181,
            height: 29,
            decoration: BoxDecoration(
//              color: Color(0xFFFFF1E2),
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(R.imagePath(Assets.bg_rank_week_top1_png,
                    package: ComponentManager.MANAGER_RANK)),
                fit: BoxFit.fill,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              K.top_one_of_last_week,
              style: TextStyle(
                color: R.color.mainTextColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _renderListAndTop(int index) {
    if (index == 0) {
      return Column(
        children: <Widget>[
          _renderLastWeek(context),
          _renderGiftTab(),
        ],
      );
    } else if (index == 1) {
      return _renderNoData();
    } else if (index == 2) {
      return SizedBox(
        width: 400,
        height: 259,
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
            if (_data!.length > 3)
              SizedBox(
                height: 79,
                child: _renderItem(3),
              )
          ],
        ),
      );
    } else if (index == 3) {
      return Container();
    } else {
      return _renderItem(index);
    }
  }

  Widget _renderItem(int index) {
    Map config = _data!.elementAt(index);
    return InkWell(
      onTap: () {
        RankManager.showImage(
            context, config['uid'], PageRefer('RankStar${widget.type}'));
      },
      child: Container(
        color: index <= 3 ? Colors.transparent : const Color(0xFFFFF8F0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: AlignmentDirectional.centerStart,
              margin: const EdgeInsets.only(left: 14),
              child: Text(
                "${index + 1}",
                style: TextStyle(color: R.color.secondTextColor, fontSize: 13),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 14.0, right: 12.0, top: 8.0, bottom: 8.0),
              child: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(28.0)),
                    child: CachedNetworkImage(
                      imageUrl: config['icon'],
                      width: 56.0,
                      height: 56.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  (index == 3 || index == 4)
                      ? PositionedDirectional(
                          start: -3.5,
                          top: -3.5,
                          child: CachedNetworkImage(
                            imageUrl: _effect[2],
                            width: 63.0,
                            height: 63.0,
                          ),
                        )
                      : Container()
                ],
              ),
            ),
            Expanded(
              child: Text(
                config['name'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: R.color.mainTextColor, fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 10.0),
              child: Text(
                "${widget.type == 0 ? K.rank_receive : K.rank_send} ${config['gnum']}",
                textScaleFactor: 1.0,
                style: TextStyle(color: R.color.secondTextColor, fontSize: 13),
              ),
            ),
          ],
        ),
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
    res.add(
      Expanded(
        child: RefreshIndicatorFactory.of(
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: ListView.builder(
              itemCount: max(_data!.length, 3),
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

    if (_currWeekUser!.containsKey('hasData') &&
        Session.uid > 0 &&
        _currWeekUser!['hasData'] == true) {
      String ac = K.rank_receive;
      if (widget.type == 1) {
        ac = K.rank_send;
      }
      int gNum = Util.parseInt(_currWeekUser!['g1Order']);
      if (_left == false) {
        gNum = Util.parseInt(_currWeekUser!['g2Order']);
      }
      int giftNum = Util.parseInt(_currWeekUser!['g1num']);
      if (_left == false) {
        giftNum = Util.parseInt(_currWeekUser!['g2num']);
      }
      res.add(Padding(
        padding:
            EdgeInsets.only(left: 18.0, right: 0.0, bottom: Util.iphoneXBottom),
        child: Row(
          children: <Widget>[
            Text(
              gNum >= 100 ? "99+" : gNum.toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 12.0, right: 12.0, top: 12.0, bottom: 12.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: CachedNetworkImage(
                  imageUrl: _currWeekUser!['icon'],
                  width: 40.0,
                  height: 40.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(_currWeekUser!['name'], style: R.textStyle.subhead),
                  Text(
                    '$ac $giftNum个',
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
      ));
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
                              padding: const EdgeInsets.only(
                                  left: 12.0,
                                  right: 12.0,
                                  bottom: 12.0,
                                  top: 12.0),
                              child: Text(
                                K.rank_rule_detail,
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

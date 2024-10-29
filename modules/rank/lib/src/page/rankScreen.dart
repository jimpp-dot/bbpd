import 'dart:async';

import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:rank/src/model/entity/charm_achieve_rank_beans.dart';
import 'package:rank/src/page/cross_pk/cross_pk_living_screen.dart';
import 'package:rank/src/page/cross_pk/cross_pk_segment_screen.dart';
import 'package:rank/src/widget/charm_achieve_rank_page.dart';
import 'package:rank/src/widget/daily_rank.dart';
import 'package:rank/src/widget/gift_rank_page.dart';
import 'package:rank/src/widget/heart_beat_area.dart';
import 'package:rank/src/widget/impression_tag_overall_rank_page.dart';
import 'package:rank/src/widget/newPeopleItem.dart';
import 'package:rank/src/widget/rankCase.dart';
import 'package:rank/src/widget/rank_puzzle_author.dart';
import 'package:rank/src/widget/rank_puzzle_score.dart';

import '../widget/cp_item.dart';
import '../widget/defend_item.dart';
import '../widget/handbook_rank_page.dart';
import '../widget/hotItem.dart';
import '../widget/loveItem.dart';
import '../widget/lucky_item.dart';
import '../widget/rankScript.dart';
import '../widget/rankStar.dart';
import '../widget/vipItem.dart';
import 'package:sliver_tools/sliver_tools.dart';

/// 荣耀殿堂（各种排行榜）
///
class RankScreen extends StatefulWidget {
  final String? type; //需要定位到tab列表中某个type的item上
  final String rankType; //排行榜类型,根据不同类型返回不同tab 目前有：base/juben/case/puzzle/all 默认值同base
  final String? title; //标题
  final int subTabIndex;
  //是否是上周榜单
  final bool isLastWeek;

  const RankScreen({super.key, this.type, this.rankType = 'base', this.title, this.subTabIndex = 0, this.isLastWeek = false});

  @override
  _State createState() => _State();
}

class PageConfig {
  final String type;
  final String name;
  final String? url;
  final bool hide;
  final bool page;
  final double height;

  PageConfig(this.name, this.type, this.height, [this.url, this.hide = false, this.page = false]);
}

int getVipColor(int vip, [bool isChatRoom = false]) {
  return Utility.getVipColor(vip, isChatRoom);
}

class _State extends State<RankScreen> with SingleTickerProviderStateMixin<RankScreen> {
  ExtendedTabController? _tabController;

  List<Widget>? _pages;
  List<String>? _tabs;
  List<Widget>? _tabsWidget;
  bool _loading = true;

  String randCommonBg = Assets.rank_screen_bg;

  final IRankManager _rankManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_RANK);

  List<PageConfig> _config = [];
  final List<PageConfig> _showRushPrizeConfigs = [];
  bool _showRushPrizeAction = false;

  final Map<String, PageConfig> _tabTypes = {
    'juben/rank/case': PageConfig(K.rank_config_case, 'case', 100.0), //侦探榜
    'juben/rank/script': PageConfig(K.rank_config_script, 'script', 100.0), //剧本
    'juben/rank/god': PageConfig(K.rank_config_god, 'god', 100.0), //车神
    'room/topvip/all': PageConfig(K.rank_config_all, 'all', 90), //真爱
    'room/rank/daily': PageConfig(K.rank_config_daily, 'daily', 90), //日榜
    'room/rank/charm': PageConfig(K.rank_config_charm, 'charm', 90), //魅力
    'room/rank/achieve': PageConfig(K.rank_config_achieve, 'achieve', 90), //成就
    'rank/awakenHandbook': PageConfig(K.rank_config_gift_hand_book, 'hand_book', 90), //图鉴
    'room/rank/gift': PageConfig(K.rank_config_gift, 'gift', 90),
    'room/topvip/lucky': PageConfig(K.rank_config_lucky, 'lucky', 90),
    'room/topvip/sweet': PageConfig(K.rank_config_sweet, 'sweet', 72.0),
    'room/weekstar/star': PageConfig(K.rank_config_star, 'star', 100.0, 'rank/defend', true, true),
    'room/defend/title': PageConfig(K.rank_config_title, 'title', 76.0, 'rank/defend', false, true),
    'room/defend/cp': PageConfig(K.rank_config_cp, 'defend', 133.0, 'rank/defend', true, true),
    'room/defend/hot': PageConfig(K.rank_config_hot, 'hot', 76.0, 'rank/defend', true, true),
    'room/marry/mate': PageConfig(K.marry_config_mate, 'mate', 125.0),
    'puzzle/rank/score': PageConfig(K.rank_config_score, 'puzzle/score', 100.0), //海龟汤得分榜
    'puzzle/rank/author': PageConfig(K.rank_config_author, 'puzzle/author', 100.0), //海龟汤熬汤人
    'juben/rank/author': PageConfig(K.rank_config_author, 'juben/author', 100.0), //海龟汤熬汤人
    'room/rank/newbie': PageConfig(K.rank_newbie_list, 'newbie', 76, 'rank/defend'), //迎新
    'room/cpk/living': PageConfig(K.rank_config_cpk_living, 'cpk/living', 76), //PK厅
    'room/cpk/segment': PageConfig(K.rank_config_cpk_segment, 'cpk/segment', 76), //PK排位
    'mount_serial/rank': PageConfig(K.rank_config_mount, 'mount_serial/rank', 76), //座驾
    'room/impressTag': PageConfig(K.rank_impress_text, 'impress_tag', 76), //印象
  };

  @override
  void initState() {
    super.initState();
    load();
  }

  void _tabSortByService(Map data) {
    data.forEach((key, value) {
      if (_tabTypes.containsKey(key) && Util.parseInt(value) == 1) {
        _config.add(_tabTypes[key]!);
      }
    });
  }

  Future<void> load() async {
    try {
      if (_rankManager.withTabDynamic()) {
        String url = '${System.domain}room/rankShowTab?v=4&type=${widget.rankType}';
        if (widget.isLastWeek) {
          url = '$url&last=1';
        }
        XhrResponse response = await Xhr.getJson(url, throwOnError: true);

        Map res = response.value();
        if (res['success'] == true) {
          Map? data = res['data'];
          Log.d("data===>>${data.toString()}");
          if (data != null) {
            _tabSortByService(data);
          }
        }
      } else {
        _config = [
          PageConfig(K.rank_config_all, 'all', 90), //真爱
          PageConfig(K.rank_config_daily, 'daily', 90), //日榜
          PageConfig(K.rank_config_lucky, 'lucky', 90), //手气
          PageConfig(K.rank_config_gift_hand_book, 'hand_book', 90), //图鉴
          PageConfig(K.rank_config_sweet, 'sweet', 72.0), //守护
          PageConfig(K.rank_config_star, 'star', 100.0, 'rank/defend', true, true), //周星
          PageConfig(K.rank_config_title, 'title', 76.0, 'rank/defend'), //贵族
          PageConfig(K.rank_config_cp, 'defend', 133.0, 'rank/defend', true, true), //CP
          PageConfig(K.rank_config_hot, 'hot', 76.0, 'rank/defend', true, true), //红人
        ];
      }
    } catch (e) {
      Log.d('room/rankShowTab requeset error:$e');
    }
    Log.d('_config:$_config');
    _loading = false;

    if (!mounted) return;
    setState(() {
      if (_config.isNotEmpty) {
        int initPage = 0;
        if (widget.type != null && widget.type!.isNotEmpty) {
          for (int i = 0; i < _config.length; i++) {
            if (_config[i].type == widget.type) {
              initPage = i;
              break;
            }
          }
          Log.d('widget.type:${widget.type}');
          if (('charm' == widget.type ||
              'achieve' == widget.type ||
              'title' == widget.type ||
              'gift' == widget.type ||
              'sweet' == widget.type ||
              'hand_book' == widget.type ||
              'mount_serial/rank' == widget.type ||
              'all' == widget.type ||
              'impress_tag' == widget.type)) {
            _showRushPrizeAction = true;
          }
        }

        safeRun(
          () => _tabController = ExtendedTabController(initialIndex: initPage, length: _config.length, vsync: this)
            ..addListener(_onTabChanged),
        );

        _pages = _config.map((PageConfig config) {
          if (config.type == 'star') {
            return StarLoader(config: config);
          }
          if (config.type == 'script' || config.type == 'god') {
            return RankScriptLoader(config: config);
          }
          if (config.type == 'case') {
            return RankCaseLoader(config: config);
          } else if (config.type == 'daily') {
            return const DailyRankPage();
          } else if (config.type == 'charm') {
            //魅力榜
            return CharmAchieveRankPage(rankType: CharmAchieveRankType.charm, isLastWeek: widget.isLastWeek);
          } else if (config.type == 'achieve') {
            return CharmAchieveRankPage(
              rankType: CharmAchieveRankType.achieve,
              tabIndex: widget.subTabIndex,
              isLastWeek: widget.isLastWeek,
            );
          } else if (config.type == 'hand_book') {
            return const HandBookRankPage(pageType: 'allGift');
          } else if (config.type == 'gift') {
            return GiftRankPage(pageType: 'allGift', isLastWeek: widget.isLastWeek);
          }
          if (config.type == 'puzzle/score') {
            return RankPuzzleScoreLoader(config: config);
          } else if (config.type == 'puzzle/author') {
            return RankPuzzleAuthorLoader(config: config);
          } else if (config.type == 'cpk/living') {
            return showRankListByKey(roomCpkLiving)
                ? const CrossPKLivingScreen()
                : Center(child: Text(K.rank_no_more_data, style: TextStyle(fontSize: 13, color: Colors.grey[400])));
          } else if (config.type == 'cpk/segment') {
            return showRankListByKey(roomCpkSegment)
                ? const CrossPKSegmentScreen()
                : Center(child: Text(K.rank_no_more_data, style: TextStyle(fontSize: 13, color: Colors.grey[400])));
          } else if (config.type == 'mount_serial/rank') {
            IVipManager vipManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_VIP);
            return vipManager.getMountRankPage();
          } else if (config.type == 'impress_tag') {
            return ImpressionTagOverallRankPage(isLastWeek: widget.isLastWeek);
          } else {
            return _Loader(config: config, isLastWeek: widget.isLastWeek);
          }
        }).toList();
        _tabs = _config.map((config) => config.name).toList();

        _tabsWidget = <Widget>[];
        for (int i = 0; i < _tabs!.length; i++) {
          _tabsWidget!.add(Tab(
            child: Text(_tabs![i]),
          ));
        }

        for (var e in _config) {
          String type = e.type;
          if (type == 'charm' ||
              type == 'achieve' ||
              type == 'title' ||
              type == 'hand_book' ||
              type == 'gift' ||
              type == 'sweet' ||
              type == 'impress_tag') {
            _showRushPrizeConfigs.add(e);
          }
        }
      }
    });
  }

  @override
  void dispose() {
    if (_tabController != null) {
      _tabController!.removeListener(_onTabChanged);
      _tabController!.dispose();
    }
    super.dispose();
  }

  _onTabChanged() {
    if (_tabController!.indexIsChanging) return;

    showRushPrizeAction();

    if (_tabs![_tabController!.index] == '贵族') {
      setState(() {
        randCommonBg = Assets.rank_screen_bg;
      });
    } else {
      setState(() {
        randCommonBg = Assets.rank_screen_bg;
      });
    }
  }

  void showRushPrizeAction() {
    int index = 0;
    if (_tabController != null) {
      index = _tabController!.index;
      Log.d('tab index:${index}');
      if (index < _config.length) {
        String type = _config[index].type;
        Log.d('tab type:${type}');
        if ((type == 'charm' ||
            type == 'achieve' ||
            type == 'title' ||
            type == 'hand_book' ||
            type == 'gift' ||
            type == 'sweet' ||
            type == 'mount_serial/rank' ||
            type == 'impress_tag')) {
          if (mounted) {
            setState(() {
              _showRushPrizeAction = true;
            });
          }
        } else {
          if (_showRushPrizeAction == true) {
            if (mounted) {
              setState(() {
                _showRushPrizeAction = false;
              });
            }
          }
        }
      }
    }
  }

  Widget _buildTab() {
    Log.d('_tabs:z${_tabs.toString()}');
    return _tabs != null && _tabs!.length > 1
        ? Container(
            width: double.infinity,
            // decoration: const BoxDecoration(
            //   color: Color(0XFFD670FF),
            //   border: Border(bottom: BorderSide(width: 0.0, color: Color(0XFFD670FF))),
            // ),
            height: 44.0,
            padding: const EdgeInsetsDirectional.only(start: 10.0, bottom: 8),
            child: CommonTabBar(
              tabs: _tabsWidget ?? [],
              isScrollable: true,
              labelColor: Colors.white,
              controller: _tabController,
              unselectedLabelColor: Colors.white.withOpacity(0.6),
              labelStyle: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
              unselectedLabelStyle: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 16, fontWeight: FontWeight.w600),
              indicator: const CommonUnderlineTabIndicator(
                borderSide: BorderSide(width: 3.0, color: Color(0xFFFFFFFF)),
                insets: EdgeInsetsDirectional.only(bottom: 0),
                wantWidth: 16,
                draggingWidth: 12.0,
              ),
              indicatorWeight: 0,
              marginStart: 8,
              marginEnd: 60,
              labelPadding: const EdgeInsetsDirectional.only(start: 12, end: 12),
            ),
          )
        : const SizedBox.shrink();
  }

  Widget _renderBody() {
    if (_loading) {
      return const Center(
        child: Loading(),
      );
    }

    if (_tabs == null || _tabs!.isEmpty) {
      return ErrorData(
        onTap: () {
          load();

          _loading = true;
          setState(() {});
        },
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTab(),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: _pages!,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Log.d('rank scree:_showRushPrizeAction:${_showRushPrizeAction}  isLastWeek:${!widget.isLastWeek}');
    return Container(
      height: double.infinity,
      color: Colors.transparent,
      child: Stack(
        children: [
          R.img(randCommonBg, fit: BoxFit.fitWidth, width: Util.width, package: Assets.package),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: BaseAppBar.custom(
              statusBrightness: Brightness.dark,
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.title ?? K.rank_page_title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (_showRushPrizeAction && !widget.isLastWeek)
                    GestureDetector(
                      onTap: () {
                        if ('mount_serial/rank' == _config[_tabController!.index].type) {
                          BaseWebviewScreen.show(context, url: Util.parseHelpUrl(178), title: K.rank_rank_desc);
                        } else {
                          IRankManager rankManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_RANK);
                          rankManager.showRankRushPrizeScreen(
                            context,
                            _showRushPrizeConfigs,
                            _showRushPrizeConfigs.indexOf(_config[_tabController!.index]),
                          );
                        }
                      },
                      child: Container(
                          width: 30,
                          height: 44,
                          alignment: Alignment.center,
                          child: R.img(Assets.rank$rank_help_icon_png, width: 18, height: 18)),
                    ),
                ],
              ),
              backgroundColor: Colors.transparent,
              backColor: Colors.white,
              actions: [
                if (!widget.isLastWeek)
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          ///上周榜单
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => RankScreen(
                                type: widget.type,
                                rankType: widget.rankType,
                                title: K.rank_last_week,
                                subTabIndex: widget.subTabIndex,
                                isLastWeek: true,
                              ),
                              settings: const RouteSettings(name: '/lastWeekRank'),
                            ),
                          );
                        },
                        child: Text(
                          K.rank_last_week,
                          style: TextStyle(color: Colors.white.withOpacity(0.5)),
                        ),
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
              ],
            ),
            body: ScaffoldBody(
              backgroundColor: Colors.transparent,
              decorationColor: Colors.transparent,
              child: _renderBody(),
            ),
          ),
        ],
      ),
    );
  }
}

class _Loader extends StatefulWidget {
  final PageConfig config;
  //是否是上周榜单
  final bool isLastWeek;

  const _Loader({required this.config, this.isLastWeek = false});

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<_Loader> with AutomaticKeepAliveClientMixin<_Loader> {
  List _data = [];
  Map? self;
  bool _loading = true;
  bool _hideRank = false;
  bool _purview = false;

  int _page = 1;
  bool _more = true;
  bool _lock = false;

  late ScrollController _controller;

  final GlobalKey<RefreshIndicatorState> _key = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    int currentNobility = NobilityUtil.currentIntNobility(oldNobility: Session.title, newNobility: Session.titleNew);
    int startNobility = NobilityUtil.currentIntNobility(
        oldNobility: NobilityUtil.getInt(NobilityType.Earl), newNobility: NobilityUtil.getInt(NobilityType.Duke));
    _purview = currentNobility >= startNobility;
    _controller = ScrollController();
    _controller.addListener(_onScroll);
    _load(1);
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  _onScroll() {
    if (!_controller.hasClients) return;
    if (_more == true && _lock == false && widget.config.page == true && _controller.position.maxScrollExtent == _controller.offset) {
      _load(_page + 1);
    }
  }

  @override
  bool get wantKeepAlive => true;

  _load(int page) async {
    _lock = true;
    try {
      String url;
      XhrResponse response;
      if (widget.config.url != null) {
        url = "${System.domain}${widget.config.url}";
        response = await Xhr.postJson(
          url,
          {
            'page': page.toString(),
            'tp': widget.config.type,
            'version': '2',
            'lan': Translations.getLan(),
            'last': widget.isLastWeek ? '1' : '0',
          },
          throwOnError: true,
          optimize: true,
        );
      } else {
        int version = widget.config.type == 'lucky' ? 2 : 1;
        url = "${System.domain}room/topvip?tp=${widget.config.type}&version=$version&lan=${Translations.getLan()}";
        if (widget.isLastWeek) {
          url = '$url&last=1';
        }
        response = await Xhr.getJson(url, throwOnError: true, optimize: true);
      }
      if (!mounted) return;
      Map res = response.value();
      List? data = res['data'];
      setState(() {
        _page = page;
        _loading = false;
        if (data != null && data.isNotEmpty) {
          if (_page == 1) {
            _data.clear();
            _data = res['data'];
          } else {
            _data.addAll(res['data']);
          }
          _more = _data.isNotEmpty && _data.length >= 15;
        } else {
          _more = false;
        }
        _hideRank = res.containsKey('hideRank') ? res['hideRank'] : false;
        if (widget.config.type == 'title' && res.containsKey('info')) {
          self = res['info'];
        }

        Log.d('rank defend:$_data');
      });
    } catch (e) {
      Log.d("--------------->");
      Log.d(e);
    }
    _lock = false;
  }

  Future<void> _onRefresh() async {
    await _load(1);
  }

  Future<bool> _setHideRank(int rid, bool hide) async {
    try {
      String url = "${System.domain}room/topset";
      Map<String, String> params = {'rid': '$rid', 'hide': hide ? '1' : '0', 'ver': '1'};
      XhrResponse response = await Xhr.postJson(url, params, throwOnError: false);
      Map res = response.response as Map;
      if (res['success'] == true) {
        return true;
      } else {
        Fluttertoast.showToast(msg: res['msg'], gravity: ToastGravity.CENTER);
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e, gravity: ToastGravity.CENTER);
    }
    return false;
  }

  Widget _renderExtend() {
    if (widget.config.page == true) {
      return SizedBox(
        height: 50.0,
        child: Center(
          child: Text(
            _more ? K.rank_loading : K.rank_havent_more,
            textScaleFactor: 1.0,
            style: TextStyle(fontSize: 12.0, color: Theme.of(context).dividerColor),
          ),
        ),
      );
    }
    if (widget.config.hide == true || _purview == false) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      height: 50.0,
      child: Row(
        children: <Widget>[
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              K.hide_in_this_ranklist,
              style: TextStyle(color: R.color.secondTextColor),
            ),
          ),
          Switch(
            inactiveTrackColor: R.color.switchInActiveColor,
            value: _hideRank,
            onChanged: (bool checked) {
              setState(() {
                _hideRank = checked;
              });
              Map<String, int> tpMap = {
                'week': 11,
                'month': 12,
                'all': 13,
                'sweet': 14,
              };

              _setHideRank(tpMap[widget.config.type] ?? 0, checked);
            },
          ),
          const SizedBox(width: 15)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    /// 真爱、守护、贵族、红人
    if ((widget.config.type == 'all' && !showRankListByKey(homeLoveKey)) ||
        (widget.config.type == 'sweet' && !showRankListByKey(homeSweetKey)) ||
        (widget.config.type == 'title' && !showRankListByKey(homeNobleKey)) ||
        (widget.config.type == 'hot' && !showRankListByKey(homeHotKey))) {
      return Center(
        child: Text(
          K.rank_no_more_data,
          style: TextStyle(fontSize: 13, color: Colors.grey[400]),
        ),
      );
    }

    if (_loading) {
      return const Loading();
    }

    double listTopMargin = 0;
    if (widget.config.type == 'sweet' || widget.config.type == 'title' || widget.config.type == 'hot') {
      listTopMargin = 5.0;
    } else if (widget.config.type == 'defend' || widget.config.type == 'lucky') {
      listTopMargin = 14.0;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: RefreshIndicatorFactory.of(
            color: R.color.mainBrandColor,
            backgroundColor: Colors.white,
            key: _key,
            onRefresh: _onRefresh,
            child: CustomScrollView(
              controller: _controller,
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(
                    [SizedBox(height: listTopMargin)],
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      if (widget.config.type == 'all' && showRankListByKey(homeLoveKey)) const HeartBeatArea(),
                    ],
                  ),
                ),
                SliverStack(children: [
                  // Container(
                  //   width: Util.width,
                  //   height: Util.width*1378/748,
                  // ),

                  // SliverPositioned.fill(
                  //   top: 0,
                  //   child: Container(
                  //     width: Util.width,
                  //     height: Util.width*1378/748,
                  //     decoration: BoxDecoration(
                  //       image: DecorationImage(
                  //         image: (R.img(Assets.nomal_rank_middle_bg,
                  //             width: Util.width,
                  //             height: Util.width*1378/748,
                  //             package: ComponentManager
                  //                 .MANAGER_RANK) as Image)
                  //             .image,
                  //         fit: BoxFit.fill,
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  SliverFixedExtentList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        Map item = _data.elementAt(index) ?? {};
                        if (widget.config.type == 'title') {
                          return showRankListByKey(homeNobleKey) ? VipItem(data: item, index: index) : const SizedBox.shrink();
                        } else if (widget.config.type == 'newbie') {
                          return NewPeopleItem(data: item, index: index, context: context);
                        } else if (widget.config.type == 'sweet') {
                          return showRankListByKey(homeSweetKey) ? DefendItem(data: item, index: index) : const SizedBox.shrink();
                        } else if (widget.config.type == 'all') {
                          return showRankListByKey(homeLoveKey)
                              ? LoveItemWidget(data: LoveItemData.fromJson(item), index: index)
                              : const SizedBox.shrink();
                        } else if (widget.config.type == 'hot') {
                          return showRankListByKey(homeHotKey) ? HotItem(data: item, index: index) : const SizedBox.shrink();
                        } else if (widget.config.type == 'defend') {
                          return CpItem(data: item, index: index);
                        } else if (widget.config.type == 'lucky') {
                          return LuckyItem(data: item, index: index);
                        }
                        return Text(
                          "${widget.config.type} $index",
                          textScaleFactor: 1.0,
                        );
                      },
                      childCount: _data.length,
                      addAutomaticKeepAlives: false,
                    ),
                    itemExtent: widget.config.height,
                  ),
                ]),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      _renderExtend(),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [SizedBox(height: Util.iphoneXBottom)],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (widget.config.type == 'title' && self != null && showRankListByKey(homeNobleKey))
          SelfVipItem(self!, showRuleFlag: widget.config.type != 'title'),
      ],
    );
  }
}

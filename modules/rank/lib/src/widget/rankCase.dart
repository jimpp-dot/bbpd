import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';
import '../../k.dart';
import '../../rank.dart';

/// 剧本榜/车神榜
class RankCaseLoader extends StatefulWidget {
  final PageConfig? config;

  const RankCaseLoader({super.key, this.config});

  @override
  _RankCaseLoaderState createState() => _RankCaseLoaderState();
}

class _RankCaseLoaderState extends State<RankCaseLoader>
    with AutomaticKeepAliveClientMixin<RankCaseLoader> {
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
        tp: 1,
      ),
      const _StarPageView(
        tp: 2,
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
  int? order;
  int? score;
  int? con;
}

class _StarPageView extends StatefulWidget {
  final int tp;

  const _StarPageView({required this.tp});

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
          "${System.domain}case/rank",
          {
            'tp': widget.tp.toString(),
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
            rankItem.icon = item['icon'];
            rankItem.name = item['name'];
            rankItem.order = Util.parseInt(item['order']);
            rankItem.score = Util.parseInt(item['score']);

            _data.add(rankItem);
          }
        }

        Map? my = data['my'];
        if (my != null) {
          Map? info = my['info'];
          if (info != null && Util.parseInt(info['uid']) != 0) {
            _my = RankItem();
            _my!.uid = Util.parseInt(info['uid']);
            _my!.icon = Util.parseStr(info['icon']) ?? '';
            _my!.name = Util.parseStr(info['name']) ?? '';
            _my!.order = Util.parseInt(info['order']);
            _my!.score = Util.parseInt(info['score']);
          }
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

  Widget _renderNoData() {
    return _noData();
  }

  Widget _renderItem(
    int index,
    double width,
    double height,
  ) {
    String bg = Assets.bg_rank_case_bg_top4_png;
    String icon = '';
    if (index == 0) {
      bg = Assets.bg_rank_case_bg_top1_png;
      icon = Assets.bg_rank_case_icon_top1_png;
    } else if (index == 1) {
      bg = Assets.bg_rank_case_bg_top2_png;
      icon = Assets.bg_rank_case_icon_top2_png;
    } else if (index == 2) {
      bg = Assets.bg_rank_case_bg_top3_png;
      icon = Assets.bg_rank_case_icon_top3_png;
    }

    RankItem config = _data[index];
    return InkWell(
      onTap: () {
        RankManager.showImage(
          context,
          config.uid,
          const PageRefer('RankCase'),
        );
      },
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(
          bottom: 8.0,
        ),
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: <Widget>[
            R.img(
              bg,
              width: width,
              height: height,
              fit: BoxFit.fill,
              package: ComponentManager.MANAGER_RANK,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 47.0,
                  alignment: Alignment.center,
                  child: index < 3
                      ? R.img(
                          icon,
                          width: 30.0,
                          height: 35.0,
                          package: ComponentManager.MANAGER_RANK,
                        )
                      : Text(
                          "${(index + 1) >= 10 ? index + 1 : '0${index + 1}'}",
                          style: TextStyle(
                            color: R.color.secondTextColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                ),
                Container(
                  margin: const EdgeInsetsDirectional.only(
                    end: 12.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 2.0, color: Colors.white.withOpacity(0.2)),
                    shape: BoxShape.circle,
                  ),
                  child: CommonAvatarWithFrame(
                    childWidget: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: '${config.icon}',
                        width: 56.0,
                        height: 56.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    overflow: -3.0,
                    uid: config.uid,
                    framePath: UserImageCacheHelper.instance()
                        .getItemFrame(config.uid ?? 0),
                  ),
                ),
                Expanded(
                  child: Text(
                    config.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: R.color.mainTextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsetsDirectional.only(end: 8.0),
                  child: RichText(
                    text: TextSpan(
                      text: "${config.score}",
                      style: TextStyle(
                        color: index < 3
                            ? R.color.mainTextColor
                            : R.color.mainTextColor.withOpacity(0.6),
                        fontSize: index < 3 ? 24 : 15,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontFamily: Util.fontFamily,
                      ),
                      children: [
                        TextSpan(
                          text: K.rank_score,
                          style: TextStyle(
                            color: index < 3
                                ? R.color.mainTextColor
                                : R.color.mainTextColor.withOpacity(0.6),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
    if (!_loading) {
      double width = MediaQuery.of(context).size.width - 32.0;
      double height = 68.0;

      res.add(
        Expanded(
          child: RefreshIndicatorFactory.of(
            child: (_data.isEmpty)
                ? _renderNoData()
                : Container(
                    padding: const EdgeInsetsDirectional.only(
                        start: 16, end: 16, top: 20),
                    child: ListView.builder(
                      itemCount: _data.length,
                      addAutomaticKeepAlives: false,
                      padding: const EdgeInsets.all(0.0),
                      itemBuilder: (BuildContext context, int index) {
                        return _renderItem(index, width, height);
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
                if (_my!.order != null)
                  Text(
                    _my!.order! >= 100 ? "99+" : "${_my!.order}",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 12.0, end: 12.0, top: 12.0, bottom: 12.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(56)),
                    child: CachedNetworkImage(
                      imageUrl: "${_my!.icon}",
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
                      Text(
                        _my!.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        height: 2.0,
                      ),
                      Text(
                        "${_my!.score}${K.rank_score}",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
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
                                K.rank_rule_script_detail3,
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

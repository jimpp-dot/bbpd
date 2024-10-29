import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:rank/src/model/entity/daily_rank_beans.dart';
import 'package:rank/src/widget/daily_star.dart';

class DailyRankPage extends StatefulWidget {
  const DailyRankPage({super.key});

  @override
  _DailyRankPageState createState() => _DailyRankPageState();
}

class _DailyRankPageState extends State<DailyRankPage>
    with AutomaticKeepAliveClientMixin<DailyRankPage> {
  late PageController _pageController;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
      const DailyRankListWidget(
          DailyRankType.charm, PageRefer('DailyRankTab1')),
      const DailyRankListWidget(
          DailyRankType.contribution, PageRefer('DailyRankTab1'))
    ];

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
//    setState(() {
//      _curPage = page;
//    });
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

class DailyRankItemIconWidget extends StatelessWidget {
  final double size;
  final DailyRankItem rankItem;
  final PageRefer refer;

  const DailyRankItemIconWidget(this.rankItem, this.size, this.refer,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        IPersonalDataManager personalDataManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        personalDataManager.openImageScreen(context, rankItem.uid,
            refer: refer);
      },
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SizedBox(
              width: 52,
              height: 52,
              child: CommonAvatarWithFrame(
                uid: rankItem.uid,
                framePath: UserImageCacheHelper.instance().showLocalFrame
                    ? Util.getFullFramePath(rankItem.selfFrame)
                    : '',
                overflow: -3.0,
                childWidget: CommonAvatar(
                  path: rankItem.icon,
                  shape: BoxShape.circle,
                  size: 52,
                ),
              ),
            ),
            if (rankItem.frame.isNotEmpty &&
                !UserImageCacheHelper.instance().showLocalFrame)
              CachedNetworkImage(
                imageUrl: '${System.imageDomain}${rankItem.frame}',
                width: size,
                height: size,
              ),
          ],
        ),
      ),
    );
  }
}

class DailyRankItemWidget extends StatelessWidget {
  final int index;
  final DailyRankItem rankItem;
  final PageRefer refer;

  const DailyRankItemWidget(this.index, this.rankItem, this.refer, {super.key});

  Widget _buildIndex() {
    if (index <= 2) {
      return Container(
        height: 23,
        width: 28,
        alignment: Alignment.center,
        child: R.img(Assets.rank_rank_x_png(index + 1),
            width: 20, height: 23, package: ComponentManager.MANAGER_RANK),
      );
    } else {
      return Container(
        height: 23,
        width: 28,
        alignment: Alignment.center,
        child: Text(
          '${index + 1}',
          maxLines: 1,
          style: TextStyle(fontSize: 13, color: R.color.secondTextColor),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          top: 5, bottom: 5, start: 14, end: 18),
      child: InkWell(
        onTap: () {
          IPersonalDataManager personalDataManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_PERSONALDATA);
          personalDataManager.openImageScreen(context, rankItem.uid,
              refer: refer);
        },
        child: Row(
          children: <Widget>[
            _buildIndex(),
            DailyRankItemIconWidget(rankItem, 62.0, refer),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: LimitedBox(
                maxWidth: 180,
                child: Text(
                  rankItem.name,
                  maxLines: 1,
                  style: TextStyle(fontSize: 16, color: R.color.mainTextColor),
                ),
              ),
            ),
            R.img(Assets.rank_ic_arrowup_svg,
                width: 16, height: 16, package: ComponentManager.MANAGER_RANK),
            NumText(
              '${rankItem.score}',
              style: const TextStyle(fontSize: 14, color: Color(0xFFFD7B08)),
            ),
          ],
        ),
      ),
    );
  }
}

class DailyRankListWidget extends StatefulWidget {
  final DailyRankType rankType;
  final PageRefer refer;

  const DailyRankListWidget(this.rankType, this.refer, {super.key});

  @override
  _DailyRankListWidgetState createState() => _DailyRankListWidgetState();
}

class _DailyRankListWidgetState extends State<DailyRankListWidget> {
  late _DailyRankLoadingSource _source;

  @override
  void initState() {
    super.initState();
    _source = _DailyRankLoadingSource(widget.rankType, this);
    _source.refresh();
  }

  @override
  void dispose() {
    super.dispose();
    _source.dispose();
  }

  Widget _buildLabel(String text, List<Color> bgColor) {
    return Container(
      alignment: Alignment.center,
      width: 44,
      height: 16,
      decoration: ShapeDecoration(
        shape: const StadiumBorder(
            side: BorderSide(color: Color(0xFFFFF1AB), width: 1)),
        gradient: LinearGradient(colors: bgColor),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 9, color: Colors.white),
      ),
    );
  }

  Widget _buildTop() {
    DailyRankTopItem? rankTopItem = _source.topItem;
    Log.d('Build top, item: $rankTopItem');

    if (rankTopItem == null) return Container();

    return Container(
      margin: const EdgeInsetsDirectional.only(
          top: 16, bottom: 8, start: 18, end: 18),
      padding: const EdgeInsetsDirectional.only(start: 6, end: 8),
      height: 72,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(R.imagePath(Assets.rank_bg_rank_daily_top_webp,
                package: ComponentManager.MANAGER_RANK))),
      ),
      child: InkWell(
        onTap: () => DailyStarScreen.show(context, widget.rankType),
        child: Row(
          children: <Widget>[
            DailyRankItemIconWidget(rankTopItem, 72.0, widget.refer),
            const SizedBox(
              width: 2,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  LimitedBox(
                    child: Text(
                      rankTopItem.name,
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: <Widget>[
                      _buildLabel(K.rank_daily_last_top,
                          [const Color(0xFFFFCF8A), const Color(0xFFFDA252)]),
                      const SizedBox(
                        width: 4,
                      ),
                      _buildLabel(
                          '${K.rank_daily_last_top_times} x${rankTopItem.topDays}',
                          [const Color(0xFFFF99B4), const Color(0xFFFF5F7D)]),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              K.rank_daily_star_title,
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
            R.img(BaseAssets.icon_next_svg,
                color: Colors.white,
                width: 16,
                height: 16,
                package: ComponentManager.MANAGER_BASE_CORE),
          ],
        ),
      ),
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    Log.d('Build indicator with status: $status');

    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return LoadingFooter(
        hasMore: false,
        loadMore: () => {},
      );
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: _source.errorMsg,
        onTap: () {
          _source.refresh();
        },
      );
    }
    if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: BaseK.K.no_data,
        onTap: () {
          _source.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: _source.errorMsg, loadMore: _source.loadMore);
    } else {
      return LoadingFooter(
          hasMore: _source.hasMore, loadMore: _source.loadMore);
    }
  }

  Widget _buildList() {
    LoadingMoreList child =
        LoadingMoreList<DailyRankItem>(ListConfig<DailyRankItem>(
      itemBuilder: (c, item, index) =>
          DailyRankItemWidget(index, item, widget.refer),
      lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
      sourceList: _source,
      indicatorBuilder: _indicatorBuilder,
    ));

    return RefreshIndicatorFactory.of(
      backgroundColor: R.color.mainBgColor,
      child: child,
      onRefresh: () => _source.refresh(),
    );
  }

  _buildTitle() {
    return Container(
      height: 40,
      padding: const EdgeInsetsDirectional.only(
        start: 16,
      ),
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        K.rank_today_title,
        style: TextStyle(
            fontSize: 14,
            color: R.color.mainTextColor,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildTop(),
        _buildTitle(),
        Expanded(child: _buildList()),
      ],
    );
  }
}

class _DailyRankLoadingSource extends LoadingMoreBase<DailyRankItem> {
  final DailyRankType rankType;
  final _DailyRankListWidgetState state;
  static const int _firstPageIndex = 1;

  _DailyRankLoadingSource(this.rankType, this.state);

  int _pageIndex = _firstPageIndex;
  bool _hasMore = true;
  String errorMsg = '';
  DailyRankTopItem? topItem;

  @override
  bool get hasMore => (_hasMore);

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _hasMore = true;
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    if (!isloadMoreAction) {
      _pageIndex = _firstPageIndex;
      _hasMore = true;
    }

    bool loadSuccess = false;
    int page = isloadMoreAction ? _pageIndex + 1 : _pageIndex;
    DailyRankResponse rsp =
        await DailyRankRepository.getRankItems(rankType, page);
    if (rsp.success == true) {
      if (page == _firstPageIndex) {
        topItem = rsp.topItem;
        clear();
        if (state.mounted) {
          state.setState(() {});
        }
      }

      if (rsp.items.isNotEmpty) {
        addAll(rsp.items);
        _pageIndex = page;

        _hasMore = true;
      } else {
        _hasMore = false;
      }

      loadSuccess = true;
    } else {
      errorMsg = rsp.msg ?? '';
      loadSuccess = false;
    }

    return loadSuccess;
  }
}

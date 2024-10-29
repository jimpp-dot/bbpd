import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/shared.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:rank/src/model/entity/charm_achieve_rank_beans.dart';

class RankFameHallItemWidget extends StatelessWidget {
  final RankFameHallItem item;

  const RankFameHallItemWidget({super.key, required this.item});

  Widget _buildDateLabel() {
    return Container(
      width: 68,
      height: 16,
      padding: const EdgeInsetsDirectional.only(start: 22, top: 1),
      alignment: AlignmentDirectional.centerStart,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(R.imagePath(Assets.bg_date_label_webp,
              package: ComponentManager.MANAGER_RANK)),
        ),
      ),
      child: Text(
        item.date,
        maxLines: 1,
        style: const TextStyle(
            fontSize: 9, color: Colors.white, fontWeight: FontWeight.w400),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        IPersonalDataManager personalDataManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        personalDataManager.openImageScreen(context, item.uid,
            refer: const PageRefer('RankFameHall'));
      },
      child: SizedBox(
        width: 106,
        height: 106,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            CommonAvatar(
              path: item.icon,
              size: 106,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            PositionedDirectional(top: 0, start: 0, child: _buildDateLabel()),
            Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  item.name,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 11, color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}

class RankFameHallScreen extends StatefulWidget {
  final CharmAchieveRankType rankType;
  final int tabIndex;

  const RankFameHallScreen(
      {super.key, required this.rankType, required this.tabIndex});

  @override
  _RankFameHallScreenState createState() => _RankFameHallScreenState();

  static Future show(
      BuildContext context, CharmAchieveRankType rankType, int tabIndex) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>
          RankFameHallScreen(rankType: rankType, tabIndex: tabIndex),
      settings: RouteSettings(
          name: '/rank/famehall',
          arguments: {'rankType': rankType, 'tabIndex': tabIndex}),
    ));
  }
}

class _RankFameHallScreenState extends State<RankFameHallScreen> {
  late _RankFameHallLoadingSource _source;

  @override
  void initState() {
    super.initState();
    _source = _RankFameHallLoadingSource(widget.rankType, widget.tabIndex);
    _source.refresh();
  }

  @override
  void dispose() {
    super.dispose();
    _source.dispose();
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
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

  Widget _buildItem(RankFameHallItem item) {
    return Center(
      child: RankFameHallItemWidget(item: item),
    );
  }

  Widget _buildList() {
    LoadingMoreList child =
        LoadingMoreList<RankFameHallItem>(ListConfig<RankFameHallItem>(
      itemBuilder: (c, item, index) => _buildItem(item),
      lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
      sourceList: _source,
      extendedListDelegate:
          const SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
      ),
      indicatorBuilder: _indicatorBuilder,
    ));

    return RefreshIndicatorFactory.of(
      backgroundColor: R.color.mainBgColor,
      child: child,
      onRefresh: () => _source.refresh(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.rank_daily_star_title),
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          padding:
              const EdgeInsetsDirectional.only(start: 20, end: 20, top: 16),
          child: _buildList(),
        ),
      ),
    );
  }
}

class _RankFameHallLoadingSource extends LoadingMoreBase<RankFameHallItem> {
  final CharmAchieveRankType rankType;
  final int tabIndex;

  _RankFameHallLoadingSource(this.rankType, this.tabIndex);

  static const int _firstPageIndex = 1;
  int _pageIndex = _firstPageIndex;
  bool _hasMore = true;
  String errorMsg = '';

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
    RankFameHallResponse rsp =
        await CharmAchieveRankRepository.getFameItems(rankType, tabIndex, page);
    if (rsp.success == true) {
      if (page == _firstPageIndex) {
        clear();
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

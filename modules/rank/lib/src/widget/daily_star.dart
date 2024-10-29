import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/shared.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:rank/src/model/entity/daily_rank_beans.dart';

class DailyStarItemWidget extends StatelessWidget {
  final DailyStarItem item;

  const DailyStarItemWidget({super.key, required this.item});

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
            refer: const PageRefer('DailyStar'));
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

class DailyStarScreen extends StatefulWidget {
  final DailyRankType dailyRankType;

  const DailyStarScreen({super.key, required this.dailyRankType});

  @override
  _DailyStarScreenState createState() => _DailyStarScreenState();

  static Future show(BuildContext context, DailyRankType dailyRankType) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DailyStarScreen(
        dailyRankType: dailyRankType,
      ),
      settings: RouteSettings(
          name: '/rank/daily', arguments: {'dailyRankType': dailyRankType}),
    ));
  }
}

class _DailyStarScreenState extends State<DailyStarScreen> {
  late _DailyStarLoadingSource _source;

  @override
  void initState() {
    super.initState();
    _source = _DailyStarLoadingSource(widget.dailyRankType);
    _source.refresh();
  }

  @override
  void dispose() {
    super.dispose();
    _source.dispose();
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

  Widget _buildItem(DailyStarItem item) {
    return Center(
      child: DailyStarItemWidget(item: item),
    );
  }

  Widget _buildList() {
    LoadingMoreList child =
        LoadingMoreList<DailyStarItem>(ListConfig<DailyStarItem>(
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

class _DailyStarLoadingSource extends LoadingMoreBase<DailyStarItem> {
  final DailyRankType rankType;
  static const int _firstPageIndex = 1;

  _DailyStarLoadingSource(this.rankType);

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
    DailyStarResponse rsp =
        await DailyRankRepository.getStarItems(rankType, page);
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

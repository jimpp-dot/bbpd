import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import '../../k.dart';
import 'anchor_zone_rank_model.dart';
import 'anchor_zone_rank_repository.dart';
import 'package:shared/assets.dart';

class AnchorZoneRankPage extends StatefulWidget {
  final int _groupId;
  final int _type;
  final AnchorZoneRankPageModel? _initModel;
  final String? refer;

  const AnchorZoneRankPage(
      int groupId, int type, AnchorZoneRankPageModel? initModel, this.refer,
      {super.key})
      : _groupId = groupId,
        _type = type,
        _initModel = initModel;

  @override
  _AnchorZoneRankPageState createState() => _AnchorZoneRankPageState();
}

class _AnchorZoneRankPageState extends State<AnchorZoneRankPage>
    with AutomaticKeepAliveClientMixin<AnchorZoneRankPage> {
  final GlobalKey<RefreshIndicatorState> _pageKey =
      GlobalKey<RefreshIndicatorState>();

  late AnchorZoneRankPageRepository _repository;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _repository =
        AnchorZoneRankPageRepository(context, widget._groupId, widget._type);
    _repository.init(widget._initModel);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _buildBody();
  }

  Widget _buildBody() {
    return RefreshIndicatorFactory.of(
      onRefresh: () async {
        _repository.refresh();
      },
      child: NestedScrollViewInnerScrollPositionKeyWidget(
        _pageKey,
        LoadingMoreList(
          ListConfig<AnchorZoneRankItemModel>(
            itemBuilder: (BuildContext context, AnchorZoneRankItemModel item,
                int index) {
              return _RankItemWidget(item, widget.refer);
            },
            sourceList: _repository,
            indicatorBuilder: _indicatorBuilder,
          ),
        ),
      ),
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying)
      return const LoadingFooter(hasMore: true);
    if (status == IndicatorStatus.fullScreenBusying)
      return const Center(child: CupertinoActivityIndicator());
    if (status == IndicatorStatus.noMoreLoad)
      return const LoadingFooter(hasMore: false);
    if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: K.rank_list_error,
        onTap: () {
          _repository.refresh();
        },
      );
    }
    if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: K.rank_list_error, loadMore: _repository.loadMore);
    }
    if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: K.rank_no_data,
        onTap: () {
          _repository.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }
}

class _RankItemWidget extends StatelessWidget {
  final AnchorZoneRankItemModel rankItem;
  final String? refer;

  const _RankItemWidget(this.rankItem, this.refer);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        IPersonalDataManager personalDataManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        await personalDataManager.openImageScreen(context, rankItem.uid,
            refer: PageRefer(refer ?? ''));
      },
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            start: 0.0, end: 16.0, top: 8.0, bottom: 8.0),
        child: Row(
          children: <Widget>[
            Container(
              width: 50.0,
              margin: const EdgeInsetsDirectional.only(end: 5.0),
              alignment: Alignment.center,
              child: _renderIndex(context, rankItem.rank),
            ),
            ClipOval(
              child: rankItem.icon.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: "${System.imageDomain}${rankItem.icon}",
                      errorWidgetType: ErrorWidgetType.defaultUserIcon,
                      suffix: '!head150',
                      width: 56.0,
                      height: 56.0,
                    )
                  : R.img(BaseAssets.shared$ic_user_none_png,
                      package: ComponentManager.MANAGER_BASE_CORE,
                      width: 56.0,
                      height: 56.0),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsetsDirectional.only(start: 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      rankItem.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16.0, color: R.color.mainTextColor),
                    ),
                    _renderInfo(),
                  ],
                ),
              ),
            ),
            NumText(
              '${rankItem.showNum}',
              style: TextStyle(
                color: R.color.thirdBrightColor,
                fontSize: 13.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _renderIndex(BuildContext context, int rank) {
    if (rank <= 3) {
      return R.img(BaseAssets.rank_top_rankx_webp(rank),
          width: 20.0,
          height: 23.0,
          package: ComponentManager.MANAGER_BASE_CORE);
    }
    return NumText('$rank', style: Theme.of(context).textTheme.bodySmall);
  }

  Widget _renderInfo() {
    int age = rankItem.age;
    int sex = rankItem.sex;
    int popularity = rankItem.popularityLevel;
    int vip = rankItem.vipLevel;
    return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (age > 0 && sex > 0)
            Padding(
                padding: const EdgeInsetsDirectional.only(end: 2, top: 6),
                child: UserSexAndAgeWidget(sex: sex, age: age)),
          if (popularity > 0)
            UserPopularity(
                popularityLevel: popularity,
                padding: const EdgeInsetsDirectional.only(end: 2)),
          if (vip > 0) UserVipWidget(vip: rankItem.vipLevel)
        ]);
  }
}

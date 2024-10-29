import 'package:flutter/cupertino.dart';
import 'package:personaldata/k.dart';
import 'package:shared/shared.dart';
import 'package:shared/model/defend_bean.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:personaldata/src/model/defend_bean.dart';
import 'package:shared/k.dart' as BaseK;
import '../widget/defend_relation_item.dart';
import '../widget/special_defend_relation_item.dart';

/// 全部守护关系列表页
class AllDefendRelationScreen extends StatefulWidget {
  final int uid;

  const AllDefendRelationScreen({super.key, this.uid = 0});

  @override
  AllDefendRelationState createState() {
    return AllDefendRelationState();
  }

  static Future<bool?> show(BuildContext context, int uid) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => AllDefendRelationScreen(uid: uid),
      settings: const RouteSettings(name: '/AllDefendRelationScreen'),
    ));
  }
}

class AllDefendRelationState extends State<AllDefendRelationScreen> {
  late AllDefendRepository _repository;
  final bool _defendChanged = false;

  @override
  void initState() {
    super.initState();
    _repository = AllDefendRepository(uid: widget.uid);
    _repository.onRefresh = _onRefresh;
  }

  @override
  void dispose() {
    _repository.dispose();
    super.dispose();
  }

  void _onRefresh() {
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: buildBody(),
      ),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return BaseAppBar.custom(
      onBackPressedCallback: () async {
        Navigator.of(context).pop(_defendChanged);
      },
      title: Text(
        K.personal_all_defend_relation,
        style: TextStyle(fontSize: 17, color: R.color.mainTextColor),
      ),
      actions: [
        if (widget.uid == Session.uid)
          GestureDetector(
            onTap: _onTapExchange,
            child: Container(
              alignment: AlignmentDirectional.center,
              padding: const EdgeInsetsDirectional.only(end: 20),
              child: Text(
                K.personal_star_exchange,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: R.color.mainBrandColor,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget buildBody() {
    return RefreshIndicatorFactory.of(
      onRefresh: () async {
        _repository.refresh();
      },
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          // 上面的横条样式
          if (Util.validList(_repository.specialItems))
            for (DefendRelationModel element in _repository.specialItems)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SpecialDefendRelationItem(
                      item: element, uid: widget.uid, refresh: _onRefresh),
                ),
              ),
          const SliverToBoxAdapter(), // StreamBuilder不能作为customScrollView第一个child,https://github.com/flutter/flutter/issues/55170
          // 下面的网格样式
          LoadingMoreSliverList(
            SliverListConfig<DefendRelationModel>(
              padding: EdgeInsetsDirectional.only(
                  start: 24,
                  end: 24,
                  top: Util.validList(_repository.specialItems) ? 0 : 12,
                  bottom: 12),
              indicatorBuilder: _indicatorBuilder,
              itemBuilder: (c, item, index) {
                return DefendRelationItem(
                  uid: widget.uid,
                  item: item,
                  ratio: (Util.width - 24 - 24 - 20) / 3 / 102,
                  refresh: () async {
                    _repository.refresh();
                  },
                );
              },
              sourceList: _repository,
              lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
              extendedListDelegate:
                  const SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const SliverFillRemaining(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const LoadingFooter(hasMore: false);
    } else if (status == IndicatorStatus.fullScreenError) {
      return SliverFillRemaining(
        child: ErrorData(
          error: BaseK.K.data_error,
          onTap: () {
            _repository.refresh(true);
          },
        ),
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: BaseK.K.data_error, loadMore: _repository.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return const SliverFillRemaining(
        child: SizedBox(),
      );
    }
    return const LoadingFooter(
      hasMore: true,
    );
  }

  _onTapExchange() async {
    IPersonalDataManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    manager.openCpLinkStarExchangePage(context);
  }
}

class AllDefendRepository extends LoadingMoreBase<DefendRelationModel> {
  int uid;
  int _page = 1;
  bool _hasMore = true;
  List<DefendRelationModel> specialItems = [];

  VoidCallback? onRefresh;

  AllDefendRepository({this.uid = 0});

  @override
  bool get hasMore => _hasMore;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _hasMore = true;
    _page = 1;
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;
    try {
      XhrResponse response = await Xhr.getJson(
        "${System.domain}profile/defendList/?version=5&uid=$uid&page=$_page",
        throwOnError: true,
      );
      DefendListResponse defendListResponse =
          DefendListResponse.fromJson(response.value() as Map<String, dynamic>);
      if (_page == 1) {
        specialItems.clear();
        clear();
      }

      bool hasData = defendListResponse.data != null &&
          (defendListResponse.data?.length ?? 0) > 0;

      _hasMore = hasData && (defendListResponse.more == true);

      if (hasData) {
        List<DefendRelationModel> data = defendListResponse.data ?? [];

        List<DefendRelationModel> specialItems = List.from(data);
        specialItems.retainWhere((element) => element.layout == 1);
        specialItems.addAll(specialItems);

        List<DefendRelationModel> otherItems = List.from(data);
        otherItems.retainWhere((element) => element.layout != 1);

        addAll(otherItems);
        _page++;
      }

      if (Util.validList(specialItems) && onRefresh != null) {
        onRefresh!();
      }
      isSuccess = true;
    } catch (e) {
      Log.d(e);
      isSuccess = false;
    }
    return isSuccess;
  }
}

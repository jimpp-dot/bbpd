import 'package:shared/assets.dart';
import 'package:rank/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;
import 'package:shared/k.dart' as BaseK;

import '../../model/history_party_model.dart';

class MoreRecentPartyScreen extends StatefulWidget {
  const MoreRecentPartyScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MoreRecentPartyScreenState();

  static Future show(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const MoreRecentPartyScreen(),
      settings: const RouteSettings(name: "/MoreRecentParty"),
    ));
  }
}

class _MoreRecentPartyScreenState extends State<MoreRecentPartyScreen> {
  late _RecentPartyRepository _repository;

  @override
  void initState() {
    super.initState();

    _repository = _RecentPartyRepository();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: R.color.mainBgColor,
        appBar: BaseAppBar(
          K.rank_all_recent_parties,
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return SafeArea(
        child: Container(
            decoration: BoxDecoration(color: R.color.mainBgColor),
            child: LoadingMoreList(
              ListConfig(
                itemBuilder: (context, item, index) {
                  return _buildList(item);
                },
                sourceList: _repository,
                indicatorBuilder: _indicatorBuilder,
              ),
            )));
  }

  Widget _buildList(dynamic item) {
    return Container(
        margin: const EdgeInsetsDirectional.only(
            start: 16, end: 16, top: 5, bottom: 5),
        child:
            _RecentPartyItem(party: item, onTap: (HistoryPartyModel model) {}));
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const SizedBox();
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: BaseK.K.data_error,
        onTap: () {
          _repository.refresh(true);
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: BaseK.K.data_error, loadMore: _repository.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return const Center(child: EmptyWidget());
    }
    return const LoadingFooter(
      hasMore: true,
    );
  }
}

class _RecentPartyRepository extends LoadingMoreBase {
  int _page = 1;
  final int _pageSize = 40;
  bool _hasMore = true;

  _RecentPartyRepository();

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
      List data = await request();

      if (data.isNotEmpty && _page == 1) {
        clear();
      }

      if (data.isNotEmpty) {
        addAll(data);
        _page++;
        if (data.length < _pageSize) {
          _hasMore = false;
        } else {
          _hasMore = true;
        }
      } else {
        _hasMore = false;
      }

      isSuccess = true;
    } catch (e) {
      Log.d(e);
      isSuccess = false;
    }
    return isSuccess;
  }

  Future<List> request() async {
    List data = [];

    try {
      XhrResponse response = await Xhr.getJson(
        "${System.domain}roomhistory/getByUser?limit=$_pageSize&page=$_page",
        throwOnError: true,
      );
      Map res = response.response as Map;
      if (res['success'] == true) {
        data = res["data"] ?? [];
      } else {}
    } catch (e) {
      Log.d(e);
    }

    return encode(data);
  }

  List encode(List data) {
    List models = [];

    for (var v in data) {
      models.add(HistoryPartyModel.fromJson(v));
    }

    return models;
  }
}

class _RecentPartyItem extends StatelessWidget {
  final HistoryPartyModel party;
  final Function(HistoryPartyModel party)? onTap;

  const _RecentPartyItem({required this.party, this.onTap});

  @override
  Widget build(BuildContext context) {
    Color typeColor = R.color.secondTextColor;

    if (party.typeName != null && party.typeName!.color != null) {
      typeColor = party.typeName!.color!;
    }

    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _onPressed,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [getCardBoxShadow()],
            borderRadius: BorderRadius.circular(12),
            color: R.color.mainBgColor,
          ),
          padding: const EdgeInsetsDirectional.only(
              start: 16, end: 10, top: 14, bottom: 14),
          child: Row(
            children: [
              CommonAvatar(
                  path: System.imageDomain + party.icon,
                  size: 72,
                  shape: BoxShape.circle,
                  fit: BoxFit.cover),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl: party.typeName?.icon ?? "",
                        width: 14,
                        height: 14,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(party.typeName?.show ?? "",
                          style: R.textStyle.title
                              .copyWith(fontSize: 13, color: typeColor),
                          textAlign: TextAlign.start)
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: SizedBox(
                              height: 24,
                              child: Text(party.name,
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis)))
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                ],
              )),
              Container(height: 56, width: 0.5, color: R.color.dividerColor),
              const SizedBox(
                width: 10,
              ),
              _buildHot()
            ],
          ),
        ));
  }

  Widget _buildHot() {
    return SizedBox(
      width: 54,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          R.img(
            BaseAssets.ic_hot_svg,
            width: 16,
            height: 16,
            package: ComponentManager.MANAGER_BASE_CORE,
          ),
          const SizedBox(
            height: 4,
          ),
          NumText(
            party.hot.toString(),
            style: TextStyle(
              color: R.color.mainTextColor.withOpacity(0.2),
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  void _onPressed() {
    if (onTap != null) onTap!(party);
  }
}

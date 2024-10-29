// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:math';

import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared/shared.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;
import 'package:rank/assets.dart';
import 'package:rank/src/api/api.dart';
import 'package:rank/src/model/pb/generated/entertain_rank.pb.dart';

import '../../../k.dart';

class OtherSingleRankTabList extends StatefulWidget {
  final int rankType;
  final int prev;
  final Function(int index) rankeTypeChange;

  const OtherSingleRankTabList(this.rankType, this.prev, this.rankeTypeChange,
      {Key? key})
      : super(key: key);

  @override
  State<OtherSingleRankTabList> createState() => OtherSingleRankTabListState();
}

class OtherSingleRankTabListState extends State<OtherSingleRankTabList>
    with TickerProviderStateMixin {
  ExtendedTabController? tabController;

  @override
  void initState() {
    super.initState();

    // 日、周、月
    safeRun(
      () => tabController =
          ExtendedTabController(initialIndex: 0, length: 3, vsync: this)
            ..addListener(_onTabChange),
    );
  }

  @override
  void dispose() {
    super.dispose();

    tabController!.removeListener(_onTabChange);
    tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int index = tabController!.index;
    return TabBarView(
      physics: const ClampingScrollPhysics(),
      controller: tabController,
      children: [
        OtherSingleRankList(widget.rankType, 1, widget.prev, index == 0),
        OtherSingleRankList(widget.rankType, 2, widget.prev, index == 1),
        OtherSingleRankList(widget.rankType, 3, widget.prev, index == 2),
      ],
    );
  }

  _onTabChange() {
    widget.rankeTypeChange(tabController!.index);
  }
}

class OtherSingleRankList extends StatefulWidget {
  final int rankType;
  final int subType;
  final int prev;
  final bool isCurrentList;

  const OtherSingleRankList(
      this.rankType, this.subType, this.prev, this.isCurrentList,
      {Key? key})
      : super(key: key);

  @override
  State<OtherSingleRankList> createState() => OtherSingleRankListState();
}

class OtherSingleRankListState extends State<OtherSingleRankList>
    with AutomaticKeepAliveClientMixin {
  OtherSingleRankRepository? source;
  int currentPrev = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    currentPrev = widget.prev;
    source = OtherSingleRankRepository(
        context, widget.rankType, widget.subType, widget.prev);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (widget.prev != currentPrev) {
      currentPrev = widget.prev;
      // if (widget.isCurrentList) {
      source!.clear();
      source = OtherSingleRankRepository(
          context, widget.rankType, widget.subType, widget.prev);
      source!.refresh();
      // }
    }

    return LoadingMoreList(ListConfig<EntertainRankItem>(
      itemBuilder: (BuildContext context, EntertainRankItem item, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: rankItem(item),
        );
      },
      sourceList: source!,
      indicatorBuilder: _indicatorBuilder,
    ));
  }

  Widget rankItem(EntertainRankItem item) {
    String cardBgImgUrl = 'static/banban/rank/rank_entertain_card_bg.webp';
    if (item.rank <= 3) {
      cardBgImgUrl =
          'static/banban/rank/rank_entertain_card_bg${item.rank}.webp';
    }
    return SizedBox(
      width: Util.width - 32,
      height: 98,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: cardBgImgUrl,
                fit: BoxFit.cover,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topCenter,
                width: 64,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: const LinearGradient(
                              colors: [Color(0xFFFFE791), Color(0xFFDD37FF)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      padding: const EdgeInsets.all(2),
                      child: CommonAvatar(
                        onTap: () {
                          IPersonalDataManager manager =
                              ComponentManager.instance.getManager(
                                  ComponentManager.MANAGER_PERSONALDATA);
                          manager.openImageScreen(context, item.leftUser.uid);
                        },
                        path: item.leftUser.icon,
                        size: 44,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Flexible(
                        child: Text(
                      item.leftUser.name,
                      style: const TextStyle(
                          color: Color(0xFF3300A3),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ))
                  ],
                ),
              ),
              Container(
                width: 85,
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 9,
                    ),
                    if (item.rank <= 3) ...[
                      R.img(Assets.rank_entertain_card_nox_webp(item.rank),
                          package: ComponentManager.MANAGER_RANK,
                          width: 36,
                          fit: BoxFit.fitWidth)
                    ] else ...[
                      Text(
                        'No.${item.rank}',
                        style: const TextStyle(
                            color: Color(0xFF5834CE),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                    const SizedBox(
                      height: 13,
                    ),
                    Container(
                      width: 64,
                      height: 22,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                R.imagePath(
                                  RoomAssets.defend_ic_defend_tips_x_webp(
                                      min(6, item.defendLevel + 2)),
                                  package: ComponentManager.MANAGER_BASE_ROOM,
                                ),
                              ),
                              fit: BoxFit.fill)),
                      child: Text(
                        item.relation,
                        style: TextStyle(
                            color: [
                              const Color(0xFF8A3E1B),
                              const Color(0xFF25234B),
                              Colors.white
                            ][max(0, min(2, item.defendLevel))],
                            fontSize: 9,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Flexible(
                        child: Text(
                            K.rank_entertain_card_value +
                                Util.numberToShortString(item.score),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: item.rank <= 3
                                    ? const Color(0x99313131)
                                    : const Color(0x99FFFFFF),
                                fontSize: 11))),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                width: 64,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: const LinearGradient(
                              colors: [Color(0xFFFFE791), Color(0xFFDD37FF)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      padding: const EdgeInsets.all(2),
                      child: CommonAvatar(
                        onTap: () {
                          IPersonalDataManager manager =
                              ComponentManager.instance.getManager(
                                  ComponentManager.MANAGER_PERSONALDATA);
                          manager.openImageScreen(context, item.rightUser.uid);
                        },
                        path: item.rightUser.icon,
                        size: 44,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Flexible(
                        child: Text(item.rightUser.name,
                            style: const TextStyle(
                                color: Color(0xFF3300A3),
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis))
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const LoadingFooter(hasMore: false);
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: K.rank_list_error,
        onTap: () {
          source!.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: K.rank_list_error, loadMore: source!.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: K.rank_no_data,
        onTap: () {
          source!.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }
}

class OtherSingleRankRepository extends LoadingMoreBase<EntertainRankItem> {
  final BuildContext context;
  final int rankType;
  final int subType;
  final int prev;

  int page = 1;
  bool _hasMore = true;
  bool forceRefresh = false;

  OtherSingleRankRepository(
      this.context, this.rankType, this.subType, this.prev);

  @override
  bool get hasMore => _hasMore || forceRefresh;

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) async {
    _hasMore = true;
    page = 1;
    forceRefresh = !notifyStateChanged;
    var result = await super.refresh(notifyStateChanged);
    forceRefresh = false;

    return result;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;

    try {
      ResEntertainRank result =
          await Api.getEntertainRankData(rankType, subType, page, prev);
      if (page == 1) {
        clear();
      }

      for (var element in result.data.list) {
        add(element);
      }

      _hasMore = result.data.hasMore;
      page++;
      isSuccess = result.success;
    } catch (exception) {
      isSuccess = false;
    }

    return isSuccess;
  }
}

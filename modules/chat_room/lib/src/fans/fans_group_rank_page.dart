import 'package:chat_room/k.dart';
import 'package:chat_room/src/fans/fans_group_util.dart';
import 'package:chat_room/src/fans/model/fans_group_beans.dart';
import 'package:chat_room/src/fans/repo/fans_group_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/shared.dart';

class FansGroupRankPage extends StatefulWidget {
  final int rid;

  const FansGroupRankPage({Key? key, required this.rid}) : super(key: key);

  @override
  _FansGroupRankPageState createState() => _FansGroupRankPageState();

  static void show(BuildContext context, int rid) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => FansGroupRankPage(
        rid: rid,
      ),
      settings: const RouteSettings(name: '/FansGroupRankPage'),
    ));
  }
}

class _FansGroupRankPageState extends State<FansGroupRankPage>
    with SingleTickerProviderStateMixin {
  late ExtendedTabController _tabController;
  late List<String> _tabs;

  @override
  void initState() {
    super.initState();

    _tabs = [K.room_fans_group_this_week, K.room_fans_group_last_week];
    _tabController = ExtendedTabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(
        backgroundColor: Colors.white,
        backColor: Colors.black,
        K.room_fans_group_rank_title,
        titleColor: Colors.black,
        // actionTitle: K.room_fans_group_prize_rule,
        // actionColor: R.color.secondTextColor,
        // onPressed: () {
        //   _showRule();
        // },
      ),
      body: SafeArea(
        child: showRankListByKey(roomFansKey)
            ? _buildBody()
            : Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    K.room_no_more_data,
                    style: const TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
              ),
      ),
    ).withCommonBgColor(Colors.white);
  }

  Widget _buildBody() {
    // type 1 本周排名 0 上周排名
    return Column(
      children: [
        _buildTab(),
        Expanded(
          child: ExtendedTabBarView(
            controller: _tabController,
            children: [
              FansGroupList(type: 1, rid: widget.rid),
              FansGroupList(type: 0, rid: widget.rid),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTab() {
    return SubTabScrollWidget(
      controller: _tabController,
      tabLabels: _tabs,
      isUseDeflautColor: true,
      selectColor: Colors.black,
      unSelectColor: Colors.black.withOpacity(0.5),
      selectedBgColor: Colors.white,
      allBgColor: const Color(0xFFF7F7F7),
    );
  }
}

class FansGroupList extends StatefulWidget {
  final int type; //0 本周排名 1 上周排名
  final int rid;

  const FansGroupList({Key? key, required this.type, required this.rid})
      : super(key: key);

  @override
  _FansGroupListState createState() => _FansGroupListState();
}

class _FansGroupListState extends State<FansGroupList>
    with AutomaticKeepAliveClientMixin {
  late FansGroupRankSource _source;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _source = FansGroupRankSource(widget.type, widget.rid);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return RefreshIndicatorFactory.of(
      onRefresh: () async {
        _source.refresh();
      },
      child: LoadingMoreList(
        ListConfig(
          itemBuilder:
              (BuildContext context, FansGroupRankItem item, int index) {
            return _buildItem(item, index);
          },
          sourceList: _source,
          indicatorBuilder: _indicatorBuilder,
          lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
        ),
      ),
    );
  }

  Widget _buildItem(FansGroupRankItem item, int index) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {},
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            start: 11, top: 8, end: 16, bottom: 9),
        height: 65,
        child: Row(
          children: [
            if (showRankByKey(roomFansKey)) _buildRankWidget(index),
            const SizedBox(
              width: 5,
            ),
            CommonAvatar(
              path: item.icon,
              size: 48,
              shape: BoxShape.circle,
            ),
            const SizedBox(
              width: 12,
            ),
            Row(
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: Util.width - 295),
                  child: Text(
                    item.name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  K.room_group_rank_item_suffix,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const Spacer(),
            if (showRankScoreByKey(roomFansKey))
              NumText(
                '${FansGroupUtil.scoreToString(item.credit.toString())} ${K.room_fans_group_score}',
                style: const TextStyle(fontSize: 15, color: Color(0xFFF95A97), fontWeight: FontWeight.w800, fontStyle: FontStyle.italic),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildRankWidget(int index) {
    return SizedBox(
      width: 40,
      height: 27,
      child: Center(
        child: FansGroupUtil.fansRankWidget(index),
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
        error: BaseK.K.data_error,
        onTap: () {
          _source.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: BaseK.K.data_error, loadMore: _source.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: BaseK.K.no_data,
        onTap: () {
          _source.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }
}

class FansGroupRankSource extends LoadingMoreBase<FansGroupRankItem> {
  final int type;
  final int rid;

  int page = 1;
  bool _hasMore = true;
  bool forceRefresh = false;

  FansGroupRankSource(this.type, this.rid);

  @override
  bool get hasMore => _hasMore || forceRefresh;

  @override
  Future<bool> refresh([bool clearBeforeRequest = false]) async {
    _hasMore = true;
    page = 1;
    forceRefresh = !clearBeforeRequest;
    var result = await super.refresh(clearBeforeRequest);
    forceRefresh = false;

    return result;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;

    try {
      FansGroupRankRsp result =
          await FansGroupRepo.getFansGroupRankData(rid, type, page);

      if (page == 1) {
        clear();
      }

      result.data?.list.forEach((element) {
        add(element);
      });

      _hasMore = result.data != null && result.data!.list.isNotEmpty;
      page++;
      isSuccess = true;
    } catch (exception, stack) {
      isSuccess = false;
      Log.d(exception);
      Log.d(stack);
    }

    return isSuccess;
  }
}

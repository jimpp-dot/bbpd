import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/base/model/pb/generated/common_reward.pb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;

/// 房间打赏榜-明细
class RankRewardDetailPage extends StatefulWidget {
  final int rid;
  final int gs;
  final String gsName;
  final int uid;

  const RankRewardDetailPage(
      {Key? key,
      required this.rid,
      required this.gs,
      required this.gsName,
      required this.uid})
      : super(key: key);

  @override
  State createState() => _RankRewardDetailPageState();

  static Future show(
      BuildContext context, int rid, int gs, String gsName, int uid) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            RankRewardDetailPage(rid: rid, gs: gs, gsName: gsName, uid: uid),
      ),
    );
  }
}

class _RankRewardDetailPageState extends State<RankRewardDetailPage> {
  late _RankRewardDetailLoadingSource _source;

  @override
  void initState() {
    super.initState();
    _source = _RankRewardDetailLoadingSource(widget.rid, widget.gs, widget.uid);
  }

  @override
  void dispose() {
    _source.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.custom(
        title: _buildTitle(),
      ),
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildTitle() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 100),
          child: Text(
            widget.gsName,
            style: const TextStyle(
                color: Color(0xFF202020),
                fontSize: 18,
                fontWeight: FontWeight.w500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          K.room_rank_reward_detail_title,
          style: const TextStyle(
              color: Color(0xFF202020),
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: LoadingMoreList<RankRewardItem>(
        ListConfig<RankRewardItem>(
          itemBuilder: (context, item, index) {
            return _buildRankRewardItem(item);
          },
          lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
          sourceList: _source,
          indicatorBuilder: _indicatorBuilder,
        ),
      ),
    );
  }

  Widget _buildRankRewardItem(RankRewardItem item) {
    return Container(
      width: double.infinity,
      height: 65,
      alignment: AlignmentDirectional.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              IPersonalDataManager personalDataManager = ComponentManager
                  .instance
                  .getManager(ComponentManager.MANAGER_PERSONALDATA);
              personalDataManager.openImageScreen(context, item.uid,
                  refer: const PageRefer('RankRewardRefer'));
            },
            child:
                CommonAvatar(path: item.icon, size: 48, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        item.name,
                        style: TextStyle(
                            color: R.color.mainTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 4),
                    UserSexAndAgeWidget(sex: item.sex, age: item.age),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  Utility.getDateDiff(item.time),
                  style:
                      const TextStyle(color: Color(0x66202020), fontSize: 11),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          _buildPrice(item.value),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget _buildPrice(int price) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(MoneyConfig.moneyIcon, width: 16, height: 16),
        const SizedBox(width: 2),
        Text(Util.numberToWStringByFloor(price),
            style: TextStyle(color: R.color.mainTextColor, fontSize: 14)),
      ],
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
        error: R.string("no_data"),
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
}

class _RankRewardDetailLoadingSource extends LoadingMoreBase<RankRewardItem> {
  final int rid;
  final int gs;
  final int uid;

  _RankRewardDetailLoadingSource(this.rid, this.gs, this.uid);

  int _pageIndex = 1;
  bool _hasMore = true;
  String errorMsg = '';

  @override
  bool get hasMore => (_hasMore);

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _hasMore = true;
    _pageIndex = 1;
    clear();
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool loadSuccess = false;

    int page = isloadMoreAction ? _pageIndex + 1 : _pageIndex;

    ApiRankRewardResponse resp =
        await RoomApi.getRoomRewardList(2, rid, gs, page, uid: uid, sort: 1);
    if (resp.success) {
      if (resp.data.list.isNotEmpty) {
        addAll(resp.data.list);
        _hasMore = resp.data.more;
        _pageIndex = page;
      } else {
        _hasMore = false;
      }
      loadSuccess = true;
    } else {
      errorMsg = resp.message;
      loadSuccess = false;
    }
    return loadSuccess;
  }
}

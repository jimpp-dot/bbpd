import 'package:chat_room/k.dart';
import 'package:shared/k.dart' as base;
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/base/page/data/room_data_rank_repository.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;
import 'package:chat_room/src/protobuf/generated/room_data.pb.dart';

class RoomDataRankPage extends StatefulWidget {
  final int rid;
  final int type;
  final int startTime; //时间段开启时间
  final int dateTime; //日期开始时间
  final int recent; //7或14天 三个参数选一个

  const RoomDataRankPage(this.rid, this.type,
      {required this.startTime, this.dateTime = 0, this.recent = 0, super.key});

  @override
  _RoomDataRankPageState createState() => _RoomDataRankPageState();
}

class _RoomDataRankPageState extends State<RoomDataRankPage>
    with AutomaticKeepAliveClientMixin {
  late final RoomDataRankRepository _repository;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _repository = RoomDataRankRepository(
      widget.rid,
      widget.type,
      startTime: widget.startTime,
      dateTime: widget.dateTime,
      recent: widget.recent,
    );
    _loadData();
  }

  Future _loadData() async {
    await _repository.refresh();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(color: R.color.mainBgColor, child: _buildContent());
  }

  Widget _buildContent() {
    return ClipRRect(
      borderRadius: const BorderRadiusDirectional.only(
        bottomStart: Radius.circular(12),
        bottomEnd: Radius.circular(12),
      ),
      child: Container(
        color: R.color.mainBgColor,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: <Widget>[
            const SliverToBoxAdapter(),
            LoadingMoreSliverList(
              SliverListConfig<PackageItem>(
                itemBuilder: _buildItem,
                sourceList: _repository,
                indicatorBuilder: _indicatorBuilder,
                autoRefresh: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, PackageItem item, int index) {
    Color color = R.color.thirdTextColor;
    int rank = index + 1;
    String rankStr = '$rank';
    if (rank < 10) {
      rankStr = '0$rankStr';
    }
    if (rank <= 3) {
      color = const Color(0xFFFFD04B);
    }
    String icon = item.senderIcon;
    String name = item.senderName;
    if (widget.type == 2) {
      icon = item.toIcon;
      name = item.toName;
    }
    return Container(
      height: 60,
      color: R.color.mainBgColor,
      child: Row(
        children: [
          Container(
            width: 40,
            alignment: AlignmentDirectional.center,
            child: Text(
              rankStr,
              style: TextStyle(
                fontSize: 13,
                fontFamily: Util.numFontFamily,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w800,
                color: color,
              ),
            ),
          ),
          CommonAvatar(
            path: icon,
            size: 40,
            shape: BoxShape.circle,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    name,
                    style: R.textStyle.medium14,
                    maxLines: 1,
                  ),
                ),
                if (widget.type == 3) const SizedBox(height: 2),
                if (widget.type == 3)
                  Flexible(
                    child: Text(
                      K.room_reception_person + item.toName,
                      style: R.textStyle.regular12
                          .copyWith(color: R.color.secondTextColor),
                      maxLines: 1,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '${item.money}',
            style: TextStyle(
              fontSize: 16,
              fontFamily: Util.numFontFamily,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    Log.d('status:$status');
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const SliverFillRemaining(
        child: Center(
          child: CupertinoActivityIndicator(),
        ),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return const LoadingFooter(hasMore: false);
    } else if (status == IndicatorStatus.fullScreenError) {
      return SliverFillRemaining(
        child: ErrorData(
          onTap: _loadData,
          fontColor: Colors.white.withOpacity(0.4),
        ),
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
        errorMessage: base.K.data_error,
        loadMore: _repository.loadMore,
        textColor: Colors.white.withOpacity(0.4),
      );
    } else if (status == IndicatorStatus.empty) {
      return SliverFillRemaining(
        child: EmptyWidget(
          onTap: _loadData,
          textColor: Colors.white.withOpacity(0.4),
        ),
      );
    }
    return const LoadingFooter(hasMore: true);
  }
}

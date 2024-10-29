import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:shared/k.dart' as base;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;
import 'package:chat_room/src/base/page/data/room_reward_detail_repository.dart';
import 'package:chat_room/src/protobuf/generated/room_data.pb.dart';

class RoomRewardListScreen extends StatefulWidget {
  final int rid;
  final int startTime; //时间段开启时间
  final int dateTime; //日期开始时间
  final int recent; //7或14天 三个参数选一个

  const RoomRewardListScreen(this.rid,
      {this.startTime = 0, this.dateTime = 0, this.recent = 0, super.key});

  @override
  _RoomRewardListScreenState createState() => _RoomRewardListScreenState();

  static show(BuildContext buildContext, int rid, int startTime, int dateTime,
      int recent) {
    return Navigator.of(buildContext).push(
      MaterialPageRoute(
        builder: (context) => RoomRewardListScreen(
          rid,
          startTime: startTime,
          dateTime: dateTime,
          recent: recent,
        ),
        settings: const RouteSettings(name: '/RoomRewardListScreen'),
      ),
    );
  }
}

class _RoomRewardListScreenState extends State<RoomRewardListScreen> {
  late final RoomRewardDetailRepository _repository;

  @override
  void initState() {
    super.initState();
    _repository = RoomRewardDetailRepository(
      widget.rid,
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
    return Scaffold(
      backgroundColor: R.color.mainBgColor,
      appBar: BaseAppBar(K.room_gpk_reward),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return RefreshIndicatorFactory.of(
      onRefresh: _loadData,
      child: Container(
        color: R.color.mainBgColor,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: <Widget>[
            const SliverToBoxAdapter(),
            LoadingMoreSliverList(
              SliverListConfig<RoomDataPackageDetailItem>(
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

  Widget _buildItem(
      BuildContext context, RoomDataPackageDetailItem item, int index) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
          start: 20.0, end: 20.0, top: 11.0, bottom: 12.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: R.color.dividerColor, width: 0.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 2),
                  child: Text(
                    item.senderName,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 16,
                        color: R.color.mainTextColor,
                        height: 1.2),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              NumText(
                '+${MoneyConfig.moneyNum(Util.parseInt(item.money), fractionDigits: 2)}',
                style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                  height: 1.2,
                ),
              ),
              const SizedBox(width: 4),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 2),
                child: Image.asset(MoneyConfig.moneyIcon,
                    width: 20.0, height: 20.0),
              ),
            ],
          ),
          const SizedBox(height: 3),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  item.toName,
                  maxLines: 1,
                  style:
                      TextStyle(fontSize: 13, color: R.color.secondTextColor),
                ),
              ),
              Text(
                '${Utility.formatDateMonthDay(item.dateTime)} ${Utility.formatDateToHourAndMin(item.dateTime)}',
                style: TextStyle(fontSize: 13, color: R.color.secondTextColor),
              )
            ],
          ),
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
      return const LoadingFooter(
        hasMore: false,
      );
    } else if (status == IndicatorStatus.fullScreenError) {
      return SliverFillRemaining(
        child: ErrorData(
            onTap: _loadData, fontColor: Colors.white.withOpacity(0.4)),
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
            onTap: _loadData, textColor: Colors.white.withOpacity(0.4)),
      );
    }
    return const LoadingFooter(hasMore: true);
  }
}

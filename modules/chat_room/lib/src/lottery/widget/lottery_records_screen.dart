import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/lottery/model/lottery_model.dart';
import '../../../k.dart';
import '../lottery_repository.dart';
import 'lottery_winners_screen.dart';
import 'package:loading_more_list/loading_more_list.dart';

/// 抽奖记录列表
class LotteryRecordsScreen extends StatefulWidget {
  final int roomId;

  const LotteryRecordsScreen(this.roomId, {super.key});

  static Future<dynamic> launch(BuildContext context, int roomId) {
    return Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => LotteryRecordsScreen(roomId)));
  }

  @override
  _LotteryRecordsScreenState createState() => _LotteryRecordsScreenState();
}

class _LotteryRecordsScreenState extends State<LotteryRecordsScreen> {
  late LotteryRecordRepository _repository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: R.color.mainBgColor,
        appBar: _buildAppBar(),
        body: _buildBody());
  }

  /// 构建标题栏
  PreferredSizeWidget _buildAppBar() {
    return BaseAppBar(K.room_open_lottery_records);
  }

  /// 构建抽奖记录列表
  Widget _buildBody() {
    return RefreshIndicatorFactory.of(
        onRefresh: () async {
          _repository.refresh();
        },
        child: LoadingMoreList(
          ListConfig<LotteryRecord>(
            padding: const EdgeInsetsDirectional.only(
                start: 20, top: 0, end: 20, bottom: 10),
            itemBuilder: (BuildContext context, LotteryRecord item, int index) {
              return _buildRecordItem(item);
            },
            sourceList: _repository,
            indicatorBuilder: _indicatorBuilder,
          ),
        ));
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
        error: K.room_something_went_wrong,
        onTap: () {
          _repository.refresh();
        },
      );
    }
    if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: K.room_something_went_wrong,
          loadMore: _repository.loadMore);
    }
    if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: K.room_no_data,
        onTap: () {
          _repository.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }

  final Widget separated = Container(color: R.color.dividerColor, height: 1);

  /// 构建抽奖项列表Item
  Widget _buildRecordItem(LotteryRecord item) {
    return InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () async {
          var result = await LotteryWinnersScreen.launch(
              context, widget.roomId, item.id);
          if (result is bool && result) _remove(item.id);
        },
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [_item(item), separated]));
  }

  Widget _item(LotteryRecord item) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 13),
                Text(
                  item.joinWay == LotteryType.TYPE_GIFT
                      ? K.room_lottery_gift_text
                      : K.room_lottery_word_text,
                  style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.createTime,
                  style: TextStyle(
                    color: R.color.thirdTextColor,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 13)
              ]),
          R.img('ic_next_small.svg',
              width: 16,
              color: R.color.thirdTextColor,
              package: ComponentManager.MANAGER_BASE_ROOM)
        ]);
  }

  /// 移除记录
  void _remove(int id) {
    if ((id) <= 0) return;
    int length = _repository.length;
    if (length <= 0) return;
    for (int i = 0; i < length; i++) {
      if (_repository[i].id == id) {
        _repository.removeAt(i);
        if (mounted) setState(() {});
        return;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _repository = LotteryRecordRepository(widget.roomId);
  }

  @override
  void dispose() {
    super.dispose();
  }
}

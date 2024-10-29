import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:shared/model/livePageRespository.dart';
import 'package:chat_room/k.dart';

import '../../../chat_room.dart';
import 'package:shared/k.dart' as BaseK;

typedef ItemCallback = Function(RoomItemModel item);

class RoomPushSubPage extends StatefulWidget {
  final String type;
  final String tabName;
  final ItemCallback? itemCallback;

  const RoomPushSubPage(
      {super.key,
      required this.type,
      required this.tabName,
      this.itemCallback});

  @override
  _RoomPushSubPageState createState() => _RoomPushSubPageState();
}

class _RoomPushSubPageState extends State<RoomPushSubPage>
    with AutomaticKeepAliveClientMixin, ReloadStateMixin {
  late final LivePageRepository _repository;

  String? _errorMessage;

  final ScrollController _scrollController = ScrollController();

  int _lastReloadTime = 0;
  final _maxReloadDurationInMilliSecs = 60 * 1000;

  @override
  void initState() {
    super.initState();

    _lastReloadTime = nowMilliSecs();

    _repository = LivePageRepository(widget.type,
        onRankersUpdated: _onRankerUpdated, source: 'room');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicatorFactory.of(
      onRefresh: _repository.refresh,
      child: CustomScrollView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: <Widget>[
          const SliverToBoxAdapter(),
          LoadingMoreSliverList(
            SliverListConfig<RoomItemModel>(
              itemBuilder: _itemBuilder,
              sourceList: _repository,
              indicatorBuilder: _indicatorBuilder,
              //isLastOne: false
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(covariant RoomPushSubPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.type != oldWidget.type) {
      _repository.clear();
      _repository = LivePageRepository(widget.type, source: 'room');
    }
  }

  @override
  bool get wantKeepAlive => true;

  Widget _itemBuilder(BuildContext context, RoomItemModel item, int index) {
    return Container(
      height: 72,
      margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child: Row(
        children: [
          CommonAvatar(
            path: item.roomIcon,
            sex: item.sex,
            size: 52,
            shape: BoxShape.circle,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.roomName,
                  style: TextStyle(
                      fontSize: 16, color: R.color.mainTextColor, height: 1.2),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                _buildLiveSubInfo(item),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              RoomApi.pushRoomMessage(item.rid, ChatRoomData.getInstance()!.rid)
                  .then((value) {
                if (value.success) {
                  Tracker.instance
                      .track(TrackEvent.room_recommend, properties: {
                    'type': 'public_screen',
                    'rid': Util.parseInt(item.rid),
                    'to_rid': Util.parseInt(ChatRoomData.getInstance()?.rid),
                  });

                  Fluttertoast.showCenter(msg: BaseK.K.send_success);
                } else {
                  Fluttertoast.showCenter(msg: value.msg);
                }
              });
            },
            child: Container(
              padding: const EdgeInsetsDirectional.only(start: 12, end: 6),
              child: R.img(
                RoomAssets.chat_room$icon_push_room_webp,
                width: 24,
                height: 24,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => widget.itemCallback?.call(item),
            child: Container(
              padding: const EdgeInsetsDirectional.only(start: 10),
              child: R.img(
                RoomAssets.chat_room$icon_push_message_webp,
                width: 24,
                height: 24,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLiveSubInfo(RoomItemModel item) {
    String prefix = '';
    if (item.isGameRoom || item.types == 'auto') {
      prefix = '';
    } else if (item.types == 'radio-defend' || item.types == 'live') {
      prefix = '[${K.room_live_prefix}]';
    } else if (item.type == 'ktv') {
      prefix = '[${K.room_owner}]';
    } else {
      prefix = '[${K.room_reception}]';
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: Text(
          '$prefix${item.userName}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 13,
            color: R.color.secondTextColor,
            height: 1.2,
          ),
        )),
        const SizedBox(width: 2),
        R.img(
          item.sex == 1
              ? BaseAssets.shared$ic_male_svg
              : BaseAssets.shared$ic_female_svg,
          width: 12,
          height: 12,
          color:
              item.sex == 1 ? R.color.mainBrandColor : const Color(0xFFFF7E96),
        ),
      ],
    );
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
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
          error: _errorMessage,
          onTap: _repository.refresh,
        ),
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: R.string('data_error'), loadMore: _repository.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return SliverFillRemaining(
        child: ErrorData(
          error: R.string('no_data'),
          onTap: _repository.refresh,
        ),
      );
    }
    return const LoadingFooter(hasMore: true);
  }

  @override
  void reload({bool force = true, animated = true}) {
    int now = nowMilliSecs();
    if (now - _lastReloadTime > _maxReloadDurationInMilliSecs || force) {
      _lastReloadTime = now;
      scrollToTop(animated: animated);
      _repository.refresh();
    }
  }

  @override
  void scrollToTop({bool animated = true}) {
    if (_scrollController.hasClients) {
      if (animated) {
        _scrollController.animateTo(0.0,
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      } else {
        _scrollController.jumpTo(0.0);
      }
    }
  }

  void _onRankerUpdated() {
    if (mounted) {
      setState(() {});
    }
  }
}

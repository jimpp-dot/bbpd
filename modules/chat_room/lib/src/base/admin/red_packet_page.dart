import 'package:shared/shared.dart';
import 'package:chat_room/src/base/repo/room_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;

import '../../../k.dart';
import '../../protobuf/generated/room_package.pb.dart';

/// 红包记录
class RedPacketPage extends StatefulWidget {
  final int rid;

  const RedPacketPage({Key? key, required this.rid}) : super(key: key);

  @override
  State createState() => _RedPacketPageState();
}

class _RedPacketPageState extends State<RedPacketPage>
    with AutomaticKeepAliveClientMixin<RedPacketPage> {
  late _PacketLoadingSource _source;

  @override
  void initState() {
    super.initState();
    _source = _PacketLoadingSource(widget.rid);
  }

  @override
  void dispose() {
    _source.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _buildBody();
  }

  Widget _buildBody() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: LoadingMoreList<BodyRoomPackageRecords_RecordItem>(
        ListConfig<BodyRoomPackageRecords_RecordItem>(
          itemBuilder: (context, item, index) {
            return _buildListItem(item, index);
          },
          cacheExtent: 86,
          lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
          sourceList: _source,
          indicatorBuilder: _indicatorBuilder,
        ),
      ),
    );
  }

  Widget _buildListItem(BodyRoomPackageRecords_RecordItem item, int index) {
    return InkWell(
      onTap: () async {
        IPersonalDataManager manager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        manager.openImageScreen(context, item.uid);
      },
      child: Container(
        height: 86,
        padding: const EdgeInsetsDirectional.only(
            start: 16.0, end: 16.0, top: 8.0, bottom: 8.0),
        child: Row(
          children: <Widget>[
            CommonAvatar(
              path: item.icon,
              shape: BoxShape.circle,
              size: 56,
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsetsDirectional.only(start: 12.0, end: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16.0, color: R.color.mainTextColor),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      K.room_tab_packet_content([(item.fromName)]),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("+${item.money}${MoneyConfig.moneyName}",
                    style: const TextStyle(
                        color: Color(0xFF9569FC),
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 6),
                Text(Utility.formatDateV2(item.dateline),
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 12,
                        fontWeight: FontWeight.normal)),
              ],
            )
          ],
        ),
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
      return LoadingFooter(
        hasMore: false,
        textColor: R.color.mainTextColor,
        loadMore: () => {},
      );
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: _source.errorMsg,
        fontColor: R.color.mainTextColor,
        onTap: () {
          _source.refresh();
        },
      );
    }
    if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: R.string("no_data"),
        fontColor: R.color.mainTextColor,
        onTap: () {
          _source.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: _source.errorMsg,
          textColor: R.color.mainTextColor,
          loadMore: _source.loadMore);
    } else {
      return LoadingFooter(
          hasMore: _source.hasMore,
          textColor: R.color.mainTextColor,
          loadMore: _source.loadMore);
    }
  }

  @override
  bool get wantKeepAlive => true;
}

class _PacketLoadingSource
    extends LoadingMoreBase<BodyRoomPackageRecords_RecordItem> {
  final int rid;
  int _lastId = 0;
  bool _hasMore = true;
  String errorMsg = '';

  _PacketLoadingSource(this.rid);

  @override
  bool get hasMore => (_hasMore);

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    if (isLoading) return Future.value(false);
    _hasMore = true;
    _lastId = 0;
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    if (!isloadMoreAction) {
      _hasMore = true;
      _lastId = 0;
    }
    RspRoomPackageRecords res = await RoomApi.getRoomPacketLst(rid, _lastId);
    if (res.success) {
      if (_lastId == 0) {
        clear();
      }
      _hasMore = res.data.hasMore;
      _lastId = res.data.lastId;
      addAll(res.data.list);
    }
    return true;
  }
}

import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:chat_room/k.dart';
import 'package:shared/k.dart' as BaseK;

class PushUserListPage extends StatefulWidget {
  final RoomItemModel roomItem;

  const PushUserListPage({super.key, required this.roomItem});

  @override
  _PushUserListPageState createState() => _PushUserListPageState();
}

class _PushUserListPageState extends State<PushUserListPage>
    with AutomaticKeepAliveClientMixin, ReloadStateMixin {
  late final NewUserTransferRepository _repository;

  String? _errorMessage;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _repository = NewUserTransferRepository(context);
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
            SliverListConfig<NewUserTransfer>(
              itemBuilder: _itemBuilder,
              sourceList: _repository,
              indicatorBuilder: _indicatorBuilder,
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget _itemBuilder(BuildContext context, NewUserTransfer item, int index) {
    bool selected = item.selected;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        IPersonalDataManager personalDataManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        personalDataManager.openImageScreen(context, item.uid);
      },
      child: Container(
        height: 72,
        margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
        child: Row(
          children: [
            CommonAvatar(
              path: item.icon,
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
                    item.name,
                    style: TextStyle(
                      fontSize: 16,
                      color: R.color.mainTextColor,
                      height: 1.2,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      UserSexAndAgeWidget(sex: item.sex, age: item.age),
                      if (item.rookieTag != null)
                        UserNewTransferWidget(
                          sevenNew: item.rookieTag!.sevenNew,
                          payLevel: item.rookieTag!.payLevel,
                        ),
                      UserVipWidget(vip: item.vipLevel)
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => _itemClick(item),
              child: Container(
                width: 63,
                height: 28,
                alignment: AlignmentDirectional.center,
                decoration: ShapeDecoration(
                  shape: const StadiumBorder(),
                  gradient: LinearGradient(
                    colors: selected
                        ? R.color.darkGradientColors
                        : R.color.mainBrandGradientColors,
                  ),
                ),
                child: Text(
                  selected ? K.room_had_send : K.room_send_message,
                  style: R.textStyle.medium14.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _itemClick(NewUserTransfer item) async {
    if (item.selected) {
      return;
    }
    MessageContent content = MessageContent(
        'text', SendUser(Session.uid.toString(), Session.name, Session.icon));
    content.content = K.room_who_invite_join_room(
        [(Session.name), (widget.roomItem.roomName)]);
    content.extra = json.encode({
      'type': 'invite_room',
      'name': widget.roomItem.roomName,
      'prefix': widget.roomItem.prefix,
      'icon': widget.roomItem.roomIcon,
      'tagName': widget.roomItem.tag.show,
      'rid': widget.roomItem.rid,
      'from': Session.uid.toString(),
      'source': 'gs_recommend', //GS 1v1 推荐房间
    });

    content.sentStatus = 'SENT';
    int? result = await Future.any([
      Im.sendMessage(ConversationType.Private, '${item.uid}', content),
      Future.delayed(const Duration(seconds: 2)),
    ]);
    if (result != null && result > 0) {
      Tracker.instance.track(TrackEvent.room_recommend, properties: {
        'type': '1v1',
        'rid': Util.parseInt(widget.roomItem.rid),
        'to_uid': Util.parseInt(item.uid),
      });

      item.selected = true;
      Fluttertoast.showCenter(msg: BaseK.K.send_success);
      if (mounted) {
        setState(() {});
      }
    } else {
      Fluttertoast.showCenter(msg: BaseK.K.send_failed);
    }
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
  void reload({bool force = true, animated = true}) => _repository.refresh();

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
}

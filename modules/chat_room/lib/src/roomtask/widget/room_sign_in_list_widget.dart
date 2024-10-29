import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/roomtask/model/room_sign_in.dart';

import '../room_task_repo.dart';

/// 房间签到榜
class RoomSignInWidget extends StatefulWidget {
  final ChatRoomData room;

  const RoomSignInWidget({super.key, required this.room});

  @override
  _RoomSignInState createState() => _RoomSignInState();

  static Future show(BuildContext context, ChatRoomData room) {
    return displayModalBottomSheet(
      context: context,
      maxHeightRatio: 1,
      theme: Theme.of(System.context).copyWith(
        canvasColor: Colors.transparent,
        platform: Util.isAndroid ? TargetPlatform.android : TargetPlatform.iOS,
      ),
      builder: (context) {
        return GestureDetector(
          onTap: () {},
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(16),
                      topEnd: Radius.circular(16)),
                  color: R.color.mainBgColor),
              child: RoomSignInWidget(
                room: room,
              )),
        );
      },
    );
  }
}

class _RoomSignInState extends State<RoomSignInWidget> {
  late RoomSignInRepository _repository;

  @override
  void initState() {
    super.initState();
    _repository = RoomSignInRepository(context, widget.room.rid, () {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          BaseAppBar.custom(
            showBack: true,
            title: Text(K.room_sign_list),
            backgroundColor: Colors.transparent,
          ),
          _buildBody(),
        ],
      ),
    );
  }

  _buildBody() {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: Util.height * 0.6),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 78),
            child: LoadingMoreList(
              ListConfig<RoomSignIn>(
                itemBuilder: _buildItem,
                sourceList: _repository,
                indicatorBuilder: _indicatorBuilder,
              ),
            ),
          ),
          if (_repository.my != null)
            PositionedDirectional(
              bottom: 0,
              start: 0,
              end: 0,
              child: Container(
                width: Util.width,
                padding: const EdgeInsetsDirectional.only(top: 3, bottom: 3),
                decoration: BoxDecoration(
                  color: R.color.mainBgColor,
                  borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(12),
                      topEnd: Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                      color: R.color.mainTextColor.withOpacity(0.03),
                      offset: const Offset(0, -4),
                      blurRadius: 4,
                    )
                  ],
                ),
                child: _buildMyItem(context, _repository.my!),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMyItem(BuildContext context, RoomSignIn item) {
    return Container(
      width: Util.width,
      height: 72,
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 6),
          Container(
            width: 40,
            alignment: AlignmentDirectional.center,
            child: Text('${item.rank <= 0 ? '-' : item.rank}',
                style: TextStyle(
                    color: R.color.mainTextColor.withOpacity(0.4),
                    fontSize: 13)),
          ),
          CommonAvatar(path: item.avatar, size: 52, shape: BoxShape.circle),
          const SizedBox(width: 12),
          Expanded(
              child: Text(item.nickname,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyle(color: R.color.mainTextColor, fontSize: 13))),
          const SizedBox(width: 20),
          InkWell(
            onTap: _onSignIn,
            child: Container(
              height: 28,
              padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
              constraints: const BoxConstraints(
                minWidth: 63,
              ),
              alignment: AlignmentDirectional.center,
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                gradient: item.signed == true
                    ? LinearGradient(colors: R.color.darkGradientColors)
                    : LinearGradient(colors: R.color.mainBrandGradientColors),
              ),
              child: Text(
                item.signed == true ? K.room_task_signed : K.room_task_signin,
                style: const TextStyle(fontSize: 13, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, RoomSignIn item, int index) {
    return Container(
      width: Util.width,
      height: 72,
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 6),
          Container(
            width: 40,
            alignment: AlignmentDirectional.center,
            child: _renderRanking(index + 1),
          ),
          CommonAvatar(path: item.avatar, size: 52, shape: BoxShape.circle),
          const SizedBox(width: 12),
          Expanded(
              child: Text(item.nickname,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyle(color: R.color.mainTextColor, fontSize: 13))),
          const SizedBox(width: 20),
          Text(K.room_total_sign,
              style: TextStyle(
                  color: R.color.mainTextColor.withOpacity(0.6), fontSize: 13)),
          const SizedBox(width: 4),
          Text('${item.day}',
              style: const TextStyle(
                  color: Color(0xFFFDA252),
                  fontSize: 13,
                  fontWeight: FontWeight.bold)),
          const SizedBox(width: 4),
          Text(K.room_day,
              style: TextStyle(
                  color: R.color.mainTextColor.withOpacity(0.6), fontSize: 13)),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  /// 排行
  Widget _renderRanking(int rank) {
    if (rank > 0 && rank <= 3) {
      return R.img('task/room_task_ic_rank_$rank.png',
          width: 20,
          height: 23,
          fit: BoxFit.contain,
          package: ComponentManager.MANAGER_BASE_ROOM);
    }
    return Text('$rank',
        style: TextStyle(
            color: R.color.mainTextColor.withOpacity(0.4), fontSize: 13));
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return Container();
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: BaseK.K.base_net_error,
        onTap: () {
          _repository.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: BaseK.K.base_net_error, loadMore: _repository.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: BaseK.K.empty_result,
        onTap: () {
          _repository.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }

  void _onSignIn() {
    if (_repository.my?.signed ?? false) return;
    RoomTaskInfoRepo.roomTaskSignin(widget.room.rid).then((signInRsp) {
      if (signInRsp.success == true) {
        if (mounted) {
          _repository.refresh();
        }
      } else if (signInRsp.msg != null) {
        Fluttertoast.showToast(msg: signInRsp.msg);
      }
    });
  }
}

class RoomSignInRepository extends LoadingMoreBase<RoomSignIn> {
  final BuildContext context;
  final int rid;
  final VoidCallback? onRefreshCallback;
  RoomSignIn? my;
  int page = 1;
  bool _hasMore = true;
  bool forceRefresh = false;

  RoomSignInRepository(this.context, this.rid, this.onRefreshCallback);

  @override
  bool get hasMore => (_hasMore && length < 300) || forceRefresh;

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
      XhrResponse response = await Xhr.getJson(
          '${System.domain}/roomexp/signranks/list?rid=$rid&page=$page',
          throwOnError: true);
      RoomSignInListRsp result =
          RoomSignInListRsp.fromJson(response.value() as Map<String, dynamic>);
      if (page == 1) {
        clear();
        my = result.my;
        if (onRefreshCallback != null) onRefreshCallback!();
      }
      for (var element in result.list) {
        add(element);
      }
      _hasMore = result.more == true;
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

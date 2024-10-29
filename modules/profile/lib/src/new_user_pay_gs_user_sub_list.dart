import 'package:shared/shared.dart';
import 'package:shared/k.dart' as base_k;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/k.dart';
import 'package:profile/src/NewUserPayRepo.dart';
import 'package:profile/src/model/pb/generated/new_user_pay_gs.pb.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;

class NewUserPayGsUserSubList extends StatefulWidget {
  final int dateTab; // 1-今天，2-昨天，3-本周，4-上周

  const NewUserPayGsUserSubList({super.key, required this.dateTab});

  @override
  State<StatefulWidget> createState() => NewUserPayGsUserSubListState();
}

class NewUserPayGsUserSubListState extends State<NewUserPayGsUserSubList>
    with AutomaticKeepAliveClientMixin {
  late _NewUserPayUserLoadingSource _source;

  @override
  void initState() {
    super.initState();
    _source = _NewUserPayUserLoadingSource(widget.dateTab);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return LoadingMoreList<NewUserPayGsItem>(ListConfig<NewUserPayGsItem>(
      itemBuilder: _itemBuilder,
      lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
      sourceList: _source,
      indicatorBuilder: _indicatorBuilder,
    ));
  }

  Widget _itemBuilder(BuildContext context, NewUserPayGsItem item, int index) {
    IRoomManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _onUserClick(context, item);
      },
      child: Padding(
        padding:
            const EdgeInsetsDirectional.only(top: 12, start: 20, bottom: 12),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                CommonAvatar(
                  path: item.icon,
                  size: 64,
                  sex: item.sex,
                  shape: BoxShape.circle,
                ),
                if (item.onlineStatus > 0)
                  const PositionedDirectional(
                    bottom: 0,
                    end: 8,
                    child: OnlineDot(),
                  ),
              ],
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.name,
                    maxLines: 1,
                    softWrap: true,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: R.color.mainTextColor,
                      fontSize: 16,
                      height: 1.2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      if (item.age > 0)
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 4.0),
                          child:
                              UserSexAndAgeWidget(sex: item.sex, age: item.age),
                        ),

                      // 归因新用户标签
                      if (Session.joinBroker == true &&
                          item.rookie.sevenNew > 0 &&
                          item.rookie.payLevel > 0)
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 4.0),
                          child: UserNewTransferWidget(
                              sevenNew: item.rookie.sevenNew,
                              payLevel: item.rookie.payLevel),
                        ),

                      if (item.vip > 0)
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 4.0),
                          child: UserVipWidget(vip: item.vip),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.registerTime,
                    style:
                        TextStyle(color: R.color.secondTextColor, fontSize: 13),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (Util.validStr(item.online))
                  Container(
                    margin: const EdgeInsetsDirectional.only(end: 20),
                    constraints: const BoxConstraints(maxWidth: 120),
                    child: Text(
                      item.online,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 11, color: R.color.secondTextColor),
                    ),
                  ),
                if (manager.chatRoomDataExists() && manager.getRid() > 0)
                  InkWell(
                    onTap: () {
                      _inviteRoom(context, item);
                    },
                    child: Ink(
                      child: Container(
                        alignment: AlignmentDirectional.center,
                        width: 76 * Util.ratio,
                        height: 32 * Util.ratio,
                        margin:
                            const EdgeInsetsDirectional.only(top: 15, end: 20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: R.color.mainBrandGradientColors),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text(
                          K.profile_new_invite_room,
                          style: const TextStyle(
                              fontSize: 13, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _onUserClick(BuildContext context, NewUserPayGsItem item) async {
    _gotoChat(context, item);
  }

  /// 去私聊
  _gotoChat(BuildContext context, NewUserPayGsItem item) {
    if (Session.isLogined == false) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }

    IChatManager chatManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
    chatManager.openUserChatScreen(
      context,
      type: 'private',
      targetId: item.uid,
      title: item.name,
    );

    // Tracker.instance.track(TrackEvent.newface_rank_chat, properties: {
    //   'uid': item.uid,
    // });
  }

  _inviteRoom(BuildContext context, NewUserPayGsItem item) async {
    IRoomManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    if (!manager.chatRoomDataExists() || manager.getRid() == 0) {
      Fluttertoast.showCenter(msg: K.profile_new_invite_not_inroom);
      return;
    }

    String url = '${System.domain}invite/inviteUserJoinRoom';
    try {
      Map<String, String> map = {
        'invite_uid': item.uid.toString(),
        'rid': manager.getRid().toString(),
        'type': 'rookie',
      };

      XhrResponse response =
          await Xhr.postJson(url, map, formatJson: true, throwOnError: true);

      BaseResponse rsp =
          BaseResponse.fromJson(response.value() as Map<String, dynamic>);
      if (rsp.success == true) {
        Fluttertoast.showCenter(msg: K.profile_new_invite_sended);
      } else if (Util.validStr(rsp.msg)) {
        Fluttertoast.showCenter(msg: rsp.msg);
      }
    } catch (e) {
      Fluttertoast.toastException(exp: e);
    }
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
        error: base_k.K.no_data,
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

  @override
  bool get wantKeepAlive => true;
}

class _NewUserPayUserLoadingSource extends LoadingMoreBase<NewUserPayGsItem> {
  final int dateTab;

  int _pageIndex = 1;

  bool _hasMore = true;
  String errorMsg = '';

  _NewUserPayUserLoadingSource(this.dateTab);

  @override
  bool get hasMore => (_hasMore);

  @override
  Future<bool> refresh([bool notifyStateChanged = false]) {
    _hasMore = true;
    _pageIndex = 1;
    return super.refresh(notifyStateChanged);
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool loadSuccess = false;
    int page = isloadMoreAction ? _pageIndex + 1 : _pageIndex;
    ResNewUserPayGsRank resp =
        await NewUserPayRepo.getTransferUserList(dateTab, page);
    if (resp.success) {
      if (page == 1) {
        clear();
      }
      _pageIndex = page;
      addAll(resp.data.rank);
      _hasMore = resp.data.hasMore;
      loadSuccess = true;
    } else {
      errorMsg = resp.msg;
      loadSuccess = false;
    }
    return loadSuccess;
  }
}

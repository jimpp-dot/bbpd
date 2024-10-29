import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';

import '../k.dart';

/// 新转承接已转化列表
class TransferUserPage extends StatefulWidget {
  const TransferUserPage({super.key});

  @override
  _TransferUserPageState createState() => _TransferUserPageState();

  static Future<Object?> launch(BuildContext context) {
    return Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const TransferUserPage()));
  }
}

class _TransferUserPageState extends State<TransferUserPage>
    with TickerProviderStateMixin<TransferUserPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(K.profile_new_user_transfered),
      body: const NewUserTransferPage(),
    );
  }
}

class NewUserTransferPage extends StatefulWidget {
  const NewUserTransferPage({super.key});

  @override
  _NewUserTransferPageState createState() => _NewUserTransferPageState();
}

class _NewUserTransferPageState extends State<NewUserTransferPage> {
  GlobalKey pageKey = GlobalKey();
  late NewUserTransferRepository _repository;

  @override
  void initState() {
    super.initState();

    _repository = NewUserTransferRepository(context);
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return RefreshIndicatorFactory.of(
      onRefresh: () async {
        _repository.refresh();
      },
      child: NestedScrollViewInnerScrollPositionKeyWidget(
        pageKey,
        LoadingMoreList(
          ListConfig<NewUserTransfer>(
            itemBuilder:
                (BuildContext context, NewUserTransfer item, int index) {
              return NewUserTransferItemWidget(item: item);
            },
            sourceList: _repository,
            indicatorBuilder: _indicatorBuilder,
          ),
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
      return const LoadingFooter(hasMore: false);
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: K.profile_list_error,
        onTap: () {
          _repository.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: K.profile_list_error, loadMore: _repository.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: K.profile_list_empty,
        onTap: () {
          _repository.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }
}

class NewUserTransferItemWidget extends StatelessWidget {
  final NewUserTransfer item;

  const NewUserTransferItemWidget({super.key, required this.item});

  Widget _buildItem(BuildContext context, NewUserTransfer item) {
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
                if (item.isOnline > 0)
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
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Text(
                          item.name,
                          maxLines: 1,
                          softWrap: true,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: R.color.mainTextColor,
                              fontSize: 16,
                              height: 1.2,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      if (item.age != 0)
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 4.0),
                          child:
                              UserSexAndAgeWidget(sex: item.sex, age: item.age),
                        ),

                      //新贵
                      if (item.isNewNoble)
                        const Padding(
                          padding: EdgeInsetsDirectional.only(end: 4.0),
                          child: NewNobleWidget(),
                        ),

                      // 归因新用户标签
                      if (Session.joinBroker == true && item.rookieTag != null)
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 4.0),
                          child: UserNewTransferWidget(
                              sevenNew: item.rookieTag?.sevenNew ?? 0,
                              payLevel: item.rookieTag?.payLevel ?? 0),
                        ),

                      if (item.vipLevel > 0)
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 4.0),
                          child: UserVipWidget(vip: item.vipLevel),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.registText,
                    style:
                        TextStyle(color: R.color.secondTextColor, fontSize: 13),
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsetsDirectional.only(end: 20),
                  constraints: const BoxConstraints(maxWidth: 120),
                  child: Text(
                    item.onlineText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 11, color: R.color.secondTextColor),
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
                        width: 63 * Util.ratio,
                        height: 28 * Util.ratio,
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

  _onUserClick(BuildContext context, NewUserTransfer item) async {
    _gotoChat(context, item);
  }

  /// 去私聊
  _gotoChat(BuildContext context, NewUserTransfer item) {
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
    _report(item.uid);
    Tracker.instance.track(TrackEvent.newface_rank_chat, properties: {
      'uid': item.uid,
    });
  }

  _inviteRoom(BuildContext context, NewUserTransfer item) async {
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

      XhrResponse response = await Xhr.postJson(url, map);

      if (response.error != null) {
        Log.d(response.error.toString());
        Fluttertoast.showCenter(msg: response.error.toString());
      }
      try {
        BaseResponse rsp =
            BaseResponse.fromJson(response.value() as Map<String, dynamic>);
        if (rsp.success == true) {
          Fluttertoast.showCenter(msg: K.profile_new_invite_sended);
        }
      } catch (e) {
        Fluttertoast.showCenter(msg: e.toString());
      }
    } catch (e) {
      Fluttertoast.showCenter(msg: e.toString());
    }
  }

  /// 上报服务端
  _report(int uid) async {
    try {
      Xhr.getJson('${System.domain}mate/report/chatrank/?vuid=$uid');
    } catch (e) {
      Log.d(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildItem(context, item);
  }
}

/// 房间里点击 已转化 按钮弹出
class BottomSheetTransferUserPage extends StatefulWidget {
  const BottomSheetTransferUserPage({super.key});

  @override
  _BottomSheetTransferUserPageState createState() {
    return _BottomSheetTransferUserPageState();
  }

  static Future<dynamic> show(BuildContext context) {
    return displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return const BottomSheetTransferUserPage();
        });
  }
}

class _BottomSheetTransferUserPageState
    extends State<BottomSheetTransferUserPage>
    with TickerProviderStateMixin<BottomSheetTransferUserPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Util.height * 2 / 3,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
          color: R.color.mainBgColor,
          borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(16), topEnd: Radius.circular(16))),
      child: Column(
        children: [_buildHeader(), Expanded(child: _buildBody())],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 56,
      width: Util.width,
      alignment: AlignmentDirectional.center,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsetsDirectional.only(start: 20),
                  child: R.img('ic_black_back.webp',
                      width: 24,
                      height: 24,
                      package: ComponentManager.MANAGER_BASE_ROOM),
                ),
              ),
            ],
          ),
          Text(
            K.profile_new_user_transfered,
            style: R.textStyle.medium18,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return const NewUserTransferPage();
  }
}

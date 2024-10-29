import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:profile/src/model/new_user_ranking_bean.dart';

import '../k.dart';

/// 新用户排行榜（从设置页进入的UI）
class NewUserRankScreen extends StatefulWidget {
  const NewUserRankScreen({super.key});

  @override
  _NewUserRankScreenState createState() => _NewUserRankScreenState();

  static Future<Object?> launch(BuildContext context) {
    return Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const NewUserRankScreen()));
  }
}

class _NewUserRankScreenState extends State<NewUserRankScreen>
    with AutomaticKeepAliveClientMixin<NewUserRankScreen> {
  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => Navigator.pop(context)),
        title: Text(
          K.profile_new_user_ranking,
          style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: const NewUserRankPage(),
    );
  }
}

class NewUserRankPage extends StatefulWidget {
  final String? _path;

  const NewUserRankPage({super.key, String? path}) : _path = path;

  @override
  _NewUserRankPageState createState() => _NewUserRankPageState();
}

class _NewUserRankPageState extends State<NewUserRankPage> {
  GlobalKey pageKey = GlobalKey();
  late NewUserRankingRepository _repository;

  @override
  void initState() {
    super.initState();
    _repository = NewUserRankingRepository(context, path: widget._path);
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
          ListConfig<NewUserRanking>(
            itemBuilder:
                (BuildContext context, NewUserRanking item, int index) {
              return _buildItem(item);
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

  Widget _buildItem(NewUserRanking item) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 12, start: 20, bottom: 12),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              GestureDetector(
                onTap: () => _onUserClick(context, item),
                child: CommonAvatar(
                  path: item.icon,
                  size: 64,
                  sex: item.sex,
                  shape: BoxShape.circle,
                ),
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
                GestureDetector(
                  onTap: () => _onUserClick(context, item),
                  child: Row(
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
                    _buildRoomTag(context, item),

                    //新贵
                    if (item.isNewNoble)
                      const Padding(
                        padding: EdgeInsetsDirectional.only(),
                        child: NewNobleWidget(),
                      ),

                    // 归因新用户标签
                    if (Session.joinBroker == true && item.rookieTag != null)
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 4.0),
                        child: UserNewTransferWidget(
                            sevenNew: item.rookieTag!.sevenNew,
                            payLevel: item.rookieTag!.payLevel),
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
                  item.content,
                  style:
                      TextStyle(color: R.color.secondTextColor, fontSize: 13),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (item.phoneModel.isNotEmpty)
                Container(
                  margin: const EdgeInsetsDirectional.only(end: 20),
                  constraints: const BoxConstraints(maxWidth: 120),
                  child: Text(
                    item.phoneModel,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 11, color: R.color.secondTextColor),
                  ),
                ),
              InkWell(
                onTap: () {
                  _gotoChat(context, item);
                },
                child: Ink(
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    width: 63 * Util.ratio,
                    height: 28 * Util.ratio,
                    margin: const EdgeInsetsDirectional.only(top: 15, end: 20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: R.color.mainBrandGradientColors),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      K.profile_go_chat,
                      style: const TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRoomTag(BuildContext context, NewUserRanking item) {
    if (item.roomType != null) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(end: 4.0),
        child: GestureDetector(
          onTap: () => _onUserClick(context, item),
          child: InRoomTag(
            label: item.roomType!.label,
            gradientBgColors: item.roomType!.colors,
          ),
        ),
      );
    }
    return const SizedBox(
      height: 16,
    );
  }

  /// 点击头像、用户名实时请求用户所在所在房间id，如果用户不在房间了进入私聊
  _onUserClick(BuildContext context, NewUserRanking item) async {
    int? rid = 0;
    if (item.rid > 0) {
      /// 点击头像实时请求用户所在所在房间id，如果用户不在房间了进入私聊
      rid = await _getRoomId(item.uid);
    }
    if (rid != null && rid > 0) {
      IRoomManager manager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      manager.openChatRoomScreenShow(context, rid);
    } else {
      _gotoChat(context, item);
    }
  }

  /// 去私聊
  _gotoChat(BuildContext context, NewUserRanking item) {
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

  /// 查询用户所在房间id
  /// [uid] 用户id
  Future<int?> _getRoomId(int uid) async {
    try {
      XhrResponse response = await Xhr.getJson(
          '${System.domain}rush/profile/room?uid=$uid',
          throwOnError: false);
      Map res = response.value();
      if (res['success'] == true && res['data'] != null) {
        return (res['data'] as Map)['rid'] as int;
      }
    } catch (e) {
      Log.d(e.toString());
    }
    return null;
  }

  /// 上报服务端
  _report(int uid) async {
    try {
      Xhr.getJson('${System.domain}mate/report/chatrank/?vuid=$uid');
    } catch (e) {
      Log.d(e);
    }
  }
}

/// 新用户排行榜（从房间底部更多菜单进入的UI）
class BottomSheetNewUserRankPage extends StatefulWidget {
  const BottomSheetNewUserRankPage({super.key});

  @override
  _BottomSheetNewUserRankPageState createState() {
    return _BottomSheetNewUserRankPageState();
  }

  static Future<dynamic> show(BuildContext context) {
    return displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return const BottomSheetNewUserRankPage();
        });
  }
}

class _BottomSheetNewUserRankPageState extends State<BottomSheetNewUserRankPage>
    with AutomaticKeepAliveClientMixin<BottomSheetNewUserRankPage> {
  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return GestureDetector(
      onTap: () {},
      child: Container(
        height: Util.height * 2 / 3,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            color: R.color.mainBgColor,
            borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(16), topEnd: Radius.circular(16))),
        child: Column(
          children: [_buildHeader(), const Expanded(child: NewUserRankPage())],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      height: 56,
      width: Util.width,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          PositionedDirectional(
            start: 0,
            child: GestureDetector(
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
          ),
          Text(
            K.profile_new_user_ranking,
            style: R.textStyle.medium18,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

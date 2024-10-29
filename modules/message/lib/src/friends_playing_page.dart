import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart' hide EmptyWidget;
import 'package:message/k.dart';
import 'package:shared/k.dart' as BaseK;

import 'model/friend_item_beans.dart';

/// 好友在玩列表
class FriendsPlayingPage extends StatefulWidget {
  final PageRefer? refer;

  const FriendsPlayingPage({super.key, this.refer});

  @override
  _FriendsPlayingPageState createState() {
    return _FriendsPlayingPageState();
  }

  static Future show(BuildContext context, {Key? key}) async {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => FriendsPlayingPage(
        key: key,
        refer: const PageRefer('friends_playing'),
      ),
      settings: const RouteSettings(name: 'friends_playing'),
    ));
  }
}

class _FriendsPlayingPageState extends State<FriendsPlayingPage> {
  final IPersonalDataManager _personalDataManager = ComponentManager.instance
      .getManager(ComponentManager.MANAGER_PERSONALDATA);
  final IRoomManager _roomManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);

  final IChatManager _chatManager =
      ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
  late LoadMoreListSource source;

  String? _errorMessage;

  set errorMsg(String? msg) {
    _errorMessage = msg;
  }

  @override
  void initState() {
    super.initState();
    source = LoadMoreListSource(state: this);
    source.refresh();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.homeBgColor,
      appBar: BaseAppBar(
        K.msg_friends_playing,
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backColor: R.colors.mainTextColor,
        titleColor: R.colors.mainTextColor,
        backgroundColor: R.colors.homeBgColor,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
        child: LoadingMoreList<FriendItem>(ListConfig<FriendItem>(
      itemBuilder: (c, item, index) {
        return FriendsPlayingItemWidget(
          item: item,
          onItemTap: () {
            if (item.rid > 0) {
              _roomManager.openChatRoomScreenShow(context, item.rid,
                  from: RoomFrom.follow_list,
                  refer: 'friends_playing',
                  uid: item.uid);
            } else if (item.online) {
              _chatManager.openUserChatScreen(
                context,
                type: 'private',
                targetId: item.uid,
                title: item.name,
              );
            } else {
              _personalDataManager.openImageScreen(context, item.uid,
                  refer: widget.refer);
            }
          },
          onItemIconTop: () => _personalDataManager
              .openImageScreen(context, item.uid, refer: widget.refer),
        );
      },
      sourceList: source,
      indicatorBuilder: _indicatorBuilder,
      lastChildLayoutType: LastChildLayoutType.fullCrossAxisExtent,
    )));
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return const LoadingFooter(hasMore: true);
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      if (source.length < 10) {
        return Container();
      }
      return const LoadingFooter(hasMore: false);
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: _errorMessage,
        fontColor: R.colors.secondTextColor,
        onTap: () {
          source.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(
          errorMessage: _errorMessage, loadMore: source.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return EmptyWidget(
        onTap: () {
          source.refresh();
        },
        textColor: R.colors.secondTextColor,
      );
    }
    return const LoadingFooter(hasMore: true);
  }

  void refresh() {
    if (mounted) setState(() {});
  }
}

class LoadMoreListSource extends LoadingMoreBase<FriendItem> {
  _FriendsPlayingPageState state;

  LoadMoreListSource({required this.state});

  int _pageIndex = 1;

  bool _hasMore = true;

  @override
  bool get hasMore {
    return _hasMore;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    Log.d(
        'friendplaying loadData, isloadMoreAction: $isloadMoreAction, this.length: $length');
    bool success;
    if (isloadMoreAction) {
      // 加载更多
      success = await _loadMore();
    } else {
      // 新加载
      _hasMore = true;
      _pageIndex = 0;
      success = await _loadMore();
    }
    return success;
  }

  Future<bool> _loadMore() async {
    return _load(_pageIndex + 1);
  }

  Future<bool> _load(int page) async {
    String url = '${System.domain}home/friendsPlayinglist?page=$page&v=3';
    try {
      XhrResponse response = await Xhr.postJson(url, {}, throwOnError: true);
      Map res = response.value();
      if (res['success'] == true) {
        dynamic list = res['data'];
        if (list != null && list is List && list.isNotEmpty) {
          if (page == 1) {
            clear();
          }
          for (var item in list) {
            FriendItem friendItem = FriendItem.fromJson(item);
            add(friendItem);
          }
        }
      }
      _pageIndex = page;
      state.errorMsg = null;
      _hasMore = (res['more'] == true);
    } catch (e) {
      String message = e.toString();
      if (e is XhrError && e.code == XhrErrorCode.Domain) {
        message = R.string('network_unavailable');
      }
      state.errorMsg = message;
      return false;
    } finally {
      if (page == 1) {
        state.refresh();
      }
    }
    return true;
  }
}

class FriendsPlayingItemWidget extends StatelessWidget {
  static const double ITEM_EXTENT = 72;

  final FriendItem item;
  final VoidCallback onItemTap;
  final VoidCallback onItemIconTop;

  const FriendsPlayingItemWidget(
      {super.key,
      required this.item,
      required this.onItemTap,
      required this.onItemIconTop});

  Widget _buildUserTag() {
    Color tagColor = const Color(0xFFFF93E5);
    String tagStr = BaseK.K.base_follow;

    switch (item.type) {
      case FriendItemType.follow:
        tagColor = const Color(0xFFFF93E5);
        tagStr = BaseK.K.base_follow;
        break;
      case FriendItemType.friend:
        tagColor = const Color(0xFFFF9579);
        tagStr = BaseK.K.base_friend;
        break;
      case FriendItemType.accompany:
        tagColor = const Color(0xFFFFBC26);
        tagStr = BaseK.K.base_companion_list;
        break;
    }

    return Container(
      height: 14,
      padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
      alignment: AlignmentDirectional.center,
      decoration: ShapeDecoration(
        shape: StadiumBorder(
          side: BorderSide(color: tagColor, width: 0.5),
        ),
      ),
      child: Text(
        tagStr,
        style: TextStyle(
            color: tagColor,
            fontSize: 9,
            fontWeight: FontWeight.w600,
            height: 1),
      ),
    );
  }

  Widget _buildRoomTag() {
    if (item.roomTag?.isNotEmpty ?? false) {
      return InRoomTag(
        label: item.roomTag,
        height: 16,
        fontSize: 9,
        tagEndPadding: 6,
        tagStartPadding: 6,
        labelColor: Colors.white,
        gradientBgColors: item.tagBg,
      );
    } else if (item.online) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            BaseK.K.say_hi,
            style: TextStyle(color: R.colors.mainBrandColor, fontSize: 12),
          ),
          R.img('icon_next_fq.svg',
              width: 16,
              height: 16,
              color: R.colors.mainBrandColor,
              package: ComponentManager.MANAGER_BASE_CORE),
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _buildNameAndTag() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        LimitedBox(
            maxWidth: 125,
            child: Text(
              item.name ?? '',
              style: TextStyle(
                color: R.colors.mainTextColor,
                fontSize: 16,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )),
        const SizedBox(
          width: 4,
        ),
        UserSexAndAgeWidget(
          sex: item.sex,
          age: item.age,
          height: 14,
          width: 31,
        ),
        const SizedBox(
          width: 4,
        ),
        _buildUserTag(),
      ],
    );
  }

  Widget _buildIcon() {
    double iconSize = 52.0;
    return SizedBox(
      width: iconSize,
      height: iconSize,
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: onItemIconTop,
            child: CommonAvatar(
              path: item.icon,
              size: iconSize,
              shape: BoxShape.circle,
            ),
          ),
          (item.roomRole?.isNotEmpty ?? false)
              ? Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Container(
                    height: 12,
                    width: 26,
                    alignment: AlignmentDirectional.center,
                    decoration: ShapeDecoration(
                        color: R.colors.secondBgColor,
                        shape: const StadiumBorder()),
                    child: Text(
                      item.roomRole ?? '',
                      style: TextStyle(
                          color: R.colors.mainTextColor,
                          fontSize: 9,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              : (item.online)
                  ? PositionedDirectional(
                      end: 4,
                      bottom: 0,
                      child: Container(
                        height: 12,
                        width: 12,
                        alignment: AlignmentDirectional.center,
                        decoration: const ShapeDecoration(
                            color: Color(0xFF2EFECE),
                            shape: CircleBorder(
                                side:
                                    BorderSide(color: Colors.white, width: 2))),
                      ),
                    )
                  : const SizedBox()
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onItemTap,
      child: Rext.themeCardContainer(
        height: ITEM_EXTENT,
        alignment: Alignment.center,
        margin:
            const EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 10),
        cornerRadius: 16,
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Row(
          children: <Widget>[
            _buildIcon(),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildNameAndTag(),
                  const SizedBox(
                    height: 2,
                  ),
                  (item.roomName?.isNotEmpty ?? false)
                      ? Row(mainAxisSize: MainAxisSize.min, children: [
                          LimitedBox(
                            maxWidth: 109,
                            child: Text(
                              '[${item.roomName}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: R.colors.secondTextColor,
                                fontFamily: Util.fontFamily,
                              ),
                            ),
                          ),
                          Text(
                            ']',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: R.colors.secondTextColor,
                                fontFamily: Util.fontFamily),
                          ),
                          Text(
                            ' · ${item.onlineNum}${BaseK.K.base_pepole_unit}',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: R.colors.thirdTextColor),
                          )
                        ])
                      : Text(
                          item.onlineDesc,
                          style: TextStyle(
                            color: R.colors.thirdTextColor,
                            fontSize: 13,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            _buildRoomTag(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildItem(context);
  }
}

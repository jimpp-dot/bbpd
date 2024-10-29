import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:message/assets.dart';
import 'package:message/k.dart';
import 'package:message/src/model/add_friend_bean.dart';
import 'package:message/src/phone_friend_screen.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/shared.dart';

/// 添加好友
class FriendAddScreen extends StatefulWidget {
  final bool showStranger;

  const FriendAddScreen({super.key, this.showStranger = true});

  @override
  _ScreenState createState() => _ScreenState();

  static void show(BuildContext context, {Key? key, bool showStranger = false, String refer = ''}) {
    Tracker.instance.track(TrackEvent.friendaddscreen_view, properties: {'refer': refer});

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FriendAddScreen(key: key, showStranger: showStranger),
        settings: const RouteSettings(name: '/friendadd'),
      ),
    );
  }
}

class _ScreenState extends State<FriendAddScreen> {
  final bool _loading = false;

  _ScreenState() : super();

  void _onShare(String type) async {
    if (!Session.isLogined) {
      ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }
    ISettingManager settingManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    settingManager.shareDirect(context, Session.uid, type);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ISearchManager searchManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_SEARCH);
    Widget searchBar = searchManager.buildSearchBar(context, true);

    double iconSize = 66;
    double wrapWidgetWidth = Util.width / 4;
    EdgeInsetsGeometry padding = const EdgeInsetsDirectional.only(bottom: 3);

    List<Widget> widgets = [
      searchBar,
      Container(
        padding: const EdgeInsetsDirectional.only(top: 8, bottom: 20),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: R.colors.dividerColor,
                width: 32,
                height: 0.5,
              ),
              const SizedBox(
                width: 8,
              ),
              GestureDetector(
                onTap: () {
                  if (Session.isLogined) {
                    Clipboard.setData(ClipboardData(text: '${Session.uid}'));
                    Toast.show(context, K.msg_id_copied);
                  }
                },
                child: Text(
                  K.msg_my_id + Utility.uidToString(Session.uid.toString()),
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: R.colors.thirdTextColor),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                color: R.colors.dividerColor,
                width: 32,
                height: 0.5,
              ),
            ],
          ),
        ),
      ),
    ];

    ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    List<Widget> platforms = [];

    loginManager.getThirdPlatforms().forEach((platform) {
      bool isWx = platform.tag() == 'wechat';
      bool isQQ = platform.tag() == 'qq';
      String imgPath = '';
      if (isWx) {
        imgPath = darkMode ? Assets.assets_images_message_addfriend_wx_dark_png : Assets.assets_images_message_addfriend_wx_png;
      } else if (isQQ) {
        imgPath = darkMode ? Assets.assets_images_message_addfriend_qq_dark_png : Assets.assets_images_message_addfriend_qq_png;
      }

      if (platform.supportAddFriend()) {
        platforms.add(
          GestureDetector(
            onTap: () {
              _onShare(platform.tag());
            },
            child: Container(
              width: wrapWidgetWidth,
              padding: padding,
              child: Column(
                children: [
                  R.img(imgPath, width: iconSize, height: iconSize, package: ComponentManager.MANAGER_MESSAGE),
                  const SizedBox(height: 8),
                  Text(
                    platform.getName() + BaseK.K.base_friend,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: R.colors.secondTextColor),
                  )
                ],
              ),
            ),
          ),
        );
      }
    });

    platforms.addAll([
      GestureDetector(
        onTap: () {
          PhoneFriendScreen.show(context);
        },
        child: Container(
          width: wrapWidgetWidth,
          padding: padding,
          child: Column(
            children: [
              R.img(darkMode ? Assets.assets_images_message_addfriend_phone_dark_png : Assets.assets_images_message_addfriend_phone_png,
                  width: iconSize, height: iconSize, package: ComponentManager.MANAGER_MESSAGE),
              const SizedBox(
                height: 8,
              ),
              Text(
                K.msg_add_phone_contacts,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: R.colors.secondTextColor),
              )
            ],
          ),
        ),
      ),
      if (widget.showStranger)
        GestureDetector(
          onTap: () {
            ICategorySelectorManager categorySelectorManager =
                ComponentManager.instance.getManager(ComponentManager.MANAGER_CATEGORY_SELECTOR);
            categorySelectorManager.openSearchCondition(context);
          },
          child: Container(
            width: wrapWidgetWidth,
            padding: padding,
            child: Column(
              children: [
                R.img(
                    darkMode
                        ? Assets.assets_images_message_addfriend_new_stranger_dark_png
                        : Assets.assets_images_message_addfriend_stranger_png,
                    width: iconSize,
                    height: iconSize,
                    package: ComponentManager.MANAGER_MESSAGE),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  K.msg_addfriend_stranger,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: R.colors.secondTextColor),
                )
              ],
            ),
          ),
        ),
    ]);

    widgets.add(
      Wrap(
        runSpacing: 10,
        children: platforms,
      ),
    );

    widgets.addAll([
      const SizedBox(height: 26),
      Container(
        height: 0.5,
        margin: const EdgeInsetsDirectional.only(start: 20, end: 20),
        color: R.colors.dividerColor,
      ),
    ]);

    widgets.add(const Expanded(child: RecommendFriendsPage()));

    return Scaffold(
      backgroundColor: R.colors.homeBgColor,
      appBar: BaseAppBar(
        K.msg_add_friend,
        statusBrightness: darkMode ? Brightness.dark : Brightness.light,
        backColor: R.colors.mainTextColor,
        titleColor: R.colors.mainTextColor,
        backgroundColor: R.colors.homeBgColor,
      ),
      body: Center(
        child: _loading
            ? const CircularProgressIndicator()
            : Column(
                children: widgets,
              ),
      ),
    );
  }
}

class RecommendFriendsPage extends StatefulWidget {
  const RecommendFriendsPage({super.key});

  @override
  _RecommendFriendsPageState createState() => _RecommendFriendsPageState();
}

class _RecommendFriendsPageState extends State<RecommendFriendsPage> {
  late RecommendFriendsSource _source;

  @override
  void initState() {
    super.initState();

    _source = RecommendFriendsSource();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(top: 26, bottom: Util.iphoneXBottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 20, bottom: 5, end: 20),
            child: Row(
              children: [
                Text(
                  K.follow_friends,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: R.colors.mainTextColor),
                ),
                const Spacer(),
                GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      width: 80,
                      height: 20,
                      margin: const EdgeInsetsDirectional.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          R.img(
                            'add_friend_change_another.webp',
                            color: R.colors.mainTextColor,
                            package: ComponentManager.MANAGER_MESSAGE,
                            width: 16,
                            height: 16,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(K.msg_addfriend_change_another, style: TextStyle(fontSize: 13, color: R.colors.thirdTextColor))
                        ],
                      ),
                    ),
                    onTap: () async {
                      await _source.refresh();
                    })
              ],
            ),
          ),
          Expanded(
              child: RefreshIndicatorFactory.of(
            onRefresh: () async {
              await _source.refresh();
            },
            child: LoadingMoreList(
              ListConfig(
                itemBuilder: (BuildContext context, RecommendFriendItem item, int index) {
                  return _buildItem(item);
                },
                sourceList: _source,
                indicatorBuilder: _indicatorBuilder,
              ),
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildItem(RecommendFriendItem item) {
    return Rext.themeCardContainer(
      cornerRadius: 16,
      margin: const EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 10),
      padding: const EdgeInsetsDirectional.all(10),
      height: 68,
      child: Row(
        children: [
          StatusAvatar(
            roomName: item.tagInfo?.show,
            roomIcon: item.tagInfo?.acuteIcon,
            colors: Util.parseColors(item.tagInfo?.bgColors),
            userAvatar: System.imageDomain + item.icon!,
            uid: item.uid,
            rid: item.rid,
            avatarRadius: 24,
            radius: 27,
            onTap: () {
              if (item.rid > 0) {
                IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
                roomManager.openChatRoomScreenShow(context, item.rid, refer: "friend_add_screen", uid: item.uid);
              } else {
                IPersonalDataManager personalDataManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_PERSONALDATA);
                personalDataManager.openImageScreen(context, item.uid, refer: const PageRefer("friend_add_screen"));
              }
            },
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(end: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          item.name ?? '',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: R.colors.mainTextColor),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      UserSexWidget(
                        sex: item.sex,
                        size: 14,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    item.reason ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(fontSize: 12, color: R.colors.thirdTextColor),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              if (item.follow == 0) {
                //关注
                NormalNull response = await BaseRequestManager.onFollow(item.uid.toString(), refer: 'friends_recommend');
                if (response.success) {
                  if (mounted) {
                    setState(() {
                      item.follow = 1;
                    });
                  }
                } else {
                  Fluttertoast.showToast(msg: response.msg, gravity: ToastGravity.CENTER);
                }
              } else {
                //打招呼
                IChatManager chatManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
                chatManager.openUserChatScreen(
                  context,
                  type: 'private',
                  targetId: item.uid,
                  title: item.name,
                );
              }
            },
            child: Container(
              alignment: Alignment.center,
              width: 63,
              height: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                gradient: LinearGradient(
                  colors: R.colors.mainBrandGradientColors,
                ),
              ),
              child: Text(
                item.follow == 0 ? K.msg_addfriend_follow : K.msg_addfriend_greet,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: R.colors.brightTextColor),
              ),
            ),
          ),
          SizedBox(
            width: item.follow == 0 ? 5 : 35,
          ),
          if (item.follow == 0)
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                _notRecommend(item);
              },
              child: Container(
                alignment: Alignment.center,
                width: 30,
                height: 30,
                child: R.img('message_addfriend_close.webp',
                    color: R.colors.mainTextColor, width: 16, height: 16, package: ComponentManager.MANAGER_MESSAGE),
              ),
            ),
        ],
      ),
    );
  }

  /// 下次不再推荐
  void _notRecommend(RecommendFriendItem? item) async {
    if (item == null || item.uid <= 0) return;

    try {
      String url = '${System.domain}friend/recommendrefuse';
      Map<String, String> params = {'refuse_uid': item.uid.toString()};

      XhrResponse response = await Xhr.postJson(url, params, throwOnError: false);
      BaseResponse res = BaseResponse.fromJson(response.value() as Map<String, dynamic>);

      if (res.success == true) {
        if (mounted) {
          setState(() {
            _source.remove(item);
          });
        }
      } else {
        Fluttertoast.showCenter(msg: res.msg);
      }
    } catch (e) {
      Fluttertoast.showCenter(msg: e.toString());
    }
  }

  Widget _indicatorBuilder(BuildContext context, IndicatorStatus status) {
    if (status == IndicatorStatus.loadingMoreBusying) {
      return LoadingFooter(
        hasMore: true,
        textColor: R.colors.secondTextColor,
      );
    } else if (status == IndicatorStatus.fullScreenBusying) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (status == IndicatorStatus.noMoreLoad) {
      return LoadingFooter(
        hasMore: false,
        textColor: R.colors.secondTextColor,
      );
    } else if (status == IndicatorStatus.fullScreenError) {
      return ErrorData(
        error: BaseK.K.data_error,
        fontColor: R.colors.secondTextColor,
        onTap: () {
          _source.refresh();
        },
      );
    } else if (status == IndicatorStatus.error) {
      return LoadingFooter(errorMessage: BaseK.K.data_error, textColor: R.colors.secondTextColor, loadMore: _source.loadMore);
    } else if (status == IndicatorStatus.empty) {
      return ErrorData(
        error: BaseK.K.no_data,
        fontColor: R.colors.secondTextColor,
        onTap: () {
          _source.refresh();
        },
      );
    }
    return const LoadingFooter(hasMore: true);
  }
}

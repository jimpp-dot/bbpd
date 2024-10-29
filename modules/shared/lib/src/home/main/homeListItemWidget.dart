import 'dart:convert';

import 'package:shared/shared.dart';
import 'package:shared/k.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'followButton.dart';

class HomeListItemWidget extends StatefulWidget {
  static const double height = 92.0;

  final ListItem? item;
  final ValueChanged<ListItem?>? onFollowClick; //关注点击
  final ValueChanged<ListItem?>? onChatClick; //聊天点击
  final bool follow; //取值为item中的follow和操作产生的关注结果
  final ValueChanged<ListItem?>? onItemClick; //item点击
  final ValueChanged<ListItem?>? onImageClick; //图片点击
  final List<String>? followUids; //已关注uid列表
  final ValueChanged<ListItem?>? onPhotoClick; // 海报图点击

  final PageRefer? refer;
  final bool suppDark;

  const HomeListItemWidget({
    Key? key,
    this.item,
    this.onFollowClick,
    this.onChatClick,
    this.follow = false,
    this.onItemClick,
    this.onImageClick,
    this.followUids,
    this.onPhotoClick,
    this.refer,
    this.suppDark = false,
  }) : super(key: key);

  @override
  _HomeListItemWidgetState createState() => _HomeListItemWidgetState();
}

class _HomeListItemWidgetState extends State<HomeListItemWidget> {
  static double photoWidth = (Util.width - 72 - 16 - 12 - 18 - 4) / 3;
  static double photoLeft = (photoWidth - 32) / 2;

  static double photosBottom = 8;

  bool showPhotos = false;

  Widget _renderTag(BuildContext context) {
    if (widget.item != null && widget.item!.inRoom > 0) {
      if (widget.item!.room_tag_new.isEmpty) {
        return Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsetsDirectional.only(end: 4.0),
              child: Text(
                K.playing,
                style: TextStyle(
                    color: widget.suppDark
                        ? R.colors.secondTextColor
                        : R.color.secondTextColor,
                    fontSize: 12.0),
              ),
            ),
            const Spacer(),
            if (!widget.item!.isBShowType) _renderFollowChat(),
          ],
        );
      } else {
        return Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsetsDirectional.only(end: 4.0),
              alignment: Alignment.center,
              child: Text(
                K.playing,
                style: TextStyle(
                    color: widget.suppDark
                        ? R.colors.secondTextColor
                        : R.color.secondTextColor,
                    fontSize: 12.0),
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(end: 2.0),
              alignment: Alignment.center,
              child: Text(
                widget.item!.room_tag_new,
                style: TextStyle(
                    color: widget.suppDark
                        ? R.colors.mainBrandColor
                        : R.color.mainBrandColor,
                    fontSize: 12.0),
              ),
            ),
            const Spacer(),
            // B模式tag不展示followchat
            if (!widget.item!.isBShowType) _renderFollowChat(),
          ],
        );
      }
    }
    bool god = false;
    if (widget.item != null &&
        widget.item!.pid > 0 &&
        !widget.item!.isInterests) {
      god = true;
    }

    if (widget.item?.cName != null &&
        widget.item!.cName.isNotEmpty &&
        Util.unverifiedSkill(widget.item!.pid) == false) {
      Widget tagWidget = Row(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text(
              god ? K.want_to_be_invited : K.want_to_play,
              style: TextStyle(
                  color: widget.suppDark
                      ? R.colors.secondTextColor
                      : R.color.secondTextColor,
                  fontSize: 12.0),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 4.0, right: 4.0),
            alignment: Alignment.center,
            child: Text(
              widget.item!.cName,
              style: TextStyle(
                  color: widget.suppDark
                      ? R.colors.mainBrandColor
                      : R.color.mainBrandColor,
                  fontSize: 12.0),
            ),
          ),
        ],
      );

      List<String> audio = widget.item!.audio.split(':');
      String? audioUrl;
      int? duration;
      if (audio.length == 2 &&
          audio[0].isNotEmpty &&
          Util.parseInt(audio[1]) > 0) {
        audioUrl = System.imageDomain + audio[0];
        duration = Util.parseInt(audio[1]);
      }

      return Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsetsDirectional.only(end: 12.0),
            padding: widget.item!.isBShowType
                ? const EdgeInsets.only(top: 0, bottom: 6.0)
                : const EdgeInsets.only(top: 3.0, bottom: 3.0),
            child: SoundButton(
              audioUrl: audioUrl,
              duration: duration,
              tagWidget: tagWidget,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          if (!widget.item!.isBShowType) _renderFollowChat(),
        ],
      );
    }
    if (widget.item?.isBShowType ?? false) {
      return const SizedBox(height: 22);
    } else {
      return const SizedBox.shrink();
    }
  }

  GlobalKey<FollowButtonState>? _followButton;

  Widget _renderFollowChat() {
    _followButton = GlobalKey<FollowButtonState>();
    return FollowButton(
      key: _followButton,
      item: widget.item,
      onFollowClick: widget.onFollowClick ?? _onFollow,
      onChatClick: widget.onChatClick ?? _onChat,
      follow: widget.follow,
    );
  }

  Widget _renderImageWidget(BuildContext context, ListItem? item) {
    return CommonAvatar(
      path: item?.icon,
      sex: item?.sex,
      size: 72,
      shape: BoxShape.circle,
      onTap: () {
        if (widget.onImageClick != null) {
          widget.onImageClick!(item);
        } else {
          _onTapImage(item);
        }
      },
    );
  }

  Widget _renderImage(BuildContext context, ListItem? item) {
    return SizedBox.fromSize(
      size: const Size(72, 72),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _renderImageWidget(context, item),
          if (item != null && item.inRoom > 0)
            PositionedDirectional(
              end: 0.0,
              bottom: 0.0,
              child: Container(
                width: 22.0,
                height: 22.0,
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 2.0, color: const Color(0xFFFFFFFF)),
                  borderRadius: BorderRadius.circular(11.0),
                  color: widget.suppDark
                      ? R.colors.mainBrandColor
                      : R.color.mainBrandColor,
                ),
                alignment: Alignment.center,
                child: R.img(
                  "living_small.webp",
                  package: ComponentManager.MANAGER_BASE_CORE,
                  width: 14.0,
                  height: 14.0,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _renderInfo(BuildContext context, ListItem? item) {
    return Container(
      padding: const EdgeInsets.only(bottom: 2),
      constraints: BoxConstraints(
          maxWidth: (widget.item?.isBShowType ?? false)
              ? Util.width
              : Util.width - 160.0),
      child: (widget.item?.isBShowType ?? false)
          ? Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    item?.sign ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        color: widget.suppDark
                            ? R.colors.secondTextColor
                            : R.color.secondTextColor,
                        fontSize: 14.0,
                        height: 1.2),
                  ),
                ),
                _renderFollowChat()
              ],
            )
          : Text(
              item?.sign ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                  color: widget.suppDark
                      ? R.colors.secondTextColor
                      : R.color.secondTextColor,
                  fontSize: 14.0,
                  height: 1.2),
            ),
    );
  }

  Widget _renderDistance(BuildContext context, ListItem? item) {
    String display = item?.onlineStatusStr ?? '';
    if (item != null && item.distanceStr.isNotEmpty) {
      display = '${item.distanceStr} · $display';
    }

    return Container(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 160.0),
      child: Text(
        display,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: widget.suppDark
                ? R.colors.secondTextColor
                : R.color.secondTextColor,
            fontSize: 12),
      ),
    );
  }

  Widget _renderSexAndAge(int age, int sex) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 4, end: 4, top: 1.5),
      child: UserSexAndAgeWidget(sex: sex, age: age),
    );
  }

  Widget _renderBasic(BuildContext context, ListItem? item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: SizedBox(
        height: 26,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      item?.nickName ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 16.0,
                          color: widget.suppDark
                              ? R.colors.mainTextColor
                              : R.color.mainTextColor),
                    ),
                  ),
                  _renderSexAndAge(item?.age ?? 0, item?.sex ?? 0),
                ],
              ),
            ),
            _renderDistance(context, item),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    context = context;

    showPhotos =
        (widget.item?.photos != null && widget.item!.photos!.length >= 3);

    return Material(
      color: widget.suppDark ? R.colors.mainBgColor : R.color.mainBgColor,
      child: Column(
        children: <Widget>[
          _renderNormalBody(),
          if (showPhotos) _renderPhotos(),
        ],
      ),
    );
  }

  Widget _renderNormalBody() {
    return Stack(
      children: <Widget>[
        InkWell(
          onTap: () {
            if (widget.onItemClick != null) {
              widget.onItemClick!(widget.item);
            } else {
              _onTapItem(widget.item);
            }
          },
          child: Container(
            height: showPhotos
                ? HomeListItemWidget.height - photosBottom
                : HomeListItemWidget.height,
            padding: EdgeInsets.only(
                left: R.dimen.defaultScreenMarginLeft,
                right: R.dimen.defaultScreenMarginRight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _renderImage(context, widget.item),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _renderBasic(context, widget.item),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: (widget.item?.isBShowType ?? false)
                              ? <Widget>[
                                  _renderTag(context),
                                  _renderInfo(context, widget.item),
                                ]
                              : <Widget>[
                                  _renderInfo(context, widget.item),
                                  _renderTag(context),
                                ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        PositionedDirectional(
          bottom: 0,
          end: 0,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              _followButton?.currentState?.performTap();
            },
            child: const SizedBox(width: 60, height: 60),
          ),
        )
      ],
    );
  }

  Widget _renderPhotos() {
    return Container(
      margin: EdgeInsets.only(bottom: photosBottom),
      padding: const EdgeInsets.only(left: 18, right: 18),
      height: photoWidth,
      alignment: AlignmentDirectional.topStart,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(child: Container()),
          _renderPhoto(
              widget.item?.photos?[0].image, widget.item?.photos?[0].type, 0),
          Container(
            width: 2,
          ),
          _renderPhoto(
              widget.item?.photos?[1].image, widget.item?.photos?[1].type, 1),
          Container(
            width: 2,
          ),
          _renderPhoto(
              widget.item?.photos?[2].image, widget.item?.photos?[2].type, 2),
        ],
      ),
    );
  }

  Widget _renderPhoto(String? url, String? type, int index) {
    // 第一张海报图跟文字左对齐，适配不同的手机宽度

    if (url == null || url.isEmpty) {
      return SizedBox(
        width: photoWidth,
        height: photoWidth,
      );
    }
    String photoUrl = url.startsWith("http") ? url : System.imageDomain + url;

    return SizedBox(
      width: photoWidth,
      height: photoWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: InkWell(
          onTap: () {
            widget.item?.clickPhotoIndex = index;
            if (widget.onPhotoClick != null) {
              widget.onPhotoClick!(widget.item);
            }
          },
          child: Stack(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: photoUrl,
                suffix: '!head150',
                placeholder: const CupertinoActivityIndicator(),
                width: photoWidth,
                height: photoWidth,
              ),
              if (type == 'video')
                PositionedDirectional(
                  start: photoLeft,
                  top: photoLeft,
                  child: R.img('home/icon_videoplay.svg',
                      width: 32, package: ComponentManager.MANAGER_BASE_CORE),
                )
            ],
          ),
        ),
      ),
    );
  }

  void _onFollow(ListItem? item) async {
    if (!Session.isLogined) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }

    if (item == null) return;

    NormalNull response =
        await BaseRequestManager.onFollow(item.uid.toString());
    if (response.success) {
      Fluttertoast.showToast(msg: K.followed, gravity: ToastGravity.CENTER);
      if (widget.followUids != null) {
        if (!widget.followUids!.contains(item.uid.toString())) {
          widget.followUids!.add(item.uid.toString());
        }
      }
    } else {
      if (response.msg.isNotEmpty) {
        Fluttertoast.showToast(msg: response.msg, gravity: ToastGravity.CENTER);
      }
      if (mounted) {
        setState(() {
          //关注失败,需要重新刷新
        });
      }
    }
  }

  void _onChat(ListItem? item) async {
    if (!Session.isLogined) {
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
      targetId: item?.uid ?? 0,
      title: item?.nickName ?? '',
    );
  }

  void _onTapItem(ListItem? item) {
    _recordClick(item);

    if (item != null && item.inRoom > 0) {
      int rid = item.inRoom;
      IRoomManager roomManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      roomManager.openChatRoomScreenShow(context, rid);
    } else {
      IPersonalDataManager personalDataManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_PERSONALDATA);
      personalDataManager.openImageScreen(context, item?.uid ?? 0,
          refer: widget.refer);
    }
  }

  void _onTapImage(ListItem? item) {
    _recordClick(item);

    IPersonalDataManager personalDataManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    personalDataManager.openImageScreen(context, item?.uid ?? 0,
        refer: widget.refer);
  }

  void _recordClick(ListItem? item) {
    DataReporter.reportEvent(ClickEvent([item?.uid ?? 0]));

    if (Session.role == UserRole.GOD) return;

    if (Session.isLogined) {
      Xhr.postJson('${System.domain}profile/uploadSeeUids', {
        'ids': jsonEncode([item?.uid ?? 0])
      });
    } else {
      SaveSeeUid.instance().add(item?.uid ?? 0);
    }
  }
}

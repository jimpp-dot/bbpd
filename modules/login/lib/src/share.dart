import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/k.dart';
import 'package:shared/shared.dart';

import '../assets.dart';

class Share extends StatefulWidget {
  final int? rid;
  final bool? needInApp;
  final bool? newShareInRoom;
  final bool isQQInstalled;
  final bool? isWxInstalled;
  final String? title;
  final ShareInfo? shareInfo;
  final int uid;
  final int topicId;
  final String? url; //如果shareInfo为null，则url获取后的结果必须能转为shareInfo
  final String? refer;
  final Map? extra;

  const Share({
    Key? key,
    this.title,
    this.shareInfo,
    this.isQQInstalled = false,
    this.isWxInstalled = false,
    this.rid = 0,
    this.needInApp = false,
    this.newShareInRoom = false,
    this.uid = 0,
    this.topicId = 0,
    this.url,
    this.refer,
    this.extra,
  }) : super(key: key);

  static Future<T?> show<T>(
    BuildContext context,
    ShareInfo? info, {
    int rid = 0,
    bool? needInApp = false,
    bool? newShareInRoom = false,
    String? title,
    int uid = 0,
    int topicId = 0,
    String? url,
    String? refer,
    Map? extra,
  }) async {
    return displayModalBottomSheet(
        context: context,
        maxHeightRatio: 1.0,
        builder: (BuildContext context) {
          return Share(
            shareInfo: info,
            rid: rid,
            needInApp: needInApp,
            newShareInRoom: newShareInRoom,
            title: title,
            uid: uid,
            topicId: topicId,
            url: url,
            refer: refer,
            extra: extra,
          );
        });
  }

  @override
  _ShareState createState() => _ShareState();
}

class _ShareState extends State<Share> {
  ShareInfo? _shareInfo;
  bool isLoading = true;
  final IRoomManager _roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void load() async {
    if (widget.shareInfo != null) {
      _shareInfo = widget.shareInfo;
    } else {
      try {
        XhrResponse response = await Xhr.getJson(widget.url ?? '');
        XhrError? error = response.error;
        if (error == null) {
          Map res = response.response as Map;
          if (res['success'] == true && res['data'] is Map) {
            _shareInfo = ShareInfo.fromJson(res['data']);
          }
        }
      } catch (e) {}
    }
    isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }

  _reportShareClick(IThirdPlatform platform) {
    if (widget.refer == null || widget.refer?.isEmpty == true) return;

    Tracker.instance.track(TrackEvent.share, properties: {'source': widget.refer, 'share_way': platform.getName()});
  }

  Widget _renderShareIcon(BuildContext context) {
    ILoginManager loginManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    List<ShareButton?> btns = loginManager.getThirdPlatforms().map<ShareButton?>((platform) {
      if (platform.supportShare()) {
        return ShareButton(
            icon: platform.getIcon(width: 67, height: 67),
            title: platform.getName(),
            color: R.color.mainTextColor,
            onPressed: () {
              _reportShareClick(platform);

              Tracker.instance.track(TrackEvent.repost, properties: {
                'target_uid': widget.uid,
                'moment_id': widget.topicId,
                'to': platform.getName(),
              });
              //点击分享或邀请通知
              String shareTag = platform.shareTag();
              eventCenter.emit(EventConstant.EventRoomInviteFriend, shareTag);

              platform.onShareTap(
                context,
                _shareInfo,
                (result) {
                  Log.d("platform.onShareTap$result");
                },
                null,
              );
            });
      } else {
        return null;
      }
    }).where((it) {
      return it != null;
    }).toList();

    // 将btns转化为非空
    List<ShareButton> nonNullBtns = btns.whereType<ShareButton>().toList();

    if (widget.needInApp == true) {
      nonNullBtns.add(ShareButton(
        icon: R.img(
          Assets.login$ic_share_fans_webp,
          width: 67.0,
          height: 67.0,
          package: ComponentManager.MANAGER_LOGIN,
        ),
        title: K.login_notice_fans,
        color: R.color.mainTextColor,
        onPressed: () {
          BaseRequestManager.inviteFansJoinRoom('${widget.rid}').then((value) {
            if (value.success == true) {
              Fluttertoast.showCenter(msg: K.login_notice_success_left_num([value.leftInviteNum.toString()]));
            } else {
              Fluttertoast.showCenter(msg: value.msg);
            }
          });
        },
      ));
    }

    /// 动态分享、歌友会活动分享
    if (widget.extra != null && (widget.extra?['type'] == 'share_moment')) {
      nonNullBtns.insert(
        0,
        ShareButton(
          icon: R.img(
            Assets.login$ic_share_fans_webp,
            width: 67.0,
            height: 67.0,
            package: ComponentManager.MANAGER_LOGIN,
          ),
          title: K.login_inner_site_msg,
          color: R.color.mainTextColor,
          onPressed: _onShareImMsg,
        ),
      );
    }

    return Container(
      alignment: Alignment.center,
      child: GridView.count(
        primary: false,
        padding: const EdgeInsetsDirectional.only(top: 0.0, start: 0.0, end: 0.0),
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
        crossAxisCount: nonNullBtns.length,
        childAspectRatio: (MediaQuery.of(context).size.width / nonNullBtns.length) / 100,
        shrinkWrap: true,
        children: nonNullBtns,
      ),
    );
  }

  Widget _renderTitle(BuildContext context) {
    String titleStr = widget.title ?? '';
    if (titleStr.isEmpty) {
      titleStr = K.login_choose_share_type;
    }
    return Text(
      titleStr,
      style: R.textStyle.medium16,
    );
  }

  Widget _renderRoomId() {
    String str = '${K.login_room_id}${Util.parseInt(widget.rid)}';
    return GestureDetector(
      onTap: () {
        Clipboard.setData(ClipboardData(text: '${widget.rid}'));
        Fluttertoast.showToast(msg: K.login_id_has_copy, gravity: ToastGravity.CENTER);
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 3),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              str,
              style: R.textStyle.regular12.copyWith(color: R.color.secondTextColor),
            ),
            const SizedBox(width: 2),
            Container(
              padding: const EdgeInsets.only(left: 4, right: 4, top: 1, bottom: 1),
              alignment: Alignment.center,
              decoration: const ShapeDecoration(shape: StadiumBorder(), color: Color(0xFF406F3D)),
              child: Text(
                K.login_copy,
                style: const TextStyle(color: Colors.white, fontSize: 9),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _renderBody(BuildContext context) {
    bool hasInApp = (widget.needInApp == true && (widget.rid ?? 0) > 0 && !Util.isLocale);
    if (isLoading) {
      return const Expanded(
        child: Center(
          child: CupertinoActivityIndicator(),
        ),
      );
    }

    if (_shareInfo == null) {
      return Expanded(
        child: EmptyWidget(
          onTap: () {
            setState(() {
              isLoading = true;
            });
            load();
          },
          size: 100,
          paddingBottom: 0,
        ),
      );
    }
    return Expanded(
      child: Container(
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
          borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(16.0)),
        ),
        child: Column(
          children: <Widget>[
            if (hasInApp)
              Expanded(
                child: _roomManager.getShareInviteScreen(context, rid: widget.rid ?? 0),
              ),
            const SizedBox(height: 24),
            _renderTitle(context),
            if (widget.extra != null && widget.extra?['widget'] != null) ...[
              const SizedBox(height: 20),
              widget.extra!['widget'],
            ],
            if (hasInApp) _renderRoomId(),
            const SizedBox(height: 20),
            _renderShareIcon(context),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool hasInApp = (widget.needInApp == true && (widget.rid ?? 0) > 0 && !Util.isLocale);
    double totalHeight;
    if (hasInApp) {
      if (Util.smallHeightScreen) {
        totalHeight = MediaQuery.of(context).size.height - 20;
      } else {
        totalHeight = MediaQuery.of(context).size.height - 160.0;
      }
    } else {
      totalHeight = Util.iphoneXBottom + 170;
    }

    if (widget.extra != null && widget.extra?['widget'] != null) {
      totalHeight += 20 + (widget.extra?['height'] ?? 0);
    }

    return Container(
      height: totalHeight + 20,
      padding: EdgeInsets.only(bottom: Util.iphoneXBottom),
      decoration: BoxDecoration(
        color: R.colors.mainBgColor,
        borderRadius: const BorderRadiusDirectional.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _renderBody(context),
        ],
      ),
    );
  }

  void _onShareImMsg() async {
    IMessageManager manager = ComponentManager.instance.getManager(ComponentManager.MANAGER_MESSAGE);
    dynamic data = await manager.openContactPage(context, onlySelectUser: true);
    if (data != null && data is Map && data.containsKey('target')) {
      Navigator.of(context).pop();
      String target = Util.parseStr(data['target']) ?? '';
      String type = Util.parseStr(data['type']) ?? '';

      MessageContent content = MessageContent(MessageType.Text, SendUser(Session.uid.toString(), Session.name, Session.icon));
      content.content = K.login_moment_share;
      content.extra = json.encode(widget.extra);
      await Im.sendMessage(type, target, content, supportVersion: ImSupportSDKVersions.MOMENT_MESSAGE_SUPPORT_VERSION);
      IChatManager chatManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
      chatManager.openUserChatScreen(context, type: type, targetId: Util.parseInt(target));
    }
  }
}

class ShareButton extends StatelessWidget {
  const ShareButton({
    super.key,
    this.icon,
    this.title,
    this.color,
    this.onPressed,
    this.marginHorizontal = 0.0,
  });

  final Widget? icon;
  final String? title;
  final Color? color;
  final GestureTapCallback? onPressed;
  final double marginHorizontal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(22.5),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon ?? const SizedBox.shrink(),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                title ?? '',
                style: TextStyle(fontSize: 12.0, color: R.color.secondTextColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

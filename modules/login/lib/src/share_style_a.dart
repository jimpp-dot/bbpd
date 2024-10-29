import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/k.dart';
import 'package:login/login.dart';

import '../assets.dart';
import 'api/api.dart';
import 'model/pb/generated/share.pb.dart';

///目前凶手系/嗨歌系使用
class ShareStyleA extends StatefulWidget {
  final int rid;
  final int musicId;
  final bool needInApp;
  final bool newShareInRoom;
  final bool isQQInstalled;
  final bool isWxInstalled;
  final String? title;
  final ShareInfo? shareInfo;
  final int uid;
  final int topicId;
  final String? url; //如果shareInfo为null，则url获取后的结果必须能转为shareInfo

  const ShareStyleA({
    Key? key,
    this.title,
    this.shareInfo,
    this.isQQInstalled = false,
    this.isWxInstalled = false,
    this.rid = 0,
    this.musicId = 0,
    this.needInApp = false,
    this.newShareInRoom = false,
    this.uid = 0,
    this.topicId = 0,
    this.url,
  }) : super(key: key);

  static Future<T?> show<T>(
    BuildContext context,
    ShareInfo info, {
    int rid = 0,
    int musicId = 0,
    bool needInApp = false,
    bool newShareInRoom = false,
    String? title,
    int uid = 0,
    int topicId = 0,
    String? url,
  }) async {
    return displayModalBottomSheet(
        context: context,
        maxHeightRatio: 1.0,
        theme: getDefaultThemeData().copyWith(
          canvasColor: Colors.transparent,
        ),
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {},
            child: ShareStyleA(
              shareInfo: info,
              rid: rid,
              musicId: musicId,
              needInApp: needInApp,
              newShareInRoom: newShareInRoom,
              title: title,
              uid: uid,
              topicId: topicId,
              url: url,
            ),
          );
        });
  }

  @override
  _ShareStyleAState createState() => _ShareStyleAState();
}

class _ShareStyleAState extends State<ShareStyleA> {
  ShareInfo? _shareInfo;
  bool isLoading = true;

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
      if (Util.parseInt(widget.musicId) > 0) {
        try {
          RespShare res = await Api.killerShareInfo(
              'good_voices', widget.musicId, widget.uid);
          if (res.success) {
            _shareInfo = ShareInfo(
              type: res.share,
              title: res.title,
              url: res.url,
              desc: res.desc,
              icon: Util.parseIcon(res.icon),
              wxUsername: res.wxUserName,
              wxPath: res.wxPath,
              wxIcon: res.wxIcon,
            );
          }
        } catch (e) {}
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
    }
    isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }

  void shareToAddCoin(String shareType) async {
    try {
      String pageType = 'reg_invite';
      if (widget.newShareInRoom) {
        pageType = 'reg_room';
      }
      String url =
          '${System.domain}cloud/doshare?shareType=$shareType&pageType=$pageType&v=1';
      XhrResponse response = await Xhr.getJson(url);
      Map res = response.response as Map;

      if (res['success'] == true) {
        if (res.containsKey('toast')) {
          String toastStr = Util.parseStr(res['toast']) ?? '';
          if (toastStr.isNotEmpty) {
            Fluttertoast.showToast(msg: toastStr);
          }
        }
      }
      if (mounted) {
        setState(() {});
      }
    } catch (e) {}
  }

  Widget _renderShareInviteWidget(BuildContext context) {
    if (widget.needInApp &&
        ((widget.rid ?? 0) > 0 || (widget.musicId ?? 0) > 0) &&
        !Util.isLocale) {
      IRoomManager roomManager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: roomManager.getShareInviteScreen(context,
                rid: widget.rid, musicId: widget.musicId),
          ),
          Container(
            height: 0.5,
            color: R.color.dividerColor,
          ),
        ],
      );
    }
    return Container();
  }

  Widget _renderBottom(BuildContext context) {
    ILoginManager loginManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
    List<ShareButton> btns =
        loginManager.getThirdPlatforms().map<ShareButton>((platform) {
      if (platform.supportShare()) {
        return ShareButton(
            icon: platform.getIcon(
              width: 48.0,
              height: 48.0,
            ),
            title: platform.getName(),
            color: R.color.mainTextColor,
            onPressed: () {
              String? shareType;
              if (widget.newShareInRoom) {
                if (platform.getName() == '微信') {
                  shareType = 'wechat';
                } else if (platform.getName() == '微信朋友圈') {
                  shareType = 'wechat_moments';
                } else if (platform.getName() == 'QQ') {
                  shareType = 'qq';
                } else if (platform.getName() == 'QQ空间') {
                  shareType = 'qzone';
                }
              }
              Tracker.instance.track(TrackEvent.repost, properties: {
                'target_uid': widget.uid,
                'moment_id': widget.topicId,
                'to': platform.getName()
              });
              //点击分享或邀请通知
              String shareTag = platform.shareTag();
              eventCenter.emit(EventConstant.EventRoomInviteFriend, shareTag);

              platform.onShareTap(
                context,
                _shareInfo,
                (result) {
                  Log.d("platform.onShareTap$result");
                  shareToAddCoin(shareTag);
                },
                null,
              );

              if (Util.parseInt(widget.musicId) > 0) {
                if (platform.getName() == '微信') {
                  shareType = 'wechat';
                } else if (platform.getName() == '微信朋友圈') {
                  shareType = 'wechat_moments';
                } else if (platform.getName() == 'QQ') {
                  shareType = 'qq';
                } else if (platform.getName() == 'QQ空间') {
                  shareType = 'qzone';
                }
                Tracker.instance.track(
                    TrackEventJuben.good_voice_vodetailspage_share,
                    properties: {
                      'voice_id': widget.musicId,
                      'way': shareType ?? '',
                    });
              }
            });
      } else {
        return const ShareButton();
      }
    }).where((it) {
      return it != null;
    }).toList();

    if (Util.parseInt(widget.musicId) > 0) {
      btns.add(ShareButton(
        icon: R.img(Assets.login$ic_share_in_app_webp,
            width: 48, height: 48, package: ComponentManager.MANAGER_LOGIN),
        title: K.login_moments,
        onPressed: () async {
          IMomentManager manager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_MOMENT);
          await manager.openMomentPublishScreen(
            context,
            from: 'share',
            musicId: widget.musicId,
          );
          Tracker.instance.track(TrackEventJuben.good_voice_vodetailspage_share,
              properties: {
                'voice_id': widget.musicId,
                'way': 'circle',
              });
        },
      ));
    }

    return Container(
      alignment: Alignment.center,
      // color: Colors.red,
      height: 100.0,
      child: GridView.count(
        primary: false,
        padding:
            const EdgeInsetsDirectional.only(top: 0.0, start: 0.0, end: 0.0),
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
        crossAxisCount: btns.length,
        childAspectRatio: MediaQuery.of(context).size.width / (4 * 100.0),
        shrinkWrap: true,
        children: btns,
      ),
    );
  }

  Widget _renderTop(BuildContext context) {
    String? titleStr = widget.title;
    if (titleStr == null || titleStr.isEmpty) {
      titleStr = K.login_choose_share_type;
    }

    return Container(
      height: 48.0,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        // color: Colors.blue,
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(16.0),
          topEnd: Radius.circular(16.0),
        ),
      ),
      child: Row(
        children: [
          (widget.needInApp &&
                  ((widget.rid ?? 0) > 0 || (widget.musicId ?? 0) > 0))
              ? InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 56.0,
                    alignment: Alignment.center,
                    child: R.img(
                      Assets.login$share_close_svg,
                      width: 24.0,
                      height: 24.0,
                      color: R.color.mainTextColor,
                      package: ComponentManager.MANAGER_LOGIN,
                    ),
                  ),
                )
              : Container(
                  width: 56.0,
                ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                titleStr,
                maxLines: 1,
                style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Container(width: 56.0),
        ],
      ),
    );
  }

  Widget _renderBody(BuildContext context) {
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
        ),
      );
    }

    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: _renderShareInviteWidget(context),
          ),
          _renderBottom(context),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool hasInApp = (widget.needInApp &&
        ((widget.rid ?? 0) > 0 || (widget.musicId ?? 0) > 0) &&
        !Util.isLocale);
    double totalHeight;
    if (hasInApp) {
      totalHeight = MediaQuery.of(context).size.height - 151.0;
    } else {
      int i = 0;
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.getThirdPlatforms().forEach((element) {
        if (element.supportShare()) {
          i = i + 1;
        }
      });
      totalHeight = Util.iphoneXBottom + 48.0 + (i / 4) * 100.0;
    }

    return Container(
      height: totalHeight,
      padding: EdgeInsets.only(bottom: Util.iphoneXBottom),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(16.0),
          topEnd: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _renderTop(context),
          _renderBody(context),
        ],
      ),
    );
  }
}

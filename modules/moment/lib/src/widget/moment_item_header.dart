import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:shared/model/models.dart';
import 'package:flutter/material.dart';
import 'package:moment/assets.dart';
import 'package:moment/k.dart';
import 'package:moment/moment.dart';
import 'package:provider/provider.dart' hide Selector;

/// 动态item顶部header
class MomentItemHeader extends StatefulWidget {
  final Moment moment;
  final bool canHeadTaped; // 点击头像跳转
  final VoidCallback? onMomentDelete;
  final bool showMore;
  final bool showFollow;
  final bool showDelete;
  final MomentFlowPage? page; // 页面来源,数据上报
  final String? topicName; // 页面标签
  final Color? mainTextColor; //文字颜色
  final Color? thirdTextColor; //文字颜色
  final Color? brightBgColor; //关注背景颜色
  final bool supportDark;
  final VoidCallback? onTopChanged;

  const MomentItemHeader({
    super.key,
    required this.moment,
    this.canHeadTaped = true,
    this.onMomentDelete,
    this.showMore = true,
    this.showFollow = true,
    this.showDelete = true,
    this.page,
    this.topicName,
    this.mainTextColor,
    this.thirdTextColor,
    this.brightBgColor,
    this.supportDark = false,
    this.onTopChanged,
  });

  @override
  State<StatefulWidget> createState() {
    return _MomentItemHeaderState();
  }
}

class _MomentItemHeaderState extends State<MomentItemHeader> {
  /// 头像点击
  void _clickUseHead() {
    if (!widget.canHeadTaped) return;

    if (widget.moment.isInRoom) {
      _gotoRoomScreen(context);
    } else {
      _gotoImageScreen(context);
    }
  }

  /// 进入个人主页
  void _gotoImageScreen(BuildContext context) {
    IPersonalDataManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    manager.openImageScreen(context, widget.moment.uid,
        refer: PageRefer(getFlowPage(widget.page)));
    _report('profile_pic');
  }

  /// 进入房间
  /// 点击头像实时请求用户所在所在房间id，如果用户不在房间了进入用户个人主页
  void _gotoRoomScreen(BuildContext context) async {
    int rid = 0;
    try {
      // 这个接口的scene/tpid参数用于服务端统计从动态进入房间的数据
      XhrResponse response = await Xhr.getJson(
          '${System.domain}rush/profile/room?uid=${widget.moment.uid}&scene=circle&tpid=${widget.moment.topicId}',
          throwOnError: false);
      Map res = response.value();
      if (res['success'] == true && res['data'] != null) {
        rid = Util.parseInt((res['data'] as Map)['rid']);
      }
    } catch (e) {
      Log.d(e);
    }
    if (rid > 0) {
      IRoomManager manager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      manager.openChatRoomScreenShow(context, rid, refer: 'squ_recommend');
    } else {
      _gotoImageScreen(context);
    }
  }

  /// 查询用户所在房间id
  /// [uid] 用户id
  static Future<int> getRoomId(int uid) async {
    try {
      XhrResponse response = await Xhr.getJson(
          '${System.domain}rush/profile/room?uid=$uid',
          throwOnError: false);
      Map res = response.value();
      if (res['success'] == true && res['data'] != null) {
        return Util.parseInt((res['data'] as Map)['rid']);
      }
    } catch (e) {
      Log.d(e.toString());
    }
    return 0;
  }

  /// 举报
  void _reportMoment() async {
    IPersonalDataManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    manager.openReportScreen(context,
        uid: widget.moment.uid,
        reportType: ReportType.Moment,
        reportId: widget.moment.topicId);

    _report('report');
  }

  void _onFollowTap() async {
    if (!Session.isLogined) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }

    if (widget.moment.isFollow == 0) {
      NormalNull response = await BaseRequestManager.onFollow(
          widget.moment.uid.toString(),
          refer: getFlowPage(widget.page),
          topicId: widget.moment.topicId);
      if (response.success) {
        widget.moment.isFollow = 1;
        Fluttertoast.showToast(
            msg: K.moment_follow_success, gravity: ToastGravity.CENTER);
        _refresh();
        _report('follow');
        Api.reportCircleFollow(widget.moment.topicId);
      } else {
        if (response.msg.isNotEmpty) {
          Fluttertoast.showToast(
              msg: response.msg, gravity: ToastGravity.CENTER);
        }
        _refresh();
      }
    } else {
      NormalNull response =
          await BaseRequestManager.unFollow(widget.moment.uid.toString());
      if (response.success) {
        widget.moment.isFollow = 0;
        _refresh();
        _report('unfollow');
      } else {
        if (response.msg.isNotEmpty) {
          Fluttertoast.showToast(
              msg: response.msg, gravity: ToastGravity.CENTER);
        }
        _refresh();
      }
    }
  }

  _onMoreTaped(BuildContext context) async {
    if (!Session.isLogined) {
      ILoginManager manager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      manager.show(context);
      return;
    }
    List<SheetItem> res = [];
    if (Session.uid == widget.moment.uid && widget.onTopChanged != null) {
      if (widget.moment.isTop) {
        res.add(SheetItem(BaseK.K.cancel_set_top, 'cancel_top'));
      } else {
        res.add(SheetItem(
            K.moment_set_top, 'top', null, null, K.moment_set_top_desc));
      }
    }
    if (Session.uid == widget.moment.uid && widget.showDelete) {
      res.add(SheetItem(K.moment_delete, "delete"));
    } else {
      res.add(SheetItem(K.moment_report, "report"));
    }
    if (widget.moment.isPublic) {
      res.add(SheetItem(K.moment_share, "share"));
    }

    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(data: res, suppDarkTheme: widget.supportDark);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }

    if (result.value?.key == 'delete') {
      await _deleteMoment();
    } else if (result.value?.key == 'report') {
      _reportMoment();
    } else if (result.value?.key == 'share') {
      _report('share');

      MomentUtils.shareMoment(context, widget.moment);
    } else if (result.value?.key == 'top') {
      _setTop(true);
    } else if (result.value?.key == 'cancel_top') {
      _setTop(false);
    }
  }

  Future<void> _setTop(bool top) async {
    var res = await Api.setTop(widget.moment.topicId, top);
    if (res.success) {
      Toast.show(context, top ? K.moment_set_top_ok : K.moment_cancel_ok);
      widget.moment.isTop = top;
      widget.onTopChanged?.call();
    } else {
      Toast.show(context, res.msg);
    }
  }

  /// 删除动态
  _deleteMoment() async {
    bool? result = await RushConfirmDialog.openRushConfirmDialog(
      context,
      title: K.moment_delete_tips,
      negativeButton: RushNegativeButton(
          text: BaseK.K.cancel,
          onPressed: () {
            Navigator.of(context).pop(false);
          }),
      positiveButton: RushPositiveButton(
          text: BaseK.K.confirm,
          onPressed: () {
            Navigator.of(context).pop(true);
          }),
    );

    if (result != null && result) {
      DataRsp response = await Api.deleteMoment(widget.moment.topicId);
      if (response.success == true) {
        _report('delete');

        MomentModel momentModel =
            Provider.of<MomentModel>(context, listen: false);
        momentModel.deleteMomentById(widget.moment.topicId);
        if (widget.onMomentDelete != null) {
          widget.onMomentDelete!();
        }
        eventCenter.emit('UserInfo.Refresh');
      } else {
        Fluttertoast.showToast(msg: response.msg, gravity: ToastGravity.CENTER);
      }
    }
  }

  void _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    ///如果热门的是作品类型的，换个icon展示
    bool isWork = widget.moment.workInfo != null;
    bool showBadge = widget.moment.badgeList.isNotEmpty;
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      clipBehavior: Clip.none,
      children: [
        if (widget.moment.likeNum > 50 &&
            DateTime.now()
                    .difference(DateTime.fromMillisecondsSinceEpoch(
                        widget.moment.time * 1000))
                    .inDays <
                7)
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 21.0, end: 95.0),
            child: isWork
                ? R.img('circle/circle_recommend_mark.webp',
                    width: 34,
                    height: 34,
                    package: ComponentManager.MANAGER_MOMENT)
                : R.img('circle/circle_hot_mark.webp',
                    width: 34,
                    height: 34,
                    package: ComponentManager.MANAGER_MOMENT),
          ),
        Container(
          height: 76,
          alignment: AlignmentDirectional.centerStart,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildIcon(),
              const SizedBox(width: 4),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(end: 4.0),
                            child: _buildTitle(widget.moment.displayName),
                          ),
                        ),
                        if (widget.moment.age > 0)
                          Padding(
                            padding: const EdgeInsetsDirectional.only(end: 4.0),
                            child: UserSexAndAgeWidget(
                              sex: widget.moment.sex,
                              sexIconSize: 10,
                            ),
                          ),
                        if (showBadge) _buildBadge(widget.moment.badgeList),
                        if (!showBadge && widget.moment.isInAudit)
                          Text(
                            K.moment_in_auditing,
                            style: TextStyle(
                              fontSize: 13.0,
                              color: widget.thirdTextColor ??
                                  R.colors.thirdTextColor,
                            ),
                          ),
                        if (!showBadge && widget.moment.official == 1)
                          Padding(
                            padding: const EdgeInsetsDirectional.only(end: 4.0),
                            child: R.img('ic_official.png',
                                width: 23,
                                height: 14,
                                package: ComponentManager.MANAGER_BASE_CORE),
                          ),
                        if (widget.moment.starVerifyTag)
                          const UserStarVerifyWidget(
                            padding: EdgeInsetsDirectional.only(end: 4.0),
                            height: 22,
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: <Widget>[
                        if (widget.moment.rushPublishTime != null)
                          Text(widget.moment.rushPublishTime!,
                              style: TextStyle(
                                color: R.colors.thirdTextColor,
                                fontSize: 12,
                              )),
                        _buildPlayTips(),
                      ].where((element) => element != null).toList(),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 16),

              /// 关注按钮
              _buildFollow(),

              /// 普通用户
              if (widget.showMore &&
                  widget.moment.userType != UserType.official) ...[
                const SizedBox(width: 6.5),
                GestureDetector(
                    onTap: () => _onMoreTaped(context),
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      margin: const EdgeInsetsDirectional.only(end: 16),
                      width: 20,
                      height: 20,
                      child: R.img(
                        'ic_more.svg',
                        package: ComponentManager.MANAGER_BASE_CORE,
                        width: 20,
                        height: 20,
                        color: R.colors.thirdTextColor,
                      ),
                    )),
              ]
            ].where((item) => item != null).toList(),
          ),
        ),
        if (widget.moment.isTop && widget.onTopChanged != null)
          PositionedDirectional(
            start: -16,
            child: Rext.autoStyleImg(Assets.moment$circle_ic_set_top_webp,
                width: 36, height: 36),
          ),
      ],
    );
  }

  Widget _buildTitle(String name) {
    return Text(
      name,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: R.colors.mainTextColor,
          fontSize: 14,
          fontFamily: Util.fontFamily),
    );
  }

  Widget _buildBadge(List<String> badgeList) {
    return badgeList.isNotEmpty
        ? R.img(Util.getRemoteImgUrl(badgeList[0]), height: 22)
        : const SizedBox.shrink();
    // List<Widget> res = badgeList.map((e) => R.img(Util.getRemoteImgUrl(e), height: 22)).toList();
    // return res.isNotEmpty
    //     ? Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: res,
    //       )
    //     : const SizedBox.shrink();
  }

  Widget _buildIcon() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _clickUseHead,
      child: RepaintBoundary(child: _buildIconContent()),
    );
  }

  Widget _buildIconContent() {
    if (widget.moment.userHeadFrame != null &&
        widget.moment.userHeadFrame!.isNotEmpty) {
      return RepaintBoundary(
          child: _buildAvatarFrame(
              widget.moment.isInRoom, widget.moment.isUserOnline));
    } else {
      return Padding(
        padding: const EdgeInsetsDirectional.only(end: 4),
        child: RoundNetIcon(
          url: widget.moment.userIcon,
          size: 48,
          inRoom: widget.moment.isInRoom,
          isOnline: widget.moment.isUserOnline,
          showBorder: false,
        ),
      );
    }
  }

  /// 头像框
  Widget _buildAvatarFrame(bool inRoom, bool isOnline) {
    double commonSize = 48;
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          width: commonSize,
          height: commonSize,
          alignment: AlignmentDirectional.center,
          child: RoundNetIcon(
            url: widget.moment.userIcon,
            size: commonSize,
            showBorder: false,
          ),
        ),
        UserIconFrame(size: commonSize, frameUrl: widget.moment.userHeadFrame!),
        if (inRoom)
          PositionedDirectional(
            bottom: 0,
            end: 2,
            child: Container(
              width: 16.0,
              height: 16.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: R.colors.mainBrandColor,
              ),
              alignment: Alignment.center,
              child: RepaintBoundary(
                child: R.img(
                  "living_small.webp",
                  package: ComponentManager.MANAGER_BASE_CORE,
                  width: 12.0,
                  height: 12.0,
                ),
              ),
            ),
          ),
        if (inRoom == false && isOnline)
          const PositionedDirectional(
            bottom: 0,
            end: 4,
            child: OnlineDot(
              padding: 0,
              borderColor: Colors.transparent,
            ),
          ),
      ],
    );
  }

  /// 关注按钮
  Widget _buildFollow() {
    if (widget.showFollow == true && widget.moment.uid != Session.uid) {
      return FollowButton(
          isFollow: widget.moment.isFollow > 0,
          onFollowTap: _onFollowTap,
          bgColor: widget.brightBgColor ?? R.colors.brightBgColor,
          textColorFollowed: widget.thirdTextColor ?? R.colors.thirdTextColor,
          textColorUnFollow: widget.mainTextColor ?? R.colors.mainTextColor,
          supportDark: widget.supportDark);
    }

    return const SizedBox.shrink();
  }

  /// 提示文案
  Widget _buildPlayTips() {
    /// 关闭个性化推荐
    bool recommendClose = !Session.recommendEnable;
    if (widget.moment.playTip == null ||
        widget.moment.playTip!.isEmpty ||
        widget.page == MomentFlowPage.User ||
        recommendClose) {
      return const SizedBox.shrink();
    }

    return Flexible(
        child: Text.rich(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      TextSpan(
        children: [
          if (widget.moment.rushPublishTime != null &&
              widget.moment.rushPublishTime!.isNotEmpty)
            TextSpan(
              text: '｜ ',
              style: TextStyle(
                color: R.colors.thirdTextColor,
                fontSize: 11,
              ),
            ),
          TextSpan(
              text: widget.moment.playTip ?? '',
              style: TextStyle(
                color: R.color.thirdTextColor,
                fontSize: 11,
              )),
        ],
      ),
    ));
  }

  _report(String? clickType) {
    if (clickType == null || clickType.isEmpty) return;
    trackerReport(
        moment: widget.moment,
        page: widget.page,
        clickType: clickType,
        topicName: widget.topicName);
  }
}

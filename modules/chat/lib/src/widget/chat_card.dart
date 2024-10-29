import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../k.dart';
import 'package:pulse_log/pulse_log.dart';

class ChatCard extends StatefulWidget {
  final int uid;
  final String? name;
  final HomeProfileData profileData;
  bool _isFollow = false;
  final Function(double) reBuildMessageLayout;

  ChatCard(Key key, this.uid, this.name, this.profileData, this._isFollow,
      this.reBuildMessageLayout)
      : super(key: key);

  @override
  _ChatCardState createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  final IPersonalDataManager _personalDataManager = ComponentManager.instance
      .getManager(ComponentManager.MANAGER_PERSONALDATA);

  bool _isSystem = false;
  List<CirclePicItem>? _momentAlbumList;
  int _momentCount = 0;

  bool _isRebuildMessageLayout = true;

  void _onMomentTap() async {
    PulseLog.instance.event('click_event', properties: {
      'click_tag': 'chat_card_image',
    });
    await _personalDataManager.openImageScreen(context, widget.uid);
  }

  void onFollow() async {
    NormalNull response =
        await BaseRequestManager.onFollow(widget.uid.toString(), refer: 'chat');
    if (response.success) {
      Fluttertoast.showToast(
          msg: R.string('followed'), gravity: ToastGravity.CENTER);
      setState(() {
        widget._isFollow = true;
      });
    } else {
      if (response.msg.isNotEmpty) {
        Fluttertoast.showToast(msg: response.msg, gravity: ToastGravity.CENTER);
      }
    }
  }

  void unFollow() async {
    NormalNull response =
        await BaseRequestManager.unFollow(widget.uid.toString());
    if (response.success) {
      setState(() {
        widget._isFollow = false;
      });
    } else {
      if (response.msg.isNotEmpty) {
        Fluttertoast.showToast(msg: response.msg, gravity: ToastGravity.CENTER);
      }
    }
  }

  bool _isSystemNotification(int uid) {
    _isSystem = ChatUtil.isSystemUser(uid);
    return _isSystem;
  }

  @override
  void initState() {
    super.initState();

    if (!_isSystemNotification(widget.uid)) {
      _loadMoment();
    }

    eventCenter.addListener(EventConstant.UserFollow, _onUserFollow);
    _personalDataManager.loadJobs();
  }

  @override
  void dispose() {
    eventCenter.removeListener(EventConstant.UserFollow, _onUserFollow);
    super.dispose();
  }

  _onUserFollow(String type, dynamic value) {
    if (value is Map &&
        value.containsKey('follow') &&
        value.containsKey('uid')) {
      bool follow = value['follow'];
      String uid = value['uid'];
      if (widget.uid == Util.parseInt(uid)) {
        setState(() {
          widget._isFollow = follow;
        });
      }
    }
  }

  void _loadMoment() async {
    IMomentManager? momentManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    ResCirclePics? result = await momentManager?.getCirclePics(widget.uid, 0);
    if (result?.success ?? false) {
      _momentAlbumList = result!.data.list;
      _momentCount = result.data.total;

      if (_isRebuildMessageLayout) {
        _isRebuildMessageLayout = false;
        double height = (60 + 16 + 16).toDouble();
        if (widget.profileData.base.hasSign()) {
          height += (8 + 20);
        }
        if ((_momentAlbumList?.isNotEmpty == true) ||
            (widget.profileData.hasCard() &&
                Util.validStr(widget.profileData.card.audio) &&
                Util.parseDouble(widget.profileData.card.duration) > 0)) {
          height += (8 + 1);
          if (_momentAlbumList?.isNotEmpty == true) {
            height += (8 + 80);
          }
          if (widget.profileData.hasCard() &&
              Util.validStr(widget.profileData.card.audio) &&
              Util.parseDouble(widget.profileData.card.duration) > 0) {
            height += (8 + 32);
          }
        }
        widget.reBuildMessageLayout(height);
      }

      refresh();
    }
  }

  Widget _renderJob() {
    int job = Util.parseInt(widget.profileData.base.job);
    if (job > 0) {
      String label = _personalDataManager.getJobLabel(job);
      return Container(
        height: 14,
        alignment: AlignmentDirectional.center,
        padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: R.colors.secondBgColor,
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Color(0xFF7252CC),
            fontWeight: FontWeight.w500,
            fontSize: 9,
            height: 1,
          ),
        ),
      );
    }
    return const SizedBox(
      height: 8,
      width: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isSystem || _isRebuildMessageLayout) {
      return const SizedBox();
    }

    return Rext.themeCardContainer(
      padding: const EdgeInsetsDirectional.all(16),
      margin: const EdgeInsetsDirectional.only(
          start: 12, end: 12, top: 16, bottom: 16),
      width: double.infinity,
      cornerRadius: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: Stack(
                    children: [
                      CommonAvatar(
                        path: widget.profileData.base.icon,
                        size: 60,
                        shape: BoxShape.circle,
                        onTap: _onMomentTap,
                      ),
                      if (widget.profileData.base.hasStarVerifyTag() &&
                          (widget.profileData.base.starVerifyTag == 1 ||
                              widget.profileData.base.starVerifyTag == 2 ||
                              widget.profileData.base.starVerifyTag == 3))
                        PositionedDirectional(
                          bottom: 0,
                          end: 0,
                          child: UserStarVerifyWidget(
                              starVerifyTag:
                                  widget.profileData.base.starVerifyTag),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width - 240,
                            maxHeight: 60),
                        child: Text(
                          widget.name ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: R.colors.mainTextColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        )),
                    const SizedBox(height: 7),
                    Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width - 240,
                          maxHeight: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          UserSexAndAgeWidget(
                              sex: widget.profileData.base.sex,
                              age: widget.profileData.base.age),
                          const SizedBox(width: 5),
                          _renderJob(),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    (widget._isFollow) ? unFollow() : onFollow();
                  },
                  child: !widget._isFollow
                      ? Container(
                          height: 32,
                          padding: const EdgeInsetsDirectional.only(
                              start: 12, end: 12),
                          alignment: AlignmentDirectional.center,
                          decoration: ShapeDecoration(
                              shape: const StadiumBorder(),
                              gradient: LinearGradient(
                                  colors: R.colors.mainBrandGradientColors)),
                          child: Text(
                            widget._isFollow
                                ? K.chat_has_followed
                                : K.chat_follow,
                            style: R.textStyle.medium14
                                .copyWith(color: R.colors.brightTextColor),
                          ),
                        )
                      : Container(
                          height: 32,
                          padding: const EdgeInsetsDirectional.only(
                              start: 12, end: 12),
                          alignment: AlignmentDirectional.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: R.colors.mainTextColor.withOpacity(0.2),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            widget._isFollow
                                ? K.chat_has_followed
                                : K.chat_follow,
                            style: R.textStyle.medium14
                                .copyWith(color: R.colors.thirdTextColor),
                          ),
                        ),
                ),
              ],
            ),
          ),
          if (widget.profileData.base.hasSign()) ...[
            const SizedBox(height: 8),
            Text(widget.profileData.base.sign,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15, color: R.colors.mainTextColor)),
          ],
          if ((_momentAlbumList?.isNotEmpty == true) ||
              (widget.profileData.hasCard() &&
                  Util.validStr(widget.profileData.card.audio) &&
                  Util.parseDouble(widget.profileData.card.duration) > 0)) ...[
            const SizedBox(height: 8),
            Divider(height: 1, color: R.colors.dividerColor),
          ],
          if (_momentAlbumList?.isNotEmpty == true) ...[
            const SizedBox(height: 8),
            MomentPreviewWidget(
              photos: _momentAlbumList,
              onPressed: _onMomentTap,
              momentCount: _momentCount,
              suppDark: true,
            ),
          ],
          if (widget.profileData.hasCard() &&
              Util.validStr(widget.profileData.card.audio) &&
              Util.parseDouble(widget.profileData.card.duration) > 0) ...[
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ChatCardSoundButton(
                  audioUrl: widget.profileData.card.audio,
                  duration: Util.parseInt(widget.profileData.card.duration),
                  suppDark: true,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

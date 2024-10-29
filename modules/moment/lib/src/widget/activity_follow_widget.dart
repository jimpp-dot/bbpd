import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:moment/k.dart';
import 'package:moment/src/model/moment_bean_v3.dart';

/// 官方活动过-真爱卡片
class ActivityFollowWidget extends StatefulWidget {
  final FollowActivityBean? activityBean;
  final MomentFlowPage page; // 信息流数据上报，页面来源

  const ActivityFollowWidget(
      {super.key, required this.activityBean, required this.page});

  @override
  _ActivityFollowWidgetState createState() => _ActivityFollowWidgetState();
}

class _ActivityFollowWidgetState extends State<ActivityFollowWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.activityBean == null) {
      return const SizedBox.shrink();
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {},
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            bottom: 20, top: 16, start: 20, end: 20),
        decoration: BoxDecoration(
          color: R.color.mainBgColor,
          border: Border(
            bottom: BorderSide(width: 8, color: R.color.secondBgColor),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(),
            _buildText(),
            const SizedBox(height: 12),
            _buildContent(),
            // _buildImage(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    if (widget.activityBean == null) {
      return Container();
    }
    return Container(
      height: 76,
      alignment: AlignmentDirectional.centerStart,
      // color: Colors.red,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () {
              IPersonalDataManager personalDataManager = ComponentManager
                  .instance
                  .getManager(ComponentManager.MANAGER_PERSONALDATA);
              personalDataManager.openImageScreen(
                  context, widget.activityBean?.uid ?? 0);
            },
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: '${widget.activityBean?.icon}',
                width: 52.0,
                height: 52.0,
                fit: BoxFit.cover,
                placeholder: R.img(
                  "user_icon_default.png",
                  width: 52.0,
                  height: 52.0,
                  package: ComponentManager.MANAGER_BASE_CORE,
                ),
                errorWidgetType: ErrorWidgetType.defaultUserIcon,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 4.0),
                      child: Text(
                        '${widget.activityBean?.name}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: R.color.mainTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(width: 4),
                    if (widget.activityBean?.official == 1)
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 4.0),
                        child: R.img('ic_official.png',
                            width: 23,
                            height: 14,
                            package: ComponentManager.MANAGER_BASE_CORE),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 4.0),
                  child: Text(
                    Utility.getDateDiff(widget.activityBean?.time ?? 0),
                    maxLines: 1,
                    textScaleFactor: 1.0,
                    style: R.textStyle.subCaption,
                  ),
                ),
              ],
            ),
          ),
        ].where((item) => item != null).toList(),
      ),
    );
  }

  Widget _buildText() {
    if (widget.activityBean == null) {
      return Container();
    }
    return Text(
      '${widget.activityBean?.content}',
      style: TextStyle(color: R.color.mainTextColor, fontSize: 16),
    );
  }

  Widget _buildContent() {
    if (widget.activityBean == null) {
      return Container();
    }
    if (MomentFollowActivityType.User == widget.activityBean?.type ||
        MomentFollowActivityType.OpenBox == widget.activityBean?.type ||
        MomentFollowActivityType.GetDiamond == widget.activityBean?.type) {
      return _buildContentUser();
    } else if (MomentFollowActivityType.Love == widget.activityBean?.type) {
      return _buildContentLove();
    }
    return Container();
  }

  Widget _buildContentUser() {
    if (widget.activityBean == null ||
        widget.activityBean!.followActivityUserItem == null) {
      return Container();
    }
    return InkWell(
      onTap: () {
        int uid = widget.activityBean!.followActivityUserItem!.uid;
        IPersonalDataManager personalDataManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_PERSONALDATA);
        personalDataManager.openImageScreen(context, uid);
      },
      child: Container(
        height: 80.0,
        alignment: AlignmentDirectional.centerStart,
        decoration: BoxDecoration(
          // color: R.color.secondBgColor,
          image: DecorationImage(
            image: AssetImage(R.imagePath("moment_follow_activity_user_bg.webp",
                package: ComponentManager.MANAGER_MOMENT)),
            fit: BoxFit.fill,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(width: 20.0),
            _buildIcon(widget.activityBean!.followActivityUserItem!.icon),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(end: 4.0),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 200),
                            child: Text(
                              widget.activityBean!.followActivityUserItem!.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 4.0),
                        child: UserSexAndAgeWidget(
                          sex: widget.activityBean!.followActivityUserItem!.sex,
                          age: widget.activityBean!.followActivityUserItem!.age,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 1.0),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 4.0),
                    child: Text(
                      widget.activityBean!.followActivityUserItem!.mark,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 4.0),
            _buildExtInfo(),
            const SizedBox(width: 4.0),
            R.img(
              'ic_next.svg',
              color: Colors.white,
              width: 16,
              height: 16,
              package: ComponentManager.MANAGER_PROFILE,
            ),
            const SizedBox(width: 20.0),
          ].where((item) => item != null).toList(),
        ),
      ),
    );
  }

  Widget _buildExtInfo() {
    FollowActivityUserItem userItem =
        widget.activityBean!.followActivityUserItem!;
    switch (widget.activityBean!.type) {
      case MomentFollowActivityType.GetDiamond:
        return Text(
          '＋${userItem.diamondNum}钻',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: R.color.mainTextColor,
              fontSize: 24.0,
              fontWeight: FontWeight.w500),
        );
      case MomentFollowActivityType.OpenBox:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '＋${userItem.cnum}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: R.color.mainTextColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              width: 4,
            ),
            CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl(userItem.cicon),
              width: 54,
              height: 54,
            ),
          ],
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildContentLove() {
    if (widget.activityBean == null ||
        widget.activityBean!.followActivityLoveItem == null) {
      return Container();
    }
    return InkWell(
      onTap: () {
        IRankManager rankManager =
            ComponentManager.instance.getManager(ComponentManager.MANAGER_RANK);
        rankManager.showRank(context, 'all');
      },
      child: Container(
        height: 148.0,
        decoration: BoxDecoration(
          // color: R.color.secondBgColor,
          image: DecorationImage(
            image: AssetImage(R.imagePath("moment_follow_activity_love_bg.webp",
                package: ComponentManager.MANAGER_MOMENT)),
            fit: BoxFit.fill,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildIcon(widget.activityBean!.followActivityLoveItem!.icon,
                    size: 60.0),
                SizedBox(
                  width: 96.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 0.0),
                        child: CachedNetworkImage(
                          imageUrl:
                              "${System.imageDomain}static/$giftSubDir/${widget.activityBean!.followActivityLoveItem!.giftId}.png",
                          width: 50.0,
                          height: 50.0,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsetsDirectional.only(
                            start: 8.0, end: 8.0),
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          Utility.getDateDiff(widget
                              .activityBean!.followActivityLoveItem!.dateLine),
                          maxLines: 1,
                          textScaleFactor: 1.0,
                          style: R.textStyle.subCaption,
                        ),
                      ),
                    ],
                  ),
                ),
                _buildIcon(widget.activityBean!.followActivityLoveItem!.toIcon,
                    size: 60.0),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                top: 12.0,
                start: 8.0,
                end: 8.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: _renderInfo(
                    widget.activityBean!.followActivityLoveItem!.name,
                    widget.activityBean!.followActivityLoveItem!.title,
                    widget.activityBean!.followActivityLoveItem!.titleNew,
                    widget.activityBean!.followActivityLoveItem!.vip),
              ),
            ),
            _renderRoomName(),
          ],
        ),
      ),
    );
  }

  List<Widget> _renderInfo(String name, int title, int titleNew, int vip) {
    int uColor = Utility.getVipColor(vip, false);
    List<Widget> res = [];
    res.add(
      UserNobilityWidget(
        titleNew: titleNew,
        padding: const EdgeInsetsDirectional.only(end: 4.0),
      ),
    );
    if (vip > 0) {
      res.add(Padding(
        padding: const EdgeInsetsDirectional.only(
          end: 4.0,
        ),
        child: UserVipWidget(vip: vip),
      ));
    }
    res.add(
      Container(
        constraints: const BoxConstraints(maxWidth: 100.0),
        child: Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Color(uColor)),
        ),
      ),
    );
    res.add(
      Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 4.0,
        ),
        child: Row(
          children: [
            Text(
              K.moment_reward,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Container(
              width: 4.0,
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 100.0),
              child: Text(
                widget.activityBean!.followActivityLoveItem!.toName,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Color(Utility.getVipColor(
                          widget.activityBean!.followActivityLoveItem!.toVip,
                          false)),
                    ),
              ),
            )
          ],
        ),
      ),
    );

    return res;
  }

  Widget _buildIcon(String iconUrl, {double size = 52.0}) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: iconUrl,
        width: size,
        height: size,
        fit: BoxFit.cover,
        placeholder: R.img(
          "user_icon_default.png",
          width: size,
          height: size,
          fit: BoxFit.fill,
          package: ComponentManager.MANAGER_BASE_CORE,
        ),
      ),
    );
  }

  Widget _renderRoomName() {
    String roomTitle =
        widget.activityBean?.followActivityLoveItem?.roomTitle ?? '';
    if (roomTitle.isEmpty) {
      return Container();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 2.0),
            child: R.img(
              'room_little.svg',
              color: R.color.thirdTextColor,
              width: 14.0,
              height: 14.0,
              package: ComponentManager.MANAGER_RANK,
            ),
          ),
          Text(
            roomTitle,
            maxLines: 1,
            textScaleFactor: 1.0,
            style: R.textStyle.subCaption.copyWith(
              fontSize: 13.0,
            ),
          ),
        ],
      ),
    );
  }
}

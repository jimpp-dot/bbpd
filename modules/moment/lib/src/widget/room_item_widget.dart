import 'package:shared/shared.dart';
import 'package:shared/model/models.dart';
import 'package:extended_text/extended_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:moment/k.dart';
import 'package:moment/src/model/homePageItemData.dart';

/// 首页房间item
class RoomItemWidget extends StatefulWidget {
  final RoomItemData data;
  final MomentFlowPage page; // 信息流数据上报，页面来源

  const RoomItemWidget({super.key, required this.data, required this.page});

  @override
  _RoomItemWidgetState createState() => _RoomItemWidgetState();
}

class _RoomItemWidgetState extends State<RoomItemWidget> {
  final double _iconSize = 18.0;
  final double _iconOffset = 14.0;

  void _gotoImageScreen() {
    Tracker.instance.track(TrackEvent.click_flow, properties: {
      'page': getFlowPage(widget.page),
      'flow_type': 'room',
      'owner_uid': widget.data.uid,
      'click_type': 'profile_pic',
    });

    IPersonalDataManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    manager.openImageScreen(context, widget.data.uid,
        refer: const PageRefer('firstpage'));
  }

  void _onEnterRoom() {
    Tracker.instance.track(TrackEvent.click_flow, properties: {
      'page': getFlowPage(widget.page),
      'flow_type': 'room',
      'owner_uid': widget.data.uid,
      'click_type': 'detail',
      if (widget.data.isGameRoom()) 'game_name': widget.data.name,
    });

    int rid = widget.data.rid;
    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.openChatRoomScreenShow(context, rid, refer: 'firstpage');
  }

  void _onFollowTap() async {
    if (!Session.isLogined) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }

    if (widget.data.isFollow == 0) {
      NormalNull response =
          await BaseRequestManager.onFollow(widget.data.uid.toString());
      if (response.success) {
        widget.data.isFollow = 1;
        _refresh();
      } else {
        if (response.msg.isNotEmpty) {
          Fluttertoast.showToast(
              msg: response.msg, gravity: ToastGravity.CENTER);
        }
        _refresh();
      }
    } else {
      NormalNull response =
          await BaseRequestManager.unFollow(widget.data.uid.toString());
      if (response.success) {
        widget.data.isFollow = 0;
        _refresh();
      } else {
        if (response.msg.isNotEmpty) {
          Fluttertoast.showToast(
              msg: response.msg, gravity: ToastGravity.CENTER);
        }
        _refresh();
      }
    }
  }

  void _onMoreTaped(BuildContext context) async {
    if (!Session.isLogined) {
      ILoginManager manager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      manager.show(context);
      return;
    }
    List<SheetItem> res = [];
    res.add(SheetItem(K.moment_report, "report"));

    SheetCallback? result = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(data: res);
        });
    if (result == null || result.reason == SheetCloseReason.Active) {
      return;
    }

    if (result.value?.key == 'report') {
      _report();
    }
  }

  /// 举报
  void _report() async {
    IPersonalDataManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_PERSONALDATA);
    manager.openReportScreen(context,
        uid: widget.data.uid,
        reportType: ReportType.Room,
        reportId: widget.data.rid);
  }

  void _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onEnterRoom,
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            top: 12, bottom: 18, start: 20, end: 20),
        decoration: BoxDecoration(
          color: R.color.mainBgColor,
          border: Border(
            bottom: BorderSide(width: 8, color: R.color.secondBgColor),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildHeader(),
            _buildDesc(),
            const SizedBox(height: 12),
            _buildRoomEntry(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        RoundNetIcon(url: widget.data.icon, size: 40, onTap: _gotoImageScreen),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.data.username ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, color: R.color.secondTextColor),
              ),
              const SizedBox(height: 4),
              UserSexAndAgeWidget(sex: widget.data.sex, age: widget.data.age),
            ],
          ),
        ),

        /// 关注按钮
        _buildFollow(),

        GestureDetector(
          onTap: () => _onMoreTaped(context),
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding:
                const EdgeInsetsDirectional.only(top: 4, start: 4, bottom: 4),
            child: R.img(
              'ic_more.svg',
              package: ComponentManager.MANAGER_BASE_CORE,
              width: 20,
              height: 20,
            ),
          ),
        ),
      ].where((item) => item != null).toList(),
    );
  }

  /// 关注按钮
  Widget _buildFollow() {
    if (widget.data.uid != Session.uid) {
      return GestureDetector(
        onTap: _onFollowTap,
        child: Container(
          width: 50,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            gradient: LinearGradient(
              colors: widget.data.isFollow == 0
                  ? [R.color.mainBrandColor, R.color.mainBrandColor]
                  : R.color.darkGradientColors,
              begin: AlignmentDirectional.centerStart,
              end: AlignmentDirectional.centerEnd,
            ),
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.only(bottom: 1),
          child: Text(
            widget.data.isFollow == 0
                ? K.moment_attention
                : K.moment_already_follow,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildDesc() {
    int maxLine = 3;
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 12 /* * widget.scale*/),
      child: ExtendedText(
        widget.data.desc ?? '',
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
        style: (TextStyle(
            fontSize: 16, // widget.scale
            color: R.color.mainTextColor)),
      ),
    );
  }

  String _getBackground() {
    if (widget.data.roomItemType == RoomItemType.Desktop) {
      return 'home/room_desktop_bg.webp';
    } else if (widget.data.roomItemType == RoomItemType.Game) {
      return 'home/room_game_bg.webp';
    } else if (widget.data.roomItemType == RoomItemType.Joy) {
      return 'home/room_joy_bg.webp';
    } else {
      return 'home/room_joy_bg.webp';
    }
  }

  Widget _buildRoomEntry() {
    return SizedBox(
      height: 72,
      child: Stack(
        children: <Widget>[
          R.img(_getBackground(),
              height: 72, width: Util.width, fit: BoxFit.fill),
          Row(
            children: <Widget>[
              _buildInfo(),
              const SizedBox(width: 19),
              _buildEntrance(),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfo() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 20.0, top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  child: Text(
                    widget.data.name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                _buildCondition(),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: <Widget>[
                _buildIconSwiper(widget.data.icons),
                const SizedBox(width: 4),
                Text(
                  K.moment_room_play_people(['${widget.data.numOfPeople}']),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdd() {
    return R.img('home/room_more_add.svg', width: _iconSize, height: _iconSize);
  }

  Widget _buildIconSwiper(List<String>? icons) {
    if (icons == null || icons.isEmpty) {
      return _buildAdd();
    }

    if (icons.length == 1) {
      return SizedBox(
        width: _iconSize + _iconOffset,
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            PositionedDirectional(
              start: _iconOffset,
              child: _buildAdd(),
            ),
            _buildIcon(icons[0]),
          ],
        ),
      );
    }
    int len = icons.length ~/ 2;

    return SizedBox(
      width: 48,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          PositionedDirectional(
            start: 28,
            child: _buildAdd(),
          ),
          SizedBox(
            height: _iconSize,
            width: _iconSize + _iconOffset,
            child: Swiper(
              containerWidth: _iconSize + _iconOffset,
              containerHeight: _iconSize,
              itemCount: len,
              pagination: null,
              autoplay: len > 1,
              loop: len > 1,
              duration: 400,
              autoplayDelay: 4000,
              autoplayDisableOnInteraction: false,
              itemBuilder: (BuildContext context, int index) {
                return _buildIconItem(icons[2 * index], icons[2 * index + 1]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconItem(String icon1, String icon2) {
    List<Widget> widgets = [];

    widgets.add(PositionedDirectional(
      start: 0,
      child: _buildIcon(icon1),
    ));

    widgets.add(PositionedDirectional(
      start: _iconOffset,
      child: _buildIcon(icon2),
    ));

    return SizedBox(
      height: _iconSize,
      width: _iconSize + _iconOffset,
      child: Stack(
        clipBehavior: Clip.none,
        children: widgets,
      ),
    );
  }

  Widget _buildCondition() {
    if (widget.data.conditions != null && widget.data.conditions!.isNotEmpty) {
      if (widget.data.roomItemType == RoomItemType.Joy) {
        return Container(
          height: 18,
          margin: const EdgeInsetsDirectional.only(start: 4.0),
          padding:
              const EdgeInsetsDirectional.only(bottom: 1.0, start: 7, end: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            color: R.color.thirdTextColor,
          ),
          alignment: Alignment.center,
          child: Text(
            widget.data.conditions!,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(fontSize: 11, color: Colors.white),
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsetsDirectional.only(start: 8.0),
          child: Text(
            widget.data.conditions!,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        );
      }
    }
    return Container();
  }

  Widget _buildEntrance() {
    return Container(
      width: 70,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.white.withOpacity(0.1),
      ),
      alignment: Alignment.center,
      child: Container(
        width: 58,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withOpacity(0.3),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildIndicator(),
            Text(
              K.moment_room_join,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildIndicator() {
    if (widget.data.roomItemType == RoomItemType.Joy) {
      return Padding(
        padding: const EdgeInsetsDirectional.only(end: 2.0),
        child: R.img('living_small.webp',
            width: 12, height: 12, package: ComponentManager.MANAGER_BASE_CORE),
      );
    }
    return Container();
  }

  Widget _buildIcon(String icon) {
    return ClipOval(
      child: Container(
        width: _iconSize,
        height: _iconSize,
        color: Colors.white,
        alignment: Alignment.center,
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: icon,
            width: _iconSize - 2,
            height: _iconSize - 2,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
